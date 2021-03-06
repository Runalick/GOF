<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed298afa01dbe436406160c176a6dde2"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3b2ec1cbf323959f82484d3c09baa42"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="/css/cscenter/csnotice.css">
<link rel="stylesheet" href="/css/common.css">

</head>
<body>

<div class="container w-100">
		<div class="row w-100 m-0" id="header">
			<div class="col-12 p-0">
				<nav class="navbar navbar-expand-md navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="/index.jsp" style="color:#664E55"><img src="/img/logo.png" id="logo"></a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse justify-content-end"
							id="navbarNavDropdown">
							<ul class="navbar-nav">
								<c:choose>
									<c:when test="${loginID =='admin'}">
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/list.brd1?cpage=1" style="color:#664E55">살까말까</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/list.brd2" style="color:#664E55">최저가경매</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/csnotice.cscenter" style="color:#664E55">고객센터</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/adminmain.admin" style="color:#664E55">관리자페이지</a></li>
										<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#"><i class="bi bi-box-arrow-right" style="color:#664E55"></i></a></li>
									</c:when>
									<c:when test="${loginID !=null}">
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/list.brd1?cpage=1" style="color:#664E55">살까말까</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/list.brd2" style="color:#664E55">최저가경매</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/csnotice.cscenter" style="color:#664E55">고객센터</a></li>
										<li class="nav-item"><a class="nav-link active" 
											aria-current="page" href="/mypage.member" style="color:#664E55">마이페이지</a></li>
										<li class="nav-item"><a class="nav-link active" aria-current="page" href="/list.letter?type=r&page=1">
											<i class="bi bi-envelope" style="color: #664E55"></i></a></li>
										<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#"><i class="bi bi-box-arrow-right" style="color:#664E55"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item nonMember"><a class="nav-link active"
											aria-current="page" href="#" style="color:#664E55">살까말까</a></li>
										<li class="nav-item nonMember"><a class="nav-link active"
											aria-current="page" href="#" style="color:#664E55">최저가경매</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/csnotice.cscenter" style="color:#664E55">고객센터</a></li>
										<li class="nav-item"><a class="nav-link active"
											aria-current="page" href="/joinform.member" style="color:#664E55">회원가입</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
		
		<div class="row w-100 m-0" id="content">
			<div class="d-none d-lg-block col-3"></div>
			<div class="col-12 col-lg-6">
				<div class="row w-100 m-0" id="CsCenterOutline">
					<div class="col-12">
						<div class="row w-100 m-0" id="CsCenterHeader">
							<div class="col-12">
								<a href="/csnotice.cscenter"><img src="/img/nametagcscenter.png" id="nametag"></a><br>
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#csnotice">공지 사항</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/csmain.cscenter">자주 묻는 질문</a></li>
									<li class="nav-item"><a class="nav-link" 
										href="/csemail.cscenter">1:1 문의하기</a></li>
									<li class="nav-item" id="mapck"><a class="nav-link" 
										href="/csmap.cscenter">찾아 오시는 길</a></li>
								</ul>
							</div>
						</div>
						
						<div class="row w-100 m-0" id="noticeArea">
							<div class="col-12">
								<div class="row w-100 m-0">
									<div class="col-12" id="noticelistHeader">☆ N O T I C E ☆</div>
									<div class="col-12"></div>
								</div>
								
								<div class="row w-100 m-0">
									<div class="col-12 p-0" id="searchBar">								
										<form action="/searchNotice.cscenter?&page=1" method="post">
											<select class="form-select" aria-label="Default select example"
												name="searchCategory">
												<option value="0">선택</option>
												<option value="1">제목</option>
												<option value="2">내용</option>
											</select>
											<input type="text" placeholder="검색하실 내용을 입력하세요"
												name="searchTarget">
											<input type="submit" value="검색">
										</form>
										<div class="row w-100 m-0"><br>

										</div>
									</div>
								</div>	
								
								<div class="row w-100 m-0" id="noticeHeader">
									<div class="d-none d-lg-block col-8">Title</div>
									<div class="d-none d-lg-block col-4">Name</div>
								</div>
								<c:forEach var="i" items="${list}">
									<a href="/detailNotice.cscenter?seq=${i.seq}" >		
									<div class="row w-100 m-0 noticeinfo">												
										<div class="col-8 listTT">${i.title }</div>
										<div class="col-4">${i.id }</div>
										<div class="col-4 d-none d-md-block"></div>
										<div class="col-8 d-none d-md-block" style="text-align:right">${i.write_date }</div>
										
									</div>
									</a>
								</c:forEach>
								
								<div class="col-12" style="text-align:right" id="writebtnBox">
									<c:if test="${loginID == 'admin'}">
										<input type="button" id="write" value="글쓰기" 
										style="color:white; font-size:min(17px,3.5vw); border:3px solid #516D5C99; border-radius:20px;
												width:90px; line-height:23px; background-color:#806c71; font-wright:bold; margin-top:2%;" >
									</c:if>
								</div>
							</div>
						</div>
					</div>
				
								
					<div class="row w-100 m-0 noticePageNavi">
						<div class="col-12">${navi}</div>
					</div>
								
					</div>
				</div>
			</div>
		</div>			
					
		<div class="row w-100 m-0" id="footer" style="background-color: #A2BAAC; font-weight: bold;">
			<div class="col-12 p-0 d-lg-none">
				<div style="padding-top: 20px; padding-bottom:10px; text-align: center; font-size:min(14px,3.5vw);">
					<a href="/csnotice.cscenter" class="footerLink">
						<span>공지사항</span></a>
					<span style="margin-left: 20px" class="footerBar">|</span>
					<a href="/csmain.cscenter" class="footerLink">
						<span style="margin-left: 20px">자주 묻는 질문</span></a>
					<span style="margin-left: 20px" class="footerBar">|</span> 
					<a href="/csemail.cscenter" class="footerLink">
						<span style="margin-left: 20px">1 : 1 문의</span></a>
					<span style="margin-left: 20px" class="footerBar">|</span> 
					<a href="/csmap.cscenter" class="footerLink">
						<span style="margin-left: 20px;">찾아오시는 길</span></a><br>
					<div style="margin-top: 15px; text-align: center">
						<span class="footerLetter">ADDRESS : 서울 중구 남대문로 120 대일빌딩 2층, 3층</span><br> 
						<span class="footerLetter">대 표 전 화 : 4989 - 4284</span>
						<span style="margin-left: 10px; margin-right:10px" class="footerLetter">|</span>
						<span class="footerLetter">E-MAIL : ttaengerang@gmail.com </span><br> 
						<span style="color: #FFF2CC;font-size:min(15px,4vw);line-height:40px;">COPYRIGHT BY PHOENIX </span>
					</div>
				</div>
			</div>
			<div class="d-none d-lg-block col-lg-9">
				<div style="margin-left:40px ; margin-top:20px;text-align:left">
					<a href="/csnotice.cscenter" class="footerLink"><span>공지사항</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/csmain.cscenter" class="footerLink"><span style="margin-left:20px">자주 묻는 질문</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/csemail.cscenter" class="footerLink"><span style="margin-left:20px">1 : 1 문의</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/csmap.cscenter" class="footerLink"><span style="margin-left:20px">찾아오시는 길</span></a><br>
					<div style="margin-top:30px ; text-align:left; margin-bottom:15px">
						<span class="footerLetter">ADDRESS : 서울 중구 남대문로 120 대일빌딩 2층, 3층</span><br>
						<span class="footerLetter">대 표 전 화 : 4989 - 4284</span><span style="margin-left:20px" class="footerLetter">|</span><span style="margin-left:20px" class="footerLetter">E-MAIL : ttaengerang@gmail.com </span><br>
						<span style="color:#FFF2CC">COPYRIGHT BY YUNJI AYEONG WOOHYENG JEONGYOEN HEESEUNG IN  PHOENIX  </span>
					</div>
				</div>
			</div>
			<div class="d-none d-lg-block col-lg-3" style="text-align:right">
				<img src="/img/footerLogo.png" style="width:70%;margin-right:10px;margin-top:10%">
			</div>
		</div>
	</div>							
									
<script>
	$(".nonMember").on("click",function(){ // 로그인 하지 않고 게시판 1,2 클릭 시 팝업
		Swal.fire({
	  	icon: 'info',
	  	text: '로그인 후 사용 가능합니다.'
		})
	})

	$("#write").on("click",function(){
		location.href="/cscenter/writeNotice.jsp";
	})
		
	
	//로그아웃 관련 공통기능

      	// SDK를 초기화. 사용할 앱의 JavaScript 키
      	Kakao.init('b956cab5ef7dbe5bc1f861614a4b2061');
	    //console.log(Kakao.isInitialized());
	    
	    //item을 localStorage에 저장하는 메소드
	    function saveToDos(token) { 
    		typeof(Storage) !== 'undefined' && sessionStorage.setItem('AccessKEY', JSON.stringify(token)); 
		};


		  $(".bi-box-arrow-right").on("click",function(){
			  if (!Kakao.Auth.getAccessToken()) {
			  Swal.fire({
				  text: '로그아웃 하시겠습니까?',
				  showCancelButton: true,
				  confirmButtonText: '로그아웃',
				  cancelButtonText: '취소',
				}).then((result) => {
				  if (result.isConfirmed) {				
				    location.href="/logout.member";				  
				  } 
				})
				return
			  }
			// -- 로그아웃 버튼 클릭시 카카오톡으로 로그인한 사용자의 토큰을 반납.
			let result = confirm("로그아웃 하시겠습니까?");
			if(!result){
				return false;
			} else {
			  Kakao.Auth.logout(function() {
	      			alert("로그아웃 되었습니다.");
	      			location.href="/logout.member";
	   		 	})
			}
		  })
	

</script>												

</body>
</html>