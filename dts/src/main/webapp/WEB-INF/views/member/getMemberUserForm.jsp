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
//	var dbPwCheck = 0;
	var pwdCheck = 0;
	  //재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
    function checkPwd() {
	  	var dbPw = $('#uPw').val();
	  	var origInputed2 = $('#chkPw').val();
        var inputPw1 = $('#newPw1').val();
        var inputPw2 = $('#newPw2').val();
        var inputPhone1 = $('#phone2').val();
        var inputPhone2 = $('#phone3').val();
        var inputAddress1 = $('#roadAddress').val();		// 주소와 상세주소 합치는 과정
        var inputAddress2 = $('#detailAddress').val();
 		
        var addressSum = inputAddress1 + "^" + inputAddress2
        document.all.uAddress.value = addressSum;
        
        // 휴대폰번호 하이픈 합치는 과정
		var temp = $('#phone1').val() + "-" + inputPhone1 + "-" + inputPhone2;		
		document.all.uPhone.value = temp;
		
		if(inputAddress1 == "" || inputAddress2 == "" || dbPw == "" || origInputed2 == "" ||
				 inputPhone1.length < 3 || inputPhone2.length < 4){		// 이름, 주소, 휴대폰번호,  입력삭제 시 가입버튼 비활성화, 휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능
			$(".updatebtn").prop("disabled", true);													
            $(".updatebtn").css("background-color", "#aaaaaa");
		}
/* 		if( dbPw == origInputed2){							// 해당 유저 기존 비밀번호와 같은 경우
//			$("#chkPw").css("background-color", "#B0F6AC");
			dbPwCheck = 1;
    
        } else if(dbPw != origInputed2){					// 새 비밀번호와 새 비밀번호 확인과 다를 경우
//        	$("#chkPw").css("background-color", "#FFCECE");
        	dbPwCheck = 0;
        } else if(origInputed2==""){								// 기존 비밀번호 텍스트박스가 null일 경우
//        	$("#chkPw").css("background-color", "#FFCECE");
        	dbPwCheck = 0;
        } */
        if( inputPw2=="" || inputPw1==""){ 	//
            $(".updatebtn").prop("disabled", true);
            $(".updatebtn").css("background-color", "#aaaaaa");
            $("#newPw1").css("background-color", "#FFCECE");
            $("#newPw2").css("background-color", "#FFCECE");
            document.all.spanPwX.style.display="none";
            document.all.spanPwO.style.display="none";
        } 
        else if ( inputPw1 == inputPw2) {		// 비밀번호 input색깔 초록색으로
            $("#newPw1").css("background-color", "#B0F6AC");
            $("#newPw2").css("background-color", "#B0F6AC");
            pwdCheck = 1;
            document.all.spanPwX.style.display="none";
            document.all.spanPwO.style.display="";
            if(origInputed2 != "" && pwdCheck == 1 
            		&& inputAddress1 != "" && inputAddress2 != ""  
            		&&  inputPhone1.length > 2 && inputPhone2.length == 4) {	// 비밀번호(이름, 주소, 휴대폰번호, 생년월일) 맞으면 가입버튼 활성화
	           $(".updatebtn").prop("disabled", false);								// 휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능
	           $(".updatebtn").css("background-color", "#4CAF50");
	
            }
        } else if (inputPw1 != inputPw2 ) {		// 비밀번호 틀리면 가입버튼 비활성화 및 비밀번호 input색깔 붉은색으로
            pwdCheck = 0;
            $(".updatebtn").prop("disabled", true);
            $(".updatebtn").css("background-color", "#aaaaaa");
            $("#newPw1").css("background-color", "#FFCECE");
            $("#newPw2").css("background-color", "#FFCECE");
            document.all.spanPwX.style.display="";
            document.all.spanPwO.style.display="none";
        }
  /*       console.log(dbPw+"디비패스워드");
        console.log(origInputed2+"입력한 기존 패스워드");
        console.log($('#chkPw').val()+"텍스트 박스 입력한 기존 패스워드"); */
    }
	


	
	$(function (){		// 화면 시작하자마자 주소부분 '^' 지워서 합치기 과정
		
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
		
		$(".updatebtn").click(function(){
			if( $('#uPw').val() != $('#chkPw').val()){
				alert("기존 비밀번호를 확인해주세요.");
				document.all.chkPw.focus();
				return false;
			}else{
		        document.all.uPw.value = $('#newPw1').val();	 
	   			alert("수정 완료 되었습니다.");
			}
    	});

	});
</script>




</head>
<body>
	<h3>단일유저 정보 수정폼</h3>
	<form action="updateMemberUser" method="post">
		<input type="hidden" name="uId" value="${member.uId }" /> 
		<input type="hidden" id="uAddress" name="uAddress" value="${member.uAddress }">
		<input type="hidden" id="uPhone" name="uPhone" value="${member.uPhone }">
		<input type="hidden" name="uPw" id="uPw" value="${member.uPw }" />
		
		<table style="width: 50%" class="table">
			<tr>
				<td>아이디</td>
				<td>${member.uId }</td>
			</tr>
			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password" class="form-control pass1" id="chkPw" oninput="checkPwd()" autofocus></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td>
					<input type="password" class="form-control pass2" id="newPw1" oninput="checkPwd()"><br>&nbsp;
					<span id="spanPwX" style="display: none">비밀번호가 일치하지 않습니다.</span>
              		<span id="spanPwO" style="display: none">비밀번호가 일치합니다.</span>
				</td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" class="form-control pass3" id="newPw2" oninput="checkPwd()"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.uName }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="button" onclick="sample4_execDaumPostcode()"value="우편번호 찾기"><br>
					<input type="text" class="form-control address" id="roadAddress" placeholder="도로명주소" value="${member.uAddress }" oninput="checkPwd()"  readonly> 
					<input type="text" class="form-control address" id="detailAddress"	placeholder="상세주소 입력창" oninput="checkPwd()" > 
					 
					<span id="guide" style="color: #999"></span>
				</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td><select id="phone1" name="phone1" class="form-control phone" oninput="checkPwd()">
					   <option value="010">010</option>
                       <option value="011">011</option>
                       <option value="012">012</option>
                       <option value="016">016</option>
                       <option value="017">017</option>
                       <option value="018">018</option>
                       <option value="019">019</option> 
				</select>  <input type="text" name="phone2" id="phone2" class="form-control phone" maxlength=4 oninput="checkPwd()">
					 <input type="text" name="phone3"  id="phone3" class="form-control phone" maxlength=4 oninput="checkPwd()">
					 
				</td>
			</tr>


			<tr>
				<td>생년월일</td>
				<td>${member.uBirth}</td>
			</tr>

			<tr>
				<td colspan="5">
					<!--     <a href="updateMemberform?uId=${member.uId }"><input type="button" value="수정"></a> -->
					<button class="form-control btn btn-primary updatebtn" disabled="disabled">수정</button> 
					<a href="getMemberUser"><input type="button" class="form-control btn btn-primary cancelbtn" value="취소"></a>
				</td>

			</tr>
		</table>
	</form>
</body>
</html>