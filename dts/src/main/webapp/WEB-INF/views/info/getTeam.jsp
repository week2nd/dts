<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
th {
	border-bottom: 1px solid black;
}
.logosize {
	width: 60%;
	height: 60%;
}
</style>
<title>getTeam.jsp</title>
</head>
<body>

	<form action="updateTeamForm">
		<c:if test="${membersession.uGrant=='admin'}">
			<div align="right">	<input class="btn btn-outline-secondary" type="submit" value="수정">	</div>
		</c:if>
		<h2>${team.teamId}</h2>
		<div class="top-campaign">
		
			<table class="table">
				<tr>
					<td rowspan="2" width="25%"><c:if test="${not empty team.fileName}">	<img class="logosize" src="./img/${team.fileName}">	</c:if></td>
					<input type="hidden" name="teamId" value="${team.teamId}">
					<td width="25%"><h4>정식 팀명 : ${team.name}</h4></td>
					<td><h5>감독</h5></td>
					<input type="hidden" name="director" value="${team.director}">
					<td><h5>헤드코치</h5></td>
					<input type="hidden" name="headCoach" value="${team.headCoach}">

				</tr>
				<tr>
					
					<td>순위	${team.rank}등</td>
					<input type="hidden" name="name" value="${team.name}">
					<td width="25%">${team.director}</td>
					<td width="25%">${team.headCoach}</td>
				</tr>
			</table>
		</div>
	</form>

	<form>
		<h4>현재 소속 선수</h4>
		<div class="top-campaign">
			<table class="table">
				<tr>
					<th>포지션</th>
					<th>이름</th>
					<th>소환사명</th>
					<th>M</th>
					<th>W</th>
					<th>L</th>
					<th>TK</th>
					<th>TD</th>
					<th>TA</th>
					<th>KDA</th>
				</tr>
				<c:forEach items="${teamJoin}" var="tj">
					<tr>
						<td>${tj.playerLine}</td>
						<td><a href="getPlayer?nickname=${tj.nickName}">${tj.playerName}</a></td>
						<td><a href="getPlayer?nickname=${tj.nickName}">${tj.nickName}</a></td>
						<td>${tj.playerMatch}</td>
						<td>${tj.playerWin}</td>
						<td>${tj.playerLose}</td>
						<td>${tj.playerKill}</td>
						<td>${tj.playerDeath}</td>
						<td>${tj.playerAssist}</td>
						<td>${tj.playerKda}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>

	<h4>상대 전적</h4>
	<div class="top-campaign">
		<table class="table">
			<tr>
				<th>상대 팀</th>
				<th>경기 수</th>
				<th>승</th>
				<th>패</th>
			</tr>
			<c:forEach items="${vsTeam}" var="vs">
				<tr>
					<td>vs <a href="getTeam?teamId=${vs.vsTeam}">${vs.vsTeam}</a></td>
					<td>${vs.playerMatch}</td>
					<td>${vs.win}</td>
					<td>${vs.lose}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<c:if test="${membersession.uGrant=='admin'}">
		<div>
			<a class="badge-light[href]:focus"
				href="deleteTeam?teamId=${team.teamId}">삭제</a>
		</div>
	</c:if>
</body>
</html>