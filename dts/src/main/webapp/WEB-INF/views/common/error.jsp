<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>에러 화면입니다.</h3>
<div>
관리자에게 문의 바랍니다. tel: 421-2460<br>
<%--=exception.getMessage() --%>
에러 : ${exception.message }
</div>
</body>
</html>