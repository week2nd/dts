<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyMatchList</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		$(".redcheck").click(function() {
						
			$('input[type="checkbox"]').not(this).prop("checked", false);
			$("#gameBuytr").empty();
			var a1 = $(this).closest('tr').find('.gameId').text();
			var a2 = $(this).closest('tr').find('.gameDate').text();
			var a3 = $(this).closest('tr').find('.redTeamName').text();
			var a4 = $(this).closest('tr').find('.redRate').text();
			var tr = "<td class='gameid'>" + a1 + "</td><td class='gamedate'>" + a2 + "</td><td class='teamid'>" + a3 + "</td><td class='rate'>" + a4 + "</td><td><input type='text' id= 'betmoney' class = 'betmoney'" 
			+ " onkeyup='returnMoney(event);removeChar(event);' onchange='checkMileage(event)'; onkeydown='return onlyNumber(event)'></td><td id='returnmoney' class='returnmoney' ></td>";
			$(tr).appendTo("#gameBuytr");			
		});
		
		$(".bluecheck").click(function() {
			$('input[type="checkbox"]').not(this).prop("checked", false);
			$("#gameBuytr").empty();
			var a1 = $(this).closest('tr').find('.gameId').text();
			var a2 = $(this).closest('tr').find('.gameDate').text();
			var a3 = $(this).closest('tr').find('.blueTeamName').text();
			var a4 = $(this).closest('tr').find('.blueRate').text();
			var tr = "<td class='gameid'>" + a1 + "</td><td class='gamedate'>" + a2 + "</td><td class='teamid'>" + a3 + "</td><td class='rate'>" + a4 + "</td><td><input type='text' id = 'betmoney' class = 'betmoney'" 
			+ " onkeyup='returnMoney(event);removeChar(event);' onchange='checkMileage(event)'; onkeydown='return onlyNumber(event)'></td><td id='returnmoney' class='returnmoney' ></td>";
			$(tr).appendTo("#gameBuytr");
		});	
		
		
		$("#buy").click(function() {
			var gameid = $("#gameBuytr").find('.gameid').text();
			//var gamedate = $("#gameBuytr").find('.gameDate').text();
			var team = $("#gameBuytr").find('.teamid').text();
			var rate = $("#gameBuytr").find('.rate').text();
			//var betmoney = $("#gameBuytr").find('.betmoneyr').val();
			var betmoney = $("#betmoney").val();
			//var returnmoney = $("#gameBuytr").find('.returnmoney').text();
			document.gameBuy.gameId.value = gameid;
			document.gameBuy.choise.value = team;
			document.gameBuy.betDrate.value = rate;
			document.gameBuy.betMoney.value = betmoney;
			console.log(gameid);
			console.log(team);
			console.log(betmoney);
			console.log(rate);
			
			document.gameBuy.submit();
		}); 
	});
	function returnMoney(e) 
	{ 
	    var rate = $(e.target).closest('tr').find('.rate').text();
	    var money = $(e.target).closest('tr').find('.betmoney').val();
	    var rm = parseInt(rate*money);
	    $(e.target).closest('tr').find('.returnmoney').text(rm);		    
	};
	function onlyNumber(event){		
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	        return;
	    else
	        return false;
	};
	function removeChar(event) {
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	        return;
	    else
	        event.target.value = event.target.value.replace(/[^0-9]/g, "");
	};
	
	function checkMileage(event) {
		var mileage = ${membersession.uMileage};
		var betmoney = $("#gameBuytr").find('.betmoney').val();
		
		if (mileage < betmoney) {
				alert("보유 마일리지보다 큰 금액을 입력할 수 없습니다.");
				$("#betmoney").val(0);
				$("#returnmoney").text(0);
			} else if (betmoney > 100000) {
				alert("게임당 배팅가능금액은 10만원 이하 입니다.");
				$("#betmoney").val(0);
				$("#returnmoney").text(0);
			} else if (betmoney < 1000) {
				alert("게임당 배팅가능금액은 천원 이상 입니다.");
				$("#betmoney").val(0);
				$("#returnmoney").text(0);
			}
	};
</script>
</head>
<body>

	<h3>경기리스트</h3>
	<form id="matchList">
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

				</tr>
			</thead>


			<c:forEach items="${buyMatchList}" var="match">
				<tr id="g${match.gameId}">
					<td class="gameId">${match.gameId}</td>
					<td class="gameDate">${match.gameDate}</td>
					<td class="gameStatus">${match.gameStatus}</td>
					<td class="redTeamName">${match.redTeamName}</td>
					<td class="redRate">${match.redRate}</td>
					<td ><input class="redcheck" type="checkbox"<c:if test="${match.buyCheck!=0 || match.gameStatus == '후' || match.gameStatus == '중'}"> disabled='disabled' </c:if>></td>
					<td class="blueTeamName">${match.blueTeamName}</td>		
					<td class="blueRate">${match.blueRate}</td>
					<td ><input class="bluecheck" type="checkbox"<c:if test="${match.buyCheck!=0 || match.gameStatus == '후' || match.gameStatus == '중'}"> disabled='disabled' </c:if>></td>
					<%-- <c:if test="${match.buyCheck!=0}">	
					<td ><input class="bluecheck" type="checkbox" disabled='disabled'></td></c:if>
					<c:if test="${match.buyCheck==0}">
					<td ><input class="bluecheck" type="checkbox"></td></c:if> --%>
					
				</tr>
			</c:forEach>
		</table>
	</form>
	<h3>구매</h3>
	

	<button type="button" class="btn" id="buy">구매하기</button>
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
			<tr id="gameBuytr" name="gameBuytr">
			</tr>
		</table>
		
		
	<form id="gameBuy" name="gameBuy" action="./buyGame" method="post">
		<input type="hidden" name="gameId"> 
		<input type="hidden" name="betDrate"> 
		<input type="hidden" name="betMoney"> 
		<input type="hidden" name="choise">
	</form>
</body>
</html>