<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
$(function() {
$(".datepicker").datepicker();
});

function teamCheck() {
	$("#redTeamId option:eq(0)").attr("selected", false);
	$("#blueTeamId option:eq(0)").attr("selected", false);
	var t1 = $("select[name=redTeamName]").val();
	var t2 = $("select[name=blueTeamName]").val();
	if(t1==t2) {
		$("#redTeamId option:eq(0)").attr("selected", true);
		$("#blueTeamId option:eq(0)").attr("selected", true);
		alert("중복팀을 선택 할 수 없습니다");		
	}	
}
</script>

</head>
<body>




<!-- <script>
function insert(){
	var data = $('#param').serialize();
	
	$.ajax({
		method : 'post',
		async:false,
		url : '/app/insertMatch22',
		data : data,
		dataType : 'json',
		success : function(result){
			alert(Result);
		}
	});
	
}
</script> -->


 <!--  ctrl + shift + f 자동정렬 하지마세요! -->

<%-- <form id="param" action="insertMatch" method="post"> --%>

<form action="insertMatch">

<input type="hidden" name="gameId" value="0" readonly="readonly">
	<div align="center">
		<table class="table">
			<tr>
				<th colspan="1"><input type="text" name="matchDate" size="7" placeholder="경기일시"></th>
				<th colspan="7">* 빈칸일 경우 오늘 날짜로 입력됩니다.</th>
				<th><input type="text" name="matchName" size="7" value="LOL Champs"  placeholder="대회명"></th>
				<td align="right" colspan="8"><input type="text" name="matchInfo" size="7" placeholder="경기 정보"></td>
			</tr>
			<tr>
				<!-- <td colspan="6"><input type="text" name="blueTeamName" size="7" placeholder="블루팀명"></td> -->
				<td colspan="6"><select id="blueTeamId" name="blueTeamName" onchange="teamCheck()">
						<option >BLUE팀ID</option>
							<c:forEach items="${teamList}" var="team">
						<option value="${team.teamId}">${team.teamId}</option>
							</c:forEach>
					</select></td>
				
				<td align="center" colspan="2">
					<select name = "blueResult">
						<option value="win">W</option>
						<option value="lose">L</option>
					</select>
				</td>
				<td> 　:</td>
				<td align="center" colspan="2">
					<select name = "redResult">
						<option value="win">W</option>
						<option value="lose">L</option>
					</select>
				</td>
				<!-- <td align="right" colspan="6"><input type="text" name="redTeamName" size="7" placeholder="레드팀명"></td> -->
				<td align="right" colspan="6"><select id="redTeamId" name="redTeamName" onchange="teamCheck()" >
						<option >RED팀ID</option>
							<c:forEach items="${teamList}" var="team">
						<option value="${team.teamId}">${team.teamId}</option>
							</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td>K</td>
				<td><input type="text" name="bluePick1Kill" value="0" size="7" placeholder="블루팀 처치합계"></td>
				<td>D</td>
				<td><input type="text" name="bluePick1Death" value="0" size="7" placeholder="블루팀 죽음합계"></td>
				<td>A</td>
				<td><input type="text" name="bluePick1Assist" value="0" size="7" placeholder="블루팀 지원합계"></td>
				<td>KDA</td>
				<td>#.#</td>
				<td>Play Time</td>
				<td>K</td>
				<td><input type="text" name="redPick1Kill" value="0" size="7" placeholder="레드팀 처치합계"></td>
				<td>D</td>
				<td><input type="text" name="redPick1Death" value="0" size="7" placeholder="레드팀 죽음합계"></td>
				<td>A</td>
				<td><input type="text" name="redPick1Assist" value="0" size="7" placeholder="레드팀 지원합계"></td>
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
				<td><input type="text" name="playTime" value="15:00" size="7" placeholder="##:##"></td>
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
				<td><input type="text" name="blueBan1" size="7" placeholder="블루 벤1"></td>
				<td><input type="text" name="blueBan2" size="7" placeholder="블루 벤2"></td>
				<td><input type="text" name="blueBan3" size="7" placeholder="블루 벤3"></td>
				<td><input type="text" name="blueBan4" size="7" placeholder="블루 벤4"></td>
				<td><input type="text" name="blueBan5" size="7" placeholder="블루 벤5"></td>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="text" name="redBan5" size="7" placeholder="레드 벤1"></td>
				<td><input type="text" name="redBan4"  size="7" placeholder="레드 벤2"></td>
				<td><input type="text" name="redBan3"  size="7" placeholder="레드 벤3"></td>
				<td><input type="text" name="redBan2"  size="7" placeholder="레드 벤4"></td>
				<td><input type="text" name="redBan1" size="7" placeholder="레드 벤5"></td>
				<td align="center" colspan="2">BAN</td>
			</tr>
			<tr>
			<td colspan="17" align="center"> 칸 나누기</td></tr>
		
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
					<td><input type="text" name="bluePick1Spell1" value="teleport" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick1" size="10" placeholder="블루 탑픽"></td>
					<td colspan="4">
					<input type="text" name="blueGamer1" size="10" placeholder="블루 탑라이너">
					<select name="blueGamer1">
					<c:forEach items="${playerList}" var="player">
						<option value="${player.nickname}">${player.nickname} </option>
					</c:forEach>
					</select>
					</td>
					<td colspan="4"><input type="text" name="redGamer1" size="10" placeholder="레드 탑라이너"></td>
					<td rowspan="2"><input type="text" name="redPick1"  size="10" placeholder="레드 탑픽 "></td>
					<td><input type="text" name="redPick1Spell1" value="teleport" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick1Spell2" value="Flash" size="10" placeholder="F"></td>
					<td><input type="text" name="bluePick1Kill" value="0" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluePick1Death" value="0" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluePick1Assist" value="0" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick1Kill" value="0" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redPick1Death" value="0" size="10" placeholder="Death"></td>
					<td><input type="text" name="redPick1Assist" value="0" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redPick1Spell2" value="Flash" size="10" placeholder="F"></td>
				</tr>
				<!-- Pick2 -->
				<tr>
					<td><input type="text" name="bluePick2Spell1" value="smite" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick2"  size="10" placeholder="블루 정글픽"></td>
					<td colspan="4"><input type="text" name="blueGamer2" size="10" placeholder="블루 정글러"></td>
					<td colspan="4"><input type="text" name="redGamer2" size="10" placeholder="레드 정글러"></td>
					<td rowspan="2"><input type="text" name="redPick2" size="10" placeholder="레드 정글픽"></td>
					<td><input type="text" name="redPick2Spell1" value="smite" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick2Spell2" value="Flash" size="10" placeholder="F"></td>
					<td><input type="text" name="bluePick2Kill" value="0" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluePick2Death" value="0" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluePick2Assist" value="0" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluePick2Kda -->
					<td><input type="text" name="redPick2Kill" value="0" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redPick2Death" value="0" size="10" placeholder="Death"></td>
					<td><input type="text" name="redPick2Assist" value="0" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redPick2Spell2" value="Flash" size="10" placeholder="F"></td>
				</tr>
				<!-- Pick3 -->
				<tr>
					<td><input type="text" name="bluePick3Spell1" value="ignite" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick3" value="${match.bluePick3}" size="10" placeholder="블루 미드픽"></td>
					<td colspan="4"><input type="text" name="blueGamer3"size="10" placeholder="블루 미드라이너"></td>
					<td colspan="4"><input type="text" name="redGamer3" size="10" placeholder="레드 미드라이너"></td>
					<td rowspan="2"><input type="text" name="redPick3" size="10" placeholder="레드 미드픽"></td>
					<td><input type="text" name="redPick3Spell1" value="ignite" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick3Spell2" value="Flash" size="10" placeholder="F"></td>
					<td><input type="text" name="bluePick3Kill" value="0" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluePick3Death" value="0" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluePick3Assist" value="0" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick3Kill" value="0" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redPick3Death" value="0" size="10" placeholder="Death"></td>
					<td><input type="text" name="redPick3Assist" value="0" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redPick3Spell2" value="Flash" size="10" placeholder="F"></td>
				</tr>
				<!-- Pick4 -->
				<tr>
					<td><input type="text" name="bluePick4Spell1" value="heal" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick4" size="10" placeholder="블루 원딜픽"></td>
					<td colspan="4"><input type="text" name="blueGamer4" size="10" placeholder="블루 원딜러"></td>
					<td colspan="4"><input type="text" name="redGamer4" size="10" placeholder="레드 원딜러"></td>
					<td rowspan="2"><input type="text" name="redPick4" size="10" placeholder="레드 원딜픽"></td>
					<td><input type="text" name="redPick4Spell1" value="heal" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick4Spell2" value="Flash" size="10" placeholder="F"></td>
					<td><input type="text" name="bluePick4Kill" value="0" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluePick4Death" value="0" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluePick4Assist" value="0" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick4Kill" value="0" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redPick4Death" value="0" size="10" placeholder="Death"></td>
					<td><input type="text" name="redPick4Assist" value="0" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redPick4Spell2" value="Flash" size="10" placeholder="F"></td>
				</tr>
				<!-- Pick5 -->
				<tr>
					<td><input type="text" name="bluePick5Spell1" value="exhaust" size="10" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick5"  size="10" placeholder="블루 서포터픽"></td>
					<td colspan="4"><input type="text" name="blueGamer5" size="10" placeholder="블루 서포터"></td>
					<td colspan="4"><input type="text" name="redGamer5"  size="10" placeholder="레드 서포터"></td>
					<td rowspan="2"><input type="text" name="redPick5" size="10" placeholder="레드 서포터픽"></td>
					<td><input type="text" name="redPick5Spell1" value="exhaust" size="10" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick5Spell2" value="Flash" size="10" placeholder="F"></td>
					<td><input type="text" name="bluePick5Kill" value="0" size="10" placeholder="Kill"></td>
					<td><input type="text" name="bluePick5Death" value="0" size="10" placeholder="Death"></td>
					<td><input type="text" name="bluePick5Assist" value="0" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick5Kill" value="0" size="10" placeholder="Kill"></td>
					<td><input type="text" name="redPick5Death" value="0" size="10" placeholder="Death"></td>
					<td><input type="text" name="redPick5Assist" value="0" size="10" placeholder="Assist"></td>
					<td>#.#</td>
					<td><input type="text" name="redPick5Spell2" value="Flash" size="10" placeholder="F"></td>
				</tr>
			</table>
		</div>
	
		<!-- <Button onclick="javascript:insert();">입력</Button> -->
		
		<input type="submit" value="경기 입력"><br>
	<div>
		<!-- <input type="reset" id="resetBtn"value="취소"> -->
	</div>
</form>


</body>
</html>