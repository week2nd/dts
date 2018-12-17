<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>




<script>
function insert(){
	var data = $('#param').serialize();
	
	$.ajax({
		method : 'post',
		async:false,
		url : '/app/insertMatch',
		data : data,
		dataType : 'json',
		success : function(result){
			alert(Result);
		}
	});
	
}
</script>


 <!--  ctrl + shift + f 자동정렬 하지마세요! -->

<%-- <form id="param" action="insertMatch" method="post"> --%>

<form action="insertMatch">

<input type="text" name="gameId" value="${match.gameId}" readonly="readonly">
	<div align="center">
		<table class="table">
			<tr>
				<th colspan="8"><input type="text" name="gameDate" value="${match.gameDate}" size="10" placeholder="경기일시" readonly="readonly"></th>
				<th><input type="text" name="gamename" value="${match.gameName}" size="10" placeholder="대회명"></th>
				<td align="right" colspan="8"><input type="text" name="gameinfo" value="${match.gameInfo}" size="10" placeholder="경기 정보"></td>
			</tr>
			<tr>
				<td colspan="6"><input type="text" name="blueTeamName" value="${match.blueTeamName}" size="10" placeholder="블루팀명"></td>
				<td align="center" colspan="2"><input type="text" name="blueResult" value="${match.blueResult}" size="10" placeholder="블루팀 결과"></td>
				<td>${match.bluePick1Kill}:${match.redPick1Kill}</td>
				<td align="center" colspan="2"><input type="text" name="redResult" value="${match.redResult}" size="10" placeholder="레드팀 결과"></td>
				<td align="right" colspan="6"><input type="text" name="redTeamName" value="${match.redTeamName}" size="10" placeholder="레드팀명"></td>
			</tr>
			<tr>
				<td>K</td>
				<td><input type="text" name="bluePick1Kill" value="${match.bluePick1Kill}" size="10" placeholder="블루팀 처치합계"></td>
				<td>D</td>
				<td><input type="text" name="bluePick1Death" value="${match.bluePick1Death}" size="10" placeholder="블루팀 죽음합계"></td>
				<td>A</td>
				<td><input type="text" name="bluePick1Assist" value="${match.bluePick1Assist}" size="10" placeholder="블루팀 지원합계"></td>
				<td>KDA</td>
				<td>#.#</td>
				<td>Play Time</td>
				<td>K</td>
				<td><input type="text" name="redPick1Kill" value="${match.redPick1Kill}" size="10" placeholder="레드팀 처치합계"></td>
				<td>D</td>
				<td><input type="text" name="redPick1Death" value="${match.redPick1Death}" size="10" placeholder="레드팀 죽음합계"></td>
				<td>A</td>
				<td><input type="text" name="redPick1Assist" value="${match.redPick1Assist}" size="10" placeholder="레드팀 지원합계"></td>
				<td>KDA</td>
				<td>#.#</td>
			</tr>
			<tr>
				<td align="center" colspan="2">PICK</td>
				<td>${match.bluePick1}</td>
				<td>${match.bluePick2}</td>
				<td>${match.bluePick3}</td>
				<td>${match.bluePick4}</td>
				<td>${match.bluePick5}</td>
				<td></td>
				<td><input type="text" name="playtime" value="${match.playTime}" size="10" placeholder="##:##"></td>
				<td></td>
				<td>${match.redPick1}</td>
				<td>${match.redPick2}</td>
				<td>${match.redPick3}</td>
				<td>${match.redPick4}</td>
				<td>${match.redPick5}</td>
				<td align="center" colspan="2">PICK</td>
			</tr>
			<tr>
				<td align="center" colspan="2">BAN</td>
				<td><input type="text" name="blueBan1" value="${match.blueBan1}" size="10" placeholder="블루 벤1"></td>
				<td><input type="text" name="blueBan2" value="${match.blueBan2}" size="10" placeholder="블루 벤2"></td>
				<td><input type="text" name="blueBan3" value="${match.blueBan3}" size="10" placeholder="블루 벤3"></td>
				<td><input type="text" name="blueBan4" value="${match.blueBan4}" size="10" placeholder="블루 벤4"></td>
				<td><input type="text" name="blueBan5" value="${match.blueBan5}" size="10" placeholder="블루 벤5"></td>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="text" name="redBan5" value="${match.redBan5}" size="10" placeholder="레드 벤1"></td>
				<td><input type="text" name="redBan4" value="${match.redBan4}" size="10" placeholder="레드 벤2"></td>
				<td><input type="text" name="redBan3" value="${match.redBan3}" size="10" placeholder="레드 벤3"></td>
				<td><input type="text" name="redBan2" value="${match.redBan2}" size="10" placeholder="레드 벤4"></td>
				<td><input type="text" name="redBan1" value="${match.redBan1}" size="10" placeholder="레드 벤5"></td>
				<td align="center" colspan="2">BAN</td>
			</tr>
			<tr>
			<td colspan="17" align="center"> 칸 나누기</td></tr>
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
				<!-- Pick1 -->
				<tr>
					<td><input type="text" name="bluePick1Spell1" value="${match.bluePick1Spell1}" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick1" value="${match.bluePick1}" size="10" placeholder="블루 탑픽"></td>
					<td colspan="4"><input type="text" name="bluegamer1" value="${match.bluegamer1}" size="10" placeholder="블루 탑라이너"></td>
					<td colspan="4"><input type="text" name="redgamer1" value="${match.redgamer1}" size="10" placeholder="레드 탑라이너"></td>
					<td rowspan="2"><input type="text" name="redPick1" value="${match.redPick1}" size="10" placeholder="레드 탑픽 "></td>
					<td><input type="text" name="redPick1Spell1" value="${match.redPick1Spell1}" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick1Spell2" value="${match.bluePick1Spell2}" size="10" placeholder="F"></td>
					<td><input type="text" name="bluePick1Kill" value="${match.bluePick1Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluePick1Death" value="${match.bluePick1Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluePick1Assist" value="${match.bluePick1Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick1Kill" value="${match.redPick1Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redPick1Death" value="${match.redPick1Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="redPick1Assist" value="${match.redPick1Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redPick1Spell2" value="${match.redPick1Spell2}" size="10" placeholder="F"></td>
				</tr>
				<!-- Pick2 -->
				<tr>
					<td><input type="text" name="bluePick2Spell1" value="${match.bluePick2Spell1}" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick2" value="${match.bluePick2}" size="10" placeholder="블루 정글픽"></td>
					<td colspan="4"><input type="text" name="bluegamer2" value="${match.bluegamer2}" size="10" placeholder="블루 정글러"></td>
					<td colspan="4"><input type="text" name="redgamer2" value="${match.redgamer2}" size="10" placeholder="레드 정글러"></td>
					<td rowspan="2"><input type="text" name="redPick2" value="${match.redPick2}" size="10" placeholder="레드 정글픽"></td>
					<td><input type="text" name="redPick2Spell1" value="${match.redPick2Spell1}" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick2Spell2" value="${match.bluePick2Spell2}" size="10" placeholder="F"></td>
					<td><input type="text" name="bluePick2Kill" value="${match.bluePick2Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluePick2Death" value="${match.bluePick2Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluePick2Assist" value="${match.bluePick2Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluePick2Kda -->
					<td><input type="text" name="redPick2Kill" value="${match.redPick2Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redPick2Death" value="${match.redPick2Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="redPick2Assist" value="${match.redPick2Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redPick2Spell2" value="${match.redPick2Spell2}" size="10" placeholder="F"></td>
				</tr>
				<!-- Pick3 -->
				<tr>
					<td><input type="text" name="bluePick3Spell1" value="${match.bluePick3Spell1}" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick3" value="${match.bluePick3}" size="10" placeholder="블루 미드픽"></td>
					<td colspan="4"><input type="text" name="bluegamer3" value="${match.bluegamer3}" size="10" placeholder="블루 미드라이너"></td>
					<td colspan="4"><input type="text" name="redgamer3" value="${match.redgamer3}" size="10" placeholder="레드 미드라이너"></td>
					<td rowspan="2"><input type="text" name="redPick3" value="${match.redPick3}" size="10" placeholder="레드 미드픽"></td>
					<td><input type="text" name="redPick3Spell1" value="${match.redPick3Spell1}" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick3Spell2" value="${match.bluePick3Spell2}" size="10" placeholder="F"></td>
					<td><input type="text" name="bluePick3Kill" value="${match.bluePick3Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluePick3Death" value="${match.bluePick3Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluePick3Assist" value="${match.bluePick3Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick3Kill" value="${match.redPick3Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redPick3Death" value="${match.redPick3Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="redPick3Assist" value="${match.redPick3Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redPick3Spell2" value="${match.redPick3Spell2}" size="10" placeholder="F"></td>
				</tr>
				<!-- Pick4 -->
				<tr>
					<td><input type="text" name="bluePick4Spell1" value="${match.bluePick4Spell1}" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick4" value="${match.bluePick4}" size="10" placeholder="블루 원딜픽"></td>
					<td colspan="4"><input type="text" name="bluegamer4" value="${match.bluegamer4}" size="10" placeholder="블루 원딜러"></td>
					<td colspan="4"><input type="text" name="redgamer4" value="${match.redgamer4}" size="10" placeholder="레드 원딜러"></td>
					<td rowspan="2"><input type="text" name="redPick4" value="${match.redPick4}" size="10" placeholder="레드 원딜픽"></td>
					<td><input type="text" name="redPick4Spell1" value="${match.redPick4Spell1}" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick4Spell2" value="${match.bluePick4Spell2}" size="10" placeholder="F"></td>
					<td><input type="text" name="bluePick4Kill" value="${match.bluePick4Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluePick4Death" value="${match.bluePick4Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluePick4Assist" value="${match.bluePick4Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick4Kill" value="${match.redPick4Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redPick4Death" value="${match.redPick4Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="redPick4Assist" value="${match.redPick4Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redPick4Spell2" value="${match.redPick4Spell2}" size="10" placeholder="F"></td>
				</tr>
				<!-- Pick5 -->
				<tr>
					<td><input type="text" name="bluePick5Spell1" value="${match.bluePick5Spell1}" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick5" value="${match.bluePick5}" size="10" placeholder="블루 서포터픽"></td>
					<td colspan="4"><input type="text" name="bluegamer5" value="${match.bluegamer5}" size="10" placeholder="블루 서포터"></td>
					<td colspan="4"><input type="text" name="redgamer5" value="${match.redgamer5}" size="10" placeholder="레드 서포터"></td>
					<td rowspan="2"><input type="text" name="redPick5" value="${match.redPick5}" size="10" placeholder="레드 서포터픽"></td>
					<td><input type="text" name="redPick5Spell1" value="${match.redPick5Spell1}" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick5Spell2" value="${match.bluePick5Spell2}" size="10" placeholder="F"></td>
					<td><input type="text" name="bluePick5Kill" value="${match.bluePick5Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluePick5Death" value="${match.bluePick5Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluePick5Assist" value="${match.bluePick5Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick5Kill" value="${match.redPick5Kill}" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redPick5Death" value="${match.redPick5Death}" size="10" placeholder="Death"></td>
					<td><input type="text" name="redPick5Assist" value="${match.redPick5Assist}" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redPick5Spell2" value="${match.redPick5Spell2}" size="10" placeholder="F"></td>
				</tr>
			</table>
		</div>
	</div>
	
		<!-- <Button onclick="javascript:insert();">입력</Button> -->
		
		<input type="submit" value="경기 입력"><br>
	<div>
		<!-- <input type="reset" id="resetBtn"value="취소"> -->
	</div>
</form>


</body>
</html>