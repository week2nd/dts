<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPlayer</title>
</head>
<body>

	<input type="hidden" value="${player.name}">
	<input type="hidden" value="${player.nickname}">
	<input type="hidden" value="${player.teamId}">
	<input type="hidden" value="${player.win}">
	<input type="hidden" value="${player.lose}">
	<input type="hidden" value="${player.kill}">
	<input type="hidden" value="${player.death}">
	<input type="hidden" value="${player.assist}">

	<h3>getPlayer</h3>

	<h3>전적 정보</h3>


	<a href="updatePlayerForm?nickname=${player.nickname}">선수 정보 변경</a>

	<div>
		<table border="1">
			<tr>
				<td><h3>${player.playerId}</h3></td>
				<td><h5>${player.name}</h5></td>
				<td width="64%"></td>
				<td align="right"><h4>${player.teamId }</h4></td>
				<input type="hidden" value="${player.nickname}">
			</tr>
		</table>
	</div>
</body>
</html>