<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
.img{
    position: relative;
    background-image: url(./img/SKT_T1.png);
    height: 20vh;
    background-size: cover;
    width:350px;
}
.img-cover{
   height: 100%;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.5);                                                                 
   z-index:1;
   border-radius: 2em;
}
.img .content{
     position: absolute;
     top:10%;
     left:20%;
     color: white;
     text-align: center;
}
#all{
	width: 10%;
	height: 10%;
	
}
#abc{
	/* float:; width:900px; height:100px; */

 /*  	width: 500px;
    height: 500px; */
/*    margin: 500px 100px 100px 100px;*/

/* 	position: relative;
	top:300px; */
}
	
</style>
<script>
   function go_sort(sortCol) { // 정렬
      document.frm.sortCol.value = sortCol;
      document.frm.submit();
   }
   function go_page(page) { // 페이징
      //   location.href="getMemberList?page="+page;
      document.frm.page.value = page;
      document.frm.submit(); // 검색폼
   }
   
   function change1(){
	   $('.notice').css('display','');
	   $('.free').css('display','none');
	   $('.analysis').css('display','none');
	   $('.suggestion').css('display','none');
   }
   function change2(){
	   $('.notice').css('display','none');
	   $('.free').css('display','');
	   $('.analysis').css('display','none');
	   $('.suggestion').css('display','none');
   }
   function change3(){
	   $('.notice').css('display','none');
	   $('.free').css('display','none');
	   $('.analysis').css('display','');
	   $('.suggestion').css('display','none');
   }
   function change4(){
	   $('.notice').css('display','none');
	   $('.free').css('display','none');
	   $('.analysis').css('display','none');
	   $('.suggestion').css('display','');
   }
   
   $(function (){
      var dateSplit1=$('#matchDate1').val().split('/');
      var dateSplit2=$('#matchDate2').val().split('/');
      var dateSplit3=$('#matchDate3').val().split('/');
      var dateSplit4=$('#matchDate4').val().split('/');
      var dateSplit5=$('#matchDate5').val().split('/');
      var dateSplit6=$('#matchDate6').val().split('/');
      
      String.prototype.ltrimzero = function() { return this.replace(/(^0+)/, ""); };      // 숫자 0 제거

      $("#temp1").text(dateSplit1[1].ltrimzero() + "월 "+ dateSplit1[2].ltrimzero() + "일");
      $("#temp2").text(dateSplit2[1].ltrimzero() + "월 "+ dateSplit2[2].ltrimzero() + "일");
      $("#temp3").text(dateSplit3[1].ltrimzero() + "월 "+ dateSplit3[2].ltrimzero() + "일");
      $("#temp4").text(dateSplit4[1].ltrimzero() + "월 "+ dateSplit4[2].ltrimzero() + "일");
      $("#temp5").text(dateSplit5[1].ltrimzero() + "월 "+ dateSplit5[2].ltrimzero() + "일");
      $("#temp6").text(dateSplit6[1].ltrimzero() + "월 "+ dateSplit6[2].ltrimzero() + "일");
   
      
      
   });
</script>
</head>
<body>
	<div id="abc">
   <h3 >게스트 메인페이지</h3>
	
   <form>
      <div class="container">
         <div class="row">
         		<c:forEach items="${matchList}" var="match" varStatus="status">
         		<div class="col-4 img">
         			<div class="content">
		         		<input type="hidden" id="matchDate${status.count}" name="matchDate" value="${match.matchDate}"><br>
		         		<h4>경기번호 : ${match.gameId}<br>
		         		날짜 : <label id="temp${status.count}"></label><br>
		         		매치 : <a href="getTeam?teamId=${match.blueTeamName}"><input type="button" class="btn btn-outline-primary" value="${match.blueTeamName}"></a>
		         		vs
		                <a href="getTeam?teamId=${match.redTeamName}"><input type="button" class="btn btn-outline-primary" value="${match.redTeamName}"></a><br>
		         		<c:if test="${membersession.uGrant!='admin'}">
		         		<a href="buyMatchList">
		                	<input type="button" value="구매" class="deleteBtn btn btn-primary" > 
		                </a>
		                </c:if>
		                <a href="getMatch?gameId=${match.gameId}">
		                   <input type="button" value="결과확인" class="deleteBtn btn btn-primary" > 
		                </a><br>
		                <c:if test="${membersession.uGrant=='admin'}">
		                   <td><a href="getMhistoryList">마일리지 관리</a></td>
		                </c:if>
		                </h4>
		               
	                </div>
                 	<div class="img-cover"></div>
                </div>
                </c:forEach>
			</div>
		</div>

		<ul class="nav nav-pills mb-3">
			<li class="nav-item">
				<a class="nav-link active show" onclick="change1()"
					data-toggle="pill" href="#pills-home"
					 aria-selected="true">공지</a>
				</li>
			<li class="nav-item">
				<a class="nav-link"  onclick="change2()"
					data-toggle="pill" href="#pills-profile"
					 aria-selected="false">자유</a>
				</li>
			<li class="nav-item">
				<a class="nav-link"  onclick="change3()"
					data-toggle="pill" href="#pills-contact"
					 aria-selected="false">분석</a>
				</li>
			<li class="nav-item">
				<a class="nav-link"  onclick="change4()"
					data-toggle="pill" href="#pills-contact" 
					 aria-selected="false">건의</a>
				</li>
		</ul>
		
         <div class="row">
            <div class="col-4 notice">
               <table border="0" class="table">
                  <tr>
                     <td>번호</td>
                     <td>제목</td>
                     <td>작성일</td>
                     <td>아이디</td>
                  </tr>
                  <c:forEach items="${noticeboard }" var="board">
                     <tr>
                        <td>${board.boardNumber }</td>
                        <td><a
                           href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardTitle}</a></td>
                        <td>${board.postDate }</td>
                        <td>${board.uId }</td>
                     </tr>
                  </c:forEach>
               </table>
            </div>
            <div class="col-4 free" style="display: none;">
               <table border="0" class="table">
                  <tr>
                     <td>번호</td>
                     <td>제목</td>
                     <td>작성일</td>
                     <td>아이디</td>
                  </tr>
                  <c:forEach items="${freeboard }" var="board">
                     <tr>
                        <td>${board.boardNumber }</td>
                        <td><a
                           href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardTitle}</a></td>
                        <td>${board.postDate }</td>
                        <td>${board.uId }</td>
                     </tr>
                  </c:forEach>
               </table>
            </div>

            <div class="col-4 analysis" style="display: none;">
               <table border="0" class="table">
                  <tr>
                     <td>번호</td>
                     <td>제목</td>
                     <td>작성일</td>
                     <td>아이디</td>
                  </tr>
                  <c:forEach items="${analysisboard }" var="board">
                     <tr>
                        <td>${board.boardNumber }</td>
                        <td><a
                           href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardTitle}</a></td>
                        <td>${board.postDate }</td>
                        <td>${board.uId }</td>
                     </tr>
                  </c:forEach>
               </table>
            </div>
            <div class="col-4 suggestion" style="display: none;">
               <table border="0" class="table">
                  <tr>
                     <td>번호</td>
                     <td>제목</td>
                     <td>작성일</td>
                     <td>아이디</td>
                  </tr>
                  <c:forEach items="${suggestionboard }" var="board">
                     <tr>
                        <td>${board.boardNumber }</td>
                        <td><a
                           href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardTitle}</a></td>
                        <td>${board.postDate }</td>
                        <td>${board.uId }</td>
                     </tr>
                  </c:forEach>
               </table>
            </div>
         </div>
   </form>
</div>
</body>
</html>