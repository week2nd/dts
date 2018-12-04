<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getUserList.jsp</title>

</head>
<body>
<h3>getUserList아아아아</h3>
<!-- 
	<c:if test="${empty sessionScope.login }">
	<a href="loginForm">로그인</a>
	<h3>일반게시판</h3> <%-- <%=request.getContextPath() %> --%>
	<a href="${pageContext.request.contextPath }/insertUserform">등록</a><br>
	
	
	</c:if>
	<c:if test="${not empty sessionScope.login }">
	${sessionScope.login.id }님 <a href="logout">로그아웃</a>
	</c:if>

	<form>
		<select name="searchCondition">
			<option value="name">이름
			<option value="role">권한
		</select>
		<input type="text" name="searchKeyword">
		<button>검색</button>
	</form>
	
	
	 
	
	<table border="1">
		<tr>
				<td>아이디</td>
				<td>비밀번호</td>				
				<td>이름</td>
				<td>권한</td>
			</tr>
		<c:forEach items="${userList }" var="user">
			<tr>
				<td>${user.id }</td>
				<td>${user.password}</td>
				<td><a href="./getUser?id=${user.id }">${user.name }</a></td>
				<td>${user.role }</td>
			</tr>
		</c:forEach>
	</table>
	 -->

</body>
</html>