<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPlayer.jsp</title>
</head>
<body>

	<h3> 선수 입력 화면</h3>
	<form action="insertPlayer">
	<input type="submit" value="선수 등록"> 
		<table border="1">
			<tr>
				<td>소환사명</td>
				<td>선수이름</td>
				<td>Line(Position)</td>
				<td>Tier</td>
				<td>최근 소속</td>
			</tr>
			<tr>
				<td><input type="text" name="nickname" value="${player.nickname}" placeholder="소환사명"> </td>
				<td><input type="text" name="name" value="${player.name}" placeholder="선수명"></td>
				<%-- <td><input type="text" name="birth" value="${player.birth}"></td> --%>
				<%-- <td><input type="text" name="line" value="${player.line}" placeholder="포지션"></td> --%>
				<td><select name="line">
					<option value="TOP">TOP</option>
					<option value="JG">JG</option>
					<option value="MID">MID</option>
					<option value="AD">AD</option>
					<option value="SUP">SUP</option>
				</select></td>
				<td><input type="text" name="tier" value="${player.tier}"></td>
				<%-- <td><input type="text" name="teamId" value="${player.teamId}" placeholder="소속팀"></td> --%>
				<td><select name="teamId">
					<c:forEach items="${teamList}" var="team">
						<option value="${team.teamId}">${team.teamId}</option>
					</c:forEach>
				</select></td>
			</tr>
		</table>
	</form>
	

</body>
</html>