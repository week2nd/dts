<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> preView </title>
</head>
<body>

	<h3> 맞대결 전적 </h3>

<table class="table" border="1">
	<tr>
		<td>${preView.blueTeamName}</td>
		<td>팀명</td>	
		<td>${preView.redTeamName}</td>
	</tr>
	<tr>
		<td><c:if test="${preView.win >= preView.lose }"> <font color="red">${preView.win}승 ${preView.lose}패</font></c:if>
			<c:if test="${preView.win < preView.lose }"> <font color="blue"> ${preView.win}승 ${preView.lose}패</font></c:if>
		</td>
		
		<td>최근성적</td>
		<td><c:if test="${preView.lose >= preView.win }"> <font color="red">${preView.lose}승 ${preView.win}패</font></c:if>
			<c:if test="${preView.lose < preView.win }"> <font color="blue"> ${preView.lose}승 ${preView.win}패</font></c:if>
		</td>
		
	</tr>
	<tr>
		<td>${preView.playerMatch}</td>
		<td>경기수</td>
		<td>${preView.playerMatch}</td>
	</tr>
	<tr>
		<td>${preView.blueRate}</td>
		<td>승률</td>
		<td>${preView.redRate}</td>
	</tr>
	<tr>
		<td>${preView.blueDrate}</td>
		<td>배당률</td>
		<td>${preView.redDrate}</td>
	</tr>
</table>

<table>

</table>


</body>
</html>