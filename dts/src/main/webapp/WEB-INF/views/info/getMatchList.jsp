<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMatchList</title>
	<script>
		function go_page(page){
			location.href="getMatchList?page="+page;
		}
	</script>
</head>
<body>

	<h3>경기 정보</h3>
	
	
	
	<c:if test="${membersession.uGrant=='admin'}">
		<button type="button" onclick="location.href='insertMatchForm'"
				class="btn">경기등록</button>
	</c:if>
		
	<form name= "matchFrm">
		<table border="1">
			<tr>
				<td><input type="hidden" name="searchCondition" value="blueteamname">팀</td>
				<td><input type="text" name="searchKeyword"></td>
				<td><button> 검색 </button></td>
			</tr>
			
		</table>
	</form>

	<form>
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
	
	<my:paging paging="${paging}" jsFunc="go_page"/>
</body>
</html>