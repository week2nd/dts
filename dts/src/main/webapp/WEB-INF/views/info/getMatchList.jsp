<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 결과 보기</title>
</head>
<body>

	<h3>경기 결과 보기</h3>

	<form>
		<c:forEach items="${matchList}" var="match">
			<table class="table">
				<tr>
					<th colspan="10">${match.matchdate}</th>
					<th>${match.matchname}</th>
					<th colspan="10">${match.matchinfo}</th>
				</tr>
				<tr>
					<td colspan="10">${match.blueteamname}</td>
					<td rowspan="2"> Kill Score <br>
					${match.bluepick1_kill}:${match.redpick1_kill}</td>
					<td colspan="10">${match.redteamname}</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<td>K</td>
					<td>${match.bluepick1_kill}</td>
					<td>D</td>
					<td>${match.bluepick1_death}</td>
					<td>A</td>
					<td>${match.bluepick1_assist}</td>
					<td>KDA </td>
					<td>KDA Function</td>
					<td colspan="2">${match.blueresult}</td>
					<td colspan="2">${match.redresult}</td>
					<td>K</td>
					<td>${match.redpick1_kill}</td>
					<td>D</td>
					<td>${match.redpick1_death}</td>
					<td>A</td>
					<td>${match.redpick1_assist}</td>
					<td>KDA </td>
					<td>KDA Function</td>
				</tr>
				<tr>
					<td>BAN</td>
					<td>${match.blueban1}</td>
					<td>${match.blueban2}</td>
					<td>${match.blueban3}</td>
					<td>${match.blueban4}</td>
					<td>${match.blueban5}</td>
					
				</tr>
			</table>

		</c:forEach>
	</form>

</body>
</html>