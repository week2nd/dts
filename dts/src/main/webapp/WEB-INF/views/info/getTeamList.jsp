<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>팀 정보</h3>
<c:if test="${membersession.uGrant=='admin'}">
<a href="insertTeamForm"><button class="btn">새 팀 입력</button></a>
</c:if>
	
	<form name="teamFrm">
		<span><input type="hidden" name="searchCondition" value="team_id">팀 이름</span>
		<input type="text" name="searchKeyword">
		<button> 검색 </button>	
	</form>

	<div>
		<table class="table">
			<tr>
				<th>순위</th>
				<th>팀명</th>
				<th>감독</th>
				<th>헤드코치</th>
				<th>팀 이름</th>
				<th>경기수</th>
				<th>승</th>
				<th>패</th>
				<th>승률</th>
			</tr>
			<c:forEach items="${teamList}" var="team">
				<tr>
					<td>${team.rank }</td>
					<td><a href="getTeam?teamId=${team.teamId }">${team.teamId }</a></td>
					<td>${team.director }</td>
					<td>${team.headCoach}</td>
					<td>${team.name}</td>
					<td>${team.playerMatch}</td>
					<td>${team.win}</td>
					<td>${team.lose}</td>
					<td>${team.rate}%</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 팀 전체 정보보기 끝-->

</body>
</html>