<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMemberUser.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>	<!-- Ajax차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>		<!-- 구글차트 -->
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

	function checkPwd() {
        var inputed = $('#chkpw1').val();
        var reinputed = $('#chkpw2').val();
  //      console.log(inputed);
		
        if(reinputed=="" || inputed=="" ){ 	//
            $("#chkpw1").css("background-color", "#FFCECE");
            $("#chkpw2").css("background-color", "#FFCECE");
        }
        else if (inputed == reinputed) {		// 비밀번호 input색깔 초록색으로
            $("#chkpw1").css("background-color", "#B0F6AC");
            $("#chkpw2").css("background-color", "#B0F6AC");
            pwdCheck = 1;
            
        } else if (inputed != reinputed) {		// 비밀번호 틀리면 가입버튼 비활성화 및 비밀번호 input색깔 붉은색으로
            pwdCheck = 0;
            $("#chkpw1").css("background-color", "#FFCECE");
            $("#chkpw2").css("background-color", "#FFCECE");
        }
        if(pwdCheck=1){
//        	alert("수정창으로 가즈아");
        }
    }
</script>
<!-- 
<style>
.button {
	background-color: #aaaaaa; /* Gray */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
</style>
 -->
</head>
<body>
	<h3>유저가 개인정보보기</h3>
	<form action="updateMemberForm" method="post">
		<input type="hidden" class="form-control id" name="uId"
			value="${member.uId }" />
		<input type="hidden" id="mileage" value="${member.uMileage }">
		<input type="hidden" id="win" value="${member.uWin }">
		<input type="hidden" id="lose" value="${member.uLose }">
		<input type="hidden" id="username" value="${member.uName }">
		<input type="hidden" id="chkpw2" value="${member.uPw }">
		<table style="width: 70%" class="table">
			<tr>
				<td><div style="width: 50px;">아이디</div></td>
				<td>${member.uId }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="uPw" id="chkpw1"
					class="form-control pass" oninput="checkPwd()"></td>
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
							class="form-control btn btn-primary joinbtn" >회원수정</button></a></td>
				<td><a href="deleteMember?uId=${member.uId }"><button
							class="form-control btn btn-primary deletebtn">회원탈퇴</button></a></td>
			</tr>
		</table>
	</form>

</body>
</html>