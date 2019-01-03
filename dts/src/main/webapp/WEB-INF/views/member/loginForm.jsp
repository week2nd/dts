<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div style="width: 30%; margin:auto">
	<form id="loginFrm" method="post" action="login">
		<div class="form-group" style="width:75%">
			<label for="uId" class="control-label">아이디</label> <input type="text"
				class="form-control" id="uId" name="uId">
		</div>
		<div class="form-group" style="width:75%">
			<label for="uPw" class="control-label">비밀번호</label> <input
				type="password" class="form-control" id="uPw" name="uPw">
		</div>
		<button type="submit" class="btn btn-outline-primary" id="loginBtn">로그인</button>
		<button type="button" class="btn btn-outline-primary"
			onclick="window.location.href='insertMember'">회원가입</button>
		<button type="button" class="btn btn-outline-secondary"
			data-dismiss="modal">취소</button>
		<button type="button" class="btn btn-link"
			onclick="window.location.href='pwSearchForm'">비밀번호찾기</button>
		<!-- <span class="psw">Forgot<a href="pwSearchForm">password?</a></span> -->
	</form>
</div>
</body>
</html>
