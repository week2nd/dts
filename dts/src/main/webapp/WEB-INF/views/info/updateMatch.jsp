<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateMatch</title>

<style>
	.body {
	text-align: center;
	}
	
 th, td{
 border: 1px solid black;
 border-top: 1px solid black;
 text-align: center;
 }
 .table th, td {
 border-top: 1px solid black;
 text-align: center;
 }
 input {
 text-align: center;
 }
 
</style>

<script>
$(function() {
$(".datepicker").datepicker();
});

function teamCheck() {
	$("#redTeamId option:eq(0)").attr("selected", false).each(function(){
		if($(this).val() == "${team.teamId}"){
			$(this).attr("selected","selected")
		}
	});
	$("#blueTeamId option:eq(0)").attr("selected", false);
	var t1 = $("select[name=redTeamName]").val();
	var t2 = $("select[name=blueTeamName]").val();
	if(t1==t2) {
		$("#redTeamId option:eq(0)").attr("selected", true);
		$("#blueTeamId option:eq(0)").attr("selected", true);
		alert("중복팀을 선택 할 수 없습니다");		
	}	
}
/* 
$("#updateBtn").click(function() {
	if(confirm("이대로 수정하시겠습니까?")) {
		alert("수정했습니다.")
		return true;
	else
		alert("취소하였습니다.")
		return false;
	}
}); */

$(function(){
	$("#updateBtn").click(function() {
		if(confirm("수정할 내용이 정확합니까?")) {
			alert("수정을 완료하였습니다")
			return true;
		} else {
			alert("취소되었습니다")
			return false;
		}
	})
});

</script>
</head>
<body>
<div class="body">
 <!--  ctrl + shift + f 자동정렬 하지마세요! -->
<div class="top-campaign">
<form action="updateMatch">
<div align="left">
<b>경기번호</b> : <input style="border: 1px solid black" type="text" name="gameId" value="${match.gameId}" readonly="readonly">
<select name="gameStatus">
	<option value="전">전</option>
	<option value="중">중</option>
	<option value="후">후</option>
</select>
</div>
	<div align="center">
		<table class="table">
			<tr>
				<th><input type="text" name="matchDate" value="${match.matchDate}" size="5" placeholder="경기일시"></th>
				<th colspan="5">* 빈칸일 경우 오늘 날짜로 입력됩니다.</th>
				<th><input type="text" name="matchName" value="${match.matchName}" size="5" placeholder="대회명"></th>
				<th colspan="4"></th>
				<th align="right" colspan="2"><input type="text" name="matchInfo" value="${match.matchInfo}" size="5" placeholder="경기 정보"></th>
			</tr>
			<tr>
				<td colspan="4"><select id="blueTeamId" name="blueTeamName" onchange="teamCheck()">
						<option value="미정">BLUE팀ID</option>
							<c:forEach items="${teamList}" var="team">
						<option <c:if test="${team.teamId == match.blueTeamName}"> selected="true" </c:if> value="${team.teamId}" > ${team.teamId}</option>
							</c:forEach>
					</select></td>
				<td align="center" colspan="2">
					<select name = "blueResult">
						<option <c:if test="${match.blueResult == 'win'}"> selected="selected" </c:if> value="win" >W</option>
						<option <c:if test="${match.blueResult == 'lose'}"> selected="selected" </c:if> value="lose" >L</option>
					</select>
				</td>
				<td>${match.bluePick1Kill}:${match.redPick1Kill}</td>
				<td align="center" colspan="2">
					<select name = "redResult">
						<option <c:if test="${match.redResult == 'win'}"> selected="selected" </c:if> value="win" >W</option>
						<option <c:if test="${match.redResult == 'lose'}"> selected="selected" </c:if> value="lose" >L</option>
					</select>
				</td>
				<td align="right" colspan="4"><select id="redTeamId" name="redTeamName" onchange="teamCheck()" >
						<option value="미정">RED팀ID</option>
							<c:forEach items="${teamList}" var="team">
						<option <c:if test="${team.teamId == match.redTeamName}"> selected="selected" </c:if> value="${team.teamId}">${team.teamId}</option>
							</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td>K</td>
				<td><input type="text" name="blueTeamKillsum" value="${match.bluePick1Kill}" size="5" placeholder="블루팀 처치합계"></td>
				<td>D</td>
				<td><input type="text" name="blueTeamDeathsum" value="${match.bluePick1Death}" size="5" placeholder="블루팀 죽음합계"></td>
				<td>A</td>
				<td><input type="text" name="blueTeamAssistsum" value="${match.bluePick1Assist}" size="5" placeholder="블루팀 지원합계"></td>
				<td>Play Time</td>
				<td>K</td>
				<td><input type="text" name="redTeamKillsum" value="${match.redPick1Kill}" size="5" placeholder="레드팀 처치합계"></td>
				<td>D</td>
				<td><input type="text" name=redTeamDeathsum value="${match.redPick1Death}" size="5" placeholder="레드팀 죽음합계"></td>
				<td>A</td>
				<td><input type="text" name="redTeamAssistsum" value="${match.redPick1Assist}" size="5" placeholder="레드팀 지원합계"></td>
			</tr>
			<tr>
				<td align="center">BAN</td>
				<td><input type="text" name="blueBan1" value="${match.blueBan1}" size="5" placeholder="블루 벤1"></td>
				<td><input type="text" name="blueBan2" value="${match.blueBan2}" size="5" placeholder="블루 벤2"></td>
				<td><input type="text" name="blueBan3" value="${match.blueBan3}" size="5" placeholder="블루 벤3"></td>
				<td><input type="text" name="blueBan4" value="${match.blueBan4}" size="5" placeholder="블루 벤4"></td>
				<td><input type="text" name="blueBan5" value="${match.blueBan5}" size="5" placeholder="블루 벤5"></td>
				<td><input type="text" name="playTime" value="${match.playTime}" size="5" placeholder="##:##"></td>
				<td><input type="text" name="redBan5" value="${match.redBan5}" size="5" placeholder="레드 벤1"></td>
				<td><input type="text" name="redBan4" value="${match.redBan4}" size="5" placeholder="레드 벤2"></td>
				<td><input type="text" name="redBan3" value="${match.redBan3}" size="5" placeholder="레드 벤3"></td>
				<td><input type="text" name="redBan2" value="${match.redBan2}" size="5" placeholder="레드 벤4"></td>
				<td><input type="text" name="redBan1" value="${match.redBan1}" size="5" placeholder="레드 벤5"></td>
				<td align="center">BAN</td>
			</tr>
		</table>
		<br>
		
		<div align="left"> <h3> 세부정보 </h3> </div>
		<div align="center">
			<table class="minitable">
				<tr>
					<td>Spell</td>
					<td>Champ</td>
					<td>Kill</td>
					<td>Death</td>
					<td>Assist</td>
					<td>Kill</td>
					<td>Death</td>
					<td>Assist</td>
					<td>Champ</td>
					<td>Spell</td>
				</tr>
				<!-- Pick1 -->
				<tr>
					<td><input type="text" name="bluePick1Spell1" value="${match.bluePick1Spell1}" size="7" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick1" value="${match.bluePick1}" size="7" placeholder="블루 탑픽"></td>
					<td colspan="3"><select name="blueGamer1">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td colspan="3"><select name="redGamer1">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td rowspan="2"><input type="text" name="redPick1" value="${match.redPick1}" size="7" placeholder="레드 탑픽 "></td>
					<td><input type="text" name="redPick1Spell1" value="${match.redPick1Spell1}" size="7" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick1Spell2" value="${match.bluePick1Spell2}" size="7" placeholder="F"></td>
					<td><input type="text" name="bluePick1Kill" value="${match.bluePick1Kill}" size="7" placeholder="Kill"></td>
					<td><input type="text" name="bluePick1Death" value="${match.bluePick1Death}" size="7" placeholder="Death"></td>
					<td><input type="text" name="bluePick1Assist" value="${match.bluePick1Assist}" size="7" placeholder="Assist"></td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick1Kill" value="${match.redPick1Kill}" size="7" placeholder="Kill"></td>
					<td><input type="text" name="redPick1Death" value="${match.redPick1Death}" size="7" placeholder="Death"></td>
					<td><input type="text" name="redPick1Assist" value="${match.redPick1Assist}" size="7" placeholder="Assist"></td>
					<td><input type="text" name="redPick1Spell2" value="${match.redPick1Spell2}" size="7" placeholder="F"></td>
				</tr>
				<!-- Pick2 -->
				<tr>
					<td><input type="text" name="bluePick2Spell1" value="${match.bluePick2Spell1}" size="7" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick2" value="${match.bluePick2}" size="7" placeholder="블루 정글픽"></td>
					<td colspan="3"><select name="blueGamer2">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td colspan="3"><select name="redGamer2">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td rowspan="2"><input type="text" name="redPick2" value="${match.redPick2}" size="7" placeholder="레드 정글픽"></td>
					<td><input type="text" name="redPick2Spell1" value="${match.redPick2Spell1}" size="7" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick2Spell2" value="${match.bluePick2Spell2}" size="7" placeholder="F"></td>
					<td><input type="text" name="bluePick2Kill" value="${match.bluePick2Kill}" size="7" placeholder="Kill"></td>
					<td><input type="text" name="bluePick2Death" value="${match.bluePick2Death}" size="7" placeholder="Death"></td>
					<td><input type="text" name="bluePick2Assist" value="${match.bluePick2Assist}" size="7" placeholder="Assist"></td>
					
					<!-- bluePick2Kda -->
					<td><input type="text" name="redPick2Kill" value="${match.redPick2Kill}" size="7" placeholder="Kill"></td>
					<td><input type="text" name="redPick2Death" value="${match.redPick2Death}" size="7" placeholder="Death"></td>
					<td><input type="text" name="redPick2Assist" value="${match.redPick2Assist}" size="7" placeholder="Assist"></td>
					<td><input type="text" name="redPick2Spell2" value="${match.redPick2Spell2}" size="7" placeholder="F"></td>
				</tr>
				<!-- Pick3 -->
				<tr>
					<td><input type="text" name="bluePick3Spell1" value="${match.bluePick3Spell1}" size="7" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick3" value="${match.bluePick3}" size="7" placeholder="블루 미드픽"></td>
					<td colspan="3"><select name="blueGamer3">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td colspan="3"><select name="redGamer3">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td rowspan="2"><input type="text" name="redPick3" value="${match.redPick3}" size="7" placeholder="레드 미드픽"></td>
					<td><input type="text" name="redPick3Spell1" value="${match.redPick3Spell1}" size="7" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick3Spell2" value="${match.bluePick3Spell2}" size="7" placeholder="F"></td>
					<td><input type="text" name="bluePick3Kill" value="${match.bluePick3Kill}" size="7" placeholder="Kill"></td>
					<td><input type="text" name="bluePick3Death" value="${match.bluePick3Death}" size="7" placeholder="Death"></td>
					<td><input type="text" name="bluePick3Assist" value="${match.bluePick3Assist}" size="7" placeholder="Assist"></td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick3Kill" value="${match.redPick3Kill}" size="7" placeholder="Kill"></td>
					<td><input type="text" name="redPick3Death" value="${match.redPick3Death}" size="7" placeholder="Death"></td>
					<td><input type="text" name="redPick3Assist" value="${match.redPick3Assist}" size="7" placeholder="Assist"></td>
					<td><input type="text" name="redPick3Spell2" value="${match.redPick3Spell2}" size="7" placeholder="F"></td>
				</tr>
				<!-- Pick4 -->
				<tr>
					<td><input type="text" name="bluePick4Spell1" value="${match.bluePick4Spell1}" size="7" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick4" value="${match.bluePick4}" size="7" placeholder="블루 원딜픽"></td>
					<td colspan="3"><select name="blueGamer4">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td colspan="3"><select name="redGamer4">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td rowspan="2"><input type="text" name="redPick4" value="${match.redPick4}" size="7" placeholder="레드 원딜픽"></td>
					<td><input type="text" name="redPick4Spell1" value="${match.redPick4Spell1}" size="7" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick4Spell2" value="${match.bluePick4Spell2}" size="7" placeholder="F"></td>
					<td><input type="text" name="bluePick4Kill" value="${match.bluePick4Kill}" size="7" placeholder="Kill"></td>
					<td><input type="text" name="bluePick4Death" value="${match.bluePick4Death}" size="7" placeholder="Death"></td>
					<td><input type="text" name="bluePick4Assist" value="${match.bluePick4Assist}" size="7" placeholder="Assist"></td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick4Kill" value="${match.redPick4Kill}" size="7" placeholder="Kill"></td>
					<td><input type="text" name="redPick4Death" value="${match.redPick4Death}" size="7" placeholder="Death"></td>
					<td><input type="text" name="redPick4Assist" value="${match.redPick4Assist}" size="7" placeholder="Assist"></td>
					<td><input type="text" name="redPick4Spell2" value="${match.redPick4Spell2}" size="7" placeholder="F"></td>
				</tr>
				<!-- Pick5 -->
				<tr>
					<td><input type="text" name="bluePick5Spell1" value="${match.bluePick5Spell1}" size="7" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick5" value="${match.bluePick5}" size="7" placeholder="블루 서포터픽"></td>
					<td colspan="3"><select name="blueGamer5">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td colspan="3"><select name="redGamer5">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td rowspan="2"><input type="text" name="redPick5" value="${match.redPick5}" size="7" placeholder="레드 서포터픽"></td>
					<td><input type="text" name="redPick5Spell1" value="${match.redPick5Spell1}" size="7" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick5Spell2" value="${match.bluePick5Spell2}" size="7" placeholder="F"></td>
					<td><input type="text" name="bluePick5Kill" value="${match.bluePick5Kill}" size="7" placeholder="Kill"></td>
					<td><input type="text" name="bluePick5Death" value="${match.bluePick5Death}" size="7" placeholder="Death"></td>
					<td><input type="text" name="bluePick5Assist" value="${match.bluePick5Assist}" size="7" placeholder="Assist"></td>
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick5Kill" value="${match.redPick5Kill}" size="7" placeholder="Kill"></td>
					<td><input type="text" name="redPick5Death" value="${match.redPick5Death}" size="7" placeholder="Death"></td>
					<td><input type="text" name="redPick5Assist" value="${match.redPick5Assist}" size="7" placeholder="Assist"></td>
					<td><input type="text" name="redPick5Spell2" value="${match.redPick5Spell2}" size="7" placeholder="F"></td>
				</tr>
			</table>
		</div>
	</div>
	<div align="right">
		<input class="btn btn-outline-secondary" type="submit" id="updateBtn" value="경기 수정"><br>
	</div>
</form>
</div>
</div>
</body>
</html>