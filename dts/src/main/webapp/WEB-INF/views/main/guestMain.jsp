<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   $(function (){
      var dateSplit1=$('#matchDate1').val().split('/');
      var dateSplit2=$('#matchDate2').val().split('/');
      var dateSplit3=$('#matchDate3').val().split('/');
      var dateSplit4=$('#matchDate4').val().split('/');
      var dateSplit5=$('#matchDate5').val().split('/');
      
      String.prototype.ltrimzero = function() { return this.replace(/(^0+)/, ""); };      // 숫자 0 제거

      $("#temp1").text(dateSplit1[1].ltrimzero() + "월 "+ dateSplit1[2].ltrimzero() + "일");
      $("#temp2").text(dateSplit2[1].ltrimzero() + "월 "+ dateSplit2[2].ltrimzero() + "일");
      $("#temp3").text(dateSplit3[1].ltrimzero() + "월 "+ dateSplit3[2].ltrimzero() + "일");
      $("#temp4").text(dateSplit4[1].ltrimzero() + "월 "+ dateSplit4[2].ltrimzero() + "일");
      $("#temp5").text(dateSplit5[1].ltrimzero() + "월 "+ dateSplit5[2].ltrimzero() + "일");
   
   });
</script>
</head>
<body>

   <h3>경기 정보</h3>

   <form>
      
      <div class="container">
         <div class="row">
            <table>
               <c:forEach items="${matchList}" var="match" varStatus="status">
                  <tr>
                     <td>
                        =========================
                        <input type="hidden" id="matchDate${status.count}" name="matchDate" value="${match.matchDate}">
                     </td>
                  </tr>
                  <tr>
                     <td>경기번호 : ${match.gameId}</td>
                  </tr>
                  <tr>
                     <td>
                        날짜 : <label id="temp${status.count}"></label>
                     <!--    <input type="text" id="temp${status.count}" >17:00 -->
                     </td>
                  </tr>
                  <tr>
                     <td>경기코드 : ${match.matchInfo}</td>
                  </tr>
                  <tr>
                     <td>
                        <a href="getTeam?teamId=${match.blueTeamName}">매치 : ${match.blueTeamName}</a>
                        vs
                        <a href="getTeam?teamId=${match.redTeamName}">${match.redTeamName}</a>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <c:if test="${membersession.uGrant!='admin'}">
                           <a href="buyMatchList">
                              <input type="button" value="구매" class="deleteBtn btn btn-primary" > 
                           </a>
                        </c:if>
                        <a href="getMatch?gameId=${match.gameId}">
                           <input type="button" value="결과확인" class="deleteBtn btn btn-primary" > 
                        </a>
                     </td>
                  </tr>
                  <tr>
                     <c:if test="${membersession.uGrant=='admin'}">
                        <td><a href="getMhistoryList">마일리지 관리</a></td>
                     </c:if>
                  </tr>
               </c:forEach>
            </table>

         </div>
         <div class="row">
            <div class="col-5">
               <table border="1" class="table">
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
            <div class="col-5">
               <table border="1" class="table">
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

            <div class="col-5">
               <table border="1" class="table">
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
            <div class="col-5">
               <table border="1" class="table">
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




   </form>

</body>
</html>