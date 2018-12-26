<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		$(".setResultBtn").click(function() {
			var gameid = $(this).closest('tr').find('.gameId').text();
			console.log(gameid);
			document.setResultfrm.gameId.value = gameid;
			document.setResultfrm.submit();
		});
		
		$(".setMoneyBtn").click(function() {
			/* $("#setMoneyfrm").empty(); */
			var gameid = $(this).closest('tr').find('.gameId').text();
			console.log(gameid);
			document.setMoneyfrm.gameId.value = gameid;
			document.setMoneyfrm.submit();
		});
	});
</script>
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
				<tr id="m${match.gameId}">
					<td class="gameId">${match.gameId}</td>
					<td class="gameDate">${match.gameDate}</td>
					<td class="gameStatus">${match.gameStatus}</td>
					<td class="redTeamName">${match.redTeamName}</td>
					<td class="redResult">${match.redResult}</td>
					<td class="blueTeamName">${match.blueTeamName}</td>
					<td class="blueResult">${match.blueResult}</td>
					<c:if test="${match.checkResult==0}">
					<td class="result"><button type="button" class="btn setResultBtn" disabled="disabled" >구매결과입력</button></td>
					</c:if>
					<c:if test="${match.checkResult!=0}">
					<td class="result"><button type="button" class="btn setResultBtn" >구매결과입력</button></td>
					</c:if>					
					<c:if test="${match.checkReturn==0}">
					<td class="money"><button type="button" class="btn setMoneyBtn">적중금액지급</button></td>
					</c:if>
					<c:if test="${match.checkReturn!=0}">
					<td class="money"><button type="button" class="btn setMoneyBtn" disabled="disabled">적중금액지급</button></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</form>

	<form id="setResultfrm" name="setResultfrm" action="./setResult" method="post">
		<input type="hidden" name="gameId">
	</form>
	
	<form id="setMoneyfrm" name="setMoneyfrm" action="./setMoney" method="post">
		<input type="hidden" name="gameId">
	</form>
</body>
</html>