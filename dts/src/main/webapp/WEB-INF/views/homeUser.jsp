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
<!-- admin css 게시판 꾸미기 위해서 사용 -->
<link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
<!-- admin css 게시판 꾸미기 위해서 사용 -->
<title>E-SPORT토토유저메인</title>
<link href="https://fonts.googleapis.com/css?family=Gothic+A1:100" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:500" rel="stylesheet">
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

<script src="js/core.js"></script>

<script src="js/lightbox-plus-jquery.min.js"></script>
<script src="js/lity.min.js"></script>
<style>
body {
font-family:'Jua';

}

.Jua {
font-family:'Jua';
font-size : 10px;
}
</style>
<script>
$(function(){
	var money = ${membersession.uMileage};
	var money2 = money.toLocaleString();
	$("#abc").text('${membersession.uName} 님    보유마일리지 : ' + money2);	
});

</script>

</head>

<body>

		
	
	
	
	<!-- Top small banner -->
	<header class="float-left w-100">
		<div class="small-top float-left w-100">
			<div class="container-fluid">
				<div class="row px-3">
					<div class="col-lg-4 date-sec">
						<div id="Date" class="mt-1">
							<script>
								var today = new Date()
								document.write(today.getFullYear(), "년 ", today
										.getMonth() + 1, "월 ", today.getDate(),
										"일")
							</script>
						</div>
					</div>
					<div class="col-lg-3 ml-auto">
            <div class="social-icon">
              <a href="#" class=" fa fa-facebook"></a>
              <a href="#" class=" fa fa-twitter"></a>
              <a href="#" class=" fa fa-google-plus"></a>
              <a href="#" class=" fa fa-linkedin"></a>
              <a href="#" class=" fa fa-youtube"></a>
              <a href="#" class=" fa fa-vimeo-square"></a>
            </div>
          </div>
				</div>
			</div>
		</div>
		<div class="top-head left">
			<div class="container-fluid">
				<div class="row px-3">
					<div class="col-lg-12">
						<h1 class="text-center">E-Sports토토유저메인</h1>
					</div>
					<!-- <div class="col-md-6 col-lg-5 admin-bar ml-auto mt-2">
						<nav class="nav justify-content-end">
							<form method="post" 
								style="display: inline-block; margin-top: 0em;">
								<div class="form-group"
									style="margin-top: 5px; display: inline-block">
								
								
								</div> 
								<div class="form-group"
									style="margin-top: 5px; display: inline-block">
								<a href="logout">로그아웃</a>
								</div> 
							</form>
						</nav>
					</div> -->
				</div>
			</div>
		</div>
	</header>
	


	
	<!-- Top Navigation -->
	<section class="top-nav">
		<nav class="navbar navbar-expand-lg py-0">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav Jua">
						<li class="nav-item active"><a class="nav-link" href="./userMain">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="./buyMatchList">게임구매</a></li>
						<li class="nav-item dropdown menu"><a
							class="nav-link dropdown-toggle" href="#" id="layouts"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							aria-live="token">경기정보</a>
							<div class="dropdown-menu" aria-labelledby="layouts">
								<a class="dropdown-item" href="./getMatchList">경기목록</a> <a
									class="dropdown-item" href="./getTeamList">팀정보</a> <a
									class="dropdown-item" href="./getPlayerList">선수정보</a>
							</div></li>
						<li class="nav-item dropdown menu"><a
							class="nav-link dropdown-toggle" href="#" id="layouts"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							aria-live="token">게시판</a>
							<div class="dropdown-menu" aria-labelledby="layouts">
								<a class="dropdown-item" href="./getBoardList?type=free">자유게시판</a>
								<a class="dropdown-item" href="./getBoardList?type=analysis">분석게시판</a>
								<a class="dropdown-item" href="./getBoardList?type=suggestion">건의게시판</a>
							</div></li>
						<li class="nav-item"><a class="nav-link"
							href="./getBoardList?type=notice">공지사항</a></li>
						<li class="nav-item dropdown menu"><a
							class="nav-link dropdown-toggle" href="#" id="layouts"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							aria-live="token">마이페이지</a>
							<div class="dropdown-menu" aria-labelledby="layouts">
								<a class="dropdown-item" href="./getMemberUser">내정보</a> <a
									class="dropdown-item" href="./getPurchaseList">내구매목록</a> <a
									class="dropdown-item" href="./payChargePage">마일리지충전</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
					</ul>
					<div>
						<div
							style="position: absolute; right: 100px; top: 10px; border-radius: 3px; font-size: 17px; margin-top: 4px"
							id="abc"></div>
						<button style="margin-top: 10px; margin-right: 5px" type="button" class="btn btn-outline-dark"	onclick="window.location.href='logout'">로그아웃</button>
					</div>
				</div>
			</div>
		</nav>
	</section>

	<section class="container">
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

	<!-- Copy footer start from here-->
	<div class="copyright">
		<div class="container-fluid">
			<div class="row px-3">
				<div class="col-lg-6 col-md-4">
					<p>
						© 2016 - <a href="http://grafreez.com">Grafreez.com</a>
					</p>
				</div>
				<div class="col-lg-6 col-md-8">
					<ul class="bottom_ul">
						<li><a href="#">About us</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Faq's</a></li>
						<li><a href="#">Contact us</a></li>
						<li><a href="#">Site Map</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/bootstrap.min.js"></script>
</body>

</html>
