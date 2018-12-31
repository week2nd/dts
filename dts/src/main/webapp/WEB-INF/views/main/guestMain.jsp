<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function go_sort(sortCol){				// 정렬
		document.frm.sortCol.value = sortCol;
		document.frm.submit();
	} 
	function go_page(page){					// 페이징
		//	location.href="getMemberList?page="+page;
		document.frm.page.value=page;
		document.frm.submit();			// 검색폼
	}
		

</script>
</head>
<body>

	<h3>경기 정보</h3>

	<form>
	
	<section class="banner-sec float-left w-100 pt-4 pb-5">
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
  </section>
	
	
	
	
		<table class="table">
			<tr>
				<th>경기번호</th>
				<th>날짜</th>
				<th>경기제목</th>
				<th colspan="5">맞대결 전적</th>
				<th>세부정보</th>
				<!-- 경기 일시 -->
				<th>결과확인</th>
				<th>게임 구매</th>
			</tr>
			<c:forEach items="${matchList}" var="match">
				<tr>
					<td>${match.gameId}</td>
					<td>${match.matchDate}17:00</td>
					<td>${match.matchInfo}</td>
					<td><a href="getTeam?teamId=${match.blueTeamName}">${match.blueTeamName}</a></td>
					<td>${match.blueTeamKillsum}</td>
					<td>${match.gameStatus}</td>
					<td>${match.redTeamKillsum}</td>
					<td><a href="getTeam?teamId=${match.redTeamName}">${match.redTeamName}</a></td>
					<td></td>
					<td><a href="getMatch?gameId=${match.gameId}">결과확인</a></td>
					<c:if test="${membersession.uGrant=='admin'}">
					<td><a href="getMhistoryList">마일리지 관리</a></td>
					</c:if>
					<c:if test="${membersession.uGrant!='admin'}">
					<td><a href="buyMatchList"> 구매 </a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</form>

</body>
</html>