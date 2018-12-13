<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMemberUser.jsp</title>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	//원형차트
	function drawChart() {
		
	//	var mileage = $('#mileage').val();
		var win = $('#win').val();
		var lose =$('#lose').val();
		
		var data = google.visualization.arrayToDataTable([
				[ '가', '나' ], 
				[ '적중', 3 ],
				[ '실패', 5 ],
				[ '마일리지', 6 ] ]);

		var options = {
			title : $('#username').val()+'님 적중률'
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, options);
          
	//	console.log(mileage);
		console.log($('#win').val());
		console.log($('#lose').val());
	
		
	}


	/////////////////////////////////////////////////////////////

	//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	var pwdCheck = 0;
	//아이디 체크하여 가입버튼 비활성화, 중복확인.

	function checkPw() {
		var inputed = $('.pass').val();
		
//		console.log(inputed);
		$.ajax({
			data : {
				uPw : inputed
			},
			url : "checkPw",
			success : function(data) {
				if (inputed == "" && data == false) { // 아이디 값을 지웠을 경우
					$(".button").prop("disabled", true);
					$(".button").css("background-color", "#aaaaaa");
					$("#chkpw").css("background-color", "#f44336");
					pwdCheck = 0;
					//         document.all.labelido.style.display="none";
				} else if (data == false) { // 사용가능한 아이디로 입력을 바꿨을때
					$("#chkpw").css("background-color", "#4CAF50");
					//          document.all.labelido.style.display="";
					//          document.all.labelidx.style.display="none";
					pwdCheck = 1;
					if (pwdCheck == 1) {
						$(".button").prop("disabled", false);
						$(".button").css("background-color", "#4CAF50");
					}
				} else if (data == true) { // 중복아이디를 입력했을 경우
					$(".button").prop("disabled", true);
					$(".button").css("background-color", "#aaaaaa");
					$("#chkpw").css("background-color", "#f44336");
					pwdCheck = 0;
					//       document.all.labelido.style.display="none";
					//        document.all.labelidx.style.display="";
				}

			}
		});
	}
</script>
<style>
.button {
	background-color: #f44336; /* Red */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
</style>
</head>
<body>
	<h3>유저보기</h3>
	<form action="getMemberUser" method="post">
		<input type="hidden" class="form-control id" name="uId"
			value="${member.uId }" />
		<input type="hidden" id="mileage" value="${member.uMileage }">
		<input type="hidden" id="win" value="${member.uWin }">
		<input type="hidden" id="lose" value="${member.uLose }">
		<input type="hidden" id="username" value="${member.uName }">
		
		<table style="width: 70%">
			<tr>
				<td><div style="width: 50px;">아이디</div></td>
				<td>${member.uId }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="uPw" id="chkpw"
					class="form-control" oninput="drawChart()"></td>
				<td colspan="2"><div style="visibility: hidden">빈공간입니당.빈공간입니당.빈공간입니당.빈공간입니당.</div></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.uName }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${member.uAddress }</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>${member.uPhone }</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${member.uBirth}</td>
			</tr>
			<tr>
				<td>마일리지</td>
				<td>${member.uMileage}</td>
			</tr>
			<tr>
				<td>맞춘횟수</td>
				<td>${member.uWin}</td>
			</tr>
			<tr>
				<td>틀린횟수</td>
				<td>${member.uLose}</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="piechart" style="width: 700px; height: 700px;"></div>
				</td>
			</tr>
		</table>
		<table style="width: 30%">
			<tr>
				<td><a href="updateMember?uId=${member.uId }"><button
							class="button" disabled="disabled">회원수정</button></a></td>
				<td><a href="deleteMember?uId=${member.uId }"><button
							class="button" disabled="disabled">회원탈퇴</button></a></td>
			</tr>
		</table>
	</form>

</body>
</html>