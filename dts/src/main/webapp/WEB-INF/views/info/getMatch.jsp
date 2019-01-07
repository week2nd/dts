<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 결과 보기</title>

<style type="text/css">
 .aligncenter{
 	text-align: center;
 }
 .minitable td, th{
 	 padding-left: 10px;
 	 padding-right: 10px;
 	border-bottom: 1px solid gray;
 }
 .minitable {
 border:1px solid gray;
 text-align: center;
 }
  .tdbot{
 	border-bottom: 1px solid gray;
 }
 .bordermiddle{
 border-left:1px solid gray;
 }
 .leftright{
 	border-left:1px solid gray; 
 	border-right:1px solid gray;
 }
 
</style>
<script>
$(function() {
	$("#deleteMatchBtn").click(function() {
		if (confirm("정말 삭제하시겠습니까??")) {
			alert("삭제했습니다.")
			return true;
		} else {
			return false;
		}
	})
});
</script>
</head>
<body>
<div class="aligncenter">
	<h3>경기 결과 보기</h3>
	<br>
<div class="top-campaign">
	<%-- <c:forEach items="${matchList}" var="match"> --%>
		<form action="updateMatchForm">
			<div align="center">
				<table class="table">
				<input type="hidden" name="gameId" value="${match.gameId}">
					<tr>
						<th colspan="8">${match.gameDate}</th>
						<th align="center">${match.gameName}</th>
						<th colspan="6"></th>
						<th align="right" colspan="2" name="matchInfo">${match.gameInfo}</th>
					</tr>
					<tr>
						<td colspan="6"><a href="getTeam?teamId=${match.blueTeamName}">${match.blueTeamName}</a></td>
						<td align="center" colspan="2">${match.blueResult}</td>
						<td align="center">${match.bluePick1Kill}:${match.redPick1Kill}</td>
						<td align="center" colspan="2">${match.redResult}</td>
						<td align="right" colspan="6"><a href="getTeam?teamId=${match.redTeamName}">${match.redTeamName}</a></td>
					</tr>
					<tr>
						<td>K</td>
						<td>${match.bluePick1Kill + match.bluePick2Kill + match.bluePick3Kill + match.bluePick4Kill + match.bluePick5Kill}</td>
						<td>D</td>
						<td>${match.bluePick1Death + match.bluePick2Death + match.bluePick3Death + match.bluePick4Death + match.bluePick5Death}</td>
						<td>A</td>
						<td>${match.bluePick1Assist + match.bluePick2Assist + match.bluePick3Assist + match.bluePick4Assist + match.bluePick5Assist}</td>
						<td>KDA</td>
						<td>${(match.bluePick1Kill + match.bluePick2Kill + match.bluePick3Kill + match.bluePick4Kill + match.bluePick5Kill
							+ match.bluePick1Assist + match.bluePick2Assist + match.bluePick3Assist + match.bluePick4Assist + match.bluePick5Assist)
							/ match.bluePick1Death + match.bluePick2Death + match.bluePick3Death + match.bluePick4Death + match.bluePick5Death 
							}</td>
						<td align="center">Play Time</td>
						<td>K</td>
						<td>${match.redPick1Kill + match.redPick2Kill + match.redPick3Kill + match.redPick4Kill + match.redPick5Kill}</td>
						<td>D</td>
						<td>${match.redPick1Death + match.redPick2Death + match.redPick3Death + match.redPick4Death + match.redPick5Death}</td>
						<td>A</td>
						<td>${match.redPick1Assist + match.redPick2Assist + match.redPick3Assist + match.redPick4Assist + match.redPick5Assist}</td>
						<td>KDA</td>
						<td>${(match.redPick1Kill + match.redPick2Kill + match.redPick3Kill + match.redPick4Kill + match.redPick5Kill
							+ match.redPick1Assist + match.redPick2Assist + match.redPick3Assist + match.redPick4Assist + match.redPick5Assist)
							/ match.redPick1Death + match.redPick2Death + match.redPick3Death + match.redPick4Death + match.redPick5Death 
							}</td>
					</tr>
					<tr>
						<td align="center" colspan="2">PICK</td>
						<td>${match.bluePick1}</td>
						<td>${match.bluePick2}</td>
						<td>${match.bluePick3}</td>
						<td>${match.bluePick4}</td>
						<td>${match.bluePick5}</td>
						<td></td>
						<td align="center" name="playTime">${match.playTime}</td>
						<td></td>
						<td>${match.redPick5}</td>
						<td>${match.redPick4}</td>
						<td>${match.redPick3}</td>
						<td>${match.redPick2}</td>
						<td>${match.redPick1}</td>
						<td align="center" colspan="2">PICK</td>
					</tr>
					<tr>
						<td align="center" colspan="2">BAN</td>
						<td>${match.blueBan1}</td>
						<td>${match.blueBan2}</td>
						<td>${match.blueBan3}</td>
						<td>${match.blueBan4}</td>
						<td>${match.blueBan5}</td>
						<td></td>
						<td></td>
						<td></td>
						<td>${match.redBan5}</td>
						<td>${match.redBan4}</td>
						<td>${match.redBan3}</td>
						<td>${match.redBan2}</td>
						<td>${match.redBan1}</td>
						<td align="center" colspan="2">BAN</td>
					</tr>
				</table>
				
				<br>
				<div align="center">
					<table class="minitable">
						<tr>
							<th width="8%">Spell </th>
							<th width="10%">Champ </th>
							<th width="8%">Kill </th>
							<th width="8%">Death </th>
							<th width="8%">Assist </th>
							<th width="8%">KDA </th>
							<th width="8%">Kill </th>
							<th width="8%">Death </th>
							<th width="8%">Assist </th>
							<th width="8%">KDA </th>
							<th width="10%">Champ </th>
							<th width="8%">Spell </th>
						</tr>
						<!-- Pick1 -->
						<tr>
							<td>${match.bluePick1Spell1}</td>
							<td rowspan="2" class="leftright">${match.bluePick1}</td>
							<td colspan="4">${match.blueGamer1}</td>
							<td  class="bordermiddle" align="" colspan="4">${match.redGamer1}</td>
							<td rowspan="2" class="leftright">${match.redPick1}</td>
							<td>${match.redPick1Spell1}</td>
						</tr>
						<tr>
							<td>${match.bluePick1Spell2}</td>
							<td>${match.bluePick1Kill}</td>
							<td>${match.bluePick1Death}</td>
							<td>${match.bluePick1Assist}</td>
							<td><c:if test="${match.bluePick1Death != 0 }">
								<fmt:formatNumber	value="${(match.bluePick1Kill + match.bluePick1Assist)/match.bluePick1Death}" pattern=".##">
								</fmt:formatNumber></c:if>
							 	<c:if test="${match.bluePick1Death == 0 }">0</c:if></td>
							<!-- bluePick1Kda -->
							<td class="bordermiddle">${match.redPick1Kill}</td>
							<td>${match.redPick1Death}</td>
							<td>${match.redPick1Assist}</td>
							<td><c:if test="${match.redPick1Death != 0 }"><fmt:formatNumber value="${(match.redPick1Kill + match.redPick1Assist)/match.redPick1Death}" pattern=".##">
							</fmt:formatNumber></c:if>
							 	<c:if test="${match.redPick1Death == 0 }">0</c:if></td>
							<td>${match.redPick1Spell2}</td>
						</tr>
						<!-- Pick2 -->
						<tr>
							<td>${match.bluePick2Spell1}</td>
							<td rowspan="2" class="leftright">${match.bluePick2}</td>
							<td colspan="4">${match.blueGamer2}</td>
							<td class="bordermiddle" colspan="4">${match.redGamer2}</td>
							<td rowspan="2" class="leftright">${match.redPick2}</td>
							<td>${match.redPick2Spell1}</td>
						</tr>
						<tr>
							<td>${match.bluePick2Spell2}</td>
							<td>${match.bluePick2Kill}</td>
							<td>${match.bluePick2Death}</td>
							<td>${match.bluePick2Assist}</td>
							<td><c:if test="${match.bluePick2Death != 0 }">
								<fmt:formatNumber	value="${(match.bluePick2Kill + match.bluePick2Assist)/match.bluePick2Death}" pattern=".##">
								</fmt:formatNumber></c:if>
							 	<c:if test="${match.bluePick2Death == 0 }">0</c:if></td>
							<!-- bluePick2Kda -->
							<td class="bordermiddle">${match.redPick2Kill}</td>
							<td>${match.redPick2Death}</td>
							<td>${match.redPick2Assist}</td>
							<td><c:if test="${match.redPick2Death != 0 }">
								<fmt:formatNumber	value="${(match.redPick2Kill + match.redPick2Assist)/match.redPick2Death}" pattern=".##">
								</fmt:formatNumber></c:if>
							 	<c:if test="${match.redPick2Death == 0 }">0</c:if></td>
							<td>${match.redPick2Spell2}</td>
						</tr>
						<!-- Pick3 -->
						<tr>
							<td>${match.bluePick3Spell1}</td>
							<td rowspan="2" class="leftright">${match.bluePick3}</td>
							<td colspan="4">${match.blueGamer3}</td>
							<td class="bordermiddle" colspan="4">${match.redGamer3}</td>
							<td rowspan="2" class="leftright">${match.redPick3}</td>
							<td>${match.redPick3Spell1}</td>
						</tr>
						<tr>
							<td>${match.bluePick3Spell2}</td>
							<td>${match.bluePick3Kill}</td>
							<td>${match.bluePick3Death}</td>
							<td>${match.bluePick3Assist}</td>
							<td><c:if test="${match.bluePick3Death != 0 }">
								<fmt:formatNumber	value="${(match.bluePick3Kill + match.bluePick3Assist)/match.bluePick3Death}" pattern=".##">
								</fmt:formatNumber></c:if>
							 	<c:if test="${match.bluePick3Death == 0 }">0</c:if></td>
							<!-- bluePick3Kda -->
							<td class="bordermiddle">${match.redPick3Kill}</td>
							<td>${match.redPick3Death}</td>
							<td>${match.redPick3Assist}</td>
							<td><c:if test="${match.redPick3Death != 0 }">
								<fmt:formatNumber	value="${(match.redPick3Kill + match.redPick3Assist)/match.redPick3Death}" pattern=".##">
								</fmt:formatNumber></c:if>
							 	<c:if test="${match.redPick3Death == 0 }">0</c:if></td>
							<td>${match.redPick3Spell2}</td>
						</tr>
						<!-- Pick4 -->
						<tr>
							<td>${match.bluePick4Spell1}</td>
							<td rowspan="2" class="leftright">${match.bluePick4}</td>
							<td colspan="4">${match.blueGamer4}</td>
							<td class="bordermiddle" colspan="4">${match.redGamer4}</td>
							<td rowspan="2" class="leftright">${match.redPick4}</td>
							<td>${match.redPick4Spell1}</td>
						</tr>
						<tr>
							<td>${match.bluePick4Spell2}</td>
							<td>${match.bluePick4Kill}</td>
							<td>${match.bluePick4Death}</td>
							<td>${match.bluePick4Assist}</td>
							<td><c:if test="${match.bluePick4Death != 0 }">
								<fmt:formatNumber	value="${(match.bluePick4Kill + match.bluePick4Assist)/match.bluePick4Death}" pattern=".##">
								</fmt:formatNumber></c:if>
							 	<c:if test="${match.bluePick4Death == 0 }">0</c:if></td>
							<!-- bluePick1Kda -->
							<td class="bordermiddle">${match.redPick4Kill}</td>
							<td>${match.redPick4Death}</td>
							<td>${match.redPick4Assist}</td>
							<td><c:if test="${match.redPick4Death != 0 }">
								<fmt:formatNumber	value="${(match.redPick4Kill + match.redPick4Assist)/match.redPick4Death}" pattern=".##">
								</fmt:formatNumber></c:if>
							 	<c:if test="${match.redPick4Death == 0 }">0</c:if></td>
							<td>${match.redPick4Spell2}</td>
						</tr>
						<!-- Pick5 -->
						<tr>
							<td>${match.bluePick5Spell1}</td>
							<td rowspan="2" class="leftright">${match.bluePick5}</td>
							<td colspan="4">${match.blueGamer5}</td>
							<td class="bordermiddle" colspan="4">${match.redGamer5}</td>
							<td rowspan="2" class="leftright">${match.redPick5}</td>
							<td>${match.redPick5Spell1}</td>
						</tr>
						<tr>
							<td>${match.bluePick5Spell2}</td>
							<td>${match.bluePick5Kill}</td>
							<td>${match.bluePick5Death}</td>
							<td>${match.bluePick5Assist}</td>
							<td><c:if test="${match.bluePick5Death != 0 }">
								<fmt:formatNumber	value="${(match.bluePick5Kill + match.bluePick5Assist)/match.bluePick5Death}" pattern=".##">
								</fmt:formatNumber></c:if>
							 	<c:if test="${match.bluePick5Death == 0 }">0</c:if></td>
							<!-- bluePick1Kda -->
							<td class="bordermiddle">${match.redPick5Kill}</td>
							<td>${match.redPick5Death}</td>
							<td>${match.redPick5Assist}</td>
							<td><c:if test="${match.redPick5Death != 0 }">
								<fmt:formatNumber	value="${(match.redPick5Kill + match.redPick5Assist)/match.redPick5Death}" pattern=".##">
								</fmt:formatNumber></c:if>
							 	<c:if test="${match.redPick5Death == 0 }">0</c:if></td>
							<td>${match.redPick5Spell2}</td>
						</tr>
					</table>
				</div>
				
			</div>
			<div align="right">
				<c:if test="${membersession.uGrant=='admin'}">	<input class="btn btn-outline-secondary" type="submit" value="수정">
				 
				<a href="deleteMatch?gameId=${match.gameId}"><input class="btn btn-outline-danger" type="button" id="deleteMatchBtn" value="삭제"></a>
				</c:if>
			</div>
		</form>
	<%-- </c:forEach> --%>
</div>
	</div>	
</body>
</html>