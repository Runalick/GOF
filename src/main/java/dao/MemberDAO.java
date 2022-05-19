package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberDTO;

public class MemberDAO {
private static MemberDAO instance = null;
	
	public synchronized static MemberDAO getInstance() {
		if(instance==null) {
			instance=new MemberDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}
	
	public boolean IsloginOk(String id,String pw) throws Exception {
		String sql = "select * from member where id=? and password=?";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			pstat.setString(2, pw);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	
	public boolean isIdExist(String id) throws Exception {
		String sql = "select * from member where id=?";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	
	public boolean isNNExist(String nickname) throws Exception {
		String sql = "select * from member where nickname=?";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, nickname);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	
	public String getNickname(String id) throws Exception {
		String sql = "select nickname from member where id=?";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				String nickname = rs.getString(1);
				return nickname;
			}
		}
	}
	
	public int insert(MemberDTO dto) throws Exception {
		String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,default)";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPassword());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getPhone());
			pstat.setString(5, dto.getEmail());
			pstat.setString(6, dto.getNickname());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public MemberDTO selectById(String pid) throws Exception{
		String sql = "select * from member where id=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, pid);
			MemberDTO dto = null;
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					String id = rs.getString("id");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String nickname = rs.getString("nickname");
					Date joindate = rs.getDate("joindate");
					
					dto = new MemberDTO(0, id, null ,name, phone, email, nickname, joindate);
				}
				return dto;
			}
		}
	}
	
	public String searchEmail(String id) throws Exception{
		String sql = "select email from member where id =?";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			try (
					ResultSet rs = pstat.executeQuery();
					){
				String useremail = null;
				if (rs.next()) {
					String email = rs.getString("email");
					useremail = email;
				}
				return useremail;
			}
		}
	}
	
	public int deleteById(String id) throws Exception {
		String sql = "delete member where id=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1,id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
//	관리자 페이지 멤버 출력 메서드
	
	//멤버 총 숫자
	private int getRecordTotalCount() throws Exception {
		String sql = "select count(*) from member";
		
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);
		}
		
	}
	
	//멤버 네비
	public String getPageNavi(int currentPage) throws Exception {
		int recordTotalCount = this.getRecordTotalCount(); 
		
		int recordCountPerPage = 10; // 한 페이지에 몇명의 회원
		
		int naviCountPerPage = 10; // 한 페이지에 몇개의 네비를 보여줄 것인지
		
		int pageTotalCount = 0; // 총 몇개의 페이지가 필요한가?
		
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage +1;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage= 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
		// startNavi의 공식 
		// (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		// endNavi의 공식
		// startNavi + naviCountPerPage - 1;
		
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
			// currentPage = pageTotalcount;
		}
		
		boolean needNext = true;
		boolean needPrev = true;
		
		if (startNavi == 1) {
			needPrev = false;
		}
		
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();

		
		if (needPrev) {

			sb.append("<a href='adminmain.admin?cpage="+(startNavi-1)+"'>< </a>");
		}
		
		for (int i = startNavi ; i <= endNavi; i++) {
			if (currentPage == i) {

				sb.append("<a href=\'adminmain.admin?cpage="+i+"\'>[" + i + "] </a>");
			}else {

				sb.append("<a href=\'adminmain.admin?cpage="+i+"\'>"+ i +" </a>");
			}
		}
		if (needNext) {

			sb.append("<a href='adminmain.admin?cpage="+(endNavi+1)+"'>> </a>");
		}
		
		return sb.toString();
		
	}
	
	// 멤버 페이지로 출력 구분
	
	public List<MemberDTO> selectByPage(int cpage) throws Exception {
		
		int startPage = cpage * 10 - 9;
		int endPage = cpage * 10;
		
		String sql = "select * from (select row_number() over(order by seq ) line, member.* from member) where line between ? and ?";
		
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, startPage);
			pstat.setInt(2, endPage);
			
			try (
					ResultSet rs = pstat.executeQuery();
					){
				List<MemberDTO> list = new ArrayList<>();
				while(rs.next()) {
					MemberDTO mdto = new MemberDTO();
					mdto.setId(rs.getString("id"));
					mdto.setSeq(rs.getInt("seq"));
					mdto.setPassword(rs.getString("password"));
					mdto.setName(rs.getString("name"));
					mdto.setPhone(rs.getString("phone"));
					mdto.setEmail(rs.getString("email"));
					mdto.setNickname(rs.getString("nickname"));
					mdto.setJoindate(rs.getDate("joindate"));
					list.add(mdto);
				}
				return list;
			}
		}
	}
	
	
}
