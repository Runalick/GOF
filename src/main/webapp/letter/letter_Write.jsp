<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPage</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="/css/member/myWriting.css">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/letter/letter_list.css">
<link rel="stylesheet" href="/css/letter/letter_Write.css">
</head>
<body>
	<div class="container w-100">
		<div class="row w-100 m-0" id="header">
			<div class="col-12 p-0">
				<nav class="navbar navbar-expand-md navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="/index.jsp" style="color: #664E55"><img
							src="/img/logo.png" id="logo"></a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse justify-content-end"
							id="navbarNavDropdown">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/list.brd1?cpage=1"
									style="color: #664E55">????????????</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/list.brd2" style="color: #664E55">???????????????</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/csnotice.cscenter"
									style="color: #664E55">????????????</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/mypage.member"
									style="color: #664E55">???????????????</a></li>
								<li class="nav-item"><a class="nav-link active" aria-current="page" href="/list.letter?type=r&page=1">
											<i class="bi bi-envelope" style="color: #664E55"></i></a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="#"><i
										class="bi bi-box-arrow-right" style="color: #664E55"></i></a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>

		<div class="row w-100 m-0" id="content">
			<div class="d-none d-lg-block col-3"></div>
			<div class="col-12 col-lg-6">
				<div class="row w-100 m-0" id="MyPageOutline">
					<div class="col-12">
						<div class="row w-100 m-0" id="MyPageHeader">
							<div class="col-12">
								<a href="/mypage.member"><img src="/img/nametagmypage.png" id="nametag"></a><br>
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link"
										href="/mypage.member">??? ?????? ??????</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/myWriting.member?board=1&page=1">??? ??? ??????</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/myReply.member?board=1&page=1">??? ?????? ??????</a></li>
									<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="/list.letter?type=r&page=1">????????????</a></li>
								</ul>
							</div>
						</div>
						<div class="row w-100 m-0" id="mywriting">
							<div class="col-12">
								<form action="/send.letter" id="letterForm" method="post">
									<span id="headTitle">????????? ?????????</span>
									<div id="msg_Box">
										<div class="row w-80 m-0">
											<div class="col-12 infoWrapper">
												<div class="info-m">????????? ?????? <span style="font-weight:normal"> ${nickname }</span></div>
											</div>
											<div class="col-12 infoWrapper">
												<div class="info-m">?????? ??????</div>
												<c:choose>
													<c:when test='${receiver!=null }'>
														<input type="text" class="inputBox-m" id="receiver" name="receiver"
															value="${receiver }" readonly>
													</c:when>
													<c:otherwise>
														<input type="text" class="inputBox-m" id="receiver"
															name="receiver" placeholder="????????? ??????" readonly>
														<input type="button" value="??????" id="searchBtn"
															class="searchBtn">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="col-12 infoWrapper">
												<div class="info-m">??????</div>
												<input type="text" id="title" class="inputBox-m" name="title"
													placeholder="????????? ??????????????????" maxlength="30">
											</div>
											<div class="col-12 infoWrapper" id="contents_Box">
												<div class="info-m" id="contents_Info" style="width: 100%">??????</div>
												<textarea id="contents" class="inputBox-m" name="contents"
													placeholder="????????? ??????????????????" style="margin-left: 2px" maxlength="300"></textarea>
											</div>
											<div class="col-12" id="mbtns">
												<input type="button" id="msg_Submit" class="msg_btn" value="?????????"> 
												<input type="button" id="msg_Cancel" class="msg_btn" value="??????">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row w-100 m-0" id="footer"
			style="background-color: #A2BAAC; font-weight: bold;">
			<div class="col-12 p-0 d-lg-none">
				<div
					style="padding-top: 20px; padding-bottom: 10px; text-align: center; font-size: min(14px, 3.5vw);">
					<a href="/csnotice.cscenter" class="footerLink">
						<span>????????????</span></a>
					<span style="margin-left: 20px" class="footerBar">|</span>
					<a href="/csmain.cscenter" class="footerLink">
						<span style="margin-left: 20px">?????? ?????? ??????</span></a>
					<span style="margin-left: 20px" class="footerBar">|</span> 
					<a href="/csemail.cscenter" class="footerLink">
						<span style="margin-left: 20px">1 : 1 ??????</span></a>
					<span style="margin-left: 20px" class="footerBar">|</span> 
					<a href="/csmap.cscenter" class="footerLink">
						<span style="margin-left: 20px;">??????????????? ???</span></a><br>
					<div style="margin-top: 15px; text-align: center">
						<span class="footerLetter">ADDRESS : ?????? ?????? ???????????? 120 ????????????
							2???, 3???</span><br> <span class="footerLetter">??? ??? ??? ??? : 4989
							- 4284</span> <span style="margin-left: 10px; margin-right: 10px"
							class="footerLetter">|</span> <span class="footerLetter">E-MAIL
							: ttaengerang@gmail.com </span><br> <span
							style="color: #FFF2CC; font-size: min(15px, 4vw); line-height: 40px;">COPYRIGHT
							BY PHOENIX </span>
					</div>
				</div>
			</div>
			<div class="d-none d-lg-block col-lg-9">
				<div style="margin-left: 40px; margin-top: 20px; text-align: left">
					<a href="/csnotice.cscenter" class="footerLink"><span>????????????</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/csmain.cscenter" class="footerLink"><span style="margin-left:20px">?????? ?????? ??????</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/csemail.cscenter" class="footerLink"><span style="margin-left:20px">1 : 1 ??????</span></a><span style="margin-left:20px" class="footerBar">|</span>
					<a href="/csmap.cscenter" class="footerLink"><span style="margin-left:20px">??????????????? ???</span></a><br>
					<div
						style="margin-top: 30px; text-align: left; margin-bottom: 15px">
						<span class="footerLetter">ADDRESS : ?????? ?????? ???????????? 120 ????????????
							2???, 3???</span><br> <span class="footerLetter">??? ??? ??? ??? : 4989
							- 4284</span><span style="margin-left: 20px" class="footerLetter">|</span><span
							style="margin-left: 20px" class="footerLetter">E-MAIL :
							ttaengerang@gmail.com </span><br> <span style="color: #FFF2CC">COPYRIGHT
							BY YUNJI AYEONG WOOHYENG JEONGYOEN HEESEUNG IN PHOENIX </span>
					</div>
				</div>
			</div>
			<div class="d-none d-lg-block col-lg-3" style="text-align: right">
				<img src="/img/footerLogo.png"
					style="width: 70%; margin-right: 10px; margin-top: 10%">
			</div>
		</div>
	</div>
	<script>
         
         function openSearchNN(){
            window.name = "parentForm";
            
            searchPop = window.open("/letter/letter_Search.jsp", "",
                  "top=200,left=400,width=550,height=350");
         }
      
         $("#searchBtn").on("click",function(){
            openSearchNN();
         })
         
         $("#msg_Submit").on("click",function(){
        	 if($("#receiver").val().length==0){
        		 Swal.fire({
        			icon:'warning',
   				  title: '???????????? ??????????????????.',
   				  confirmButtonText: '??????'
   				});
        		return false;
        	 }
        	 
        	 if($("#title").val().length==0){
        		 Swal.fire({
        			icon:'warning',
   				  title: '????????? ??????????????????.',
   				  confirmButtonText: '??????'
   				});
        		return false;
        	 }
        	 
        	 if($("#contents").val().length==0){
        		 Swal.fire({
        			icon:'warning',
   				  title: '????????? ??????????????????.',
   				  confirmButtonText: '??????'
   				});
        		return false;
        	 }
        	 
        	 
				Swal.fire({
				  title: '???????????? ????????? ??????????????????????',
				  showCancelButton: true,
				  confirmButtonText: '?????????',
				  cancelButtonText: '??????'
				}).then((result) => {
					if (result.isConfirmed) {
						Swal.fire({
							icon: 'success',
							title: '????????? ?????? ??????'
						}).then((result2) => {
							if (result2.isConfirmed) {
							$("#letterForm").submit();
							}
						})
					}
				})
			})
         
         $("#msg_Cancel").on("click",function(){
            location.href="/list.letter?type=r&page=1";
         })
      
      
         //???????????? ?????? ????????????
         // SDK??? ?????????. ????????? ?????? JavaScript ???
         Kakao.init('b956cab5ef7dbe5bc1f861614a4b2061');
       //console.log(Kakao.isInitialized());
       
       //item??? localStorage??? ???????????? ?????????
       function saveToDos(token) { 
          typeof(Storage) !== 'undefined' && sessionStorage.setItem('AccessKEY', JSON.stringify(token)); 
      };
        $(".bi-box-arrow-right").on("click",function(){
           if (!Kakao.Auth.getAccessToken()) {
           Swal.fire({
              text: '???????????? ???????????????????',
              showCancelButton: true,
              confirmButtonText: '????????????',
              cancelButtonText: '??????',
            }).then((result) => {
              if (result.isConfirmed) {            
                location.href="/logout.member";              
              } 
            })
            return
           }
         // -- ???????????? ?????? ????????? ?????????????????? ???????????? ???????????? ????????? ??????.
         let result = confirm("???????????? ???????????????????");
         if(!result){
            return false;
         } else {
           Kakao.Auth.logout(function() {
                  alert("???????????? ???????????????.");
                  location.href="/logout.member";
                })
         }
        })
        
   </script>
</body>
</html>