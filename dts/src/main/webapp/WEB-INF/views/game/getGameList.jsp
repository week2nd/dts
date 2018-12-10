<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getGameList</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		$(".redcheck").click(function() {
			
			/* $(".redcheck").attr("checked", false); //uncheck all checkboxes
			$(this).attr("checked", true);  */
			
			
			$('input[type="checkbox"]').not(this).prop("checked", false);
			$("#gameBuytr").empty();
			var a1 = $(this).closest('tr').find('.gameId').text();
			var a2 = $(this).closest('tr').find('.gameDate').text();
			var a3 = $(this).closest('tr').find('.redTeamId').text();
			var a4 = $(this).closest('tr').find('.redRate').text();
			var tr = "<td>" + a1 + "</td><td>" + a2 + "</td><td>" + a3 + "</td><td class='rate'>" + a4 + "</td><td><input type='text' class = 'betmoney'" 
			+ " onchange='returnMoney(event)'></td><td class='returnmoney'></td>";
			$(tr).appendTo("#gameBuytr");
			
		});
		
		$(".bluecheck").click(function() {
			$("#gameBuytr").empty();
			var a1 = $(this).closest('tr').find('.gameId').text();
			var a2 = $(this).closest('tr').find('.gameDate').text();
			var a3 = $(this).closest('tr').find('.blueTeamId').text();
			var a4 = $(this).closest('tr').find('.blueRate').text();
			var tr = "<td>" + a1 + "</td><td>" + a2 + "</td><td>" + a3 + "</td><td class='rate'>" + a4 + "</td><td><input type='text' class = 'betmoney'" 
			+ " onchange='returnMoney(event)'></td><td class='returnmoney'></td>";
			$(tr).appendTo("#gameBuytr");
		});	
	});
	function returnMoney(e) 
	{ 
	    var rate = $(e.target).closest('tr').find('.rate').text();
	    var money = $(e.target).closest('tr').find('.betmoney').val();
	    var rm = rate * money;
	    $(e.target).closest('tr').find('.returnmoney').text(rm);		    
	};
	
</script>
</head>
<body>

	<h3>경기리스트</h3>
	<button id="insertGame" class="btn">경기등록</button>
	<form id="gameList">
		<table class="table">
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

			<c:forEach items="${gameList}" var="game">
				<tr id="g${game.gameId}">
					<td class="gameId">${game.gameId}</td>
					<td class="gameDate">${game.gameDate}</td>
					<td class="state">${game.state}</td>
					<td class="redTeamId">${game.redTeamId}</td>
					<td class="redRate">${game.redRate}</td>
					<td ><input class="redcheck" type="checkbox"></td>
					<td class="blueTeamId">${game.blueTeamId}</td>
					<td class="blueRate">${game.blueRate}</td>
					<td ><input class="bluecheck" type="checkbox"></td>
					<td class="result">${game.result}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<h3>구매</h3>
	<form id="gameBuy">
		<table class="table">
			<thead>
				<tr>
					<th>게임번호</th>
					<th>경기일시</th>
					<th>선택팀</th>
					<th>선택배당률</th>
					<th>배팅금액</th>
					<th>예상적중금액</th>
				</tr>
			</thead>

			<tr id="gameBuytr">
			</tr>
			<button id="gamebuy" class="btn">구매하기</button>

		</table>
	</form>
</body>
</html>