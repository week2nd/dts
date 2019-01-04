<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertTeam.jsp</title>
<style type="text/css">
	.tdborder {
		border : 1px solid black;
}
	th {
		border-bottom: 2px dashed black;
	}
</style>

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
		<div class="top-campaign">
			<table class="table">
				<tr>
					<th>팀 약어	</th>
					<th>감독		</th>
					<th>헤드코치	</th>
					<th>팀명		</th>
				</tr>
				<tr>
					<td><input type="hidden"	name="teamId" 		value="${team.teamId}">${team.teamId}		</td>
					<td><input class="tdborder"	type="text"		name="director"		value="${team.director }">	</td>
					<td><input class="tdborder"	type="text"		name="headCoach"	value="${team.headCoach }">	</td>
					<td><input type="hidden"	name="name"			value="${team.name}">${team.name}			</td>
				</tr>
			</table>
				<div align="right">
					<input class="btn btn-outline-success" type="file" name="uploadFile">
					<c:if test="${membersession.uGrant=='admin'}">	<input class="btn btn-outline-secondary" type="submit" value="입력">	${team.fileName}
					</c:if>
				</div>
		</div>
	</form>
</body>
</html>