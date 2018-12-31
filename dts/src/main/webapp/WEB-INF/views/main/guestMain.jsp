<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function go_sort(sortCol) { // 정렬
		document.frm.sortCol.value = sortCol;
		document.frm.submit();
	}
	function go_page(page) { // 페이징
		//	location.href="getMemberList?page="+page;
		document.frm.page.value = page;
		document.frm.submit(); // 검색폼
	}
</script>
</head>
<body>

	<h3>경기 정보</h3>

	<form>

		<div class="container">
			<div class="row">
				<table class="table">
					<tr>
						<th>경기번호</th>
						<th>날짜</th>
						<th>경기제목</th>
						<th colspan="5">맞대결 전적</th>
						<th>세부정보</th>
						<th>결과확인</th>
						<th>게임 구매</th>
					</tr>
					<c:forEach items="${matchList}" var="match">
						<tr>
							<td>${match.gameId}</td>
							<td>${match.matchDate}17:00</td>
							<td>${match.matchInfo}</td>
							<td><a href="getTeam?teamId=${match.blueTeamName}">${match.blueTeamName}</a></td>
							<td>${match.blueTeamKillsum}</td>
							<td>${match.gameStatus}</td>
							<td>${match.redTeamKillsum}</td>
							<td><a href="getTeam?teamId=${match.redTeamName}">${match.redTeamName}</a></td>
							<td></td>
							<td><a href="getMatch?gameId=${match.gameId}">결과확인</a></td>
							<c:if test="${membersession.uGrant=='admin'}">
								<td><a href="getMhistoryList">마일리지 관리</a></td>
							</c:if>
							<c:if test="${membersession.uGrant!='admin'}">
								<td><a href="buyMatchList"> 구매 </a></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>

			</div>
			<div class="row">
				<div class="col-5">
					<table border="1" class="table">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>아이디</td>
						</tr>
						<c:forEach items="${noticeboard }" var="board">
							<tr>
								<td>${board.boardNumber }</td>
								<td><a
									href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardTitle}</a></td>
								<td>${board.postDate }</td>
								<td>${board.uId }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="col-5">
					<table border="1" class="table">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>아이디</td>
						</tr>
						<c:forEach items="${freeboard }" var="board">
							<tr>
								<td>${board.boardNumber }</td>
								<td><a
									href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardTitle}</a></td>
								<td>${board.postDate }</td>
								<td>${board.uId }</td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<div class="col-5">
					<table border="1" class="table">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>아이디</td>
						</tr>
						<c:forEach items="${analysisboard }" var="board">
							<tr>
								<td>${board.boardNumber }</td>
								<td><a
									href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardTitle}</a></td>
								<td>${board.postDate }</td>
								<td>${board.uId }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="col-5">
					<table border="1" class="table">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>아이디</td>
						</tr>
						<c:forEach items="${suggestionboard }" var="board">
							<tr>
								<td>${board.boardNumber }</td>
								<td><a
									href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardTitle}</a></td>
								<td>${board.postDate }</td>
								<td>${board.uId }</td>
							</tr>
						</c:forEach>
					</table>
				</div>



			</div>
		</div>




	</form>

</body>
</html>