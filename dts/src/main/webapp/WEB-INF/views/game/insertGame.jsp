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

function teamCheck() {
	$("#redTeamId option:eq(0)").attr("selected", false);
	$("#blueTeamId option:eq(0)").attr("selected", false);
	var t1 = $("select[name=redTeamId]").val();
	var t2 = $("select[name=blueTeamId]").val();
	if(t1==t2) {
		$("#redTeamId option:eq(0)").attr("selected", true);
		$("#blueTeamId option:eq(0)").attr("selected", true);
		alert("중복팀을 선택 할 수 없습니다");		
	}	
}
</script>
</head>
<body>
	<h3>경기등록</h3>
	<form action="insertGame" method="post">
	<button>경기등록</button>
		<table class="table">
			<tr>
				<td>레드팀</td>
				<td><select id="redTeamId" name="redTeamId" onchange="teamCheck()">
						<option >REDTEAM</option>
						<c:forEach items="${teamList}" var="team">
							<option value="${team.teamId}">${team.teamId}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>레드팀배당률</td>
				<td><input type="text" name="redRate"></td>
			</tr>
			<tr>
				<td>블루팀</td>
				<td><select id="blueTeamId" name="blueTeamId" onchange="teamCheck()">
						<option >BLUETEAM</option>
						<c:forEach items="${teamList}" var="team">
							<option value="${team.teamId}">${team.teamId}</option>
						</c:forEach>
				</select></td>

			</tr>
			<tr>
				<td>블루팀배당률</td>
				<td><input type="text" name="blueRate"></td>
			</tr>
			<tr>
				<td>경기일자</td>
				<td><input type="date" name="gameDate"/></td>
			</tr>
		</table>
	</form>
</body>
</html>