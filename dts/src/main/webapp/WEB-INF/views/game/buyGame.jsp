<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyGame</title>

</head>
<body>
<%
		String id = (String) session.getAttribute("uid");				
	%>
	<form action="/insertPurchase" method="post" name="gamebuy">
	<input type="hidden" name="uId" value="<%=id%>">
	게임번호<input type="text" name="gameid" value="${purchaseVO.gameId }">
	선택팀<input type="text" name="choise" value="${purchaseVO.choise }">
	배당률<input type="text" name="betDrate" value="${purchaseVO.betDrate }">
	배팅금액<input type="text" name="betMoney" value="${purchaseVO.betMoney }">
	<button>구매완료하기</button>
</form>
</body>
</html>