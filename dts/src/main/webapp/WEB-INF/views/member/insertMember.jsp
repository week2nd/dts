<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertUser.jsp</title>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> <!-- ajax 스크립트 -->
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
     

     
     /////////////////////////////////////////////////////////////

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
     
    var idCheck = 0;		// 아이디가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정		
    var pwdCheck = 0;		// 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    
   
    function checkId() {	//아이디 체크하여 가입버튼 비활성화, 중복확인.
        var inputId = $('.id').val();		// 아이디 값 inputId에 담기
        var isid = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,20}$/;	// 영어, 숫자만 입력가능하게 만든 변수
        
        $.ajax({
            data : {
                uId : inputId
            },
            url : "checkId",
            success : function(data) {
            	
                if(inputId=="" && data==false || inputId.length<4) {		// 아이디 텍스트박스 값이 Null이면서 data에 없거나 아이디 값 길이가 4미만일 경우
                    $(".joinbtn").prop("disabled", true);					// 가입버튼 비활성화 
                    $(".joinbtn").css("background-color", "#aaaaaa");		// 가입버튼 회색
                    $("#chkId").css("background-color", "#FFCECE");			// 아이디 텍스트박스 빨강색
                    idCheck = 0;
                    document.all.spanIdO.style.display="none";				// 사용가능한 아이디 span 비활성화
                    document.all.spanIdX.style.display="none";				// 중복 아이디 span 비활성화
                } else if (data == false) {				// data에 값이 없을 경우
                    $("#chkId").css("background-color", "#B0F6AC");			// 아이디 텍스트박스 초록색
                    document.all.spanIdO.style.display="";					// 사용가능한 아이디 span 활성화
                    document.all.spanIdX.style.display="none";				// 중복 아이디 span 비활성화
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {	// 아이디체크와 비밀번호체크 모두 확인 됬을 경우
                      	$(".joinbtn").prop("disabled", false);				// 가입버튼 활성화
                       	$(".joinbtn").css("background-color", "#4CAF50");	// 가입버튼 초록색
                    } 
                } else if (data == true) {				// 중복아이디를 입력했을 경우
                    $(".joinbtn").prop("disabled", true);					
                    $(".joinbtn").css("background-color", "#aaaaaa");		// 가입버튼 회색
                    $("#chkId").css("background-color", "#FFCECE");			// 아이디 텍스트박스 빨강색
                    idCheck = 0;
                    document.all.spanIdO.style.display="none";				// 사용가능한 아이디 span 비활성화
                    document.all.spanIdX.style.display="";					// 중복 아이디 span 활성화
                } 
                if(inputId.length<4){					// 아이디 값 길이가 4미만일 경우
                    document.all.countId.style.display="";					// 네 글자 이상 아이디입력 필요 span 활성화
                    $("#chkId").css("background-color", "#FFCECE");			// 아이디 텍스트박스 빨강색
                 } else if(inputId.length>3){			// 아이디 값 길이가 4이상일 경우
                    document.all.countId.style.display="none";				// 네 글자 이상 아이디입력 필요 span 비활성화
                 }
            }
        });
    }
  
    function checkPwd() {		//재입력 비밀번호 체크 및 이름, 주소, 휴대폰번호, 생년월일, E-Mail의 값 확인 후 가입버튼 비활성화 또는 맞지않음을 알림 
    	/*     	var target = document.getElementById("selectEmail");
    	 if(target.options[target.selectedIndex].value == "direct" &&  document.all.chkEmail2.value != null){
   	    	document.all.chkEmail2.value = "";
      		document.all.chkEmail2.readOnly = false;
      		console.log($('#chkEmail2').val());
         } else if(target.options[target.selectedIndex].value == "blank" &&  document.all.chkEmail2.value != null ){
      		document.all.chkEmail2.readOnly = true;
//      		$("#chkEmail2").attr("disabled",true);
         } else if(	target.options[target.selectedIndex].text == "네이버" || 
        		 	target.options[target.selectedIndex].text == "구글" ||
        		 	target.options[target.selectedIndex].text == "다음" ||
        		 	target.options[target.selectedIndex].text == "네이트"){
      		document.all.chkEmail2.value = target.options[target.selectedIndex].value;
      		document.all.chkEmail2.readOnly = true;
//  			$("#chkEmail2").attr("disabled",true);
         } 
    	 */ 	 
    	  
        var inputPw1 = $('#chkPw1').val();				// 비밀번호 텍스트박스 값
        var inputPw2 = $('#chkPw2').val();				// 비밀번호 확인 텍스트박스 값
        var inputName = $('#chkName').val();			// 이름 텍스트박스 값
        var inputPhone1 = $('#phone2').val();			// 폰번호 첫 번째 텍스트박스 값
        var inputPhone2 = $('#phone3').val();			// 폰번호 두 번째 텍스트박스 값
        var inputBirth = $('#chkBirth').val();			// 생년월일 텍스트박스 값
        var inputAddress1 = $('#roadAddress').val();	// 주소 첫 번째 텍스트박스 값
        var inputAddress2 = $('#detailAddress').val();	// 주소 두 번째 텍스트박스 값
        var inputEmail1 = $('#chkEmail1').val();		// E-Mail 첫 번째 텍스트박스 값
        var inputEmail2 = $('#chkEmail2').val();		// E-Mail 두 번째 텍스트박스 값
        
        
     	// E-Mail @를 합치는 과정	
        document.all.uEmail.value = inputEmail1 + "@" + inputEmail2;
       
        // 주소와 상세주소 합치는 과정(주소와 상세주소를 구분하기 위해 임의의 특수문자'^' 추가)
        document.all.uAddress.value = inputAddress1 + "^" + inputAddress2;
        
        // 휴대폰번호 '-'(하이픈) 합치는 과정		
		document.all.uPhone.value = $('#phone1').val() + "-" + inputPhone1 + "-" + inputPhone2;
			
		if(inputName == "" || inputAddress1 == "" || inputAddress2 == "" 		// 이름, 주소, 휴대폰번호, 생년월일, E-mail의 각 값들이 모두 Null일 경우 (휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능)
				|| inputEmail1 == "" || inputEmail2 == "" || inputBirth == "" 	// 휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능
				|| inputPhone1.length < 3 || inputPhone2.length < 4){		
			$(".joinbtn").prop("disabled", true);				// 가입버튼 비활성화					
            $(".joinbtn").css("background-color", "#aaaaaa");	// 가입버튼 회색
		}
		
        if(inputPw2=="" || inputPw1=="" ){ 		// 비밀번호 값이 없거나 비밀번호 확인 값이 없을 경우
            $(".joinbtn").prop("disabled", true);				// 가입버튼 비활성화 
            $(".joinbtn").css("background-color", "#aaaaaa");	// 가입버튼 회색
            $("#chkPw1").css("background-color", "#FFCECE");	// 비밀번호 텍스트박스 빨강색
            $("#chkPw2").css("background-color", "#FFCECE");	// 비밀번호 확인 텍스트박스 빨강색
            document.all.spanPwX.style.display="none";			// 비밀번호가 틀렸다 span 비활성화	
            document.all.spanPwO.style.display="none";			// 비밀번호가 맞았다 span 비활성화
        }
        else if (inputPw1 == inputPw2) {		// 비밀번호 값과 비밀번호확인 값이 같을 경우
            $("#chkPw1").css("background-color", "#B0F6AC");	// 비밀번호 텍스트박스 초록색
            $("#chkPw2").css("background-color", "#B0F6AC");	// 비밀번호 확인 텍스트박스 초록색 
            pwdCheck = 1;
            document.all.spanPwX.style.display="none";			// 비밀번호가 틀렸다 span 비활성화
            document.all.spanPwO.style.display="";				// 비밀번호가 맞았다 span 활성화
            if(idCheck==1 && pwdCheck == 1 && inputEmail1 != "" && inputEmail2 != ""
            		&& inputName != "" && inputAddress1 != "" && inputAddress2 != "" && inputBirth != "" 
            		&&  inputPhone1.length > 2 && inputPhone2.length == 4) {	// 아이디 중복, 비밀번호확인을 하고 이름, 주소, 휴대폰번호, 생년월일, E-mail의 각 값들이 모두 Null일 경우 (휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능)
	           $(".joinbtn").prop("disabled", false);							// 가입버튼 활성화 
	           $(".joinbtn").css("background-color", "#4CAF50");				// 가입버튼 초록색
            }
        } else if (inputPw1 != inputPw2) {		// 비밀번호 틀릴경우
            pwdCheck = 0;										
            $(".joinbtn").prop("disabled", true);				// 가입버튼 비활성화
            $(".joinbtn").css("background-color", "#aaaaaa");	// 가입버튼 회색
            $("#chkPw1").css("background-color", "#FFCECE");	// 비밀번호 텍스트박스 빨강색
            $("#chkPw2").css("background-color", "#FFCECE");	// 비밀번호 확인 텍스트박스 빨강색
            document.all.spanPwX.style.display="";				// 비밀번호가 틀렸다 span 활성화
            document.all.spanPwO.style.display="none";			// 비밀번호가 맞았다 span 비활성화
        }
    }
    
    $(function(){	
    	$(".joinbtn").click(function(){		// 가입버튼 누르면 뜨는 alert
    		alert($('#chkName').val()+"님 DTS E-sport토토 가입을 환영합니다.");
    	});
    	
    });
    
    
    $(document).ready(function(){	// 영어, 숫자만 입력되게 처리
    	  
    	$("input[name=uId]").keyup(function(event){					// input name이 uId에 키 입력시	
    		if (!(event.keyCode >=37 && event.keyCode<=40)) {
    			var inputVal = $(this).val();
    			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
    		}	
    	});
    		$("input[name=uEmail1]").keyup(function(event){ 		// input name이 uEmail1에 키 입력시
    		if (!(event.keyCode >=37 && event.keyCode<=40)) {
    			var inputVal = $(this).val();
    			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
    		}	
    	});
    	 $("input[name=uEmail2]").keyup(function(event){ 			// input name이 uEmail2에 키 입력시
    		if (!(event.keyCode >=37 && event.keyCode<=40)) {
    			var inputVal = $(this).val();
    			$(this).val(inputVal.replace(/[^a-z0-9.]/gi,''));	// '.'도 입력할 수 있게 출력
    		}	
    	}); 
	});

 </script>





<style>
	body {								/* 글자 폰트 */
		font-family: Arial, Helvetica, sans-serif;
	}

	.joinbtn {						/* delete 버튼 */
		background-image: linear-gradient(to right, #A8A7A7 , #363636);
		color: white;					/* 글자색 */
		padding: 8px 20px;				/* 버튼 크기 위아래 8px, 좌우 20px */
		margin: 20px 0;					/* 상하 여백 20px, 좌우 여백 0px */
		cursor: pointer;				/* 마우스 hover 시 마우시 포인터 손가락으로 변경 */
		width: 7%;						/* 버튼 넓이 7% */
	}
	.joinbtn:hover {					/* delete버튼 마우스 hover 시 */
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




</head>
<body>
	<h3>회원가입</h3>
	<form action="insertMember" method="post">
	<input type="text" id="uDate" value="${member.uDate }">
		<table id="tb">
	        <tr>            
	            <td>아이디</td>
	            <td><input type="text" class="id" name="uId" id="chkId" placeholder="아이디" value="${member.uId }" oninput="checkId()"  autofocus><br>
	            	<span id="spanIdO" style="display: none">사용가능한 아이디 입니다.</span>
	            	<span id="spanIdX" style="display: none">중복 아이디 입니다.</span>
	            	<span id="countId">네글자 이상 아이디를 입력하세요.</span>
	            </td>
	            <td>
	            	
	            </td>
	        </tr>
	        <tr>
	            <td>비밀번호</td>
	            <td>
	            	<input type="password" name="uPw" id="chkPw1" placeholder="비밀번호" value="${member.uPw }" oninput="checkPwd()"><br>&nbsp;
	            	<span id="spanPwX" style="display: none">비밀번호가 일치하지 않습니다.</span>
              		<span id="spanPwO" style="display: none">비밀번호가 일치합니다.</span>
            	</td>
	            
	        </tr>
	        <tr>
	            <td>비밀번호 확인</td>
	            <td><input type="password" name="member" id="chkPw2" placeholder="비밀번호 확인" value="${member.uPw }" oninput="checkPwd()"></td>
	        </tr>
	        <tr>
	            <td>이름</td>
	            <td><input type="text"  name="uName" id="chkName" placeholder="이름" value="${member.uName }" oninput="checkPwd()"></td>
	            
	        </tr>
	        <tr>
	            <td>주소</td>       
	            <td>
	            	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	                <input type="text" id="roadAddress" placeholder="지번주소" value="${member.uAddress }" oninput="checkPwd()" >
	                <input type="text" id="detailAddress" placeholder="상세주소 입력창" oninput="checkPwd()"><br>
	                <input type="hidden" id="uAddress" name="uAddress">
	                <span id="guide" style="color:#999"></span>
	            </td>
	        </tr>
	        <tr>
               <td>휴대폰번호</td>
               <td>
                   <select name="phone1" id="phone1" oninput="checkPwd()">
                       <option value="010">010</option>
                       <option value="011">011</option>
                       <option value="012">012</option>
                       <option value="016">016</option>
                       <option value="017">017</option>
                       <option value="018">018</option>
                       <option value="019">019</option>                        
                   </select>
                   
                   &nbsp;-&nbsp;&nbsp;<input type="text" id="phone2" name="member" maxlength=4 placeholder="휴대폰번호 앞자리" value="${member.uPhone }" oninput="checkPwd()"   onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>&nbsp;&nbsp;-&nbsp;
                   <input type="text" id="phone3" maxlength=4 placeholder="휴대폰번호 뒷자리" id="${member.uPhone }" oninput="checkPwd()"   onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
                   <input type="hidden" name="uPhone" id="uPhone" oninput="checkPwd()">
               </td>
           </tr>
	        <tr>
	            <td>생년월일</td>
	            <td>
	            	<input type="date" name="uBirth" id="chkBirth" value="${member.uBirth }" oninput="checkPwd()">
	            </td>
	        </tr>
	        <tr>
	            <td>E-Mail</td>
	            <td>
	            	<input type="hidden" id="uEmail" name="uEmail"  value="${member.uEmail }">
	            	<input type="text" name="uEmail1" id="chkEmail1" placeholder="이메일 아이디"  oninput="checkPwd()">&nbsp;&nbsp;@&nbsp;
	            	<input type="text" name="uEmail2" id="chkEmail2" placeholder="해당 홈페이지"  oninput="checkPwd()">
<!-- 	            	<select name="selectEmail" id="selectEmail" class="form-control phone" onchange="checkPwd()">
                       <option value="blank">--선택--</option>
                       <option value="naver.com">네이버</option>
                       <option value="gmail.com">구글</option>
                       <option value="daum.net">다음</option>
                       <option value="nate.com">네이트</option>
                       <option value="direct">직접입력</option>
                   </select> -->
	            </td>
	        </tr>        
	    </table>
	    <button class="joinbtn" disabled="disabled">가입</button>
    </form>

</body>
</html>