<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

#loginFrm {
	width: 50%;
	border: 7px solid #f1f1f1;
}

.txt[type=text], .txt[type=password] {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

#loginBtn {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 50%;
}

#loginBtn:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>

	<h2>Login Form</h2>

	<form id="loginFrm" action="login">
	<div class="form-group">
	</div>
	<div class="container">
	<label for="uname"><b>Username</b></label><br>
	<input id="uId" type="text" class="form-control" placeholder="ID" name="uId"><br>
	<label for="psw"><b>Password</b></label> <br> 
	<input id="uPw" type="password" class="form-control" placeholder="Password" name="uPw">
	<button id="loginBtn" type="submit">Login</button><br>
	</div>
		<div class="container" style="background-color: #f1f1f1">
			<button type="button" class="cancelbtn">Cancel</button>
			<span class="psw">Forgot <a href="#">password?</a></span>
		</div>
	</form>
 
</body>
</html>
