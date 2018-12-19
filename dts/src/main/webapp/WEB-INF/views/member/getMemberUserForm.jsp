<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMemberUserForm.jsp</title>

<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
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

	/////////////////////////////////
	
	var pwdCheck = 0;		// 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	
    function checkPwd() {	//재입력 비밀번호 체크 및 이름, 주소, 휴대폰번호, 생년월일, E-Mail의 값 확인 후 가입버튼 비활성화 또는 맞지않음을 알림	
	  	var dbPw = $('#uPw').val();							// 해당 유저 비밀번호 값
	  	var origInputed2 = $('#chkPw').val();				// 비밀번호 텍스트박스 값
        var inputPw1 = $('#newPw1').val();					// 새 비밀번호 텍스트박스 값
        var inputPw2 = $('#newPw2').val();					// 새 비밀번호 확인 텍스트박스 값
        var inputPhone1 = $('#phone2').val();				// 휴대폰번호 첫 번째 텍스트박스 값
        var inputPhone2 = $('#phone3').val();				// 휴대폰번호 두 번째 텍스트박스 값
        var inputAddress1 = $('#roadAddress').val();		// 주소 첫 번째 텍스트박스 값
        var inputAddress2 = $('#detailAddress').val();		// 주소 두 번째 텍스트박스 값
        var inputEmail1 = $('#chkEmail1').val();			// E-Mail 첫 번째 텍스트박스 값
        var inputEmail2 = $('#chkEmail2').val();			// E-Mail 두 번째 텍스트박스 값
        
     	// E-Mail @를 합치는 과정
        document.all.uEmail.value = inputEmail1 + "@" + inputEmail2;
        
     	// 주소와 상세주소 합치는 과정(주소와 상세주소를 구분하기 위해 임의의 특수문자'^' 추가) 
        document.all.uAddress.value = inputAddress1 + "^" + inputAddress2;
        
        // 휴대폰번호 하이픈 합치는 과정
		document.all.uPhone.value = $('#phone1').val() + "-" + inputPhone1 + "-" + inputPhone2;
		
		if(inputAddress1 == "" || inputAddress2 == "" || dbPw == "" || 
				origInputed2 == "" || inputEmail1 == "" || inputEmail2 == "" ||
				 inputPhone1.length < 3 || inputPhone2.length < 4){		// 이름, 주소, 휴대폰번호,  입력삭제 시 가입버튼 비활성화, 휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능
			$(".updateBtn").prop("disabled", true);						// 수정 버튼 비활성화						
            $(".updateBtn").css("background-color", "#aaaaaa");			// 수정 버튼 회색
		}

        if( inputPw2=="" || inputPw1==""){ 								// 비밀번호 값이 없거나 비밀번호 확인 값이 없을 경우 
            $(".updateBtn").prop("disabled", true);						// 수정 버튼 비활성화
            $(".updateBtn").css("background-color", "#aaaaaa");			// 수정 버튼 회색
            $("#newPw1").css("background-color", "#FFCECE");			// 비밀번호 텍스트박스 빨강색
            $("#newPw2").css("background-color", "#FFCECE");			// 비밀번호 확인 텍스트박스 빨강색
            document.all.spanPwX.style.display="none";					// 비밀번호가 틀렸다 span 비활성화
            document.all.spanPwO.style.display="none";					// 비밀번호가 맞았다 span 비활성화
        } else if ( inputPw1 == inputPw2) {								// 비밀번호 input색깔 초록색으로
            $("#newPw1").css("background-color", "#B0F6AC");			// 비밀번호 텍스트박스 초록색
            $("#newPw2").css("background-color", "#B0F6AC");			// 비밀번호 확인 텍스트박스 초록색
            pwdCheck = 1;
            document.all.spanPwX.style.display="none";					// 비밀번호가 틀렸다 span 비활성화
            document.all.spanPwO.style.display="";						// 비밀번호가 맞았다 span 활성화
            
            if(origInputed2 != "" && pwdCheck == 1 
            		&& inputAddress1 != "" && inputAddress2 != "" 
            		&& inputEmail1 != "" && inputEmail2 != ""   
            		&&  inputPhone1.length > 2 && inputPhone2.length == 4) {	// 아이디 중복, 비밀번호확인을 하고 이름, 주소, 휴대폰번호, 생년월일, E-mail의 각 값들이 모두 Null일 경우 (휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능)
	           $(".updateBtn").prop("disabled", false);							// 가입버튼 활성화  
	           $(".updateBtn").css("background-color", "#4CAF50");				// 가입버튼 초록색 
	
            }
        } else if (inputPw1 != inputPw2 ) {								// 비밀번호 틀릴경우
            pwdCheck = 0;
            $(".updateBtn").prop("disabled", true);						// 가입버튼 비활성화
            $(".updateBtn").css("background-color", "#aaaaaa");			// 가입버튼 회색
            $("#newPw1").css("background-color", "#FFCECE");			// 비밀번호 텍스트박스 빨강색
            $("#newPw2").css("background-color", "#FFCECE");			// 비밀번호 확인 텍스트박스 빨강색
            document.all.spanPwX.style.display="";						// 비밀번호가 틀렸다 span 활성화
            document.all.spanPwO.style.display="none";					// 비밀번호가 맞았다 span 비활성화
        }
    }
	


	
	$(function (){		
		
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
		
		
		
		$(".updateBtn").click(function(){
			if( $('#uPw').val() != $('#chkPw').val()){
				alert("기존 비밀번호를 확인해주세요.");
				document.all.chkPw.focus();
				document.all.chkPw.value = "";
				return false;
			}else{
		        document.all.uPw.value = $('#newPw1').val();	 
	   			alert("수정 완료 되었습니다.");
			}
    	});

	});
</script>


<style>
	body {								/* 글자 폰트 */
		font-family: Arial, Helvetica, sans-serif;
		font-size: 16px;
	}

	.updateBtn, .cancelBtn{						/* delete 버튼 */
		background-image: linear-gradient(to right, #A8A7A7 , #363636);
		color: white;					/* 글자색 */
		padding: 8px 20px;				/* 버튼 크기 위아래 8px, 좌우 20px */
		margin: 20px 0;					/* 상하 여백 20px, 좌우 여백 0px */
		cursor: pointer;				/* 마우스 hover 시 마우시 포인터 손가락으로 변경 */
		width: 20%;						/* 버튼 넓이 7% */
	}
	.updateBtn:hover, .cancelBtn:hover {					/* delete버튼 마우스 hover 시 */
		opacity: 0.8;					
		background-color: #3e8e41;		/* 배경색깔 기존 색보다 좀 더 연하게 */
		box-shadow: 3px 2px #666;		/* 아래로 그림자 생성 오른쪽 3px, 아래 2px */
	  	transform: translateY(2px);		/* 그림자 길이 2px */
	}
	 
	table {								/* th, td에 여백 15px, 글자 왼쪽정렬 */
		border: 1px solid #f2f2f2; 
		border-collapse: collapse;
	/*	width: 80%;					 넓이 100%  */
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
	 	border: 1px solid #7fbfff; 
	 	padding: 8px 20px;
	 }
	#phone1{
	 	size: 40px;
	 	border: 1px solid #7fbfff; 
	 	padding: 10px 20px;
	 }
			
		
</style>







</head>
<body>
	<h3>단일유저 정보 수정폼</h3>
	<form action="updateMemberUser" method="post">
		<input type="hidden" name="uId" value="${member.uId }" /> 
		<input type="hidden" id="uAddress" name="uAddress" value="${member.uAddress }">
		<input type="hidden" id="uPhone" name="uPhone" value="${member.uPhone }">
		<input type="hidden" name="uPw" id="uPw" value="${member.uPw }" />
		
		<table style="width: 50%" >
			<tr>
				<td>아이디</td>
				<td>${member.uId }</td>
			</tr>
			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password" id="chkPw" oninput="checkPwd()" autofocus></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td>
					<input type="password" id="newPw1" oninput="checkPwd()"><br>&nbsp;
					<span id="spanPwX" style="display: none">비밀번호가 일치하지 않습니다.</span>
              		<span id="spanPwO" style="display: none">비밀번호가 일치합니다.</span>
				</td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" id="newPw2" oninput="checkPwd()"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.uName }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="button" onclick="sample4_execDaumPostcode()"value="우편번호 찾기"><br>
					<input type="text" id="roadAddress" placeholder="도로명주소" value="${member.uAddress }" oninput="checkPwd()"  readonly> 
					<input type="text" id="detailAddress" placeholder="상세주소 입력창" oninput="checkPwd()" > 
					 
					<span id="guide" style="color: #999"></span>
				</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td><select id="phone1" name="phone1" oninput="checkPwd()">
					   <option value="010">010</option>
                       <option value="011">011</option>
                       <option value="012">012</option>
                       <option value="016">016</option>
                       <option value="017">017</option>
                       <option value="018">018</option>
                       <option value="019">019</option> 
				</select>  <input type="text" name="phone2" id="phone2" maxlength=4 oninput="checkPwd()">
					 <input type="text" name="phone3"  id="phone3" maxlength=4 oninput="checkPwd()">
					 
				</td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td>
					<input type="hidden" name="uEmail" id="uEmail" value="${member.uEmail }">
					<input type="text" name="uEmail1" id="chkEmail1" oninput="checkPwd()" >
					<input type="text" name="uEmail2" id="chkEmail2" oninput="checkPwd()">
				</td>
			</tr>
		</table>
		<button class="updateBtn" disabled="disabled">수정</button> 
		<a href="getMemberUser"><input type="button" class="cancelBtn" value="취소"></a>
	</form>
</body>
</html>