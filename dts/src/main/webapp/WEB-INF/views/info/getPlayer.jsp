<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPlayer</title>
</head>
<body>

	<h3>getPlayer</h3>

	<h3>전적 정보</h3>
	<div>
		<table border="1">
			<tr>
				<td><h3>${player.playerId}</h3></td>
				<td><h5>${player.name}</h5></td>
				<td width="64%"></td>
				<td align="right"><h4>${player.teamId }</h4></td>
			</tr>
		</table>
	</div>
</body>
</html>