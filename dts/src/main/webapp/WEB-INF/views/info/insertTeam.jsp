<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertTeam.jsp</title>
</head>
<body>

	
	<form action="insertTeam" method="post" enctype="multipart/form-data">
		<div class="top-campaign">
		<p align="left" style="font-size: 30px;"> 팀 입력 </p>
			<table class="table">
				<tr>
					<th>팀 약어	</th>
					<th>감독		</th>
					<th>헤드코치	</th>
					<th>팀명		</th>
				</tr>
				<tr>
					<td><input type="text" name="teamId" 	value="${team.teamId}"		placeholder="팀 약어">	</td>
					<td><input type="text" name="director"	value="${team.director}"	placeholder="감독">		</td>
					<td><input type="text" name="headCoach"	value="${team.headCoach}"	placeholder="헤드코치">	</td>
					<td><input type="text" name="name" 		value="${team.name }"		placeholder="팀이름">		</td>
				</tr>
			</table>
			<p align="right"><input class="btn btn-outline-success" type="file" name="uploadFile" value="${team.fileName }">${team.fileName}	</p>
			<div align="right">
			<input class="btn btn-outline-secondary" type="submit" value="입력" >
		</div>
		</div>
		
	</form>

</body>
</html>