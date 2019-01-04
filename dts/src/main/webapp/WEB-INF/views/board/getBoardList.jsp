<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardList.jsp</title>
<style>
			table {
				width: 100px;
			}
</style>
</head>
<body>
	<div align="center">
	<c:if test="${type=='notice'}">
	<h3>공지게시판</h3>
	</c:if>
	<c:if test="${type=='free'}">
	<h3>자유게시판</h3>
	</c:if>
	<c:if test="${type=='analysis'}">
	<h3>분석게시판</h3>
	</c:if>
	<c:if test="${type=='suggestion'}">
	<h3>건의게시판</h3>
	</c:if>
	</div>
	
	<form name="frm">
		<!-- 게시판 검색!! -->
		<select name="searchCondition">
			<option value="board_Title">제목
			<option value="board_Content">내용
		</select> <input type="text" name="searchKeyword"
			value="${boardVO.searchKeyword}">
		<button>검색</button>
		<input type="hidden" name="sortCol" /> <input type="hidden"
			name="page" /> <input type="hidden" name="type" value="${type}" />
	</form>
	<script>
		if ("${boardVO.searchCondition}" != "") {
			document.frm.searchCondition.value = "${boardVO.searchCondition}";
		}
	</script>
	
	<form action="deleteBoardList">	
	<c:if test="${membersession.uGrant=='admin'}">					<!-- admin 으로 로그인시 선택삭제가 보인다. -->
		<input type=hidden name = "type" value = "${type}">			
		<button>선택삭제</button>
	</c:if>
		<script>
			function go_sort(sortCol) {								// 정렬 기능
				document.frm.sortCol.value = sortCol;
				document.frm.submit();
			}
			function go_page(page) {								// 페이징 기능
				document.frm.page.value = page;
				document.frm.submit(); 								// 검색폼 
			}
		</script>
		<c:if test="${membersession.uGrant=='admin' || type!='notice' }">		
		<a href="${pageContext.request.contextPath}/insertBoardform?type=${type}">등록</a>
		</c:if>
		  <div class="table-responsive table--no-card m-b-30">
		<table border="1" width="500" class = "table table-borderless table-data3">
		<thead>
			<tr>
				<c:if test="${membersession.uGrant=='admin'}">
				<th align="center">선택</th>
				</c:if>
				<th align="center">번호</th>
				<th align="center">제목</th>
				<th align="center">작성일</th>
				<th align="center">조회수</th>
				<th align="center">추천수</th>
				<th align="center">아이디</th>
				<c:if test="${membersession.uGrant=='admin'}">
				<th align="center">게시판타입</th>
				</c:if>
			</tr>
			</thead>
			<c:forEach items="${board }" var="board">
				<tr>
				<c:if test="${membersession.uGrant=='admin'}">
					<td align="center"><input type="checkbox" name="bnumberList"
						value="${board.boardNumber}" /></td>
				</c:if>
					<td align="center">${board.boardNumber }</td>
					<td align="center"><a href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardTitle}</a></td>
					<td align="center">${board.postDate }</td>
					<td align="center">${board.boardHits }</td>
					<td align="center">${board.boardLike }</td>
					<td align="center">${board.uId }</td>
					<c:if test="${membersession.uGrant=='admin'}">
					<td align="center">${board.boardType }</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		</div>
	</form>


	<%-- 삭제할때 type도 가져오는방법<a href="deleteBoard?boardNumber=${board.boardNumber}&boardType=${board.boardType }">삭제</a> --%>
	<!-- a 태그에서 파라미터를 두개 가져오는 방법 -->

	<div align="center">
	<!-- 페이징 위해 추가  -->
	<my:paging paging="${paging}" jsFunc="go_page" />
	</div>

</body>
</html>