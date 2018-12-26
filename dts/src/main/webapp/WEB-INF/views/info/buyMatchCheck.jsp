<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyGame</title>
<!-- <script>
$(function(){
	$("#gameId").text("${purchaseVO.gameId}");
});



</script> -->
</head>
<body>
	
	
	<table class="table">
	<thead>
	<tr>
	<th>게임번호</th>
	<th>선택팀</th>
	<th>배당률</th>
	<th>배팅금액</th>
	</tr>
	</thead>
	<tr>
	<td>${purchaseVO.gameId }</td>
	<td>${purchaseVO.choise }</td>
	<td>${purchaseVO.betDrate }</td>
	<td>${purchaseVO.betMoney }</td>
	</tr>	
	</table>
	<form action="./insertPurchase" method="post" name="gamebuy" >
	<input type="hidden" name="uId" value="${membersession.uId }">
	<input type="hidden" name="gameId" value="${purchaseVO.gameId }" readonly>
	<input type="hidden" name="choise" value="${purchaseVO.choise }" readonly>
	<input type="hidden" name="betDrate" value="${purchaseVO.betDrate }" readonly>
	<input type="hidden" name="betMoney" value="${purchaseVO.betMoney }" readonly>
	<button>구매완료하기</button>
</form>
</body>
</html>