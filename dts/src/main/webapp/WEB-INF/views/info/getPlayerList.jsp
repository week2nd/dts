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

	<h3>선수 정보 TEST</h3>	
	<form action="insertPlayerForm">
		<input type="submit" value="선수 등록">
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
					<td>${player.name}</td>
					<td><a href="getPlayer?nickname=${player.nickname}">${player.nickname}</a></td>
					<td>${player.teamId}</td>
					<td>${player.match}</td>
					<td>${player.win}</td>
					<td>${player.lose}</td>
					<td>${player.winrate }%</td>
					<td>${player.kill}</td>
					<td>${player.death}</td>
					<td>${player.assist}</td>
					<td>${player.kda}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>