<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoard.jsp</title>
</head>
<body>
<h3>게시판보기</h3>
	게시판제목 : ${board.boardNumber }; ${board.boardTitle} 
	게시판내용 : ${board.boardContent } 
	작성일시 : ${board.postDate } 
	조회수 : ${board.boardHits } 
	추천수 : ${board.boardLike} 
	아이디 : ${board.uId } 
	게시판타입 : ${board.boardType } 
	<a href="updateBoardform?seq=${board.uId}">수정</a> 
	<a href="deleteBoard?seq=${board.uId}">삭제</a>
	 
</body>
</html>
