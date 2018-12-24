<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판등록</title>
</head>
<body>
	<h3>게시판 등록</h3>

	
	
	<form action="./insertBoard" method="post" enctype="multipart/form-data">
		제목<input type="text" name="boardTitle" ><br>
		내용<textarea rows="5" cols="30" name="boardContent" ></textarea><br>
		아이디<input type="text" name="uId" value="${membersession.uId}" readonly><br>
		게시판타입<input type="text" name="boardType" value="${type}"><br>
		첨부파일<input type="file" name="uploadFile"><br>		<!-- 파일업로드 -->
		<button>저장</button>
	</form>
	 
</body>
</html>