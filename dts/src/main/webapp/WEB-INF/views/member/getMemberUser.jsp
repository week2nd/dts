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
				backgroundColor: '#E6E6FA'
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

<!-- 
<style>
	body {								/* 글자 폰트 */
		font-family: Arial, Helvetica, sans-serif;
	}

	.updateBtn, .deleteBtn {						/* delete 버튼 */
		background-color: #aaaaaa;
		color: white;					/* 글자색 */
		padding: 8px 20px;				/* 버튼 크기 위아래 8px, 좌우 20px */
		margin: 20px 0;					/* 상하 여백 20px, 좌우 여백 0px */
		cursor: pointer;				/* 마우스 hover 시 마우시 포인터 손가락으로 변경 */
		width: 7%;						/* 버튼 넓이 7% */
	}
	.updateBtn:hover, .deleteBtn:hover {					/* delete버튼 마우스 hover 시 */
		opacity: 0.8;					
		background-color: #3e8e41;		/* 배경색깔 기존 색보다 좀 더 연하게 */
		box-shadow: 3px 2px #666;		/* 아래로 그림자 생성 오른쪽 3px, 아래 2px */
	  	transform: translateY(2px);		/* 그림자 길이 2px */
	}
	 
	table {								/* th, td에 여백 15px, 글자 왼쪽정렬 */
		border: 1px solid #f2f2f2; 		/* 선 굵기 1px, 실선, 회색 */
		border-collapse: collapse;
		width: 50%;						/* 넓이 50%  */
		margin: 0 0 20px 0;				/* 아랫쪽 테이블 간격 20px  */
	}
	 
	th, td {							/* th, td에 여백 15px, 글자 왼쪽정렬  */						
 		padding: 15px;
 		text-align: left;
	}
	 
	tr:nth-child(even) {				/* 짝수번째 연한 회색 */			
		background-color: #f2f2f2;
	}
		
	input{
	 	size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 8px 20px;
	 }
	#phone1{
	 	size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 10px 20px;
	 }
		
</style>

 -->




</head>
<body style="background-color:#aaaaaa;">
	<form action="updateMemberForm" method="post">
	<input type="hidden" name="uId" value="${member.uId }" />
	<input type="hidden" id="chkpw2" value="${member.uPw }">
	<input type="hidden" id="uName" value="${member.uName }">			<!-- 구글차트에서 이름 필요 -->
	<input type="hidden" id="uAddress" value="${member.uAddress }">
	<input type="hidden" id="uWin" value="${member.uWin}">				<!-- 구글차트에서 맞춘횟수 필요 -->
	<input type="hidden" id="uLose" value="${member.uLose}">			<!-- 구글차트에서 틀린횟수 필요 -->
	<input type="hidden" id="uEmail" value="${member.uEmail}">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="overview-wrap">
					<h3>유저가 개인정보보기</h3>
				</div>
			</div>
		</div>
	<div style="width: 40%; margin:auto; background-color:#f3f3f3;">
		<div class="row">
			<div class="col-lg-6">
				<div class="au-card recent-report">
					<a href="updateMember?uId=${member.uId }">
					<button	class="updateBtn btn btn-primary btn-lg" >회원수정</button></a>
				
					<a href="deleteMemberUser?uId=${member.uId }">
					<input type="button" value="회원탈퇴"	class="deleteBtn btn btn-primary btn-lg" ></a>
				</div>
			</div>
			<div class="col-lg-6" style="float:; width:100px; height:100px;">
				<div class="au-card recent-report">
					<div id="piechart" style="width: 500px; height: 500px;">
				</div>
			</div>
		</div>
			
		</div>
		
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					아이디
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					${member.uId }
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					비밀번호
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
					이름
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					${member.uName }
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					주소
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
					휴대폰번호
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					${member.uPhone }
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					생년월일
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					${member.uBirth}
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					E-Mail
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					${member.uEmail}
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					마일리지
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
					맞춘횟수
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					${member.uWin}
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-2">
				<div class="au-card recent-report">
					틀린횟수
				</div>
			</div>
			<div class="col-lg-4">
				<div class="au-card recent-report">
					${member.uLose}
				</div>
			</div>
			
		</div>
		
		
		
		
	</div>
	</div>
		
		
				
	</form>

</body>
</html>