<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateUser.jsp</title>
</head>
<body>
	<h3>테이블 수정</h3>

	<form action="./updateBoard" method="post">
	<input type="hidden" name="BOARD_NUMBER" value="${board.boardNumber}">
		제목<input type="text" name="boardTitle" value="${board.boardTitle}"><br>
		내용<input type="text" name="boardContent" value="${board.boardContent}"><br>
		<button>저장</button>
	</form>

</body>
</html>