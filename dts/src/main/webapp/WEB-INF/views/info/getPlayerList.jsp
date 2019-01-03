<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
	th, td {text-align : center;}
	p {background-color : white;
		size: 10cm;	}
	.search {background-color: white;
			border-radius: 10px;
			border: 1px solid black;
			color:black;
			padding: 5px;
			margin-top:-5px;
			margin-bottom: -5px; 
			
	}
	
	#border {border-radius : 1px;
			border-top : 1px solid black;
			padding: 10px;	}
</style>

<meta charset="UTF-8">
<title>getPlayerList</title>
</head>
<body>

	<h3>선수 정보</h3>
	
	<form name="playerFrm">
	<div>
		<select name="searchCondition">
			<option value="nickname">소환사명</option>
			<option value="team_id">최근 소속팀</option>
			<option value="name">선수이름</option> 
		</select>
		<input type="text" name="searchKeyword">
		<button class="search" > 검색 </button>
	</div>		
	</form>
	
	<form action="insertPlayerForm">
		<c:if test="${membersession.uGrant=='admin'}">
			<div align="right"> <input type="submit" value="선수 등록 " class="search" > </div>
		</c:if>
		<div class="top-campaign">
		<table class="table">
			<tr>
				<td>순위</td>
				<td>이름</td>
				<td>소환사명</td>
				<td>최근 소속</td>
				<td align="center">M</td>
				<td align="center">W</td>
				<td align="center">L</td>
				<td align="center">승률</td>
				<td align="center">TK</td>
				<td align="center">TD</td>
				<td align="center">TA</td>
				<td align="center">KDA</td>
			</tr>
			<c:forEach items="${playerList}" var="player">
				<tr>
					<td>${player.playerRank}</td>
					<td><a href="getPlayer?nickname=${player.nickname}">${player.name}</a></td>
					<td><a href="getPlayer?nickname=${player.nickname}">${player.nickname}</a></td>
					<td><a href="getTeam?teamId=${player.teamId }">${player.teamId }</a></td>
					<td>${player.match}</td>
					<td>${player.win}</td>
					<td>${player.lose}</td>
					<td>${player.winrate }%</td>
					<td>${player.kill}</td>
					<td>${player.death}</td>
					<td>${player.assist}</td>
					<td>${player.kda} %</td>
					<input type="hidden" name="playerId" value="${player.playerId}">
					<input type="hidden" name="line" value="${player.line}">
				</tr>
			</c:forEach>
		</table>
		<div id="border" align="right"><a href="#">위로가기</a></div>
		</div>
	</form>
	
	
	
</body>
</html>