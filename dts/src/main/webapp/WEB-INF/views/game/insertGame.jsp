<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
$(function() {
$(".datepicker").datepicker();
});
</script>
</head>
<body>
	<h3>경기등록</h3>
	<form action="insertGame" method="post">
	<button>경기등록</button>
		<table class="table">
			<tr>
				<td>레드팀</td>
				<td><select name="redTeamId">
						<c:forEach items="${teamList}" var="team">
							<option value="${team.teamId}">${team.teamId}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>레드팀배당률</td>
				<td><input type="text" name="redRate" value=""></td>
			</tr>
			<tr>
				<td>블루팀</td>
				<td><select name="blueTeamId">
						<c:forEach items="${teamList}" var="team">
							<option value="${team.teamId}">${team.teamId}</option>
						</c:forEach>
				</select></td>

			</tr>
			<tr>
				<td>블루팀배당률</td>
				<td><input type="text" name="blueRate" value=""></td>
			</tr>
			<tr>
				<td>경기일자</td>
				<td><input type="date" name="gameDate"/></td>
			</tr>
		</table>
	</form>
</body>
</html>