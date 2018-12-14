<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateMatch</title>
<script>
$("#deleteMatchBtn").click(function() {
	var delcon = confirm("삭제하시겠습니까?");
	if(delcon == true) {
		document.write("삭제했습니다.")
	} else if(delcon == false) {
		document.write("취소했습니다.")
	}
	
});
</script>
</head>
<body>

 <!--  ctrl + shift + f 자동정렬 하지마세요! -->

<form action="updateMatch">
<input type="text" name="matchId" value="${match.matchId}" readonly="readonly">
	<div align="center">
		<table class="table">
			<tr>
				<th colspan="8"><input type="text" name="matchdate" value="${match.matchdate}" size="10" placeholder="경기일시" readonly="readonly"></th>
				<th><input type="text" name="matchname" value="${match.matchname}" size="10" placeholder="대회명"></th>
				<td align="right" colspan="8"><input type="text" name="matchinfo" value="${match.matchinfo}" size="10" placeholder="경기 정보"></td>
			</tr>
			<tr>
				<td colspan="6"><input type="text" name="blueteamname" value="${match.blueteamname}" size="10" placeholder="블루팀명"></td>
				<td align="center" colspan="2"><input type="text" name="blueresult" value="${match.blueresult}" size="10" placeholder="블루팀 결과"></td>
				<td>${match.bluepick1Kill}:${match.redpick1Kill}</td>
				<td align="center" colspan="2"><input type="text" name="redresult" value="${match.redresult}" size="10" placeholder="레드팀 결과"></td>
				<td align="right" colspan="6"><input type="text" name="redteamname" value="${match.redteamname}" size="10" placeholder="레드팀명"></td>
			</tr>
			<tr>
				<td>K</td>
				<td><input type="text" name="bluepick1Kill" value="${match.bluepick1Kill}" size="10" placeholder="블루팀 처치합계"></td>
				<td>D</td>
				<td><input type="text" name="bluepick1Death" value="${match.bluepick1Death}" size="10" placeholder="블루팀 죽음합계"></td>
				<td>A</td>
				<td><input type="text" name="bluepick1Assist" value="${match.bluepick1Assist}" size="10" placeholder="블루팀 지원합계"></td>
				<td>KDA</td>
				<td>#.#</td>
				<td>Play Time</td>
				<td>K</td>
				<td><input type="text" name="redpick1Kill" value="${match.redpick1Kill}" size="10" placeholder="레드팀 처치합계"></td>
				<td>D</td>
				<td><input type="text" name="redpick1Death" value="${match.redpick1Death}" size="10" placeholder="레드팀 죽음합계"></td>
				<td>A</td>
				<td><input type="text" name="redpick1Assist" value="${match.redpick1Assist}" size="10" placeholder="레드팀 지원합계"></td>
				<td>KDA</td>
				<td>#.#</td>
			</tr>
			<tr>
				<td align="center" colspan="2">PICK</td>
				<td>${match.bluepick1}</td>
				<td>${match.bluepick2}</td>
				<td>${match.bluepick3}</td>
				<td>${match.bluepick4}</td>
				<td>${match.bluepick5}</td>
				<td></td>
				<td><input type="text" name="playtime" value="${match.playtime}" size="10" placeholder="##:##"></td>
				<td></td>
				<td>${match.redpick1}</td>
				<td>${match.redpick2}</td>
				<td>${match.redpick3}</td>
				<td>${match.redpick4}</td>
				<td>${match.redpick5}</td>
				<td align="center" colspan="2">PICK</td>
			</tr>
			<tr>
				<td align="center" colspan="2">BAN</td>
				<td><input type="text" name="blueban1" value="${match.blueban1}" size="10" placeholder="블루 벤1"></td>
				<td><input type="text" name="blueban2" value="${match.blueban2}" size="10" placeholder="블루 벤2"></td>
				<td><input type="text" name="blueban3" value="${match.blueban3}" size="10" placeholder="블루 벤3"></td>
				<td><input type="text" name="blueban4" value="${match.blueban4}" size="10" placeholder="블루 벤4"></td>
				<td><input type="text" name="blueban5" value="${match.blueban5}" size="10" placeholder="블루 벤5"></td>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="text" name="redban5" value="${match.redban5}" size="10" placeholder="레드 벤1"></td>
				<td><input type="text" name="redban4" value="${match.redban4}" size="10" placeholder="레드 벤2"></td>
				<td><input type="text" name="redban3" value="${match.redban3}" size="10" placeholder="레드 벤3"></td>
				<td><input type="text" name="redban2" value="${match.redban2}" size="10" placeholder="레드 벤4"></td>
				<td><input type="text" name="redban1" value="${match.redban1}" size="10" placeholder="레드 벤5"></td>
				<td align="center" colspan="2">BAN</td>
			</tr>
			<tr>
			<td><input type="button" value="butt"></td></tr>
		</table>
		<div align="center">
			<table class="minitable">
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
					<td><input type="text" name="bluepick1Spell1" value="${match.bluepick1Spell1}" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluepick1" value="${match.bluepick1}" size="10" placeholder="블루 탑픽"></td>
					<td colspan="4"><input type="text" name="bluegamer1" value="${match.bluegamer1}" size="10" placeholder="블루 탑라이너"></td>
					<td colspan="4"><input type="text" name="redgamer1" value="${match.redgamer1}" size="10" placeholder="레드 탑라이너"></td>
					<td rowspan="2"><input type="text" name="redpick1" value="${match.redpick1}" size="10" placeholder="레드 탑픽 "></td>
					<td><input type="text" name="redpick1Spell1" value="${match.redpick1Spell1}" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluepick1Spell2" value="${match.bluepick1Spell2}" size="10" placeholder="F"></td>
					<td><input type="text" name="bluepick1Kill" value="${match.bluepick1Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluepick1Death" value="${match.bluepick1Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluepick1Assist" value="${match.bluepick1Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluepick1Kda -->
					<td><input type="text" name="redpick1Kill" value="${match.redpick1Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redpick1Death" value="${match.redpick1Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="redpick1Assist" value="${match.redpick1Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redpick1Spell2" value="${match.redpick1Spell2}" size="10" placeholder="F"></td>
				</tr>
				<!-- pick2 -->
				<tr>
					<td><input type="text" name="bluepick2Spell1" value="${match.bluepick2Spell1}" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluepick2" value="${match.bluepick2}" size="10" placeholder="블루 정글픽"></td>
					<td colspan="4"><input type="text" name="bluegamer2" value="${match.bluegamer2}" size="10" placeholder="블루 정글러"></td>
					<td colspan="4"><input type="text" name="redgamer2" value="${match.redgamer2}" size="10" placeholder="레드 정글러"></td>
					<td rowspan="2"><input type="text" name="redpick2" value="${match.redpick2}" size="10" placeholder="레드 정글픽"></td>
					<td><input type="text" name="redpick2Spell1" value="${match.redpick2Spell1}" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluepick2Spell2" value="${match.bluepick2Spell2}" size="10" placeholder="F"></td>
					<td><input type="text" name="bluepick2Kill" value="${match.bluepick2Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluepick2Death" value="${match.bluepick2Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluepick2Assist" value="${match.bluepick2Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluepick2Kda -->
					<td><input type="text" name="redpick2Kill" value="${match.redpick2Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redpick2Death" value="${match.redpick2Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="redpick2Assist" value="${match.redpick2Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redpick2Spell2" value="${match.redpick2Spell2}" size="10" placeholder="F"></td>
				</tr>
				<!-- pick3 -->
				<tr>
					<td><input type="text" name="bluepick3Spell1" value="${match.bluepick3Spell1}" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluepick3" value="${match.bluepick3}" size="10" placeholder="블루 미드픽"></td>
					<td colspan="4"><input type="text" name="bluegamer3" value="${match.bluegamer3}" size="10" placeholder="블루 미드라이너"></td>
					<td colspan="4"><input type="text" name="redgamer3" value="${match.redgamer3}" size="10" placeholder="레드 미드라이너"></td>
					<td rowspan="2"><input type="text" name="redpick3" value="${match.redpick3}" size="10" placeholder="레드 미드픽"></td>
					<td><input type="text" name="redpick3Spell1" value="${match.redpick3Spell1}" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluepick3Spell2" value="${match.bluepick3Spell2}" size="10" placeholder="F"></td>
					<td><input type="text" name="bluepick3Kill" value="${match.bluepick3Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluepick3Death" value="${match.bluepick3Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluepick3Assist" value="${match.bluepick3Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluepick1Kda -->
					<td><input type="text" name="redpick3Kill" value="${match.redpick3Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redpick3Death" value="${match.redpick3Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="redpick3Assist" value="${match.redpick3Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redpick3Spell2" value="${match.redpick3Spell2}" size="10" placeholder="F"></td>
				</tr>
				<!-- pick4 -->
				<tr>
					<td><input type="text" name="bluepick4Spell1" value="${match.bluepick4Spell1}" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluepick4" value="${match.bluepick4}" size="10" placeholder="블루 원딜픽"></td>
					<td colspan="4"><input type="text" name="bluegamer4" value="${match.bluegamer4}" size="10" placeholder="블루 원딜러"></td>
					<td colspan="4"><input type="text" name="redgamer4" value="${match.redgamer4}" size="10" placeholder="레드 원딜러"></td>
					<td rowspan="2"><input type="text" name="redpick4" value="${match.redpick4}" size="10" placeholder="레드 원딜픽"></td>
					<td><input type="text" name="redpick4Spell1" value="${match.redpick4Spell1}" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluepick4Spell2" value="${match.bluepick4Spell2}" size="10" placeholder="F"></td>
					<td><input type="text" name="bluepick4Kill" value="${match.bluepick4Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluepick4Death" value="${match.bluepick4Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluepick4Assist" value="${match.bluepick4Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluepick1Kda -->
					<td><input type="text" name="redpick4Kill" value="${match.redpick4Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redpick4Death" value="${match.redpick4Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="redpick4Assist" value="${match.redpick4Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redpick4Spell2" value="${match.redpick4Spell2}" size="10" placeholder="F"></td>
				</tr>
				<!-- pick5 -->
				<tr>
					<td><input type="text" name="bluepick5Spell1" value="${match.bluepick5Spell1}" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluepick5" value="${match.bluepick5}" size="10" placeholder="블루 서포터픽"></td>
					<td colspan="4"><input type="text" name="bluegamer5" value="${match.bluegamer5}" size="10" placeholder="블루 서포터"></td>
					<td colspan="4"><input type="text" name="redgamer5" value="${match.redgamer5}" size="10" placeholder="레드 서포터"></td>
					<td rowspan="2"><input type="text" name="redpick5" value="${match.redpick5}" size="10" placeholder="레드 서포터픽"></td>
					<td><input type="text" name="redpick5Spell1" value="${match.redpick5Spell1}" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluepick5Spell2" value="${match.bluepick5Spell2}" size="10" placeholder="F"></td>
					<td><input type="text" name="bluepick5Kill" value="${match.bluepick5Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluepick5Death" value="${match.bluepick5Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluepick5Assist" value="${match.bluepick5Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluepick1Kda -->
					<td><input type="text" name="redpick5Kill" value="${match.redpick5Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redpick5Death" value="${match.redpick5Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="redpick5Assist" value="${match.redpick5Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redpick5Spell2" value="${match.redpick5Spell2}" size="10" placeholder="F"></td>
				</tr>
			</table>
		</div>
	</div>
		<input type="submit" value="경기 수정"><br>
	<div id="deleteMatch">
		<a href="deleteMatch?matchId=${match.matchId }"><input type="button" id="deleteMatchBtn"value="삭제"></a>
	</div>
</form>


</body>
</html>