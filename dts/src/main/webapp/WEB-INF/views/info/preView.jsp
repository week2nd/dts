<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>preView</title>

<style>
	.table th {
		border-top: 1px solid black;
	}

	.td-right{
		text-align: right;
		width: 40%;
	}
	.td-center{
		text-align: center;
		width: 20%;
		border: 1px ridge gray;
		border-bottom: 1px ridge gray;
	}
	.td-left{
		text-align: left;
		width: 40%;
	}
	
	.minitable {
		text-align : center;
		width: 60%;
		margin: auto;
	}
	
</style>
</head>
<body>

	<h3>맞대결 전적</h3>
	<br>

	<div class="top-campaign" >
		<div class="minitable">
		<table class="table" border="1">
			<tr>
				<th align="center">${preView.blueTeamName}</th>
				<th class="td-center td-top">팀명</th>
				<th align="center">${preView.redTeamName}</th>
			</tr>
			<tr>
				<td align="center"><c:if test="${preView.win >= preView.lose }">
						<font color="red">${preView.win}승 ${preView.lose}패</font>
					</c:if> <c:if test="${preView.win < preView.lose }">
						<font color="blue"> ${preView.win}승 ${preView.lose}패</font>
					</c:if></td>

				<td class="td-center">최근성적</td>
				<td align="center"><c:if test="${preView.lose >= preView.win }">
						<font color="red">${preView.lose}승 ${preView.win}패</font>
					</c:if> <c:if test="${preView.lose < preView.win }">
						<font color="blue"> ${preView.lose}승 ${preView.win}패</font>
					</c:if></td>

			</tr>
			<tr>
				<td align="center">${preView.playerMatch}</td>
				<td class="td-center">경기수</td>
				<td align="center">${preView.playerMatch}</td>
			</tr>
			<tr>
				<td align="center">${preView.blueRate} %</td>
				<td class="td-center">승률</td>
				<td align="center">${preView.redRate} %</td>
			</tr>
			<tr>
				<td align="center">${preView.blueDrate} %</td>
				<td class="td-center">배당률</td>
				<td align="center">${preView.redDrate} %</td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>