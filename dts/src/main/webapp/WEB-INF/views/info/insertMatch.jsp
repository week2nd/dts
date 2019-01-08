<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<div class="body">



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

<%-- <form id="param" action="insertMatch" method="post"> --%>

<form action="insertMatch">

<input type="hidden" name="gameId" value="0" readonly="readonly">
	<h3 align="left"> Pick / Ban </h3>
	<br>
	<div class="top-campaign" align="center">
		<table class="table">
			<tr>
				<th colspan="2"><input style="width:80px;" type="text" name="matchDate" size="5" placeholder="경기일시"></th>
				<th colspan="3">* 빈칸일 경우 오늘 날짜로 입력됩니다.</th>
				<th colspan="3"><input style="width:120px;" type="text" name="matchName" size="5" value="LOL Champs"  placeholder="대회명"></th>
				<th colspan="3"></th>
				<th align="right" colspan="2"><input style="width:120px; type="text" name="matchInfo" size="5" placeholder="경기 정보"></th>
			</tr>
			<tr>
				<td colspan="4"><select id="blueTeamId" name="blueTeamName" onchange="teamCheck()">
						<option value="미정">BLUE팀ID</option>
							<c:forEach items="${teamList}" var="team">
						<option value="${team.teamId}">${team.teamId}</option>
							</c:forEach>
					</select></td>
				
				<td align="center" colspan="2">
					<select name = "blueResult">
						<option value=""> </option>
						<option value="win">W</option>
						<option value="lose">L</option>
					</select>
				</td>
				<td align="center">:</td>
				<td align="center" colspan="2">
					<select name = "redResult">
						<option value=""> </option>
						<option value="win">W</option>
						<option value="lose">L</option>
					</select>
				</td>
				<td align="right" colspan="4"><select id="redTeamId" name="redTeamName" onchange="teamCheck()" >
						<option value="미정">RED팀ID</option>
							<c:forEach items="${teamList}" var="team">
						<option value="${team.teamId}">${team.teamId}</option>
							</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td colspan="2">K</td>
				<td colspan="2">D</td>
				<td colspan="2">A</td>
				<td>Play Time</td>
				<td colspan="2">K</td>
				<td colspan="2">D</td>
				<td colspan="2">A</td>
			</tr>
			
			<tr>
				<td align="center">BAN</td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="blueBan1" size="5" placeholder="블루 벤1"></td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="blueBan2" size="5" placeholder="블루 벤2"></td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="blueBan3" size="5" placeholder="블루 벤3"></td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="blueBan4" size="5" placeholder="블루 벤4"></td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="blueBan5" size="5" placeholder="블루 벤5"></td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="playTime" value="15:00" size="5" placeholder="##:##"></td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="redBan5" size="5" placeholder="레드 벤1"></td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="redBan4"  size="5" placeholder="레드 벤2"></td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="redBan3"  size="5" placeholder="레드 벤3"></td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="redBan2"  size="5" placeholder="레드 벤4"></td>
				<td style="padding-left : 0px; padding-right : 0px;"><input style="width:80px;" type="text" name="redBan1" size="5" placeholder="레드 벤5"></td>
				<td align="center">BAN</td>
			</tr>
		</table>
		</div>
		<h3 align="left"> 경기 선수별 세부정보 </h3>
		<br>
		<div class="top-campaign">
		<table class="table" style="margin: auto; width: 80%">
				<tr>
					<th width="8%">Spell</th>
					<th width="10%">Champ</th>
					<th width="8%">Kill</th>
					<th width="8%">Death</th>
					<th width="8%">Assist</th>
					<th width="8%">Kill</th>
					<th width="8%">Death</th>
					<th width="8%">Assist</th>
					<th width="10%">Champ</th>
					<th width="8%">Spell</th>
				</tr>
				<!-- Pick1 -->
				<tr>
					<td><input type="text" name="bluePick1Spell1" value="teleport" size="7" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick1" size="7" placeholder="블루 탑픽"></td>
					<td style="text-align: right"colspan="3"><select name="blueGamer1">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td style="text-align: left" colspan="3"><select name="redGamer1">
						<c:forEach items="${playerList}" var="player">
							<option value="${player.nickname}">${player.nickname} </option>
						</c:forEach>
					</select></td>
					<td rowspan="2"><input type="text" name="redPick1"  size="7" placeholder="레드 탑픽 "></td>
					<td><input type="text" name="redPick1Spell1" value="teleport" size="7" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick1Spell2" value="Flash" size="7" placeholder="F"></td>
					<td><input type="text" name="bluePick1Kill" value="0" size="7" placeholder="Kill"></td>
					<td><input type="text" name="bluePick1Death" value="0" size="7" placeholder="Death"></td>
					<td><input type="text" name="bluePick1Assist" value="0" size="7" placeholder="Assist"></td>
					
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick1Kill" value="0" size="7" placeholder="Kill"></td>
					<td><input type="text" name="redPick1Death" value="0" size="7" placeholder="Death"></td>
					<td><input type="text" name="redPick1Assist" value="0" size="7" placeholder="Assist"></td>
					
					<td><input type="text" name="redPick1Spell2" value="Flash" size="7" placeholder="F"></td>
				</tr>
				<!-- Pick2 -->
				<tr>
					<td><input type="text" name="bluePick2Spell1" value="smite" size="7" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick2"  size="7" placeholder="블루 정글픽"></td>
					<td style="text-align: right"colspan="3">
					<select name="blueGamer2">
					<c:forEach items="${playerList}" var="player">
						<option value="${player.nickname}">${player.nickname} </option>
					</c:forEach>
					</select></td>
					<td style="text-align: left"colspan="3">
					<select name="redGamer2">
					<c:forEach items="${playerList}" var="player">
						<option value="${player.nickname}">${player.nickname} </option>
					</c:forEach>
					</select></td>
					<td rowspan="2"><input type="text" name="redPick2" size="7" placeholder="레드 정글픽"></td>
					<td><input type="text" name="redPick2Spell1" value="smite" size="7" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick2Spell2" value="Flash" size="7" placeholder="F"></td>
					<td><input type="text" name="bluePick2Kill" value="0" size="7" placeholder="Kill"></td>
					<td><input type="text" name="bluePick2Death" value="0" size="7" placeholder="Death"></td>
					<td><input type="text" name="bluePick2Assist" value="0" size="7" placeholder="Assist"></td>
					
					<!-- bluePick2Kda -->
					<td><input type="text" name="redPick2Kill" value="0" size="7" placeholder="Kill"></td>
					<td><input type="text" name="redPick2Death" value="0" size="7" placeholder="Death"></td>
					<td><input type="text" name="redPick2Assist" value="0" size="7" placeholder="Assist"></td>
					
					<td><input type="text" name="redPick2Spell2" value="Flash" size="7" placeholder="F"></td>
				</tr>
				<!-- Pick3 -->
				<tr>
					<td><input type="text" name="bluePick3Spell1" value="ignite" size="7" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick3" value="${match.bluePick3}" size="7" placeholder="블루 미드픽"></td>
					<td style="text-align: right"colspan="3">
					<select name="blueGamer3">
					<c:forEach items="${playerList}" var="player">
						<option value="${player.nickname}">${player.nickname} </option>
					</c:forEach>
					</select></td>
					<td style="text-align: left"colspan="3">
					<select name="redGamer3">
					<c:forEach items="${playerList}" var="player">
						<option value="${player.nickname}">${player.nickname} </option>
					</c:forEach>
					</select></td>
					<td rowspan="2"><input type="text" name="redPick3" size="7" placeholder="레드 미드픽"></td>
					<td><input type="text" name="redPick3Spell1" value="ignite" size="7" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick3Spell2" value="Flash" size="7" placeholder="F"></td>
					<td><input type="text" name="bluePick3Kill" value="0" size="7" placeholder="Kill"></td>
					<td><input type="text" name="bluePick3Death" value="0" size="7" placeholder="Death"></td>
					<td><input type="text" name="bluePick3Assist" value="0" size="7" placeholder="Assist"></td>
					
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick3Kill" value="0" size="7" placeholder="Kill"></td>
					<td><input type="text" name="redPick3Death" value="0" size="7" placeholder="Death"></td>
					<td><input type="text" name="redPick3Assist" value="0" size="7" placeholder="Assist"></td>
					
					<td><input type="text" name="redPick3Spell2" value="Flash" size="7" placeholder="F"></td>
				</tr>
				<!-- Pick4 -->
				<tr>
					<td><input type="text" name="bluePick4Spell1" value="heal" size="7" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick4" size="7" placeholder="블루 원딜픽"></td>
					<td style="text-align: right"colspan="3">
					<select name="blueGamer4">
					<c:forEach items="${playerList}" var="player">
						<option value="${player.nickname}">${player.nickname} </option>
					</c:forEach>
					</select></td>
					<td style="text-align: left"colspan="3">
					<select name="redGamer4">
					<c:forEach items="${playerList}" var="player">
						<option value="${player.nickname}">${player.nickname} </option>
					</c:forEach>
					</select></td>
					<td rowspan="2"><input type="text" name="redPick4" size="7" placeholder="레드 원딜픽"></td>
					<td><input type="text" name="redPick4Spell1" value="heal" size="7" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick4Spell2" value="Flash" size="7" placeholder="F"></td>
					<td><input type="text" name="bluePick4Kill" value="0" size="7" placeholder="Kill"></td>
					<td><input type="text" name="bluePick4Death" value="0" size="7" placeholder="Death"></td>
					<td><input type="text" name="bluePick4Assist" value="0" size="7" placeholder="Assist"></td>
					
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick4Kill" value="0" size="7" placeholder="Kill"></td>
					<td><input type="text" name="redPick4Death" value="0" size="7" placeholder="Death"></td>
					<td><input type="text" name="redPick4Assist" value="0" size="7" placeholder="Assist"></td>
					
					<td><input type="text" name="redPick4Spell2" value="Flash" size="7" placeholder="F"></td>
				</tr>
				<!-- Pick5 -->
				<tr>
					<td><input type="text" name="bluePick5Spell1" value="exhaust" size="7" placeholder="D"></td>
					<td rowspan="2"><input type="text" name="bluePick5"  size="7" placeholder="블루 서포터픽"></td>
					<td style="text-align: right"colspan="3">
					<select name="blueGamer5">
					<c:forEach items="${playerList}" var="player">
						<option value="${player.nickname}">${player.nickname} </option>
					</c:forEach>
					</select></td>
					<td style="text-align: left"colspan="3">
					<select name="redGamer5">
					<c:forEach items="${playerList}" var="player">
						<option value="${player.nickname}">${player.nickname} </option>
					</c:forEach>
					</select></td>
					<td rowspan="2"><input type="text" name="redPick5" size="7" placeholder="레드 서포터픽"></td>
					<td><input type="text" name="redPick5Spell1" value="exhaust" size="7" placeholder="D"></td>
				</tr>
				<tr>
					<td><input type="text" name="bluePick5Spell2" value="Flash" size="7" placeholder="F"></td>
					<td><input type="text" name="bluePick5Kill" value="0" size="7" placeholder="Kill"></td>
					<td><input type="text" name="bluePick5Death" value="0" size="7" placeholder="Death"></td>
					<td><input type="text" name="bluePick5Assist" value="0" size="7" placeholder="Assist"></td>
					
					<!-- bluePick1Kda -->
					<td><input type="text" name="redPick5Kill" value="0" size="7" placeholder="Kill"></td>
					<td><input type="text" name="redPick5Death" value="0" size="7" placeholder="Death"></td>
					<td><input type="text" name="redPick5Assist" value="0" size="7" placeholder="Assist"></td>
					
					<td><input type="text" name="redPick5Spell2" value="Flash" size="7" placeholder="F"></td>
				</tr>
			</table>
			<br>
			<div align="right">
				<input class="btn btn-outline-secondary" type="submit" value="경기 입력"><br>
			</div>
		</div>
	
		<!-- <Button onclick="javascript:insert();">입력</Button> -->
		
		
	<div>
		<!-- <input type="reset" id="resetBtn"value="취소"> -->
	</div>
</form>

</div>
</body>
</html>