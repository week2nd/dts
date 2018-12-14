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
 <%String type = request.getParameter("type"); %>

	
	<form action="./insertBoard" method="post">
		제목<input type="text" name="boardTitle" ><br>
		내용<textarea rows="5" cols="30" name="boardContent" ></textarea><br>
		아이디<input type="text" name="uId" value="${membersession.uId}" readonly><br>
		<input type="hidden" name="boardType" value="<%=type %>" readonly><br>
		<button>저장</button>
	</form>
	 
</body>
</html>