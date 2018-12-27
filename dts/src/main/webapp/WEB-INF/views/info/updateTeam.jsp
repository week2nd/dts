<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertTeam.jsp</title>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<!-- <script>
$(function() {
$(".datepicker").datepicker();
});

function teamCheck() {
	$("#redTeamId option:eq(0)").attr("selected", false);
	var t1 = $("select[name=TeamId]").val();
}
</script> -->

</head>
<body>
	<form action="updateTeam" method="post" enctype="multipart/form-data">
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
					<td><input type="hidden" name="teamId" value="${team.teamId}">
					${team.teamId}</td>
					<td><input type="text" name="director"
						value="${team.director }"></td>
					<td><input type="text" name="headCoach"
						value="${team.headCoach }"></td>
					<td><input type="hidden"  name="name" value="${team.name}">
					${team.name}</td>
					<td>0</td>
					<td>0</td>
					<td>${team.rate}%</td>
				</tr>
			</table>
			<input type="file" name="uploadFile">
		</div>
		<c:if test="${membersession.uGrant=='admin'}">
		<input type="submit" value="입력">
		${team.fileName}
		</c:if>
	</form>

</body>
</html>