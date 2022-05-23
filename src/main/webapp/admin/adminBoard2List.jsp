<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
p {
	margin: 20px 0px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${loginID =='admin'}">
			<!-- 세션에 관리자 아이디로 로그인시 -->
			<div class="container w-100"
				style="max-width: 100%; padding: 0; margin: 0; position: relative;">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="/index.jsp">앞날의 지침</a>
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
									aria-current="page" href="#">지출의 참견</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="list.brd2">선택의 참견</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/csmain.cscenter">고객센터</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/adminmain.admin">관리자페이지</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</c:when>

		<c:when test="${loginID !=null}">
			<!-- 세션에 아이디가 존재할때 -->
			<div class="container w-100"
				style="max-width: 100%; padding: 0; margin: 0; position: relative;">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="/index.jsp">앞날의 지침</a>
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
									aria-current="page" href="#">지출의 참견</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="list.brd2">선택의 참견</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/csmain.cscenter">고객센터</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/mypage.member">마이페이지</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</c:when>
		<c:otherwise>
			<!-- 세션에 아이디가 없을 때 -->
			<div class="container w-100"
				style="max-width: 100%; padding: 0; margin: 0; position: relative;">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="/index.jsp">앞날의 지침</a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse justify-content-end"
							id="navbarNavDropdown">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link active nonMember"
									aria-current="page" href="#">지출의 참견</a></li>
								<li class="nav-item"><a class="nav-link active nonMember"
									aria-current="page" href="list.brd2">선택의 참견</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/csmain.cscenter">고객센터</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="joinform.member">회원가입</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</c:otherwise>
	</c:choose>

	<div class="container">
		<div class="row">
			<div class="col">
				<p>Admin Page</p>
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link" 
						href="/adminmain.admin">회원 정보 관리</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/adminBoardsList.admin?board=1">게시글 관리</a></li>
					<li class="nav-item"><a class="nav-link" 
						href="/adminReplyList.admin?board=1">댓글 관리</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active">
						<div class="row w-100 m-0">
							<div class="col-12" id="listbtns">
								<button id="toBoard1">지출의 참견</button>
								<button id="toBoard2">선택의 참견</button>
							</div>
						</div>

						<form action="serch.brd2" method="post">
							<div class="row">
								<div class="col-4"></div>
								<div class="col-2">
									<select class="from-select: aria-label=select" id="select1"
										name="category">
										<option class="select" value="title">제목</option>
										<option class="select" value="writer">작성자</option>
										<option class="select" value="contents">내용</option>
									</select>
								</div>
								<div class="col-4">
									<input type="search" id="serch" name="serch"
										placeholder="검색하실 내용을 입력하세요">
								</div>
								<div class="col-2">
									<button type="submit" id="submit">검색</button>
								</div>
							</div>
						</form>
						<div class="row">
							<div class="col-2"></div>
							<div class="col-8">
								<div class="row">
									<div class="col-2">글번호</div>
									<div class="col-2">제목</div>
									<div class="col-2">작성자</div>
									<div class="col-2">제한시간</div>
									<div class="col-2">작성시간</div>
									<div class="col-2">조회수</div>
								</div>
								<c:forEach var="i" items="${list2}">
									<div class="row">
										<div class="col-2">${i.seq}</div>
										<div class="col-2 title">
											<a href="/read.brd2?seq=${i.seq}">${i.title}</a>
											<c:if test="${i.reply!=0}">
							[${i.reply}]
						</c:if>
										</div>
										<div class="col-2 nickname">${i.nickname}</div>
										<div class="col-2 limit" id="${i.seq}"></div>
										<div class="col-2 time" id="${i.write_date}">${i.write_date}</div>
										<div class="col-2">${i.view_count}</div>
									</div>
								</c:forEach>
								<div class="row">
									<div class="col-1"></div>
									<div class="col-10">list</div>
									<div class="col-1"></div>
								</div>
							</div>
							<div class="col-2"></div>
						</div>
						<div class="row">
							<div class="col-2"></div>
							<div class="col-8">${pageNavi}</div>

							<div class="row">
								<div class="col-12">footer</div>
							</div>


						</div>
						<div class="tab-pane fade" id="postManagement">
							<p>post list.</p>
						</div>
						<div class="tab-pane fade" id="replyManagement">
							<p>reply list.</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<script>
			$("#toBoard1").on("click", function() {
				location.href = "/adminBoardsList.admin?board=1";
			})

			$("#toBoard2").on("click", function() {
				location.href = "/adminBoardsList.admin?board=2";
			})

			const countDownTimer = function(id, date) {
				let _vDate = new Date(date);
				// 전달 받은 일자 
				let _second = 1000;
				let _minute = _second * 60;
				let _hour = _minute * 60;
				let _day = _hour * 24;
				let timer;
				function showRemaining() {
					let now = new Date();
					var distDt = _vDate - now;
					if (distDt < 0) {
						clearInterval(timer);
						document.getElementById(id).textContent = "종료";
						return;
					}
					let days = Math.floor(distDt / _day);
					let hours = Math.floor((distDt % _day) / _hour);
					let minutes = Math.floor((distDt % _hour) / _minute);
					let seconds = Math.floor((distDt % _minute) / _second);
					//document.getElementById(id).textContent = date.toLocaleString() + "까지 : ";
					//document.getElementById(id).textContent = days + '일 ';
					//document.getElementById(id).textContent += hours + '시간 ';
					document.getElementById(id).textContent = minutes + '분 ';
					document.getElementById(id).textContent += seconds + '초';
				}
				timer = setInterval(showRemaining, 1000);
			}

			for (let i = 0; i < $(".title").length; i++) {
				let id = $(document.querySelectorAll(".limit")[i]).attr('id');
				let time = $(document.querySelectorAll(".time")[i]).attr('id');
				let dateObj = new Date(time);
				dateObj.setMinutes(dateObj.getMinutes() + 10);
				countDownTimer(id, dateObj);
			}
			// 내일까지 countDownTimer('sample02', '04/01/2024 00:00 AM'); 
			// 2024년 4월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용한다. 
			// 		countDownTimer('sample03', '04/01/2024');
			// 2024년 4월 1일까지 countDownTimer('sample04', '04/01/2019');
			// 2024년 4월 1일까지
			const serchbold = function(category, serch) {
				let length = serch.length;
				//검색어의 길이
				let arr = [];
				//인덱스 배열 생성
				if (category == title) {
					let list = $(".title").children().text();
					for (let i = 0; i < list.length;) {
						console.log(list.indexOf(serch, i));
					}
				} else if (category == nickname) {

				}
			}
		</script>
</body>
</html>