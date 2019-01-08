<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMatchList</title>

<style>
th {
	text-align: center;
	border-bottom: 1px solid black;
}
</style>
<script>
	function go_page(page) {
		location.href = "getMatchList?page=" + page;
		document.matchFrm.page.value = page;
		document.matchFrm.submit();
	}

	if ("${matchVO.searchCondition}" != "") {
		document.matchFrm.searchCondition.value = "${matchVO.searchCondition}";
	}
</script>
</head>
<body>

	<div class="top-campaign">
		<p style="font-size:30px; text-align:center">경기정보</p>
		<form name="matchFrm">
			<table>
				<tr>
					<td><input type="hidden"name="searchCondition" value="blueteamname"><font size="4">팀명 &nbsp;</font> </td>
					<td style="margin-left: 10px; "><input style="border:none; border-bottom: 2px solid black;"	type="text" name="searchKeyword" value="${matchVO.searchKeyword}"></td>
					<td><button style="line-height: 0.65" class="btn btn-outline-secondary">검색</button></td>
					<input type="hidden" name="page">
				</tr>
			</table>
		</form>
		<c:if test="${membersession.uGrant=='admin'}">
		<div align="right">
			<button class="btn btn-outline-secondary" type="button" onclick="location.href='insertMatchForm'"	class="btn">경기등록</button>
		</div>
	</c:if>
		<br>
		<table class="table">
			<tr>
				<th style="border-top : 1px solid black;">경기번호	</th>
				<th style="border-top : 1px solid black;">날짜		</th>
				<th style="border-top : 1px solid black;">경기제목	</th>
				<th style="border-top : 1px solid black;"></th>
				<th style="border-top : 1px solid black;">맞대결 전적</th>
				<th style="border-top : 1px solid black;"></th>
				<th style="border-top : 1px solid black;">세부정보	</th>
				<!-- 경기 일시 -->
				<th style="border-top : 1px solid black;">경기 상태	</th>
				<th style="border-top : 1px solid black;">결과확인	</th>
				<th style="border-top : 1px solid black;">게임 구매	</th>

			</tr>
			<c:forEach items="${matchList}" var="match">
				<tr>
					<td align="center">${match.gameId}</td>
					<td align="center">${match.matchDate}&nbsp;17:00</td>
					<td align="center">${match.matchInfo}</td>
					<td align="right"><a href="getTeam?teamId=${match.blueTeamName}">${match.blueTeamName}</a></td>
					<td align="center">${match.bluePick1Kill + match.bluePick2Kill + match.bluePick3Kill + match.bluePick4Kill + match.bluePick5Kill}
						 : ${match.redPick1Kill + match.redPick2Kill + match.redPick3Kill + match.redPick4Kill + match.redPick5Kill}</td>
					<td><a href="getTeam?teamId=${match.redTeamName}">${match.redTeamName}</a></td>
					<td align="center"><a href="preView?blueTeamName=${match.blueTeamName}&redTeamName=${match.redTeamName}">전적</a></td>
					<td align="center">${match.gameStatus}</td>
					<td align="center">	<c:if test="${match.gameStatus == '후' || membersession.uGrant == 'admin'}">
										<a href="getMatch?gameId=${match.gameId}">결과확인</a>		</c:if></td>
					<c:if test="${membersession.uGrant=='admin'}">
					<td align="center"><!-- <a href="getMhistoryList">마일리지 관리</a> --></td></c:if>

					<c:if test="${membersession.uGrant !='admin' && match.gameStatus == '전'}">
					<td align="center"><a href="buyMatchList"> 구매 </a></td></c:if>
				</tr>
			</c:forEach>
		</table>

		<div align="center" style="margin-top: 50px">
		<my:paging paging="${paging}" jsFunc="go_page" />
		</div>
	</div>
	
</body>
</html>