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
		<form action="deletePlayer">
			<input type="submit" value="선수 삭제">
			<table border="1">
				<tr>
					<td><h3>${player.playerId} ${player.nickname }</h3></td>
					<td><h5>${player.name}</h5></td>
					<td width="64%"></td>
					<td align="right"><h4>${player.teamId }</h4></a></td>
					<%-- <input type="hidden" value="${player.nickname}">
					<input type="hidden" name="playerId" value="${player.playerId}"> --%>
				</tr>
			</table>
		</form>
	</div>


	<div>
		<table class="table">
			<tr>
				<th>일자</th>
				<th>경기정보</th>
				<th>소환사명</th>
				<th>챔피언</th>
				<th>소환주문</th>
				<th>결과</th>
				<th>K</th>
				<th>D</th>
				<th>A</th>
				<th>KDA</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		
	</div>

</body>
</html>