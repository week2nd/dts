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

	
	var pwCheck = 0;						//비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정

	function checkPwd() {					//비밀번호 체크하여 수정, 탈퇴버튼 비활성화
        var inputPw = $('#chkpw1').val();	// 텍스트 입력값
        var dbPw = $('#chkpw2').val();		// hidden으로 숨겨져있는 해당유저 비밀번호
		
        if(inputPw=="" ){ 					// 비밀번호창이 null이면 input색깔 빨강색으로
        	pwCheck = 0;
            $("#chkpw1").css("background-color", "#FFCECE");
            $("#chkpw2").css("background-color", "#FFCECE");
        }
        else if (inputPw == dbPw) {			// 입력한 비밀번호가 같으면 input색깔 초록색으로
            $("#chkpw1").css("background-color", "#B0F6AC");
            $("#chkpw2").css("background-color", "#B0F6AC");
            pwCheck = 1;
            
        } else if (inputPw != dbPw) {		// 입력한 비밀번호와 다르면 비밀번호 input색깔 붉은색으로
            pwCheck = 0;
            $("#chkpw1").css("background-color", "#FFCECE");
            $("#chkpw2").css("background-color", "#FFCECE");
        }
        if(pwCheck=1){						// 수정버튼 누를 시 alert창으로 선택하는 거 추가하기 필요
//        	alert("수정창으로 가즈아");
        }
    }
	
	
	$(function(){		// 화면 시작하자마자 주소부분 '^' 지워서 합치기 과정
 		
 		var addresssplit=$('#uAddress').val().split('^');			// 주소 '^'만 제외하고 넣기
 		document.all.tempAddress.value = addresssplit[0];
 		if(addresssplit[1]!=null){									// 상세주소 입력 되어 있을 경우 두개 붙이기 (막아놨는데)
 			document.all.tempAddress.value = addresssplit[0] + addresssplit[1];
 		} 
	});
	
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
		<input type="hidden" name="uId" value="${member.uId }" />
		<input type="hidden" id="chkpw2" value="${member.uPw }">
		<input type="hidden" id="uAddress" value="${member.uAddress }">
		<table style="width: 70%" class="table">
			<tr>
				<td><div style="width: 50px;">아이디</div></td>
				<td>${member.uId }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="uPw" id="chkpw1" class="form-control pass" oninput="checkPwd()"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.uName }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="tempAddress"><br>
				
				</td>
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
				<td><a href="updateMember?uId=${member.uId }">
					<button	class="form-control btn btn-primary joinbtn" >회원수정</button></a>
				</td>
				<td><a href="deleteMember?uId=${member.uId }">
					<input type="button" value="회원탈퇴"	class="form-control btn btn-primary deletebtn" ></button>
					</a>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>