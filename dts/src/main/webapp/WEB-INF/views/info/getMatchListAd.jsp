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
<form id="matchListAd">
	<table class="table">
		<thead>
			<tr>
				<th>게임번호</th>
				<th>경기일자</th>
				<th>경기상태</th>
				<th>레드팀</th>
				<th>결과</th>
				<th>블루팀</th>
				<th>결과</th>
				<td>구매결과입력</td>
				<td>적중금액지급</td>
			</tr>
		</thead>
		
		<c:forEach items="${matchListAd}" var="match">
			<tr>
				<td class="gameId">${match.gameId}</td>
				<td class="gameDate">${match.gameDate}</td>
				<td class="gameStatus">${match.gameStatus}</td>
				<td class="redTeamName">${match.redTeamName}</td>
				<td class="redResult">${match.redResult}</td>
				<td class="blueTeamName">${match.blueTeamName}</td>
				<td class="blueResult">${match.blueResult}</td>
				<td><button type="button" class="btn" id="setResult">버튼</button></td>			
				<td><button>버튼</button></td>			
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>