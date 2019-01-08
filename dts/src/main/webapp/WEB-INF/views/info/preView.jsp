<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	

	<div class="top-campaign" >
	<p style="font-size:30px; text-align:center">맞대결 전적</p>
		<div class="minitable">
		<table class="table" border="1">
			<tr>
				<th style="text-align : center;" align="center">${preView.blueTeamName}</th>
				<th class="td-center td-top">팀명</th>
				<th style="text-align : center;" align="center">${preView.redTeamName}</th>
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
				<td align="center"><fmt:formatNumber value="${preView.blueRate}" pattern="0.##"></fmt:formatNumber> %</td>
				<td class="td-center">승률</td>
				<td align="center"><fmt:formatNumber value="${preView.redRate}" pattern="0.##"></fmt:formatNumber> %</td>
			</tr>
			<tr>
				<td align="center">
				<fmt:formatNumber value="${preView.blueDrate}" pattern="0.##"></fmt:formatNumber> %</td>
				<td class="td-center">배당률</td>
				<td align="center"><fmt:formatNumber value="${preView.redDrate}" pattern="0.##"></fmt:formatNumber> %</td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>