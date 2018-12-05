<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getUserList.jsp</title>
<script>
 	function go_sort(sortCol){
 		document.frm.sortCol.value = sortCol;
 		document.frm.submit();
 	}
</script>
</head>
<body>
<h3>getUserList아아아아</h3>
<form action="deleteMemberList">	
	<button>선택삭제</button>
	<table border="1" >
		<tr>
			<td>선택</td>
			<td>아이디<a href="#" onclick="go_sort('uid')">▲</a></td>
			<td>비밀번호<a href="#" onclick="go_sort('upw')">▲</a></td>				
			<td>이름<a href="#" onclick="go_sort('uname')">▲</a></td>
			<td>주소<a href="#" onclick="go_sort('uaddress')">▲</a></td>
			<td>폰번호<a href="#" onclick="go_sort('uphone')">▲</a></td>
			<td>마일리지<a href="#" onclick="go_sort('umileage')">▲</a></td>
			<td>권한<a href="#" onclick="go_sort('ugrant')">▲</a></td>
			<td>생년월일<a href="#" onclick="go_sort('ubirth')">▲</a></td>
			<td>가입일<a href="#" onclick="go_sort('udate')">▲</a></td>
			<td>승리<a href="#" onclick="go_sort('uwin')">▲</a></td>
			<td>패배<a href="#" onclick="go_sort('ulose')">▲</a></td>
		</tr>
		<c:forEach items="${memberList }" var="member">
			<tr>
				<td><input type="checkbox" name="uidList" value="${member.uid}" /></td>
 				<td><a href="./getMember?uid=${member.uid }">${member.uid }</a></td>
				<td>${member.upw }</td>
				<td>${member.uname }</td>
				<td>${member.uaddress }</td>
				<td>${member.uphone }</td>
				<td>${member.umileage }</td>
				<td>${member.ugrant }</td>
				<td>${member.ubirth }</td>
				<td>${member.udate }</td>
				<td>${member.uwin }</td>
				<td>${member.ulose }</td>
			</tr>
		</c:forEach>
	</table>
</form>	
</body>
</html>