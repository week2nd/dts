<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="">

<title>E-SPORT토토게스트</title>
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<link href="resources/style.css" rel="stylesheet">
<script src="js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/new-style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link href="css/lightbox.min.css" rel="stylesheet">
<link href="css/lity.min.css" rel="stylesheet">
<!-- <link href="css/slidebars.css" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css" href="css/loaders.css" />
<script src="js/popper.js"></script>
<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="js/core.js"></script>

<script src="js/lightbox-plus-jquery.min.js"></script>
<script src="js/lity.min.js"></script>
<style>
body {
font-family:'Jua';

}
</style>
<script>
$(function(){
	$('#loginForm').on('show.bs.modal', function () {
		$("#loginFrm")[0].reset();
	});
	$('#loginForm').on('shown.bs.modal', function () {

		$("#uId")[0].focus();
	});
});

</script>
</head>
<body>
	<!-- Top small banner -->
	<header class="float-left w-100">
		<div class="small-top float-left w-100">
			<div class="container-fluid">
				<div class="row px-1">
					<div class="col-lg-2 date-sec">
						<div id="Date" class="mt-1">
							<script>
								var today = new Date()
								document.write(today.getFullYear(), "년 ",
										today.getMonth() + 1, "월 ",
										today.getDate(), "일")
							</script>
						</div>
					</div>
					<div class="col-lg-5 lp-6" style="margin-left:18%">

						<a href="http://www.sktt1.net/" target="_blank"><img src="img\skt.png"></a>
						<a href="https://post.naver.com/teamgriffin" target="_blank"><img
							src="img\griffin.png"></a> 
						<a href="http://kt-sports.co.kr/sports/site/esports/rolster/bi.do" target="_blank"><img
							src="img\kt.png"></a> 
						<a href="https://www.facebook.com/GenGLOL"  target="_blank"><img
							src="img\geng.png"></a> 
						<a href="https://www.facebook.com/SandboxGamingNL" target="_blank"><img
							src="img\sandbox.png"></a> 
						<a href="https://www.facebook.com/IMteam" target="_blank"><img
							src="img\kingzone.png"></a> 
						<a href="https://www.facebook.com/HLE.lol" target="_blank"><img
							src="img\hanwha.png"></a> 
						<a href="https://www.facebook.com/AfreecaFreecs" target="_blank"><img
							src="img\afreeca.png"></a> 
						<a href="https://www.facebook.com/TeamAwesome001" target="_blank"><img
							src="img\damwon.png"></a> 
						<a href="http://greenwings.jinair.com/Story/Notice.aspx"  target="_blank"><img
							src="img\jinair.png"></a>


					</div>
				</div>
			</div>
		</div>
		<div class="top-head left">
			<div class="container-fluid">
				<div class="row px-3">
					<div class="col-lg-12">
						<h1 class="text-center">E-Sports 토토게스트</h1>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- <div class="col-7 mx-auto"> -->
	<!-- Top Navigation -->
	<section class="top-nav">
		<nav class="navbar navbar-expand-lg py-0">
			<div class="container-fluid" style="width:68%">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li class="nav-item active"><a class="nav-link" href="./">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#">게임구매</a></li>
						<li class="nav-item"><a class="nav-link" href="#">경기정보</a></li>
						<li class="nav-item dropdown menu"><a
							class="nav-link dropdown-toggle" href="#" id="layouts"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							aria-live="token">게시판</a>
							<div class="dropdown-menu" aria-labelledby="layouts">
								<a class="dropdown-item" href="#">자유게시판</a> <a
									class="dropdown-item" href="#">분석게시판</a> <a
									class="dropdown-item" href="#">건의게시판</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
					</ul> 
					<div><button style="margin-left:400px;" type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#loginForm">로그인/회원가입</button></div>
				</div>				
			</div>
		</nav>		
	</section>

	<div class="modal fade" id="loginForm" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<div style="text-align: center">
						<h4 class="modal-title" id="myModalLabel"
							style="text-align: center;">LOGIN PAGE</h4>
					</div>
				</div>
				<div class="modal-body">
					<form id="loginFrm" method="post" action="login">
						<div class="form-group">
							<label for="uId" class="control-label" style="width: 50%">아이디</label>
							<input type="text" class="form-control" id="uId" name="uId">
						</div>
						<div class="form-group">
							<label for="uPw" class="control-label">비밀번호</label> <input
								type="password" class="form-control" id="uPw" name="uPw">
						</div>
						<button type="submit" class="btn btn-outline-primary"
							id="loginBtn">로그인</button>
						<button type="button" class="btn btn-outline-primary"
							onclick="window.location.href='insertContract'">회원가입</button>
						<button type="button" class="btn btn-outline-secondary"
							data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-link"
							onclick="window.location.href='pwSearchForm'">비밀번호찾기</button>
						<!-- <span class="psw">Forgot<a href="pwSearchForm">password?</a></span> -->
					</form>
				</div>
			</div>
		</div>
	</div>

	<section class="container" style="padding-top:240px;">
		<div class="col-md-12">
			<tiles:insertAttribute name="content" />
		</div>

	</section>
	

	<!-- Footer Section -->
	<footer>
		<div class="container-fluid">
			<div class="row px-3">
				<div class="col-lg-4 col-md-12">
					<h6 class="heading-footer">ABOUT US</h6>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley.</p>
					<p>
						<i class="fa fa-phone"></i> <span>Call Us :</span> +91 9999 878
						398
					</p>
					<p>
						<i class="fa fa-envelope"></i> <span>Send Email :</span>
						info@webenlance.com
					</p>
				</div>
				<div class="col-lg-2 col-md-4">
					<h6 class="heading-footer">QUICK LINKS</h6>
					<ul class="footer-ul">
						<li><a href="#"> Career</a></li>
						<li><a href="#"> Privacy Policy</a></li>
						<li><a href="#"> Terms & Conditions</a></li>
						<li><a href="#"> Client Gateway</a></li>
						<li><a href="#"> Ranking</a></li>
						<li><a href="#"> Case Studies</a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-4">
					<h6 class="heading-footer">LATEST NEWS</h6>
					<div class="post">
						<p>
							Key Republicans sign letter warning against candidate<span>August
								3,2015</span>
						</p>
						<p>
							Obamacare Appears to Be Making People Healthie <span>August
								3,2015</span>
						</p>
						<p>
							Syria war: Why the battle for Aleppo matters<span>August
								3,2015</span>
						</p>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 social-icons">
					<h6 class="heading-footer">FOLLOW</h6>
					<ul class="footer-ul">
						<li><a href="#"><i class=" fa fa-facebook"></i> Facebook</a></li>
						<li><a href="#"><i class=" fa fa-twitter"></i> Twitter</a></li>
						<li><a href="#"><i class=" fa fa-google-plus"></i>
								Google+</a></li>
						<li><a href="#"><i class=" fa fa-linkedin"></i> Linkedin</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/bootstrap.min.js"></script>
</body>

</html>
