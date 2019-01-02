<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardList.jsp</title>

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
		
		<table border="1" class = "table">
			<tr>
				<c:if test="${membersession.uGrant=='admin'}">
				<td>선택</td>
				</c:if>
				<td>번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>추천수</td>
				<td>아이디</td>
				<c:if test="${membersession.uGrant=='admin'}">
				<td>게시판타입</td>
				</c:if>
			</tr>
			<c:forEach items="${board }" var="board">
				<tr>
				<c:if test="${membersession.uGrant=='admin'}">
					<td><input type="checkbox" name="bnumberList"
						value="${board.boardNumber}" /></td>
				</c:if>
					<td>${board.boardNumber }</td>
					<td><a href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardTitle}</a></td>
					<td><a href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">${board.boardContent }</a></td>
					<td>${board.postDate }</td>
					<td>${board.boardHits }</td>
					<td>${board.boardLike }</td>
					<td>${board.uId }</td>
					<c:if test="${membersession.uGrant=='admin'}">
					<td>${board.boardType }</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</form>


	<%-- 삭제할때 type도 가져오는방법<a href="deleteBoard?boardNumber=${board.boardNumber}&boardType=${board.boardType }">삭제</a> --%>
	<!-- a 태그에서 파라미터를 두개 가져오는 방법 -->

	<div align="center">
	<!-- 페이징 위해 추가  -->
	<my:paging paging="${paging}" jsFunc="go_page" />
	</div>

</body>
</html>