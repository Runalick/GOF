<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminPage</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="/css/admin/adminmain.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<div class="container w-100">
		<div class="row" id="header">
			<div class="col-12">
				<nav class="navbar navbar-expand-md navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="/index.jsp" style="color:#664E55">땡그랑</a>
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
											aria-current="page" href="/csmain.cscenter" style="color:#664E55">고객센터</a></li>
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
											aria-current="page" href="/csmain.cscenter" style="color:#664E55">고객센터</a></li>
										<li class="nav-item"><a class="nav-link active" 
											aria-current="page" href="/mypage.member" style="color:#664E55">마이페이지</a></li>
										<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="#"><i class="bi bi-box-arrow-right" style="color:#664E55"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item nonMember"><a class="nav-link active"
											aria-current="page" href="#" style="color:#664E55">살까말까</a></li>
										<li class="nav-item nonMember"><a class="nav-link active"
											aria-current="page" href="#" style="color:#664E55">최저가경매</a></li>
										<li class="nav-item nonMember"><a class="nav-link active"
											aria-current="page" href="#" style="color:#664E55">고객센터</a></li>
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
				<div class="row w-100 m-0" id="AdminPageOutLine">
					<div class="col-12">
						<div class="row w-100 m-0" id="AdminPageHeader">
							<div class="col-12">
								<p>Admin Page</p>
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="/adminmain.admin">회원 정보 관리</a></li>
									<li class="nav-item"><a class="nav-link" 
										href="/adminBoardsList.admin">게시글 관리</a></li>
									<li class="nav-item"><a class="nav-link" 
										href="/adminReplysList.admin?board=1">댓글 관리</a></li>
								</ul>
							</div>
						</div>
					
<!-- 						위까지만 스타일 통일 아래는 아직  -->
						
<!-- 						<div class="tab-content"> -->
<!-- 							<div class="tab-pane fade show active" id="memberManagement"> -->
						
				
						<div class="row w-100 m-0"  id="memberManagement">
							<div class="col-12 p-0">
								<div class="row w-100 m-0">
									<div class="col-12" id="memberlistHeader">Member List</div>
								</div>
								<div class="row w-100 m-0" id="memberHeader">
									<div class="d-none d-lg-block col-1">No.</div>
									<div class="d-none d-lg-block col-lg-3">ID</div>
									<div class="d-none d-lg-block col-lg-3">NickName</div>
									<div class="d-none d-lg-block col-2">Name</div>
									<div class="d-none d-lg-block col-lg-3">JoinDate</div>
								</div>
						
<!-- 							<table align=center> -->
<!-- 								<tr> -->
<!-- 									<th colspan=5 style="text-align:center;">Members</th> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>No.</td> -->
<!-- 									<td>ID</td> -->
<!-- 									<td>Nickname</td> -->
<!-- 									<td>Name</td> -->
<!-- 									<td>JoinDate</td> -->
<!-- 								</tr> -->
<%-- 								<c:forEach var="i" items="${list}"> --%>
<!-- 									<tr> -->
<%-- 										<td>${i.seq}</td> --%>
<%-- 										<td><a href="/detailViewMember.admin?id=${i.id}">${i.id}</td>										 --%>
<%-- 										<td>${i.nickname}</td> --%>
<%-- 										<td>${i.name}</td> --%>
<%-- 										<td>${i.joindate}</td> --%>
<!-- 									</tr> -->
								
<%-- 								</c:forEach> --%>
								
								<c:forEach var="i" items="${list}">
									<div class="row w-100 m-0">
										<div class="col-1 p-0 d-none d-lg-block">${i.seq}</div>
										<div class="col-6 p-0 col-lg-3"><a href="/detailViewMember.admin?id=${i.id}">${i.id}</a></div>										
										<div class="col-6 p-0 col-lg-3">${i.nickname}</div>
										<div class="col-6 p-0 col-lg-2">${i.name}</div>
										<div class="col-6 p-0 col-lg-3">${i.joindate}</div>
									</div>
								
								</c:forEach>
								
								<div class="row w-100 m-0 memberlistPageNavi">
									<div class="col-12">
										${pageNavi}
									</div>
								</div>
								
							</div>
						</div>							
						
					</div>
				
				</div>
			</div>
		</div>
		<div class="row w-100 m-0" id="footer" style="background-color:#A2BAAC; font-weight:bold">
			<div class="col-12 d-lg-none">
				<div style="margin-left:40px ; margin-top:20px;text-align:left">
					<a href="/cscenter/csmain.jsp" class="footerLink"><span>자주 묻는 질문</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/cscenter/csmain.jsp" class="footerLink"><span style="margin-left:20px">1 : 1 문의</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/cscenter/csmain.jsp" class="footerLink"><span style="margin-left:20px">찾아오시는 길</span></a><br>
					<div style="margin-top:35px ; text-align:left">
						<span class="footerLetter">ADDRESS : 서울 중구 남대문로 120 대일빌딩 2층, 3층</span><br>
						<span class="footerLetter">대 표 전 화 : 4989 - 4284</span><span style="margin-left:20px" class="footerLetter">|</span><span>E-MAIL : 4989 - 4284 </span><br>
						<span style="color:#FFF2CC">COPYRIGHT BY PHOENIX  </span>
					</div>
				</div>
			</div>
			<div class="d-none d-lg-block col-lg-9">
				<div style="margin-left:40px ; margin-top:20px;text-align:left">
					<a href="/cscenter/csmain.jsp" class="footerLink"><span>자주 묻는 질문</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/cscenter/csmain.jsp" class="footerLink"><span style="margin-left:20px">1 : 1 문의</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/cscenter/csmain.jsp" class="footerLink"><span style="margin-left:20px">찾아오시는 길</span></a><br>
					<div style="margin-top:30px ; text-align:left; margin-bottom:15px">
						<span class="footerLetter">ADDRESS : 서울 중구 남대문로 120 대일빌딩 2층, 3층</span><br>
						<span class="footerLetter">대 표 전 화 : 4989 - 4284</span><span style="margin-left:20px" class="footerLetter">|</span><span style="margin-left:20px" class="footerLetter">E-MAIL : 4989 - 4284 </span><br>
						<span style="color:#FFF2CC">COPYRIGHT BY YUNJI AYEONG WOOHYENG JEONGYOEN HEESEUNG IN  PHOENIX  </span>
					</div>
				</div>
			</div>
			<div class="d-none d-lg-block col-lg-3" style="text-align:right">
				<img src="/img/footerLogo.png" style="width:70%;margin-right:10px;margin-top:10%">
			</div>
		</div>
	</div>




</body>
</html>