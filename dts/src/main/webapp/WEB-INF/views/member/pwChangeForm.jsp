<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwChangeForm.jsp</title>
</head>
<script>
var pwdCheck = 0;		// 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정

function checkPwd() {	//재입력 비밀번호 체크 및 이름, 주소, 휴대폰번호, 생년월일, E-Mail의 값 확인 후 가입버튼 비활성화 또는 맞지않음을 알림	
  	var dbPw = $('#uPw').val();							// 해당 유저 비밀번호 값
  	var origInputed2 = $('#chkPw').val();				// 비밀번호 텍스트박스 값
    var inputPw1 = $('#newPw1').val();					// 새 비밀번호 텍스트박스 값
    var inputPw2 = $('#newPw2').val();					// 새 비밀번호 확인 텍스트박스 값
	
	if(dbPw == "" || origInputed2 == ""){		// 이름, 주소, 휴대폰번호,  입력삭제 시 가입버튼 비활성화, 휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능
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
        
        if(origInputed2 != "" && pwdCheck == 1 ) {	// 아이디 중복, 비밀번호확인을 하고 이름, 주소, 휴대폰번호, 생년월일, E-mail의 각 값들이 모두 Null일 경우 (휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능)
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
<body>
	<h3>유저 비밀번호 수정</h3>
	<form action="updateMemberUser" method="post">
		<input type="hidden" name="uId" value="${member.uId }" /> 
		<input type="hidden" name="uPw" id="uPw" value="${member.uPw }" />
		<table style="width: 50%" >
			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password" id="chkPw" oninput="checkPwd()" autofocus></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td>
					<input type="password" id="newPw1" oninput="checkPwd()"><br>
					<span id="spanPwX" style="display: none">비밀번호가 일치하지 않습니다.</span>
            		<span id="spanPwO" style="display: none">비밀번호가 일치합니다.</span>
				</td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" id="newPw2" oninput="checkPwd()"></td>
			</tr>
		</table>
		<button class="updateBtn" disabled="disabled">수정</button> 
		<a href="getMemberUser"><input type="button" class="cancelBtn" value="취소"></a>
	</form>
</body>
</html>