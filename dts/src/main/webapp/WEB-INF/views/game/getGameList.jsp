<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getGameList</title>
</head>
<body>
<h3>경기리스트</h3>
<a href="${pageContext.request.contextPath}/insertGame">경기등록</a>
	<form>
		<table border="1">
			<thead>
				<tr>
					<th>게임번호</th>
					<th>경기일시</th>
					<th>경기상태</th>
					<th>레드팀</th>
					<th>레드팀배당률</th>
					<th>선택</th>
					<th>블루팀</th>
					<th>블루팀배당률</th>
					<th>선택</th>
					<th>결과</th>

				</tr>
			</thead>

			<tr>
				<c:forEach items="${gameList}" var="game">
					<tr>
						<td>${game.gameId}</td>
						<td>${game.gameDate}</td>
						<td>${game.state}</td>
						<td>${game.redTeamId}</td>
						<td>${game.redRate}</td>
						<td><input type="checkbox" name="redcheck" value=""></td>
						<td>${game.blueTeamId}</td>
						<td>${game.blueRate}</td>
						<td><input type="checkbox" name="bluecheck" value=""></td>
						<td>${game.result}</td>
					</tr>
				</c:forEach>
			</tr>
		</table>
	</form>
</body>
</html>