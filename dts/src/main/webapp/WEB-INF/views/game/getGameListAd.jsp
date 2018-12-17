<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>환급</h3>
	<form id="matchListAd" action="updateResult">
		<table class="table">
			<thead>
				<tr>
					<th>게임번호</th>
					<th>경기일시</th>
					<th>경기상태</th>
					<th>레드팀</th>
					<th>블루팀</th>
					<th>금액지급</th>
				</tr>
			</thead>

			<c:forEach items="${gameListAd}" var="game">
				<tr id="g${game.gameId}">
					<td class="gameId">${game.gameId}</td>
					<td class="gameDate">${game.gameDate}</td>
					<td class="gameState">${game.state}</td>
					<td class="redteam">${game.redTeamId}</td>
					<td class="blueteam">${game.blueTeamId}</td>
					<td><button type="button" value="지급버튼"/></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>