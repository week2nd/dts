<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getUser.jsp</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
	daum.postcode.load(function() {
		/*  new daum.Postcode({
		      oncomplete: function(data) {
		          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		          // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		      }
		  }).open();  팝업창 차단*/
	});

	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('roadAddress').value = fullRoadAddr;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
	function sum() {
		console.log("ASdfasd");
		// 주소와 상세주소 합치는 과정       		
		document.all.uAddress.value = $('#roadAddress').val() + "^"
				+ $('#detailAddres').val();

		// 휴대폰번호 하이픈 합치는 과정
		document.all.uPhone.value = $('#phone1').val() + "-"
				+ $('#phone2').val() + "-" + $('#phone3').val();

		// E-Mail @를 합치는 과정
		document.all.uEmail.value = $('#chkEmail1').val() + "@"
				+ $('#chkEmail2').val();
	}

	// 휴대폰번호 숫자만 입력가능하게
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9)
			return;
		else
			return false;
	}
	// 휴대폰번호 숫자가 아닐 시 삭제
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}

	

	$(function (){
		
		//한글입력 안되게 처리
		$("input[name=uEmail1]").keyup(function(event) { // input name이 uEmail1에 키 입력시
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});
		$("input[name=uEmail2]").keyup(function(event) { // input name이 uEmail2에 키 입력시
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9.]/gi, '')); // '.'도 입력할 수 있게 출력
			}
		});
		
		
		console.log("asdfasdfadfadfasdfasdfvasdjvalsjkdnf");
		var addressSplit=$('#uAddress').val().split('^');			// 주소 '^'만 제외하고 넣기
		document.all.roadAddress.value = addressSplit[0];
 		if(addressSplit[1]!=null){									// 상세주소 입력 되어 있을 경우 두개 붙이기 (막아놨는데)
 			document.all.detailAddress.value = addressSplit[1];
 		}
		var phoneSplit =  $('#uPhone').val().split('-');			// 휴대폰 '-'만 제외하고 넣기
				
		document.all.phone2.value = phoneSplit[1];
		document.all.phone3.value = phoneSplit[2];
		
		var tempPhone = phoneSplit[0] + "-" + phoneSplit[1] + "-" + phoneSplit[2];
		document.all.uPhone.value = tempPhone;
		
		var emailSplit=$('#uEmail').val().split('@');			// 이메일 '@'만 제외하고 넣기
 		document.all.chkEmail1.value = emailSplit[0];
 		document.all.chkEmail2.value = emailSplit[1];
		
		


	});
</script>



<style>
	#all{
		background-color: #606060;
		margin:auto;  
		border-radius: 2em;
		color: white;
	}
	#uPw{
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
	label{
		margin: 20px 0px;
	}

	#button, #deleteBtn, #cancelBtn{
		margin: 20px 0px 20px 0px;
	}

</style>


</head>
<body>
	<h2 align="center">관리자가 단일유저 정보보기</h2><br>
	<form action="updateMember" method="post">
		<input type="hidden" name="uId" value="${member.uId }" />
		<div id="all" class="col-6">
		<div class="container">
			<div class="row">
				<div class="col-3">
					<label id="label1">아이디</label>
				</div>
				<div class="col-9">
					<label id="label2">${member.uId }</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-3">
					<label id="label3">비밀번호</label>
				</div>
				<div class="col-9">
					<input type="password" name="uPw" id="uPw" value="${member.uPw }">
				</div>
			</div>
			
			<div class="row">
				<div class="col-3">
					<label id="label4">이름</label>
				</div>
				<div class="col-9">
					<label id="label5">${member.uName }</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-3">
					<label id="label6">주소</label>
				</div>
				<div class="col-9">
					<input type="button" onclick="sample4_execDaumPostcode()" id="addressSearch" class="btn btn-warning btn-sm"
					value="우편번호 찾기"><br> <input type="text"
					id="roadAddress" placeholder="지번주소" oninput="sum()" readonly>
					<input type="text" id="detailAddress" placeholder="상세주소 입력창"
					oninput="sum()"> <input type="hidden" id="uAddress"
					name="uAddress" value="${member.uAddress }"> <span
					id="guide" style="color: #999"></span>
				</div>
			</div>
			
			<div class="row">
				<div class="col-3">
					<label id="label7">휴대폰번호</label>
				</div>
				<div class="col-9">
					<select name="phone1" id="phone1" oninput="sum()">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="012">012</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select> &nbsp;-&nbsp;&nbsp;<input type="text" name="phone2" id="phone2"
					oninput="sum()" maxlength=4 onkeydown='return onlyNumber(event)'
					onkeyup='removeChar(event)'>&nbsp;&nbsp;-&nbsp; <input
					type="text" name="phone3" id="phone3" oninput="sum()" maxlength=4
					onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
					<input type="hidden" name="uPhone" id="uPhone"
					value="${member.uPhone }">
				</div>
			</div>
			
			<div class="row">
				<div class="col-3">
					<label id="label8">E-Mail</label>
				</div>
				<div class="col-9">
					<input type="hidden" name="uEmail" id="uEmail"
					value="${member.uEmail }"> <input type="text"
					name="uEmail1" id="chkEmail1" placeholder="이메일 아이디" oninput="sum()">&nbsp;@
					<input type="text" name="uEmail2" id="chkEmail2"
					placeholder="해당 홈페이지" oninput="sum()">
				</div>
			</div>
			
			<div class="row">
				<div class="col-3">
					<label id="label9">마일리지</label>
				</div>
				<div class="col-9">
					<label id="label10">${member.uMileage}</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-3">
					<label id="label11">권한</label>
				</div>
				<div class="col-9">
					<label id="label12">${member.uGrant}</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-3">
					<label id="label13">생년월일</label>
				</div>
				<div class="col-9">
					<label id="label14">${member.uBirth}</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-3">
					<label id="label15">가입일시</label>
				</div>
				<div class="col-9">
					<label id="label16">${member.uDate}</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-3">
					<label id="label17">맞춘횟수</label>
				</div>
				<div class="col-9">
					<label id="label18">${member.uWin}</label>
				</div>
			</div>
			<div class="row">
				<div class="col-3">
					<label id="label19">틀린횟수</label>
				</div>
				<div class="col-9">
					<label id="label20">${member.uLose}</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-12">
					<div style="text-align: center">
						<a href="updateMember?uId=${member.uId }">
						<button id="updateBtn" class="btn btn-primary btn-lg">회원수정</button></a>
						<a href="deleteMember?uId=${member.uId }"> 
						<input id="deleteBtn" class="updateBtn btn btn-primary btn-lg" type="button" value="회원탈퇴"></a>
						<a href="getMemberList"><input id="cancelBtn" type="button" class="updateBtn btn btn-primary btn-lg" value="&nbsp;취 소&nbsp;"></a>
					</div>
				</div>
			</div>
			
		</div>
		</div>
		
			<!--      <tr >
            <td colspan="5" > 
    <!--     <a href="updateMemberform?uId=${member.uId }"><input type="button" value="수정"></a> 
      	   		<button class="form-control btn btn-primary updatebtn">수정</button> 
                <a href="deleteMember?uId=${member.uId }"><input type="button" class="form-control btn btn-primary deletebtn" value="삭제"></a>
                <a href="getMemberList"><input type="button" class="form-control btn btn-primary cancelbtn" value="취소"></a>
            </td>
            
        </tr> -->

	
		
	</form>

</body>
</html>