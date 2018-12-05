<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardList.jsp</title>
<!-- <script>
 	function go_sort(sortCol){
 		document.frm.sortCol.value = sortCol;
 		document.frm.submit();
 	} 
</script>-->
</head>
<body>
<h3>getBoardList아아아아</h3><br><br><br><br><br><br>
 <form action="deleteMemberList">	
	<button>선택삭제</button>
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
				<td><input type="checkbox" name="bnumberList" value="${board.bnumberList}" /></td>
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
</body>
</html>