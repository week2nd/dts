<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPlayer</title>

<style>
.table-head {
	text-align: center;
	border: 1px solid;
	max-width: 98%;
	width: 100%;
	height: 2cm;
}

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

	<input type="hidden" name="line" value="${player.line}">

	<p style="font-size:30px; text-align:center">선수정보</p>

	<input type="hidden" name="playerId" value="${player.playerId}">
	<div>
		<c:if test="${membersession.uGrant=='admin'}">
			<p align="right">
				<a class="btn btn-outline-secondary"
					href="updatePlayerForm?nickname=${player.nickname}">선수 정보 변경 </a>
			</p>
		</c:if>
		<div class="top-campaign">
			<table class="table-head">
				<tr>
					<td rowspan="2" width="20%"><p style="font-size:30px">${player.teamId} ${player.nickname }</p></td>
					<td rowspan="2" width="40%"><h3>${player.name}</h3></td>
					<td>포지션</td>
					<td rowspan="2" width="20%"><h3>${player.teamname }</h3></td>
				</tr>
				<tr>
					<td width="10%"><b>${player.line}</b></td>
				</tr>
			</table>
			<br>
		</div>
		<h4>상대 전적</h4>
		<hr />
		<div class="top-campaign">
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
						<td>${rec.matchDate}		</td>
						<td>${rec.matchName}${rec.matchInfo}	</td>
						<td>${player.teamId}${rec.blueGamer3}	</td>
						<td>vs ${rec.redGamer3}		</td>
						<td>${rec.bluePick3}		</td>
						<td>${rec.bluePick3Spell1}${rec.bluePick3Spell2}	</td>
						<td>${rec.blueResult}		</td>
						<td>${rec.bluePick3Kill}	</td>
						<td>${rec.bluePick3Death}	</td>
						<td>${rec.bluePick3Assist}	</td>
					</tr>
				</c:forEach>
			</table>

		</div>
		<c:if test="${membersession.uGrant=='admin'}">
			<p align="right">
				<a class="btn btn-outline-secondary"
					href="deletePlayer?nickname=${player.nickname}"> <input type="button" id="deleteMatchBtn" value="선수 삭제">
				</a>
			</p>
		</c:if>
	</div>

</body>
</html>