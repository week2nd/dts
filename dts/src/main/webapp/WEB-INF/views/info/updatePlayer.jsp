<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePlayer</title>
</head>
<body>
	<h3>선수 정보 변경</h3>
	
	
	<form action="updatePlayer">
	<%-- <a href="updatePlayer?nickname=${player.nickname}"> --%><input type="submit" value="선수 정보 변경"></a>
		<table border="1">
			<tr>
				<td>이름</td>
				<td>소환사명</td>
				<td>최근 소속</td>
				<td>W</td>
				<td>L</td>
				<td>TK</td>
				<td>TD</td>
				<td>TA</td>
			</tr>
			<tr>
				<td><input type="text" name="name" value="${player.name}"></td>
				<td><input type="text" name="nickname" value="${player.nickname}"></td>
				<td><input type="text" name="teamId" value="${player.teamId}"></td>
				<td><input type="text" name="win" value="${player.win}"></td>
				<td><input type="text" name="lose" value="${player.lose}"></td>
				<td><input type="text" name="kill" value="${player.kill}"></td>
				<td><input type="text" name="death" value="${player.death}"></td>
				<td><input type="text" name="assist" value="${player.assist}"></td>
			</tr>
		</table>
		<!-- <input type="submit" value="정보 변경"> -->
	</form>
</body>
</html>