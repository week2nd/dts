<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertUser.jsp</title>
</head>
<body>
	<h3>게시판 등록</h3>
	
	<form action="./insertBoard" method="post">
		제목<input type="text" name="id" ><br>
		내용<input type="text" name="password" ><br>
		이름<input type="text" name="name" ><br>
		권한<input type="text" name="role" ><br>
		<button>저장</button>
	</form>
	 
</body>
</html>