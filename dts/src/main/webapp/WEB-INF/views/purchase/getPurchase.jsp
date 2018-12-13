<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>배팅단건</h3>
	<table class="table">
		<thead>
			<tr>
				<td>구매번호</td>
				<td>게임번호</td>
				<td>구매일</td>
				<td>선택팀</td>
				<td>배팅금액</td>
				<td>배당률</td>
				<td>적중유무</td>
				<td>환급금액</td>
			</tr>

		</thead>
		<tr>
			<td>${purchase.purchasenum}</td>
			<td>${purchase.gameid}</td>
			<td>${purchase.betdate}</td>
			<td>${purchase.choise}</td>
			<td>${purchase.betmoney}</td>
			<td>${purchase.betdrate}</td>
			<td>${purchase.accuracy}</td>
			<td></td>
		</tr>
	</table>
</body>
</html>