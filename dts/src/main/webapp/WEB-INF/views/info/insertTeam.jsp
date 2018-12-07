<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertTeam.jsp</title>
</head>
<body>
	<form action="insertTeam">
		<div>
			<table>
				<tr>
					<th>팀 약어</th>
					<th>감독</th>
					<th>헤드코치</th>
					<th>팀명</th>
					<th>Win</th>
					<th>Lose</th>
					<th>Rate</th>
				</tr>
				<tr>
					<td><input type="text" name="teamId" value="${team.teamId}"></td>
					<td><input type="text" name="director"
						value="${team.director }"></td>
					<td><input type="text" name="headCoach"
						value="${team.headCoach }"></td>
					<td><input type="text" name="name" value="${team.name }">
					</td>
					<td>0</td>
					<td>0</td>
					<td>${team.rate}%</td>
				</tr>
			</table>
		</div>
		<input type="submit" value="입력">
	</form>

</body>
</html>