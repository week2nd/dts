<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMhistoryList</title>
<script>
	function go_page(page) {
		location.href = "getMhistoryList?page=" + page;
	}
</script>
</head>
<body>

	<form>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>업데이트날짜</th>
					<th>이전마일리지</th>
					<th>현재마일리지</th>
					<th>아이피</th>
					<th>구분</th>
				</tr>
			</thead>

			<tr>
				<c:forEach items="${mhistoryList}" var="mhistory">
					<tr>
						<td>${mhistory.num}</td>
						<td>${mhistory.uId}</td>
						<td>${mhistory.ahDate}</td>
						<td>${mhistory.oldMileage}</td>
						<td>${mhistory.newMileage}</td>
						<td>${mhistory.ipAddr}</td>
						<td>${mhistory.categorie}</td>
					</tr>
				</c:forEach>
			</tr>
		</table>
	</form>
	<my:paging paging="${paging}" jsFunc="go_page" />

</body>
</html>