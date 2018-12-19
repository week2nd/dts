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
	//원형차트
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		
	//	var mileage = $('#mileage').val();
		var win = $('#uWin').val();						// 맞춘횟수 값
		var lose =$('#uLose').val();					// 틀린횟수 값
		if(win!=0 || lose!=0){							// 경기구매를 한 번이상 했을 경우 차트를 보여줌
			document.all.piechart.style.display="";
			var data = google.visualization.arrayToDataTable([
					[ '가', '나' ], 
					[ '적중', Number($('#uWin').val()) ],
					[ '실패', Number($('#uLose').val()) ],
					 ]);
	
			var options = {
				title : $('#uName').val()+'님 적중률'
			};
	
			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));
	
			chart.draw(data, options);
		}else{			// 경기구매를 한번도 안했을 경우 영역 비활성화
			document.all.piechart.style.display="none";
		}
	}


	/////////////////////////////////////////////////////////////

	
	$(function(){		// 화면 시작하자마자 주소부분 '^' 지워서 합치기 과정
		
		
 		var addressSplit=$('#uAddress').val().split('^');					// 주소 '^'를 기준으로 자르기
 		$("#tempAddress").text(addressSplit[0] + addressSplit[1]);			// 주소와 상세주소 합쳐서 tempAddress에 입력
 		$(".deletebtn").click(function(){									// 회원탈퇴 버튼을 눌렀을 경우
 			if (confirm("정말 삭제하시겠습니까??")== true){						// 회원탈퇴 확인을 눌렀을 경우 	
 				if($('#chkpw2').val() != $('#chkpw1').val()){				// 입력한 비밀번호와 해당유저 비밀번호가 다를 경우
 					alert("비밀번호를 확인해주세요.");
 					document.all.chkpw1.focus();							// 비밀번호 텍스트 박스로 커서 이동
 					document.all.chkpw1.value = "";							// 비밀번호 텍스트 박스 값 제거
 					return false;
 				}else if(false){											// 입력한 비밀번호와 해당유저 비밀번호가 같을 경우
 					alert($('#uName').val() + "회원 탈퇴 완료 되었습니다.");
 				}
 			}else{															// 회원탈퇴 취소를 눌렀을 경우
 				document.all.chkpw1.focus();								// 비밀번호 텍스트 박스로 커서 이동
				return false;
			}

 		});
		$(".updatebtn").click(function(){									// 회원수정 버튼을 눌렀을 경우
			if( $('#chkpw2').val() != $('#chkpw1').val()){					// 입력한 비밀번호와 해당유저 비밀번호가 다를 경우
				document.all.chkpw1.focus();								// 비밀번호 텍스트 박스로 커서 이동
				document.all.chkpw1.value = "";								// 비밀번호 텍스트 박스 값 제거
				alert("비밀번호를 확인해주세요.");
				return false;
			}
    	});
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
		<input type="hidden" id="uName" value="${member.uName }">			<!-- 구글차트에서 이름 필요 -->
		<input type="hidden" id="uAddress" value="${member.uAddress }">
		<input type="hidden" id="uWin" value="${member.uWin}">				<!-- 구글차트에서 맞춘횟수 필요 -->
		<input type="hidden" id="uLose" value="${member.uLose}">			<!-- 구글차트에서 틀린횟수 필요 -->
		<input type="hidden" id="uEmail" value="${member.uEmail}">
		<table style="width: 70%" class="table">
			<tr>
				<td><div style="width: 50px;">아이디</div></td>
				<td>${member.uId }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uPw" id="chkpw1" class="form-control pass" oninput="checkPwd()" autofocus></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.uName }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<label id="tempAddress"></label>  
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
				<td>E-Mail</td>
				<td>${member.uEmail}</td>
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
					<button	class="form-control btn btn-primary updatebtn" >회원수정</button></a>
				</td>
				<td><a href="deleteMemberUser?uId=${member.uId }">
					<input type="button" value="회원탈퇴"	class="form-control btn btn-primary deletebtn" >
					</a>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>