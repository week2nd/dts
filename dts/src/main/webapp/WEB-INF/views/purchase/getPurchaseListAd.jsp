<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script>
	function go_page(page) {
		location.href = "getPurchaseListAd?page=" + page;
	}
</script>
</head>
<body>
	<form name="frm">
		<select name="searchCondition">
			<option value="GAME_ID">게임번호
			<option value="U_Id">아이디
		</select> <input type="text" name="searchKeyword">
		<button>검색</button>
	</form>

	<form>
		<table class="table">
			<thead>
				<tr>
					<th>구매번호</th>
					<th>아이디</th>
					<th>게임번호</th>
					<th>베팅금액</th>
					<th>배당률</th>
					<th>적중유무</th>
					<th>구매일</th>
					<th>선택팀</th>
					<th>지급확인</th>
				</tr>
			</thead>

			<tr>
				<c:forEach items="${purchaseList}" var="purchase">
					<tr>
						<td>${purchase.purchaseNum}</td>
						<td>${purchase.uId}</td>
						<td>${purchase.gameId}</td>
						<td>${purchase.betMoney}</td>
						<td>${purchase.betDrate}</td>
						<td>${purchase.accuracy}</td>
						<td>${purchase.betDate}</td>
						<td>${purchase.choise}</td>
						<td>${purchase.returnCheck}
					</tr>

				</c:forEach>
			</tr>
		</table>
	</form>
	<my:paging paging="${paging1}" jsFunc="go_page"/>
</body>
</html>