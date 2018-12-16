<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyGame</title>

</head>
<body>

	<form action="./insertPurchase" method="post" name="gamebuy" >
	<input type="hidden" name="uId" value="${membersession.uId }">
	게임번호<input type="text" name="gameId" value="${purchaseVO.gameId }" readonly>
	선택팀<input type="text" name="choise" value="${purchaseVO.choise }" readonly >
	배당률<input type="text" name="betDrate" value="${purchaseVO.betDrate }" readonly>
	배팅금액<input type="text" name="betMoney" value="${purchaseVO.betMoney }" readonly>
	<button>구매완료하기</button>
</form>
</body>
</html>