<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPlayer.jsp</title>
</head>
<body>

	
		<form action="insertPlayer">
		<div align="right">
			<input type="submit" class="btn btn-outline-secondary" value="선수 등록">
		</div>
		<div class="top-campaign">
		<p align="left" style="font-size: 30px;"> 선수 입력 화면 </p>
			<table class="table">
				<tr>
					<td>소환사명			</td>
					<td>선수이름			</td>
					<td>Line(Position)	</td>
					<td>최근 소속			</td>
				</tr>
				<tr>
					<td><input type="text" name="nickname"
						value="${player.nickname}" placeholder="소환사명만 입력하세요">	</td>
					<td><input type="text" name="name" value="${player.name}"
						placeholder="선수명을 입력하세요">								</td>
					<td><select name="line">
							<option value="TOP">TOP	</option>
							<option value="JG">JG	</option>
							<option value="MID">MID	</option>
							<option value="AD">AD	</option>
							<option value="SUP">SUP	</option>
						</select>	</td>
					<td><select name="teamId">
							<c:forEach items="${teamList}" var="team">
								<option value="${team.teamId}">${team.teamId}	</option>
							</c:forEach>
						</select>	</td>
				</tr>
			</table>
		</div>
	</form>


</body>
</html>