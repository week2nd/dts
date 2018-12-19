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
 		// 주소와 상세주소 합치는 과정       		
        document.all.uAddress.value = $('#roadAddress').val() + "^" + $('#detailAddres').val();
        
       	// 휴대폰번호 하이픈 합치는 과정
		document.all.uPhone.value = $('#phone1').val() + "-" + $('#phone2').val() + "-" + $('#phone3').val();
		
		// E-Mail @를 합치는 과정
        document.all.uEmail.value = $('#chkEmail1').val() + "@" + $('#chkEmail2').val();
 	}
 	$(function(){
 		
		var addressSplit = $('#uAddress').val().split('^');		// 주소 '^'를 기준으로 자르기
 		document.all.roadAddress.value = addressSplit[0];		// '^' 기준으로 첫 번째 부분을 지번주소 텍스트박스에 입력
		document.all.detailAddres.value = addressSplit[1];		// '^' 기준으로 두 번째 부분을 상세주소 텍스트박스에 입력
 		
 		var phoneSplit = $('#uPhone').val().split('-');			// 주소 '-'(하이픈)을 기준으로 자르기
 		document.all.phone2.value = phoneSplit[1];				// '-' 기준으로 두 번째 부분을 휴대폰번호 첫 번째 텍스트박스에 입력 
 		document.all.phone3.value = phoneSplit[2];				// '-' 기준으로 세 번째 부분을 휴대폰번호 두 번째 텍스트박스에 입력
 		
 		var emailSplit = $('#uEmail').val().split('@');			// 이메일 '@'를 기준으로 자르기
 		document.all.chkEmail1.value = emailSplit[0];			// '-' 기준으로 첫 번째 부분을 E-Mail 첫 번째 텍스트박스에 입력
 		document.all.chkEmail2.value = emailSplit[1];			// '-' 기준으로 두 번째 부분을 E-Mail 두 번째 텍스트박스에 입력
 		
 	});
     
 	// 휴대폰번호 숫자만 입력가능하게
    function onlyNumber(event){		
   	    event = event || window.event;
   	    var keyID = (event.which) ? event.which : event.keyCode;
   	    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 ) 
   	        return;
   	    else
   	        return false;
   	}
	// 휴대폰번호 숫자가 아닐 시 삭제
   	function removeChar(event) {
   	    event = event || window.event;
   	    var keyID = (event.which) ? event.which : event.keyCode;
   	    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
   	        return;
   	    else
   	        event.target.value = event.target.value.replace(/[^0-9]/g, "");
   	}
   		
   	$(document).ready(function(){	// 영어, 숫자만 입력되게 처리
  	  //한글입력 안되게 처리
	  	$("input[name=uEmail1]").keyup(function(event){ 				// input name이 uEmail1에 키 입력시
	  		if (!(event.keyCode >=37 && event.keyCode<=40)) {
	  			var inputVal = $(this).val();
	  			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
	  		}	
	  	});
	  	$("input[name=uEmail2]").keyup(function(event){ 				// input name이 uEmail2에 키 입력시
	  		if (!(event.keyCode >=37 && event.keyCode<=40)) {
	  			var inputVal = $(this).val();
	  			$(this).val(inputVal.replace(/[^a-z0-9.]/gi,''));		// '.'도 입력할 수 있게 출력
	  		}	
	  	});
	});
     
 </script>



<style>
	body {								/* 글자 폰트 */
		font-family: Arial, Helvetica, sans-serif;
		font-size: 16px;
	}

	#updateBtn, #deleteBtn, #cancelBtn{						/* delete 버튼 */
		background-image: linear-gradient(to right, #A8A7A7 , #363636);
		color: white;					/* 글자색 */
		padding: 8px 20px;				/* 버튼 크기 위아래 8px, 좌우 20px */
		margin: 20px 0;					/* 상하 여백 20px, 좌우 여백 0px */
		cursor: pointer;				/* 마우스 hover 시 마우시 포인터 손가락으로 변경 */
		width: 20%;						/* 버튼 넓이 7% */
	}
	#updateBtn:hover ,#deleteBtn:hover, #cancelBtn:hover {					/* delete버튼 마우스 hover 시 */
		opacity: 0.8;					
		background-color: #3e8e41;		/* 배경색깔 기존 색보다 좀 더 연하게 */
		box-shadow: 3px 2px #666;		/* 아래로 그림자 생성 오른쪽 3px, 아래 2px */
	  	transform: translateY(2px);		/* 그림자 길이 2px */
	}
	 
	#tb {								/* th, td에 여백 15px, 글자 왼쪽정렬 */
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
	 	border: 1px solid #f2f2f2; 
	 	padding: 8px 20px;
	 }
	#phone1{
	 	size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 10px 20px;
	 }
			
		
</style>


</head>
<body>
<h3>관리자가 단일유저 정보보기</h3>
 	<form action="updateMember" method="post">
 	<input type="hidden" name="uId" value="${member.uId }" /> 
 	<table id="tb">
        <tr>            
            <td>아이디</td>
            <td>${member.uId }</td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="uPw" id="uPw"  value="${member.uPw }" ></td>
        </tr>
        <tr>
            <td>이름</td>
            <td>${member.uName }</td>
        </tr>
        <tr>
            <td>주소</td>
            <td>
           	   <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text"  id="roadAddress" placeholder="지번주소" oninput="sum()" readonly>
               <input type="text"  id="detailAddres" placeholder="상세주소 입력창" oninput="sum()">
               <input type="hidden" id="uAddress" name="uAddress" value="${member.uAddress }">  
               <span id="guide" style="color:#999"></span>

            </td>
        </tr>
        <tr>
            <td>휴대폰번호</td>
            <td>
                <select name="phone1" id="phone1" oninput="sum()">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="012">012</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>                         
                </select>
                
                &nbsp;-&nbsp;&nbsp;<input type="text" name="phone2" id="phone2" oninput="sum()" maxlength=4 onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>&nbsp;&nbsp;-&nbsp; 
                <input type="text" name="phone3" id="phone3" oninput="sum()" maxlength=4 onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
                <input type="hidden" name="uPhone" id="uPhone" value="${member.uPhone }">
            </td>
        </tr>
        <tr>
			<td>E-Mail</td>
			<td>
				<input type="hidden" name="uEmail" id="uEmail" value="${member.uEmail }" >
				<input type="text" name="uEmail1" id="chkEmail1" placeholder="이메일 아이디"  oninput="sum()" >&nbsp;@
				<input type="text" name="uEmail2" id="chkEmail2" placeholder="해당 홈페이지"  oninput="sum()" >
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
    
    <table style="width: 40%">
		<tr>
			<td>
				<a href="updateMember?uId=${member.uId }">
				<button id="updateBtn" >회원수정</button></a>
			
				<a href="deleteMember?uId=${member.uId }">
				<input id="deleteBtn" type="button" value="회원탈퇴"	></button>
				</a>
			
				<a href="getMemberList"><input id="cancelBtn" type="button" value="&nbsp;취 소&nbsp;"></a>
			</td>
		</tr>
	</table>
 	</form>
 	
</body>
</html>