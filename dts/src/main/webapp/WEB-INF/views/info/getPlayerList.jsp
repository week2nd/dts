<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPlayerList</title>
</head>
<body>

	<h3>선수 정보</h3>
	
	<form name="playerFrm">
		<select name="searchCondition">
			<option value="nickname">소환사명</option>
			<option value="team_id">최근 소속팀</option>
			<option value="name">선수이름</option> 
		</select>
		<input type="text" name="searchKeyword">
		<button> 검색 </button>
	</form>
	
	<form action="insertPlayerForm">
		<c:if test="${membersession.uGrant=='admin'}">
			<input type="submit" value="선수 등록">
		</c:if>
		<table border="1">
			<tr>
				<td>순위</td>
				<td>이름</td>
				<td>소환사명</td>
				<td>최근 소속</td>
				<td align="center">M</td>
				<td align="center">W</td>
				<td align="center">L</td>
				<td align="center">승률</td>
				<td align="center">TK</td>
				<td align="center">TD</td>
				<td align="center">TA</td>
				<td align="center">KDA</td>
			</tr>
			<c:forEach items="${playerList}" var="player">
				<tr>
					<td>${player.playerRank}</td>
					<td><a href="getPlayer?nickname=${player.nickname}">${player.name}</a></td>
					<td><a href="getPlayer?nickname=${player.nickname}">${player.nickname}</a></td>
					<td><a href="getTeam?teamId=${player.teamId }">${player.teamId }</a></td>
					<td>${player.match}</td>
					<td>${player.win}</td>
					<td>${player.lose}</td>
					<td>${player.winrate }%</td>
					<td>${player.kill}</td>
					<td>${player.death}</td>
					<td>${player.assist}</td>
					<td>${player.kda}</td>
					<input type="hidden" name="playerId" value="${player.playerId}">
				</tr>
			</c:forEach>
		</table>
	</form>
	
	<a href="#">위로가기</a>
	
	</div>
</body>
</html>