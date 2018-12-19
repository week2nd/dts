<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardList.jsp</title>

</head>
<body>
<h3>게시판목록</h3>

 	<script>
	function go_sort(sortCol){
		document.frm.sortCol.value = sortCol;
		document.frm.submit();
	}
	function go_page(page){
		location.href="getBoardList?page"+page;
/* 		document.frm.page.value=page;
		document.frm.submit();		//검색폼 */
	}
	</script>
 
 <form action="deleteBoardList">	
	<button>선택삭제</button>
	

	
	<a href="${pageContext.request.contextPath}/insertBoard">등록</a>
	
	<table border="1" >
		<tr>
			<td>선택</td>
			<td>번호<a href="#" onclick="go_sort('boardNumber')">▲</a></td>
			<td>제목<a href="#" onclick="go_sort('boardTitle')">▲</a></td>				
			<td>내용<a href="#" onclick="go_sort('boardContent')">▲</a></td>
			<td>작성일<a href="#" onclick="go_sort('postDate')">▲</a></td>
			<td>조회수<a href="#" onclick="go_sort('boardHits')">▲</a></td>
			<td>추천수<a href="#" onclick="go_sort('boardLike')">▲</a></td>
			<td>아이디<a href="#" onclick="go_sort('uId')">▲</a></td>
			<td>게시판타입<a href="#" onclick="go_sort('boardType')">▲</a></td>
			
		</tr>
		<c:forEach items="${boardList }" var="board">
			<tr>
				<td><input type="checkbox" name="bnumberList" value="${board.boardNumber}" /></td>
 				<td>${board.boardNumber }</td>
				<td><a href="./getBoard?boardNumber=${board.boardNumber }">${board.boardTitle }</a></td>
				<td>${board.boardContent }</td>
				<td>${board.postDate }</td>
				<td>${board.boardHits }</td>
				<td>${board.boardLike }</td>
				<td>${board.uId }</td>
				<td>${board.boardType }</td>
			</tr>
		</c:forEach> 
	</table>
</form>	 

 <my:paging paging="${paging}" jsFunc="go_page"/>	<!-- 페이징 위해 추가 -->


</body>
</html>