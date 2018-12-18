<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getUser.jsp</title>

 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
 <script>
     daum.postcode.load(function(){
   /*  new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
             // 예제를 참고하여 다양한 활용법을 확인해 보세요.
         }
     }).open();  팝업창 차단*/ 
     });
 
     function sample4_execDaumPostcode() {
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
             document.getElementById('roadAddress').value = fullRoadAddr;
 
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
 	function sum(){
 		var inputAddress1 = $('#roadAddress').val();		// 주소와 상세주소 합치는 과정
        var inputAddress2 = $('#detailAddres').val();
 		
        var addressSum = inputAddress1 + "^" + inputAddress2
        document.all.uAddress.value = addressSum;
        
       	// 휴대폰번호 하이픈 합치는 과정
    	
		var tempPhone = $('#phone1').val() + "-" + $('#phone2').val() + "-" + $('#phone3').val();		
		document.all.uPhone.value = tempPhone;
		
		var emailSum = $('#chkEmail1').val() + "@" + $('#chkEmail2').val();
        document.all.uEmail.value = emailSum;
        
        
 	}
 	$(function(){
 		
 		var addressSplit=$('#uAddress').val().split('^');			// 주소 '^'만 제외하고 넣기
 		document.all.roadAddress.value = addressSplit[0];
 		if(addressSplit[1]!=null){
 			document.all.detailAddres.value = addressSplit[1];
 		} 
 		
 		var phoneSplit=$('#uPhone').val().split('-');			// 주소 '-'(하이픈)만 제외하고 넣기
 		document.all.phone2.value = phoneSplit[1];
 		document.all.phone3.value = phoneSplit[2];
 		
 		var emailSplit=$('#uEmail').val().split('@');			// 이메일 '@'만 제외하고 넣기
 		document.all.chkEmail1.value = emailSplit[0];
 		document.all.chkEmail2.value = emailSplit[1];
 		
 	});
     
 	
    function onlyNumber(event){		
   	    event = event || window.event;
   	    var keyID = (event.which) ? event.which : event.keyCode;
   	    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 ) 
   	        return;
   	    else
   	        return false;
   	}
   	 
   	function removeChar(event) {
   	    event = event || window.event;
   	    var keyID = (event.which) ? event.which : event.keyCode;
   	    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
   	        return;
   	    else
   	        event.target.value = event.target.value.replace(/[^0-9]/g, "");
   	}
     
 </script>




</head>
<body>
<h3>관리자가 단일유저 정보보기</h3>
 	<form action="updateMember" method="post">
 	<input type="hidden" name="uId" value="${member.uId }" /> 
 	<table style="width: 100%" class="table">
        <tr>            
            <td>아이디</td>
            <td>${member.uId }</td>
            <td colspan="2"><div style="visibility: hidden">빈공간입니당.빈공간입니당.빈공간입니당.빈공간입니당.</div></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="uPw" id="uPw" class="form-control pass" value="${member.uPw }" ></td>
        </tr>
        <tr>
            <td>이름</td>
            <td>${member.uName }</td>
        </tr>
        <tr>
            <td>주소</td>
            <td>
           	   <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text" class="form-control address" id="roadAddress" placeholder="도로명주소" oninput="sum()" readonly>
               <input type="text" class="form-control address" id="detailAddres" placeholder="상세주소 입력창" oninput="sum()">
               <input type="hidden" id="uAddress" name="uAddress" value="${member.uAddress }">  
               <span id="guide" style="color:#999"></span>

            </td>
        </tr>
        <tr>
            <td>휴대폰번호</td>
            <td>
                <select name="phone1" id="phone1" class="form-control phone" oninput="sum()">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="012">012</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>                         
                </select>
                
                <input type="text" name="phone2" id="phone2" class="form-control phone" oninput="sum()" maxlength=4 onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'> 
                <input type="text" name="phone3" id="phone3" class="form-control phone" oninput="sum()" maxlength=4 onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
                <input type="hidden" name="uPhone" id="uPhone" value="${member.uPhone }">
            </td>
        </tr>
        <tr>
			<td>E-Mail</td>
			<td>
				<input type="text" name="uEmail" id="uEmail" value="${member.uEmail }" >
				<input type="text" name="uEmail1" id="chkEmail1" placeholder="이메일 아이디" class="form-control email" oninput="sum()" >
				<input type="text" name="uEmail2" id="chkEmail2" placeholder="해당 홈페이지" class="form-control email" oninput="sum()" >
			</td>
		</tr>
		<tr>
			<td>마일리지</td>
			<td>${member.uMileage}</td>
		</tr>
		<tr>
			<td>권한</td>
			<td>${member.uGrant}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${member.uBirth}</td>
		</tr>
		<tr>
			<td>가입일시</td>
			<td>${member.uDate}</td>
		</tr>
		<tr>
			<td>맞춘횟수</td>
			<td>${member.uWin}</td>
		</tr>
		<tr>
			<td>틀린횟수</td>
			<td>${member.uLose}</td>
		</tr>
  <!--      <tr >
            <td colspan="5" > 
    <!--     <a href="updateMemberform?uId=${member.uId }"><input type="button" value="수정"></a> 
      	   		<button class="form-control btn btn-primary updatebtn">수정</button> 
                <a href="deleteMember?uId=${member.uId }"><input type="button" class="form-control btn btn-primary deletebtn" value="삭제"></a>
                <a href="getMemberList"><input type="button" class="form-control btn btn-primary cancelbtn" value="취소"></a>
            </td>
            
        </tr> --> 
    </table>
    
    <table style="width: 30%">
		<tr>
			<td>
				<a href="updateMember?uId=${member.uId }">
				<button	class="form-control btn btn-primary joinbtn" >회원수정</button></a>
			</td>
			<td>
				<a href="deleteMember?uId=${member.uId }">
				<input type="button" value="회원탈퇴"	class="form-control btn btn-primary deletebtn" ></button>
				</a>
			</td>
			<td>
				<a href="getMemberList"><input type="button" class="form-control btn btn-primary cancelbtn" value="&nbsp;취 소&nbsp;"></a>
			</td>
		</tr>
	</table>
 	</form>
 	
</body>
</html>