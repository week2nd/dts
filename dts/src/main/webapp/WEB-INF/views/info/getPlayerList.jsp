<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
th, td {
	text-align: center;
}
th {
	border-bottom: 1px solid black;
}

p {
	background-color: white;
	size: 10cm;
}

.search {
	background-color: white;
	border-radius: 10px;
	border: 1px solid black;
	color: black;
	padding: 5px;
	margin-top: -5px;
	margin-bottom: -5px;
}

#border {
	border-radius: 1px;
	border-top: 1px solid black;
	padding: 10px;
}
</style>

<meta charset="UTF-8">
<title>getPlayerList</title>
</head>
<body>

	<h3>선수 정보</h3>

	

	
	<div class="top-campaign">
		<form name="playerFrm">
		<div>
			<select name="searchCondition">
				<option value="nickname">소환사명		</option>
				<option value="team_id">최근 소속팀	</option>
				<option value="name">선수이름		</option>
			</select> <input type="text" name="searchKeyword">
			<button class="btn btn-outline-secondary">검색	</button>
		</div>
	</form>
		
		<form action="insertPlayerForm">
		<c:if test="${membersession.uGrant=='admin'}">
			<div align="right">
				<input type="submit" value="선수 등록 "
					class="btn btn-outline-secondary">
			</div>
		</c:if>
		<br>
			<table class="table">
				<tr>
					<th>순위					</th>
					<th>이름					</th>
					<th>소환사명				</th>
					<th>최근 소속				</th>
					<th align="center">M	</th>
					<th align="center">W	</th>
					<th align="center">L	</th>
					<th align="center">승률	</th>
					<th align="center">TK	</th>
					<th align="center">th	</th>
					<th align="center">TA	</th>
					<th align="center">KDA	</th>
				</tr>
				<c:forEach items="${playerList}" var="player">
					<tr>
						<td>${player.playerRank}	</td>
						<td><a href="getPlayer?nickname=${player.nickname}">${player.name}</a>		</td>
						<td><a href="getPlayer?nickname=${player.nickname}">${player.nickname}</a>	</td>
						<td><a href="getTeam?teamId=${player.teamId }">${player.teamId }</a>		</td>
						<td>${player.match}			</td>
						<td>${player.win}			</td>
						<td>${player.lose}			</td>
						<td>${player.winrate }%		</td>
						<td>${player.kill}			</td>
						<td>${player.death}			</td>
						<td>${player.assist}		</td>
						<td>${player.kda}%			</td>
							<input type="hidden" name="playerId" value="${player.playerId}">
							<input type="hidden" name="line" value="${player.line}">
					</tr>
				</c:forEach>
			</table>
			<div id="border" align="right">
				<a href="#">위로가기</a>
			</div>
			</form>
		</div>
	



</body>
</html>