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
					<td>${match.bluepick1Kill}:${match.redpick1Kill}</td>
					<td align="center" colspan="2">${match.redresult}</td>
					<td colspan="6">${match.redteamname}</td>
				</tr>
				<tr>
					<td>K</td>
					<td>${match.bluepick1Kill}</td>
					<td>D</td>
					<td>${match.bluepick1Death}</td>
					<td>A</td>
					<td>${match.bluepick1Assist}</td>
					<td>KDA</td>
					<td>#.#</td>
					<td>Play Time</td>
					<td>K</td>
					<td>${match.redpick1Kill}</td>
					<td>D</td>
					<td>${match.redpick1Death}</td>
					<td>A</td>
					<td>${match.redpick1Assist}</td>
					<td>KDA</td>
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
					<td></td>
					<td></td>
					<td>${match.redban5}rb5</td>
					<td>${match.redban4}rb4</td>
					<td>${match.redban3}rb3</td>
					<td>${match.redban2}rb2</td>
					<td>${match.redban1}rb1</td>
					<td align="center" colspan="2">BAN</td>
				</tr>
			</table>
			<div align="center">
				<minitable class="minitable">
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
					<!-- pick1 -->
					<tr>
						<td>${match.bluepick1Spell1}</td>
						<td rowspan="2">${match.bluepick1}</td>
						<td colspan="4">${match.bluegamer1}SKTT1 이상혁</td>
						<td colspan="4">${match.redgamer1}</td>
						<td rowspan="2">${match.redpick1}</td>
						<td>${match.redpick1Spell1}</td>
					</tr>
					<tr>
						<td>${match.bluepick1Spell2}</td>
						<td>${match.bluepick1Kill}</td>
						<td>${match.bluepick1Death}</td>
						<td>${match.bluepick1Assist}</td>
						<td>#.#</td>
						<!-- bluepick1Kda -->
						<td>${match.redpick1Kill}</td>
						<td>${match.redpick1Death}</td>
						<td>${match.redpick1Assist}</td>
						<td>#.#</td>
						<td>${match.redpick1Spell2}</td>
					</tr>
					<!-- pick2 -->
					<tr>
						<td>${match.bluepick2Spell1}</td>
						<td rowspan="2">${match.bluepick2}</td>
						<td colspan="4">${match.bluegamer2}SKTT1 이상혁</td>
						<td colspan="4">${match.redgamer2}</td>
						<td rowspan="2">${match.redpick2}</td>
						<td>${match.redpick2Spell1}</td>
					</tr>
					<tr>
						<td>${match.bluepick2Spell2}</td>
						<td>${match.bluepick2Kill}</td>
						<td>${match.bluepick2Death}</td>
						<td>${match.bluepick2Assist}</td>
						<td>#.#</td>
						<!-- bluepick2Kda -->
						<td>${match.redpick2Kill}</td>
						<td>${match.redpick2Death}</td>
						<td>${match.redpick2Assist}</td>
						<td>#.#</td>
						<td>${match.redpick2Spell2}</td>
					</tr>
					<!-- pick3 -->
					<tr>
						<td>${match.bluepick3Spell1}</td>
						<td rowspan="2">${match.bluepick3}</td>
						<td colspan="4">${match.bluegamer3}SKTT1 이상혁</td>
						<td colspan="4">${match.redgamer3}</td>
						<td rowspan="2">${match.redpick3}</td>
						<td>${match.redpick3Spell1}</td>
					</tr>
					<tr>
						<td>${match.bluepick3Spell2}</td>
						<td>${match.bluepick3Kill}</td>
						<td>${match.bluepick3Death}</td>
						<td>${match.bluepick3Assist}</td>
						<td>#.#</td>
						<!-- bluepick1Kda -->
						<td>${match.redpick3Kill}</td>
						<td>${match.redpick3Death}</td>
						<td>${match.redpick3Assist}</td>
						<td>#.#</td>
						<td>${match.redpick3Spell2}</td>
					</tr>
					<!-- pick4 -->
					<tr>
						<td>${match.bluepick4Spell1}</td>
						<td rowspan="2">${match.bluepick4}</td>
						<td colspan="4">${match.bluegamer4}SKTT1 이상혁</td>
						<td colspan="4">${match.redgamer4}</td>
						<td rowspan="2">${match.redpick4}</td>
						<td>${match.redpick4Spell1}</td>
					</tr>
					<tr>
						<td>${match.bluepick4Spell2}</td>
						<td>${match.bluepick4Kill}</td>
						<td>${match.bluepick4Death}</td>
						<td>${match.bluepick4Assist}</td>
						<td>#.#</td>
						<!-- bluepick1Kda -->
						<td>${match.redpick4Kill}</td>
						<td>${match.redpick4Death}</td>
						<td>${match.redpick4Assist}</td>
						<td>#.#</td>
						<td>${match.redpick4Spell2}</td>
					</tr>
					<!-- pick5 -->
					<tr>
						<td>${match.bluepick5Spell1}</td>
						<td rowspan="2">${match.bluepick5}</td>
						<td colspan="4">${match.bluegamer5}SKTT1 이상혁</td>
						<td colspan="4">${match.redgamer5}</td>
						<td rowspan="2">${match.redpick5}</td>
						<td>${match.redpick5Spell1}</td>
					</tr>
					<tr>
						<td>${match.bluepick5Spell2}</td>
						<td>${match.bluepick5Kill}</td>
						<td>${match.bluepick5Death}</td>
						<td>${match.bluepick5Assist}</td>
						<td>#.#</td>
						<!-- bluepick1Kda -->
						<td>${match.redpick5Kill}</td>
						<td>${match.redpick5Death}</td>
						<td>${match.redpick5Assist}</td>
						<td>#.#</td>
						<td>${match.redpick5Spell2}</td>
					</tr>
				</minitable>
			</div>
		</c:forEach>
	</form>

</body>
</html>