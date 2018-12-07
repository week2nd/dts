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
		<form>
			<table border="1">
				<tr>
					<td><h3>${team.teamId}</h3></td>
					<td><h5>${team.director}</h5></td>
					<td >${team.headCoach }</td>
					<td ><h4>${team.name }</h4></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>