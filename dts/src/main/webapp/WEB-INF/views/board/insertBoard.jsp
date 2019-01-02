<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판등록</title>
</head>
<body>
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
	
	
	<form action="./insertBoard" method="post" enctype="multipart/form-data">
		제목<input type="text" name="boardTitle" ><br>
		내용<textarea rows="5" cols="30" name="boardContent" ></textarea><br>
		아이디<input type="text" name="uId" value="${membersession.uId}" readonly><br>
		첨부파일<input type="file" name="uploadFile"><br>		<!-- 파일업로드 -->
		<input type="hidden" name="boardType" value="${type}"><br>
		<button>저장</button>
	</form>
	 
</body>
</html>