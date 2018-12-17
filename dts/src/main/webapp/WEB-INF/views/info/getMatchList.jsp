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

	<table class="table">
		<tr>
			<th>날짜</th>
			<th>경기정보</th>
			<th>경기제목</th>
			<th colspan="5">맞대결 전적</th>
			<th>중계일정</th>
			<!-- 경기 일시 -->
			<th>경기장</th>
			<th>게임 구매</th>
		</tr>
		<c:forEach items="${matchList}" var="match">
			<tr>
				<td>${match.gameDate} 17:00</td>
				<td>${match.gameInfo}</td>
				<td>${match.blueTeamName }</td>
				<td>${match.blueTeamKill }</td>
				<td>${match.gameStatus }</td>
				<td>${match.redTeamName }</td>
				<td>${match.redTeamKill }</td>
				<td></td>
				<td></td>
				<td><input type="button" value="구매"></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>