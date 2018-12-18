<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMhistoryList</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function go_page(page) {
		location.href = "getMhistoryList?page=" + page;
	}
</script>
<script>
	$(function() {
		$("#ajax").click(function() {
		
			$.ajax({
				url : "getMhistoryListAjax",
				type : "POST",
				contentType : "application/json;charset=utf-8",
				dataType : "json",
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + "Http에러메시지 :" + msg);
				},
				success : function(data) {
					console.log(data);
					for (i = 0; i <= data.length; i++) {
						var tr = "<tr><td>" + data[i].num + 
						"</td><td>" + data[i].uId + 
						"</td><td>" + data[i].ahDate + 
						"</td><td>" + data[i].oldMileage + 
						"</td><td>" + data[i].newMileage + 
						"</td><td>" + data[i].ipAddr + 
						"</td><td>"	+ data[i].categorie + "</td></tr>"
						$(tr).appendTo("#mhistoryList");
					}
				}
			});
		})		
	});
</script>
</head>
<body>
	<button id="ajax">ajax</button>
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
			<tbody id="mhistoryList">
			</tbody>
			<%-- <tr>
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
			</tr> --%>
		</table>
	</form>
	<my:paging paging="${paging}" jsFunc="go_page" />

</body>
</html>