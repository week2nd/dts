<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	th, td {text-align: center;}
</style>
<meta charset="UTF-8">
<title>updatePlayer</title>
</head>
<body>
	<h3>선수 정보 변경</h3>
	
	
	<form action="updatePlayer">
	<%-- <a href="updatePlayer?nickname=${player.nickname}"> --%><input type="submit" value="선수 정보 변경"></a>
		<%-- <table border="1">
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
		</table> --%>
		<div class="top-campaign">
		<table class="table">
			<tr>
				<th>이름		</th>
				<th>소환사명	</th>
				<th>포지션	</th>
				<th>최근 소속	</th>
				<th>총 승수	</th>
				<th>총 패배	</th>
				<th>총 처치	</th>
				<th>총 사망	</th>
				<th>총 지원	</th>
			</tr>	<tr>
				<td>${player.name}		</td>
				<input type="hidden" name="name" value="${player.name}">
				<td >${player.nickname}	</td>
				<input type="hidden" name="nickname" value="${player.nickname}">
				<td><select name="line">
					<option value="TOP"<c:if test="${player.line == 'TOP'}">selected="selected"</c:if>>	TOP	</option>
					<option value="JG"<c:if test="${player.line == 'JG'}">selected="selected"</c:if>>	JG	</option>
					<option value="MID"<c:if test="${player.line == 'MID'}">selected="selected"</c:if>>	MID	</option>
					<option value="AD"<c:if test="${player.line == 'AD'}">selected="selected"</c:if>>	AD	</option>
					<option value="SUP"<c:if test="${player.line == 'SUP'}">selected="selected"</c:if>>	SUP	</option>
				</select></td>
				<td><select name="teamId">
					<c:forEach items="${teamList}" var="team">
					<option value="${team.teamId}"
						<c:if test="${team.teamId == player.teamId}"> selected="selected" </c:if>> ${team.teamId} </option>
					</c:forEach>
				</select></td>
				<td>${player.win}		</td>
				<td>${player.lose}		</td>
				<td>${player.kill}		</td>
				<td>${player.death}		</td>
				<td>${player.assist}	</td>
		</table>
		</div>
		<!-- <input type="submit" value="정보 변경"> -->
	</form>
</body>
</html>