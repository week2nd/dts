<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getTeam.jsp</title>
</head>
<body>

	<div>
		<form action="updateTeamForm">
		<c:if test="${membersession.uId=='admin'}">
			<input class="btn" type="submit" value="수정">
		</c:if>
			<table class="table">
				<tr>
					<td><h3>${team.teamId}</h3></td>
					<input type="hidden" name="teamId" value="${team.teamId}">
					<td><h5>${team.director}</h5></td>
					<input type="hidden" name="director" value="${team.director}">
					<td>${team.headCoach}</td>
					<input type="hidden" name="headCoach" value="${team.headCoach}">
					<td><h4>${team.name}</h4></td>
					<input type="hidden" name="name" value="${team.name}">
				</tr>
				<tr>
				<td>순위 ${team.rank}</td>
				<td>${team.director }</td>
				</tr>
			</table>
		</form>
		
		<form>
			현재 소속 선수
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
		</form>
		
			<table class="table">
				<tr>
					<th>상대 팀</th>
					<th>경기 수</th>
					<th> 승 </th>
					<th> 패 </th>
				</tr>
			<c:forEach items="${vsTeam}" var="vs">
				<tr>
					<td>vs <a href="getTeam?teamId=${vs.vsTeam}">${vs.vsTeam}</a></td>
					<td>${vs.playerMatch}</td>
					<td>${vs.win}</td>
					<td>${vs.lose} </td>
				</tr>
			</c:forEach>
			</table>
	</div>
	<c:if test="${membersession.uId=='admin'}">
	<div>
		<a class="badge-light[href]:focus" href="deleteTeam?teamId=${team.teamId}">삭제</a>
	</div>
	</c:if>

</body>
</html>