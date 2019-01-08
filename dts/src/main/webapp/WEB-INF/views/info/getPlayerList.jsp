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

	
	
	<div class="top-campaign">
	<p style="font-size:30px; text-align:center">선수 정보</p>
		<form name="playerFrm">
		<div>
		<table>
			<tr>
				<td><select name="searchCondition" class="custom-select" style="height:calc(2.25rem - 6px); line-height:1;">
				<option value="nickname">소환사명		</option>
				<option value="team_id">최근 소속팀	</option>
				<option value="name">선수이름		</option>
				</select>	</td>
				<td><input style="border:none; border-bottom: 2px solid black;" type="text" name="searchKeyword">	</td>
				<td><button class="btn btn-outline-secondary" style="line-height: 0.65" >검색	</button> </td>
			</tr>
		</table>
			<!-- <select name="searchCondition" >
				<option value="nickname">소환사명		</option>
				<option value="team_id">최근 소속팀	</option>
				<option value="name">선수이름		</option>
			</select>
			<td><input type="text" name="searchKeyword">	</td>
			<button class="btn btn-outline-secondary">검색	</button> -->
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
					<th style="border-top : 1px solid black;">순위					</th>
					<th style="border-top : 1px solid black;">이름					</th>
					<th style="border-top : 1px solid black;">소환사명				</th>
					<th style="border-top : 1px solid black;">최근 소속				</th>
					<th style="border-top : 1px solid black;" align="center">M	</th>
					<th style="border-top : 1px solid black;" align="center">W	</th>
					<th style="border-top : 1px solid black;" align="center">L	</th>
					<th style="border-top : 1px solid black;" align="center">승률	</th>
					<th style="border-top : 1px solid black;" align="center">TK	</th>
					<th style="border-top : 1px solid black;" align="center">th	</th>
					<th style="border-top : 1px solid black;" align="center">TA	</th>
					<th style="border-top : 1px solid black;" align="center">KDA	</th>
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