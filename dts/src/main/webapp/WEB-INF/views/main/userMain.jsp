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
	
/* .img-cover{
   height: 100%;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.5);                                                                 
   z-index:1;
   border-radius: 2em;
} */
.img .content{
     position: absolute;
     top:10%;
     left:20%;
     color: white;
     text-align: center;
}


.imgSKT{
	position: relative;
	background-image: url(./img/skt3.png); 
	background-repeat: no-repeat;
}
.imgKT{
	position: relative;
	background-image: url(./img/kt3.png); 
	background-repeat: no-repeat;
	
}
.Air{
	position: relative;
	background-image: url(./img/jinair3.png); 
	background-repeat: no-repeat;
}

.G{
	position: relative;
	background-image: url(./img/geng3.png); 
	background-repeat: no-repeat;
}
.imgAfreeca{
	position: relative;
	background-image: url(./img/afreeca3.png); 
	background-repeat: no-repeat;
	
}
.imgKZ{
	position: relative;
	background-image: url(./img/kingzone3.png); 
	background-repeat: no-repeat;
}

.imgDWG{
	position: relative;
	background-image: url(./img/damwon3.png); 
	background-repeat: no-repeat;
}
.imgSANDBOX{
	position: relative;
	background-image: url(./img/sandbox3.png); 
	background-repeat: no-repeat;
	
}
.imgFIN{
	position: relative;
	background-image: url(./img/griffin3.png); 
	background-repeat: no-repeat;
}

.imgHLE{
	position: relative;
	background-image: url(./img/hanwha3.png); 
	background-repeat: no-repeat;
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
      
      String.prototype.ltrimzero = function() { return this.replace(/(^0+)/, ""); };      // 숫자 0 제거

      $("#temp1").text(dateSplit1[1].ltrimzero() + "월 "+ dateSplit1[2].ltrimzero() + "일");
      $("#temp2").text(dateSplit2[1].ltrimzero() + "월 "+ dateSplit2[2].ltrimzero() + "일");
      $("#temp3").text(dateSplit3[1].ltrimzero() + "월 "+ dateSplit3[2].ltrimzero() + "일");
      $("#temp4").text(dateSplit4[1].ltrimzero() + "월 "+ dateSplit4[2].ltrimzero() + "일");
   
      
      
   });
</script>
</head>


	
      <div class="container">
         <div class="row">
         	
         		<c:forEach items="${matchList}" var="match" varStatus="status">
         			<div class="row" style="width:100%; magin-bottom:20px;">		
         		<div class="col-4 img${match.blueTeamName}" >
         		</div>
         			<div class="col-3 content card" style="text-align:center; margin:5px 30px; font-size:25px;">
		         		<input type="hidden" id="matchDate${status.count}" name="matchDate" value="${match.matchDate}">
		         		<div>경기번호 : ${match.gameId}<br></div>
		         		<div>날짜 : <label id="temp${status.count}"></label></div>
		         		<div><a href="getTeam?teamId=${match.blueTeamName}">${match.blueTeamName}</a>
		         		vs
		                <a href="getTeam?teamId=${match.redTeamName}">${match.redTeamName}</a>
		                </div>
		                <div style="margin-bottom:5px;">
		         		<a href="buyMatchList" class="btn btn-outline-primary">
		                	구매
		                </a>
		                 <a href="getMatch?gameId=${match.gameId}"  class="btn btn-outline-primary">
		                   경기미리보기</a>
		                </div>
		               
	                </div>
                 	<!-- <div class="img-cover"></div> -->
                <div class="col-4 img${match.redTeamName}">
         		</div>
                </div>
                </c:forEach>
			</div>
		</div>
		
		<div class="container2" style="margin:50px 0px 50px 0px">
		<div class="row">
		<div class="col-6">
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
		
         <div class="row" style="width:150%;">
            <div class="col-8 notice">
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
            <div class="col-8 free" style="display: none;">
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

            <div class="col-8 analysis" style="display: none;">
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
            <div class="col-8 suggestion" style="display: none;">
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
         </div>
         <div class="col-4" style="margin:0px 0px 20px 0px">
	         <div >
	         	<a href="./helper"><img src="img\helper.PNG"></a>
	         </div>
	     </div>
         </div>
         </div>
</body>
</html>