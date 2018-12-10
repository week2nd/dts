<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertUser.jsp</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<!-- 
function checkValue(){
    var dmi = document.MuserUpdate;
    
    
    if(dmi.mPw.value==""){
        alert("비밀번호를 입력하세요.");
        dmi.mPw.focus();
        return false;
    }else if(dmi.mPw.value.length<4){
        alert("비밀번호를 4글자 이상 입력하세요.");
        dmi.mPw.focus();	
        return false;
    }
    if(dmi.mPwchk.value==""){
        alert("비밀번호 확인을 입력하세요.");
        dmi.mPwchk.focus();
        return false;
    }       
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(dmi.mPw.value != dmi.mPwchk.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        dmi.mPw.focus();
        return false;
    }
    if(dmi.mName.value==""){
        alert("이름을 입력하세요");
        dmi.mName.focus();
        return false;
    }else if(dmi.mName.value.length<2){
        alert("이름를 2글자 이상 입력하세요.");
        dmi.mName.focus();	
        return false;
    }
    if(dmi.mPhone.value==""){
        alert("휴대폰번호를 입력하세요");
        dmi.mPhone.focus();
        return false;
    }else if(dmi.mPhone.value.length<12){
        alert("휴대폰번호를 끝까지 입력하세요.");
        dmi.mPhone.focus();	
        return false;
    }
    
    
}
 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
  <style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }

</style>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script> <!-- 다음우편번호 스크립트 -->
 <script>
     daum.postcode.load(function(){					// 다음 우편번호 함수
   /*  new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
             // 예제를 참고하여 다양한 활용법을 확인해 보세요.
         }
     }).open();  팝업창 차단*/ 
     });
 
     function sample4_execDaumPostcode() {			// 다음 우편번호 함수
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
             // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }
             // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
             if(fullRoadAddr !== ''){
                 fullRoadAddr += extraRoadAddr;
             }
 
             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('sample4_roadAddress').value = fullRoadAddr;
             document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
 
             // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
             if(data.autoRoadAddress) {
                 //예상되는 도로명 주소에 조합형 주소를 추가한다.
                 var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                 document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
 
             } else if(data.autoJibunAddress) {
                 var expJibunAddr = data.autoJibunAddress;
                 document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
 
             } else {
                 document.getElementById('guide').innerHTML = '';
             }
         }
     }).open();
 }
     
     
     
     
     /////////////////////////////////////////////////////////////
     
      //아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var nickCheck = 0;
    var pwdCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
   
    function checkId() {
        var inputed = $('.id').val();
        if(inputed ==''){
        	document.all.labelidx.style.display="none";
            document.all.labelido.style.display="none";
        	return
        }
        console.log(inputed);
        $.ajax({
            data : {
                uId : inputed
            },
            url : "checkId",
            success : function(data) {
                if(inputed=="" && data==false) {			// 아이디 값을 지웠을 경우
                    $(".joinbtn").prop("disabled", true);
                    $(".joinbtn").css("background-color", "#aaaaaa");
                    $("#chkid").css("background-color", "#FFCECE");
                    idCheck = 0;
                    
                } else if (data == false) {					// 사용가능한 아이디로 입력을 바꿨을때
                    $("#chkid").css("background-color", "#B0F6AC");
                    document.all.labelido.style.display="";
                    document.all.labelidx.style.display="none";
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {
                        $(".joinbtn").prop("disabled", false);
                        $(".joinbtn").css("background-color", "#4CAF50");
                    } 
                } else if (data == true) {					// 중복아이디를 입력했을 경우
                    $(".joinbtn").prop("disabled", true);
                    $(".joinbtn").css("background-color", "#aaaaaa");
                    $("#chkid").css("background-color", "#FFCECE");
                    idCheck = 0;
                    document.all.labelido.style.display="none";
                    document.all.labelidx.style.display="";
                } 
            }
        });
    }
  //재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
    function checkPwd() {
        var inputed = $('#chkpw1').val();
        var reinputed = $('#chkpw2').val();
        console.log(inputed);
        console.log(reinputed);
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){	//
     //       $(".joinbtn").prop("disabled", true);
     //       $(".joinbtn").css("background-color", "#aaaaaa");
            $("#chkpw1").css("background-color", "#FFCECE");
            $("#chkpw2").css("background-color", "#FFCECE");
        }
        else if (inputed == reinputed) {		// 비밀번호 input색깔 초록색으로
            $("#chkpw1").css("background-color", "#B0F6AC");
            $("#chkpw2").css("background-color", "#B0F6AC");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1) {	// 비밀번호 맞으면 가입버튼 활성화
	           $(".joinbtn").prop("disabled", false);
	           $(".joinbtn").css("background-color", "#4CAF50");
            }
        } else if (inputed != reinputed) {		// 비밀번호 틀리면 가입버튼 비활성화 및 비밀번호 input색깔 붉은색으로
            pwdCheck = 0;
            $(".joinbtn").prop("disabled", true);
            $(".joinbtn").css("background-color", "#aaaaaa");
            $("#chkpw1").css("background-color", "#FFCECE");
            $("#chkpw2").css("background-color", "#FFCECE");
            
        }
    }
    //닉네임과 이메일 입력하지 않았을 경우 가입버튼 비활성화
  /*  function checkNick() {
        var nickname = $("#nickname").val();
        console.log(nickname);
        $.ajax({
            data : {
                nickName : nickname
            },
            url : "checkNickName.do",
            success : function(data) {
                if(nickname=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#nickname").css("background-color", "#FFCECE");
                    nickCheck = 0;
                } else if (data == '0') {
                    $("#nickname").css("background-color", "#B0F6AC");
                    nickCheck = 1;
                    if(nickCheck ==1 && pwdCheck == 1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                    } 
                } else if (data == '1') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#nickname").css("background-color", "#FFCECE");
                    nickCheck = 0;
                } 
            }
        });
    }*/
    /*캔슬버튼 눌렀을 눌렀을시 인풋박스 클리어
    $(".cancelbtn").click(function(){
            $(".id").val(null);
            $(".pass").val('');
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
    });*/
    
 
     
     
     
     
 
     
     
     
     
 
 </script>


</head>
<body>
	<h3>회원가입</h3>
	<form action="insertMember" method="post">
	
		<table style="width: 70%" >
			<tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
	        <tr>            
	            <td>아이디</td>
	            <td><input type="text" class="form-control id" name="uId" id="chkid" placeholder="아이디" value="${member.uId }" oninput="checkId()" ></td>
	            <td><span id="labelido" style="display: none">사용가능한 아이디 입니다.</span><span id="labelidx" style="display: none">중복 아이디 입니다.</span></td>
	        </tr>
	        <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
	        <tr>
	            <td>비밀번호</td>
	            <td><input type="password" class="form-control pass" name="uPw" id="chkpw1" placeholder="비밀번호" value="${member.uPw }" oninput="checkPwd()"></td>
	        </tr>
	        <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>        
	        <tr>
	            <td>비밀번호 확인</td>
	            <td><input type="password" class="form-control pass" name="member" id="chkpw2" placeholder="비밀번호 확인" value="${member.uPw }" oninput="checkPwd()"></td>
	        </tr>
   	        <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
	        <tr>
	            <td>이름</td>
	            <td><input type="text" class="form-control name"  name="uName" placeholder="이름" value="${member.uName }"></td>
	            <td colspan="2"><div style="visibility: hidden">빈공간입니당.빈공간입니당.빈공간입니당.빈공간입니당.</div></td>
	            
	        </tr>
	        <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
	        <tr>
	            <td>주소</td>       
	            <td>
	            	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	                <input type="text" class="form-control address" id="sample4_postcode" placeholder="우편번호">
	                <input type="text" class="form-control address" id="sample4_roadAddress" name="uAddress" placeholder="도로명주소" value="${member.uAddress }">
	                <input type="text" class="form-control address" id="sample4_jibunAddress" placeholder="지번주소">
	                <span id="guide" style="color:#999"></span>
	            </td>
	        </tr>
	        <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
	        <tr>
	            <td>휴대폰번호</td>
	            <td>
	             <!--   <select name="phone1">
	                    <option value="zero">010</option>
	                    <option value="one">011</option>
	                    <option value="two">012</option>
	                    <option value="three">013</option>
	                    <option value="four">014</option>
	                    <option value="five">015</option>                        
	                </select>
	                -
	                <input type="text" name="member" value="${member.uPhone }"> -   -->
	                <input type="text" class="form-control phone" name="uPhone" placeholder="휴대폰번호" id="${member.uPhone }">
	            </td>
	        </tr>
	        <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
	        <tr>
	            <td>생년월일</td>
	            <td>
	            	<input type="date" class="form-control date" name="uBirth" value="${member.uBirth }">
	            </td>
	        </tr>        
	        <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
	        <tr>
	            <td colspan="2"> 
	                <button class="form-control btn btn-primary joinbtn" disabled="disabled">가입</button> 
	                
	            </td>
	            
	        </tr>
	    </table>
    </form>
    
</body>
</html>