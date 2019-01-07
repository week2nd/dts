<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMemberUser.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>	<!-- Ajax -->
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
				title : $('#uName').val()+'님 적중률',
				backgroundColor: '#f2f2f2'
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
 		$(".deleteBtn").click(function(){									// 회원탈퇴 버튼을 눌렀을 경우
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
		$(".updateBtn").click(function(){									// 회원수정 버튼을 눌렀을 경우
			if( $('#chkpw2').val() != $('#chkpw1').val()){					// 입력한 비밀번호와 해당유저 비밀번호가 다를 경우
				document.all.chkpw1.focus();								// 비밀번호 텍스트 박스로 커서 이동
				document.all.chkpw1.value = "";								// 비밀번호 텍스트 박스 값 제거
				alert("비밀번호를 확인해주세요.");
				return false;
			}
    	});
		
		
		var money = ${member.uMileage};
		var money2 = money.toLocaleString();
		$("#point").text(money2);	
	
		
	});
	
</script>

<style>

	#all{
		background-color: #f2f2f2;
		margin: auto;  
		border-radius: 2em;
	}
	#chkPw{
		size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 8px 20px;
		width: 100%;
		margin: 20px 0px;
	}
	#addressSearch{
		size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 8px 20px;
		width: 30%;
		margin: 20px 0px 0px 0px;
	}
	#roadAddress{
		size: 40px;
	 	border: 1px solid #c1c1c1; 
	 	padding: 8px 20px;
		width: 49%;
		margin: 0px 0px 20px 0px;
		background-color:#c1c1c1;
	}
	#detailAddress{
		size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 8px 20px;
		width: 49%;
		margin: 0px 0px 20px 0px;
	}
	
	#phone1, #phone2, #phone3{
		size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 8px 20px;
		width: 30%;
		margin: 20px 0px;
	}
	#chkEmail1, #chkEmail2 {
		size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 8px 20px;
		width: 46%;
		margin: 20px 0px;
	}
	label, #point{
		margin: 20px 0px;
	}

	#button1, #button2{
		margin: 20px 0px 20px 0px;
	}


</style>




</head>
<body>
	
	<h2 align="center">유저가 개인정보보기</h2><br>
	<form action="updateMemberForm" method="post">
	<input type="hidden" name="uId" value="${member.uId }" />
	<input type="hidden" id="chkpw2" value="${member.uPw }">
	<input type="hidden" id="uName" value="${member.uName }">			<!-- 구글차트에서 이름 필요 -->
	<input type="hidden" id="uAddress" value="${member.uAddress }">
	<input type="hidden" id="uWin" value="${member.uWin}">				<!-- 구글차트에서 맞춘횟수 필요 -->
	<input type="hidden" id="uLose" value="${member.uLose}">			<!-- 구글차트에서 틀린횟수 필요 -->
	<input type="hidden" id="uEmail" value="${member.uEmail}">
	<div class="container-fluid">
		
	<div class="col-lg-12" id="all">
		<div class="row">
			<div class="col-lg-6">
				<div class="au-card recent-report">
					<a href="updateMember?uId=${member.uId }">
					<button	class="updateBtn btn btn-primary btn-lg" id="button1" >회원수정</button></a>
				
					<a href="deleteMemberUser?uId=${member.uId }">
					<input type="button" value="회원탈퇴"	class="deleteBtn btn btn-primary btn-lg" id="button2" ></a>
				</div>
			</div>
			<div class="col-lg-6" style="float:; width:100px; height:100px;">
				<div class="au-card recent-report">
					<div id="piechart" style="width: 450px; height: 450px;">
				</div>
			</div>
		</div>
			
		</div>
		
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					<label id="label1">아이디</label>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					<label id="label2">${member.uId }</label>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					<label id="label3">비밀번호</label>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					<input class="form-control" type="password" name="uPw" id="chkpw1" autofocus>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					<label id="label4">이름</label>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					<label id="label5">${member.uName }</label>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					<label id="label6">주소</label>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					<label id="tempAddress"></label>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					<label id="label7">휴대폰번호</label>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					<label id="label8">${member.uPhone }</label>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					<label id="label9">생년월일</label>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					<label id="label10">${member.uBirth}</label>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					<label id="label11">E-Mail</label>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					<label id="label12">${member.uEmail}</label>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					<label id="label13">마일리지</label>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					<div id="point"></div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					<label id="label14">맞춘횟수</label>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					<label id="label15">${member.uWin}</label>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					<label id="label16">틀린횟수</label>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					<label id="label17">${member.uLose}</label>
				</div>
			</div>
			
		</div>
		
		
		
		
	</div>
	</div>
		
		
				
	</form>
	<br>

</body>
</html>