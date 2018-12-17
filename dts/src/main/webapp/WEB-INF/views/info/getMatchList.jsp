<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMatchList</title>
</head>
<body>

<button type="button" onclick="location.href='insertMatchForm'"
		class="btn">경기등록</button>

	<form action=>
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
					<td>${match.blueTeamName }</td>
					<td>${match.blueTeamKillsum }</td>
					<td>${match.gameStatus }</td>
					<td>${match.redTeamKillsum }</td>
					<td>${match.redTeamName }</td>
					<td></td>
					<td><a href="getMatch?gameId=${match.gameId}">결과확인</a></td>
					<td><input type="button" value="구매"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>