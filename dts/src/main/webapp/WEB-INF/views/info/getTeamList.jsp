<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th {
	border-bottom: 1px solid black;
}


th, td {
	text-align: center;
}
</style>
</head>
<body>

	
	

	

	<div class="top-campaign">
	<p style="font-size:30px; text-align:center">팀 정보</p>
	<form name="teamFrm">
		<table>
			<tr>
				<th style="border-bottom: 0px;"><input type="hidden" name="searchCondition" value="team_id" placeholder=""><font size="4">팀 이름 &nbsp;</font>	</th> 
				<td ><input style="border:none; border-bottom: 2px solid black;" type="text" name="searchKeyword">	</td>
				<td><button class="btn btn-outline-secondary" style="line-height: 0.65">검색</button>	</td>		
			</tr>
		</table>
	</form>
	
	<c:if test="${membersession.uGrant=='admin'}">
		<p align="right">
			<a href="insertTeamForm"><button
					class="btn btn-outline-secondary">새 팀 입력</button></a>
		</p>
	</c:if>
	
	
	<br>
		<table class="table">
			<tr>
				<th style="border-top : 1px solid black;">순위		</th>
				<th style="border-top : 1px solid black;">팀명		</th>
				<th style="border-top : 1px solid black;">감독		</th>
				<th style="border-top : 1px solid black;">헤드코치	</th>
				<th style="border-top : 1px solid black;">팀 이름	</th>
				<th style="border-top : 1px solid black;">경기수	</th>
				<th style="border-top : 1px solid black;">승		</th>
				<th style="border-top : 1px solid black;">패		</th>
				<th style="border-top : 1px solid black;">승률		</th>
			</tr>
			<c:forEach items="${teamList}" var="team">
				<tr>
					<td>	<c:if test="${team.rank == 1}">	<b><font color="red">	</c:if>
						${team.rank}	<c:if test="${team.rank == 1}">	</font></b>	</c:if>	</td>
					<td><a href="getTeam?teamId=${team.teamId}">${team.teamId }</a>	</td>
					<td>${team.director}	</td>
					<td>${team.headCoach}	</td>
					<td>${team.name}		</td>
					<td>${team.playerMatch}	</td>
					<td>${team.win}			</td>
					<td>${team.lose}		</td>
					<td>${team.rate}%		</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 팀 전체 정보보기 끝-->

</body>
</html>