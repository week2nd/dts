<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getTeam.jsp</title>
</head>
<body>

	<div>
		<form action="updateTeamForm">
			<input class="btn" type="submit" value="수정">
			<table border="1">
				<tr>
					<td><h3>${team.teamId}</h3></td>
					<input type="hidden" name="teamId" value="${team.teamId}">
					<td><h5>${team.director}</h5></td>
					<input type="hidden" name="director" value="${team.director}">
					<td >${team.headCoach}</td>
					<input type="hidden" name="headCoach" value="${team.headCoach}">
					<td ><h4>${team.name}</h4></td>
					<input type="hidden" name="name" value="${team.name}">
				</tr>
				<tr>
				<td>순위 ${team.rank}</td>
				</tr>
			</table>
		</form>
	</div>
	<a class="badge-light[href]:focus" href="deleteTeam?teamId=${team.teamId}">삭제</a>

</body>
</html>