<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPlayer</title>

<style>
	.table-head { text-align: center;
				border: 1px solid;
				max-width: 98%;
				width: 100%;
				height: 2cm;}
	.table-head td {
	padding: 5px;
	border: 1px solid;
	}
	.table {
	width: 100%;
	max-width: 100%;
	margin-bottom: 1rem;
	background-color: transparent
}				
</style>
</head>
<body>
	<%-- <input type="hidden" name="playerId" value="${player.playerId}">
	<input type="hidden" name="name" value="${player.name}">
	<input type="hidden" name="nickname" value="${player.nickname}"> --%>
	<input type="hidden" name="line" value="${player.line}">
	<%-- <input type="hidden" name="teamId" value="${player.teamId}">
	<input type="hidden" name="win" value="${player.win}">
	<input type="hidden" name="lose" value="${player.lose}">
	<input type="hidden" name="kill" value="${player.kill}">
	<input type="hidden" name="death" value="${player.death}">
	<input type="hidden" name="assist" value="${player.assist}"> --%>

	<h3>getPlayer</h3>

	<h3>전적 정보</h3>

	<c:if test="${membersession.uGrant=='admin'}">
	<a href="updatePlayerForm?nickname=${player.nickname}">선수 정보 변경</a>
	</c:if>

	<div>
		<c:if test="${membersession.uGrant=='admin'}">
		<input type="hidden" name="playerId" value="${player.playerId}">
			<a href="deletePlayer?nickname=${player.nickname}"> 선수 삭제 </a>
		</c:if>
			<div class="top-campaign">
			<table class="table-head">
				<tr>
					<td><h3>${player.teamId} ${player.nickname }</h3></td>
					<td><h5>${player.name}</h5></td>
					<td width="64%"></td>
					<td><h4>${player.teamname }</h4></a></td>
					<%-- <input type="hidden" value="${player.nickname}">
					<input type="hidden" name="playerId" value="${player.playerId}"> --%>
				</tr>
			</table>
			<!-- </div>
	</div>


		
	<div>
	<div class="top-campaign"> -->
		<h4>상대 전적	</h4><hr/>
		<table class="table">
			<tr>
				<th>일자</th>
				<th>경기정보</th>
				<th>소환사명</th>
				<th>상대</th>
				<th>챔피언</th>
				<th>소환주문</th>
				<th>결과</th>
				<th>K</th>
				<th>D</th>
				<th>A</th>
				
			</tr>
			
			<c:forEach items="${playerRecordList}" var="rec">
				<tr>
					<td>${rec.matchDate}</td>
					<td>${rec.matchName} ${rec.matchInfo}</td>
					<td>${player.teamId} ${rec.blueGamer3}</td>
					<td>vs ${rec.redGamer3}</td>
					<td>${rec.bluePick3}</td>
					<td>${rec.bluePick3Spell1}  ${rec.bluePick3Spell2}</td>
					<td>${rec.blueResult}</td>
					<td>${rec.bluePick3Kill}</td>
					<td>${rec.bluePick3Death}</td>
					<td>${rec.bluePick3Assist}</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>

</body>
</html>