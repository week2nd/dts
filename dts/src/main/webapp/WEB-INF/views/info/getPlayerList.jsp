<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPlayerList</title>
</head>
<body>

	<h3>선수 정보 TEST</h3>
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
				<td>#</td>
				<td>${player.name}</td>
				<td>${player.nickname}</td>
				<td>최근 소속</td>
				<td align="center">#</td>
				<td align="center">#</td>
				<td align="center">#</td>
				<td align="center">#%</td>
				<td align="center">#</td>
				<td align="center">#</td>
				<td align="center">#</td>
				<td align="center">#.#</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>