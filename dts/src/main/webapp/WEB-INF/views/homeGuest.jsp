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

<script>
$(function(){
	$('#loginForm').on('show.bs.modal', function () {
		console.log('aaaaaa');
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
								document.write(today.getFullYear(), "년 ", today
										.getMonth() + 1, "월 ", today.getDate(),
										"일")
							</script>
						</div>
					</div>
					<div class="col-lg-5 ml-auto lp-6">

              <a href="http://www.sktt1.net/"><img src="img\skt.png"></a>
              <a href="https://post.naver.com/teamgriffin"><img src="img\griffin.png"></a>
              <a href="http://kt-sports.co.kr/sports/site/esports/rolster/bi.do"><img src="img\kt.png"></a>
              <a href="https://www.facebook.com/GenGLOL"><img src="img\geng.png"></a>
              <a href="https://www.facebook.com/SandboxGamingNL"><img src="img\sandbox.png"></a>
              <a href="https://www.facebook.com/IMteam"><img src="img\kingzone.png"></a>
              <a href="https://www.facebook.com/HLE.lol"><img src="img\hanwha.png"></a>
              
              <a href="https://www.facebook.com/AfreecaFreecs"><img src="img\afreeca.png"></a>
              <a href="https://www.facebook.com/TeamAwesome001"><img src="img\damwon.png"></a>
              <a href="http://greenwings.jinair.com/Story/Notice.aspx"><img src="img\jinair.png"></a>
              

          </div>
				</div>
			</div>
		</div>
		<div class="top-head left">
			<div class="container-fluid">
				<div class="row px-3">
					<div class="col-lg-12">
						<h1 class="text-center" style="margin-top:10px;">E-Sports토토게스트메인</h1>
					</div>
					<!-- <div class="col-md-4 ml-auto">
						<nav class="nav justify-content-end">
							<form method="post" action="login"
								style="display: inline-block; margin-top: 0em;">
								<div class="form-group"
									style="margin-top: 5px; display: inline-block">
									<input id="uId" type="text" class="form-control"
										placeholder="ID" name="uId">
								</div>
								<div class="form-group"
									style="margin-top: 5px; display: inline-block">
									<input id="uPw" type="password" class="form-control"
										placeholder="Password" name="uPw">
								
								</div>
								<div class="form-group"
									style="margin-top: 5px; display: inline-block"><button type="submit">로그인</button></div>

							</form>
							<div class="form-group"
									style="margin-top: 13px; margin-left: 5px display: inline-block">
							<button onclick="window.location.href='insertMember'">회원가입</button></div>
							<button class="btn" onclick="window.location.href='loginForm'">로그인/회원가입</button>
						</nav>
					</div> -->
				</div>
			</div>
		</div>
	</header>

	<!-- Top Navigation -->
	<section class="top-nav">
		<nav class="navbar navbar-expand-lg py-0">
			<div class="container">
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
					
					<div><button style="margin-top:10px; margin-right:5px;" type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#loginForm">로그인/회원가입</button></div>	
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
											<label for="uId" class="control-label">아이디</label> 
											<input type="text" class="form-control" id="uId" name="uId" >
										</div>
										<div class="form-group">
											<label for="uPw" class="control-label">비밀번호</label> 
											<input type="password" class="form-control" id="uPw" name="uPw">
										</div>
										<button type="submit" class="btn btn-outline-primary" id="loginBtn">로그인</button>
										<button type="button" class="btn btn-outline-primary" onclick="window.location.href='insertMember'">회원가입</button>
										<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-link" onclick="window.location.href='pwSearchForm'">비밀번호찾기</button>
										<!-- <span class="psw">Forgot<a href="pwSearchForm">password?</a></span> -->
									</form>
								</div>
							</div>
						</div>
					</div>

	<section class="container">
		<div class="col-md-12">
			<tiles:insertAttribute name="content" />
		</div>

	</section>
	<!-- Info Block-01 -->
	<!-- <section class="banner-sec float-left w-100 pt-4 pb-5">
    <div class="container-fluid">
      <div class="row px-3">
        <div class="col-md-3">
          <div class="card mb-4"> <img class="img-fluid" src="img/politics.jpg" alt="">
            <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">뉴스?</span> </div>
            <div class="card-body p-2">
              <div class="news-title">
                <h2 class=" title-small"><a href="#">무슨구역이지</a></h2>
              </div>
              <p class="card-text"><small class="text-time"><em>하단부분이네</em></small></p>
            </div>
          </div>
          <div class="card mb-4"> <img class="img-fluid" src="img/business1.jpg" alt="">

            <div class="card-body p-2">
              <div class="news-title">
                <h2 class=" title-small"><a href="#">The worst songs about business reviews</a></h2>
              </div>
              <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card mb-4"> <img class="img-fluid" src="img/travel.jpg" alt="">
            <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">Travel</span> </div>
            <div class="card-body p-2">
              <div class="news-title">
                <h2 class=" title-small"><a href="#">The complete beginner's guide to travel insurances</a></h2>
              </div>
              <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
            </div>
          </div>
          <div class="card"> <img class="img-fluid" src="img/food.jpg" alt="">
            <div class="card-img-overlay"> <span class="badge badge-pill badge-danger">News</span> </div>
            <div class="card-body p-2">
              <div class="news-title">
                <h2 class=" title-small"><a href="#">How chicken dishes aren't as bad as you think</a></h2>
              </div>
              <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 top-slider">
          <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            Indicators
            <ol class="carousel-indicators">
              <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
              <li data-target="#carousel-example-generic" data-slide-to="1"></li>
              <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            Wrapper for slides
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <div class="news-block">
                  <div class="news-media"><img class="img-fluid" src="img/sport1.jpg" alt=""></div>
                  <div class="news-title">
                    <h2 class=" title-large"><a href="#">Ray madison may struggle to get best from Paul in a 4-2-3-1
                        formation</a></h2>
                  </div>
                  <div class="news-des">Condimentum ultrices mi est a arcu at cum a elementum per cum turpis dui
                    vulputate vestibulum in vehicula montes vel. Mauris nam suspendisse consectetur mus...</div>
                  <div class="time-text"><strong>2h ago</strong></div>
                </div>
              </div>
              <div class="carousel-item">
                <div class="news-block">
                  <div class="news-media"><img class="img-fluid" src="img/health.jpg" alt=""></div>
                  <div class="news-title">
                    <h2 class=" title-large"><a href="#">An Alternative Form of Mental Health Care Gains a Foothold</a></h2>
                  </div>
                  <div class="news-des">Condimentum ultrices mi est a arcu at cum a elementum per cum turpis dui
                    vulputate vestibulum in vehicula montes vel. Mauris nam suspendisse consectetur mus...</div>
                  <div class="time-text"><strong>2h ago</strong></div>
                </div>
              </div>
              <div class="carousel-item">
                <div class="news-block">
                  <div class="news-media"><img class="img-fluid" src="img/politics1.jpg" alt=""></div>
                  <div class="news-title">
                    <h2 class=" title-large"><a href="#">Key Republican Senator Says She Will Not Vote for former
                        president!</a></h2>
                  </div>
                  <div class="news-des">Condimentum ultrices mi est a arcu at cum a elementum per cum turpis dui
                    vulputate vestibulum in vehicula montes vel. Mauris nam suspendisse consectetur mus...</div>
                  <div class="time-text"><strong>2h ago</strong></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> -->

	<!-- widget block -->
	<!-- <section class="widget-block flasher-sec float-left w-100">
    <div class="container-fluid">
      <div class="row px-3">
        <div class="col-md-2 pr-0">
          <div class="heading-box">Breaking News</div>
        </div>
        <div class="col-md-10 pl-0">
          <div class="content-box">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <span class="time-box">2:30PM</span>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                </div>
                <div class="carousel-item">
                  <span class="time-box">2:35PM</span>Sed do eiusmod tempor incididunt ut labore et dolore magna
                  aliqua.
                </div>
                <div class="carousel-item">
                  <span class="time-box">2:40PM</span>Ut enim ad minim veniam, quis nostrud exercitation ullamco
                  laboris nisi ut aliquip
                </div>
                <div class="carousel-item">
                  <span class="time-box">2:45PM</span>Ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                  in voluptate
                </div>
                <div class="carousel-item">
                  <span class="time-box">4:17PM</span>Velit esse cillum dolore eu fugiat nulla pariatur.
                </div>
                <div class="carousel-item">
                  <span class="time-box">5:25PM</span>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                  officia deserunt mollit anim id est laborum.
                </div>
              </div>
              <div class="control-box">
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                  <i class="fa fa-angle-left" aria-hidden="true"></i>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                  <i class="fa fa-angle-right" aria-hidden="true"></i>
                  <span class="sr-only">Next</span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> -->

	<!-- Info Block-02 -->
	<!-- <section class="section-01 float-left w-100 py-5">
    <div class="container-fluid">
      <div class="row px-3">
        <div class="col-md-8">
          <div class="row">
            <div class="col-md-12">
              <h3 class="heading-large">Politics</h3>
            </div>
            <div class="col-md-6">
              <div class="card mb-4">
                <img class="img-fluid" src="img/war.jpg" alt="">
                <div class="card-body">
                  <div class="news-title">
                    <h2 class=" title-small"><a href="#">Why the world would end without political polls</a></h2>
                  </div>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
                  <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card mb-4">
                <img class="img-fluid" src="img/politics.jpg" alt="">
                <div class="card-body">
                  <div class="news-title">
                    <h2 class=" title-small"><a href="#">Why entertainment centers will make you question everything</a></h2>
                  </div>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
                  <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card mb-4">
                <img class="img-fluid" src="img/movie.jpg" alt="">
                <div class="card-body">
                  <div class="news-title">
                    <h2 class=" title-small"><a href="#">The worst Movies about live tennis scores</a></h2>
                  </div>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
                  <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card"> <img class="img-fluid" src="img/travel1.jpg" alt="">
                <div class="card-body">
                  <div class="news-title">
                    <h2 class=" title-small"><a href="#">The complete beginner's guide to travel insurances</a></h2>
                  </div>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
                  <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <aside class="col-md-4 side-bar">
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home" role="tab">Latest</a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile" role="tab">Top</a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages" role="tab">Featured</a> </li>
          </ul> -->

	<!-- Tab panes -->
	<!-- <div class="tab-content sidebar-tabing">
            <div class="tab-pane active" id="home" role="tabpanel">
              <div class="media"> <a href="#"><img class="d-flex mr-3" src="img/sport2.jpg" alt="Generic placeholder image"></a>
                <div class="media-body">
                  <div class="news-title">
                    <h2 class="title-small"><a href="#">You're losing money by not using sports bras</a></h2>
                  </div>
                  <div class="news-auther"><span class="time">1h ago</span></div>
                </div>
              </div>
              <div class="media"> <a href="#"><img class="d-flex mr-3" src="img/lifestyle.jpg" alt="Generic placeholder image"></a>
                <div class="media-body">
                  <div class="news-title">
                    <h2 class="title-small"><a href="#">Problems with professional beauty supplies</a></h2>
                  </div>
                  <div class="news-auther"><span class="time">1h ago</span></div>
                </div>
              </div>
              <div class="media"> <a href="#"><img class="d-flex mr-3" src="img/food1.jpg" alt="Generic placeholder image"></a>
                <div class="media-body">
                  <div class="news-title">
                    <h2 class="title-small"><a href="#">How chicken dishes aren't as bad as you think</a></h2>
                  </div>
                  <div class="news-auther"><span class="time">1h ago</span></div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="profile" role="tabpanel">
              <div class="media"> <a href="#"><img class="d-flex mr-3" src="img/movie.jpg" alt="Generic placeholder image"></a>
                <div class="media-body">
                  <div class="news-title">
                    <h2 class="title-small"><a href="#">Why entertainment centers will make you question everything</a></h2>
                  </div>
                  <div class="news-auther"><span class="time">1h ago</span></div>
                </div>
              </div>
              <div class="media"> <a href="#"><img class="d-flex mr-3" src="img/auto.jpg" alt="Generic placeholder image"></a>
                <div class="media-body">
                  <div class="news-title">
                    <h2 class="title-small"><a href="#">The best ways to utilize automotive jobs</a></h2>
                  </div>
                  <div class="news-auther"><span class="time">1h ago</span></div>
                </div>
              </div>
              <div class="media"> <a href="#"><img class="d-flex mr-3" src="img/business1.jpg" alt="Generic placeholder image"></a>
                <div class="media-body">
                  <div class="news-title">
                    <h2 class="title-small"><a href="#">The worst Movies about live tennis scores</a></h2>
                  </div>
                  <div class="news-auther"><span class="time">1h ago</span></div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="messages" role="tabpanel">
              <div class="media"> <a href="#"><img class="d-flex mr-3" src="img/food.jpg" alt="Generic placeholder image"></a>
                <div class="media-body">
                  <div class="news-title">
                    <h2 class="title-small"><a href="#">How chicken dishes aren't as bad as you think</a></h2>
                  </div>
                  <div class="news-auther"><span class="time">1h ago</span></div>
                </div>
              </div>
              <div class="media"> <a href="#"><img class="d-flex mr-3" src="img/business.jpg" alt="Generic placeholder image"></a>
                <div class="media-body">
                  <div class="news-title">
                    <h2 class="title-small"><a href="#">hy entertainment centers will make you question everything</a></h2>
                  </div>
                  <div class="news-auther"><span class="time">1h ago</span></div>
                </div>
              </div>
              <div class="media"> <a href="#"><img class="d-flex mr-3" src="img/sport1.jpg" alt="Generic placeholder image"></a>
                <div class="media-body">
                  <div class="news-title">
                    <h2 class="title-small"><a href="#">The best ways to utilize automotive jobs</a></h2>
                  </div>
                  <div class="news-auther"><span class="time">1h ago</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="video-sec">
            <h4 class="heading-small">Featured Video</h4>
            <div class="video-block">
              <div class="embed-responsive embed-responsive-4by3">
                <iframe class="embed-responsive-item" src="//www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>
              </div>
            </div>
          </div>
        </aside>
      </div>
    </div>
  </section> -->

	<!-- widget block -->
	<!-- <section class="widget-block widget-slider float-left w-100 py-4">
    <div class="container-fluid">
      <div class="row px-5">
        <div class="col-md-12 px-0">
          <div id="widgetcarousel-1" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <div class="row">
                  <div class="col-md-3">
                    <div class="card text-white">
                      <a href="#">
                        <img class="card-img" src="img/business1.jpg" alt="Card image">
                        <div class="card-img-overlay">
                          <h4 class="card-title">Business</h4>
                        </div>
                      </a>
                    </div>
                  </div>
                  <div class="col-md-3">
                    <div class="card text-white">
                      <a href="#">
                        <img class="card-img" src="img/movie.jpg" alt="Card image">
                        <div class="card-img-overlay">
                          <h4 class="card-title">MOVIES</h4>
                        </div>
                      </a>
                    </div>
                  </div>
                  <div class="col-md-3">
                    <div class="card text-white">
                      <a href="#">
                        <img class="card-img" src="img/sport2.jpg" alt="Card image">
                        <div class="card-img-overlay">
                          <h4 class="card-title">Sports</h4>
                        </div>
                      </a>
                    </div>
                  </div>
                  <div class="col-md-3">
                    <div class="card text-white">
                      <a href="#">
                        <img class="card-img" src="img/tech.jpg" alt="Card image">
                        <div class="card-img-overlay">
                          <h4 class="card-title">Tech</h4>
                        </div>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="carousel-item">
                <div class="row">
                  <div class="col-md-3">
                    <div class="card text-white">
                      <a href="#">
                        <img class="card-img" src="img/auto.jpg" alt="Card image">
                        <div class="card-img-overlay">
                          <h4 class="card-title">Autos</h4>
                        </div>
                      </a>
                    </div>
                  </div>
                  <div class="col-md-3">
                    <div class="card text-white">
                      <a href="#">
                        <img class="card-img" src="img/food1.jpg" alt="Card image">
                        <div class="card-img-overlay">
                          <h4 class="card-title">Food</h4>
                        </div>
                      </a>
                    </div>
                  </div>
                  <div class="col-md-3">
                    <div class="card text-white">
                      <a href="#">
                        <img class="card-img" src="img/lifestyle.jpg" alt="Card image">
                        <div class="card-img-overlay">
                          <h4 class="card-title">Lifestyle</h4>
                        </div>
                      </a>
                    </div>
                  </div>
                  <div class="col-md-3">
                    <div class="card text-white">
                      <a href="#">
                        <img class="card-img" src="img/art.jpg" alt="Card image">
                        <div class="card-img-overlay">
                          <h4 class="card-title">Art</h4>
                        </div>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="control-box">
              <a class="carousel-control-prev" href="#widgetcarousel-1" role="button" data-slide="prev">
                <i class="fa fa-angle-left" aria-hidden="true"></i>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#widgetcarousel-1" role="button" data-slide="next">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> -->

	<!-- Info Block-03 -->
	<!-- <section class="section-02 float-left w-100 py-5">
    <div class="container-fluid">
      <div class="row px-3">
        <div class="col-md-12">
          <h3 class="heading-large">International News Section</h3>
        </div>
        <div class="col-md-4">
          <div class="card"> <img class="img-fluid" src="img/war.jpg" alt="">
            <div class="card-body">
              <div class="news-title">
                <h2 class=" title-small"><a href="#">If your actions inspire others to dream more, learn more, do more and become more, you are a leader.</a></h2>
              </div>
              <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
            </div>
          </div>
          <ul class="news-listing">
            <li><a href="#">Key Republicans sign letter warning against candidate</a></li>
            <li><a href="#">Obamacare Appears to Be Making People Healthier</a></li>
            <li><a href="#">Syria war: Why the battle for Aleppo matters</a></li>
            <li><a href="#">‘S.N.L.’ to Lose Two Longtime Cast Members</a></li>
          </ul>
        </div>
        <div class="col-md-4">
          <div class="card"> <img class="img-fluid" src="img/business.jpg" alt="">
            <div class="card-body">
              <div class="news-title">
              <h2 class=" title-small"><a href="#">I am not afraid of an army of lions led by a sheep; I am afraid of an army of sheep led by a lion.</a></h2>
              </div>
              <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
            </div>
          </div>
          <ul class="news-listing">
            <li><a href="#">Syria war: Why the battle for Aleppo matters</a></li>
            <li><a href="#">Key Republicans sign letter warning against candidate</a></li>
            <li><a href="#">Obamacare Appears to Be Making People Healthier</a></li>
            <li><a href="#">‘S.N.L.’ to Lose Two Longtime Cast Members</a></li>
          </ul>
        </div>
        <div class="col-md-4">
          <div class="card"> <img class="img-fluid" src="img/politics.jpg" alt="">
            <div class="card-body">
            <div class="news-title">
            <h2 class=" title-small"><a href="#">A good leader takes a little more than his share of the blame, a little less than his share of the credit.</a></h2></div>
            <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
            </div>
          </div>
          <ul class="news-listing">
            <li><a href="#">‘S.N.L.’ to Lose Two Longtime Cast Members</a></li>
            <li><a href="#">Key Republicans sign letter warning against candidate</a></li>
            <li><a href="#">Obamacare Appears to Be Making People Healthier</a></li>
            <li><a href="#">Syria war: Why the battle for Aleppo matters</a></li>
          </ul>
        </div>
      </div>
    </div>
  </section> -->

	<!-- Video and Picture gallery -->
	<!-- <section class="video-gallery-sec float-left w-100 py-5">
    <div class="container-fluid">
      <div class="row mb-3 px-3">
        <div class="col-md-12">
          <h3 class="heading-large">Today's Image Gallery</h3>
        </div>
        <div class="col-md-3">
          <div class="news-block">
            <div class="news-media"><a class="example-image-link" href="img/politics1.jpg" data-lightbox="media-2"
                data-title="An Alternative Form of Mental Health Care Gains a Foothold"><img class="img-fluid example-image"
                  src="img/politics1.jpg" alt=""></a><span class="gallery-counter"><i class="fa fa-image"></i>12</span></div>
            <h2 class=" title-small">An Alternative Form of Mental Health Care Gains a Foothold</h2>
          </div>
        </div>
        <div class="col-md-3">
          <div class="news-block">
            <div class="news-media"><a class="example-image-link" href="img/sport.jpg" data-lightbox="media-3"
                data-title="Delta passengers got pizza delivered to the plane"><img class="img-fluid" src="img/sport.jpg"
                  alt=""></a><span class="gallery-counter"><i class="fa fa-image"></i>17</span></div>
            <h2 class=" title-small">Delta passengers got pizza delivered to the plane</h2>
          </div>
        </div>
        <div class="col-md-3">
          <div class="news-block">
            <div class="news-media"><a class="example-image-link" href="img/travel.jpg" data-lightbox="media-4"
                data-title="He took Bolt's record - can he?"><img class="img-fluid" src="img/travel.jpg" alt=""></a><span
                class="gallery-counter"><i class="fa fa-image"></i>06</span></div>
            <h2 class=" title-small">He took Bolt's record - can he?</h2>
          </div>
        </div>
        <div class="col-md-3">
          <div class="news-block">
            <div class="news-media"><a class="example-image-link" href="img/business1.jpg" data-lightbox="media-5"
                data-title="Minorities Suffer From Unequal Pain Treatment"><img class="img-fluid" src="img/business1.jpg"
                  alt=""></a><span class="gallery-counter"><i class="fa fa-image"></i>09</span></div>
            <h2 class=" title-small">Minorities Suffer From Unequal Pain Treatment</h2>
          </div>
        </div>
      </div>
      <div class="row mb-3 px-3">
        <div class="col-md-3">
          <div class="news-block">
            <div class="news-media"><a class="example-image-link" href="img/war.jpg" data-lightbox="media-6" data-title="Minorities Suffer From Unequal Pain Treatment"><img
                  class="img-fluid" src="img/war.jpg" alt=""></a><span class="gallery-counter"><i class="fa fa-image"></i>10</span></div>
            <h2 class=" title-small">Minorities Suffer From Unequal Pain Treatment</h2>
          </div>
        </div>
        <div class="col-md-3">
          <div class="news-block">
            <div class="news-media"><a class="example-image-link" href="img/other1.jpg" data-lightbox="media-7"
                data-title="Delta passengers got pizza delivered to the plane"><img class="img-fluid" src="img/other1.jpg"
                  alt=""></a><span class="gallery-counter"><i class="fa fa-image"></i>11</span></div>
            <h2 class=" title-small">Delta passengers got pizza delivered to the plane</h2>
          </div>
        </div>
        <div class="col-md-3">
          <div class="news-block">
            <div class="news-media"><a class="example-image-link" href="img/other2.jpg" data-lightbox="media-8"
                data-title="He took Bolt's record - can he?"><img class="img-fluid" src="img/other2.jpg" alt=""></a><span
                class="gallery-counter"><i class="fa fa-image"></i>05</span></div>
            <h2 class=" title-small">He took Bolt's record - can he?</h2>
          </div>
        </div>
        <div class="col-md-3">
          <div class="news-block">
            <div class="news-media"><a class="example-image-link" href="img/city.jpg" data-lightbox="media-9"
                data-title="Best moments in travel"><img class="img-fluid" src="img/city.jpg" alt=""></a><span class="gallery-counter"><i
                  class="fa fa-image"></i>15</span></div>
            <h2 class=" title-small">Best moments in travel</h2>
          </div>
        </div>
      </div>
    </div>
  </section> -->


	<!-- Footer tabing section -->
	<!-- <div class="sub-footer">
    <div class="container">
      <h3 class="heading-large">Top Five Stories</h3>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <div class="row">
          <div class="carousel-inner col-sm-8 p-0">
            <div class="carousel-item active"> <img class="img-fluid" src="img/footer-col-1.jpg">
              <div class="carousel-caption">
                <div class="news-title">
                  <h2 class=" title-large"><a href="#">Ray madison may struggle to get best from Paul in a 4-2-3-1
                      formation</a></h2>
                </div>
              </div>
            </div>

            <div class="carousel-item"> <img class="img-fluid" src="img/footer-col-2.jpg">
              <div class="carousel-caption">
                <div class="news-title">
                  <h2 class=" title-large"><a href="#">Delta passengers got pizza delivered to the plane</a></h2>
                </div>
              </div>
            </div> -->
	<!-- End Item -->

	<!-- <div class="carousel-item"> <img class="img-fluid" src="img/footer-col-3.jpg">
              <div class="carousel-caption">
                <div class="news-title">
                  <h2 class=" title-large"><a href="#">Key Republican Senator Says She Will Not Vote for former
                      president!</a></h2>
                </div>
              </div>
            </div> -->
	<!-- End Item -->

	<!-- <div class="carousel-item"> <img class="img-fluid" src="img/footer-col-4.jpg">
              <div class="carousel-caption">
                <div class="news-title">
                  <h2 class=" title-large"><a href="#">An Alternative Form of Mental Health Care Gains a Foothold</a></h2>
                </div>
              </div>
            </div> -->
	<!-- End Item -->

	<!-- <div class="carousel-item"> <img class="img-fluid" src="img/footer-col-5.jpg">
              <div class="carousel-caption">
                <div class="news-title">
                  <h2 class=" title-large"><a href="#">Woman dies in prison drone police chase </a></h2>
                </div>
              </div>
            </div> -->
	<!-- End Item -->
	<!-- </div>
          <ul class="list-group col-sm-4">
            <li data-target="#myCarousel" data-slide-to="0" class="list-group-item active">
              <h4>Ray madison may struggle to get best from Paul in a 4-2-3-1 formation</h4>
            </li>
            <li data-target="#myCarousel" data-slide-to="1" class="list-group-item">
              <h4>Delta passengers got pizza delivered to the plane</h4>
            </li>
            <li data-target="#myCarousel" data-slide-to="2" class="list-group-item">
              <h4>Key Republican Senator Says She Will Not Vote for former president!</h4>
            </li>
            <li data-target="#myCarousel" data-slide-to="3" class="list-group-item">
              <h4>An Alternative Form of Mental Health Care Gains a Foothold</h4>
            </li>
            <li data-target="#myCarousel" data-slide-to="4" class="list-group-item">
              <h4>Woman dies in prison drone police chase </h4>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div> -->

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
