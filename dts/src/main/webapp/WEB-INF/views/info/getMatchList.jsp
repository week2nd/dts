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
					<th colspan="8">${match.matchdate}</th>
					<th>${match.matchname}</th>
					<th colspan="8">${match.matchinfo}</th>
				</tr>
				<tr>
					<td colspan="6">${match.blueteamname}</td>
					<td align="center" colspan="2">${match.blueresult}</td>
					<td>${match.bluepick1_kill}:${match.redpick1_kill}</td>
					<td align="center" colspan="2">${match.redresult}</td>
					<td colspan="6">${match.redteamname}</td>
				</tr>
				<tr>
					<td>K</td>
					<td>${match.bluepick1_kill}</td>
					<td>D</td>
					<td>${match.bluepick1_death}</td>
					<td>A</td>
					<td>${match.bluepick1_assist}</td>
					<td>KDA </td>
					<td>#.#</td>
					<td>Play Time</td>
					<td>K</td>
					<td>${match.redpick1_kill}</td>
					<td>D</td>
					<td>${match.redpick1_death}</td>
					<td>A</td>
					<td>${match.redpick1_assist}</td>
					<td>KDA </td>
					<td>#.#</td>
				</tr>
				<tr>
				<td align="center" colspan="2">BAN</td>
					<td>${match.bluepick1}</td>
					<td>${match.bluepick2}</td>
					<td>${match.bluepick3}</td>
					<td>${match.bluepick4}</td>
					<td>${match.bluepick5}</td>
					<td></td>
					<td>${match.playtime}</td>
					<td></td>
					<td>${match.redpick5}</td>
					<td>${match.redpick4}</td>
					<td>${match.redpick3}</td>
					<td>${match.redpick2}</td>
					<td>${match.redpick1}</td>
					<td align="center" colspan="2">BAN</td>
				</tr>
				<tr>
					<td align="center" colspan="2">BAN</td>
					<td>${match.blueban1}bb1</td>
					<td>${match.blueban2}bb2</td>
					<td>${match.blueban3}bb3</td>
					<td>${match.blueban4}bb4</td>
					<td>${match.blueban5}bb5</td>
					<td></td>
					<td> </td>
					<td></td>
					<td>${match.redban5}rb5</td>
					<td>${match.redban4}rb4</td>
					<td>${match.redban3}rb3</td>
					<td>${match.redban2}rb2</td>
					<td>${match.redban1}rb1</td>
					<td align="center" colspan="2">BAN</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<td>Spell</td>
					<td>Champ</td>
					<td>Kill</td>
					<td>Death</td>
					<td>Assist</td>
					<td>KDA</td>
					<td>Kill</td>
					<td>Death</td>
					<td>Assist</td>
					<td>KDA</td>
					<td>Champ</td>
					<td>Spell</td>
				</tr>
				<tr>
					<td>${match.bluepick1_spell1}</td>
					<td rowspan="2">${match.bluepick1}</td>
					<td colspan="4">${match.bluegamer1}SKT T1 이상혁</td>
					<td colspan="4">${match.redgamer1}</td>
					<td rowspan="2">${match.redpick1}</td>
					<td>${match.redpick1_spell1}</td>
				</tr>
				<tr>
					<td>${match.bluepick1_spell2}</td>
					<td>${match.bluepick1_kill}</td>
					<td>${match.bluepick1_death}</td>
					<td>${match.bluepick1_assist}</td>
					<td>#.#</td> <!-- bluepick1_kda -->
					<td>${match.redpick1_kill}</td>
					<td>${match.redpick1_death}</td>
					<td>${match.redpick1_assist}</td>
					<td>#.#</td>
					<td>${match.redpick1_spell2}</td>
				</tr>
					
					
					
			
			</table>
		</c:forEach>
	</form>

</body>
</html>