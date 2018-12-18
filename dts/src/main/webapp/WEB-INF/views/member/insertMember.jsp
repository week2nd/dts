<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertUser.jsp</title>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
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
     
     // 휴대폰번호 숫자만 입력가능하게
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
   	
   	
    // 휴대폰번호 숫자만 입력가능하게
    function onlyVarchar2(event){		
   	    event = event || window.event;
   	    var keyID = (event.which) ? event.which : event.keyCode;
   	    if ( (keyID >= 65 && keyID <= 90) || (keyID >= 97 && keyID <= 122) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 ) 
   	        return;
   	    else
   	        return false;
   	}
   	 
   	function removeVarchar2(event) {
   	    event = event || window.event;
   	    var keyID = (event.which) ? event.which : event.keyCode;
   	    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
   	        return;
   	    else
   	        event.target.value = event.target.value.replace(/[^a-z0-9]/gi,"");
   	}
     
     
     /////////////////////////////////////////////////////////////
     
      //아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
   
    function checkId() {
        var inputId = $('.id').val();
        var isid = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,20}$/;
        
        $.ajax({
            data : {
                uId : inputId
            },
            url : "checkId",
            success : function(data) {
            	
                if(inputId=="" && data==false || inputId.length<4) {			// 아이디 값을 지웠을 경우
                    $(".joinbtn").prop("disabled", true);
                    $(".joinbtn").css("background-color", "#aaaaaa");
                    $("#chkId").css("background-color", "#FFCECE");
                    idCheck = 0;
                    document.all.spanIdO.style.display="none";
                    document.all.spanIdX.style.display="none";
                } else if (data == false) {					// 사용가능한 아이디로 입력을 바꿨을때
//                	console.log(isid+"@@@"); 
//                	console.log(inputId+"###");
                    $("#chkId").css("background-color", "#B0F6AC");
                    document.all.spanIdO.style.display="";
                    document.all.spanIdX.style.display="none";
                    idCheck = 1;
             //       console.log(inputId.length);
                    if(idCheck==1 && pwdCheck == 1) {
                      	$(".joinbtn").prop("disabled", false);
                       	$(".joinbtn").css("background-color", "#4CAF50");
                    } 
                } else if (data == true) {					// 중복아이디를 입력했을 경우
                    $(".joinbtn").prop("disabled", true);
                    $(".joinbtn").css("background-color", "#aaaaaa");
                    $("#chkId").css("background-color", "#FFCECE");
                    idCheck = 0;
                    document.all.spanIdO.style.display="none";
                    document.all.spanIdX.style.display="";
                } 
                if(inputId.length<4){
             //       console.log(inputId.length);
                    document.all.countId.style.display="";
                    $("#chkId").css("background-color", "#FFCECE");
                 } else if(inputId.length>3){
                    document.all.countId.style.display="none";
                 }
            }
        });
    }
  //재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
    function checkPwd() {
        var inputPw1 = $('#chkPw1').val();
        var inputPw2 = $('#chkPw2').val();
        var inputName = $('#chkName').val();
        var inputPhone1 = $('#phone2').val();
        var inputPhone2 = $('#phone3').val();
        var inputBirth = $('#chkBirth').val();
        var inputAddress1 = $('#roadAddress').val();
        var inputAddress2 = $('#detailAddress').val();
        var inputEmail1 = $('#chkEmail1').val();
        var inputEmail2 = $('#chkEmail2').val();
        var target = document.getElementById("selectEmail");
        
       
        // 주소와 상세주소 합치는 과정
        var addressSum = inputAddress1 + "^" + inputAddress2;
        document.all.uAddress.value = addressSum;
        
        // 이메일과 @를 합치는 과정
        var EmailSum = inputEmail1 + "@" + inputEmail2;
        document.all.uEmail.value = EmailSum;
        
        // 휴대폰번호 하이픈 합치는 과정
		var tempPhone = $('#phone1').val() + "-" + inputPhone1 + "-" + inputPhone2;		
		document.all.uPhone.value = tempPhone;
			
		if(inputName == "" || inputAddress1 == "" || inputAddress2 == "" || inputEmail1 == "" || inputEmail2 == "" ||
				inputBirth == "" || inputPhone1.length < 3 || inputPhone2.length < 4){		// 이름, 주소, 휴대폰번호, 생년월일 입력삭제 시 가입버튼 비활성화
			$(".joinbtn").prop("disabled", true);													// 휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능
            $(".joinbtn").css("background-color", "#aaaaaa");
		}
		
        if(inputPw2=="" || inputPw1=="" ){ 	//
            $(".joinbtn").prop("disabled", true);
            $(".joinbtn").css("background-color", "#aaaaaa");
            $("#chkPw1").css("background-color", "#FFCECE");
            $("#chkPw2").css("background-color", "#FFCECE");
            document.all.spanPwX.style.display="none";				
            document.all.spanPwO.style.display="none";
        }
        else if (inputPw1 == inputPw2) {		// 비밀번호 input색깔 초록색으로
            $("#chkPw1").css("background-color", "#B0F6AC");
            $("#chkPw2").css("background-color", "#B0F6AC");
            pwdCheck = 1;
            document.all.spanPwX.style.display="none";			// 일치하는거 표시
            document.all.spanPwO.style.display="";				// 불일치하는거 지우기
            if(idCheck==1 && pwdCheck == 1 && inputEmail1 != "" && inputEmail2 != ""
            		&& inputName != "" && inputAddress1 != "" && inputAddress2 != "" && inputBirth != "" 
            		&&  inputPhone1.length > 2 && inputPhone2.length == 4) {	// 비밀번호(이름, 주소, 휴대폰번호, 생년월일, E-mail) 맞으면 가입버튼 활성화
	           $(".joinbtn").prop("disabled", false);								// 휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능
	           $(".joinbtn").css("background-color", "#4CAF50");
            }
        } else if (inputPw1 != inputPw2) {		// 비밀번호 틀리면 가입버튼 비활성화 및 비밀번호 input색깔 붉은색으로
            pwdCheck = 0;
            $(".joinbtn").prop("disabled", true);
            $(".joinbtn").css("background-color", "#aaaaaa");
            $("#chkPw1").css("background-color", "#FFCECE");
            $("#chkPw2").css("background-color", "#FFCECE");
            document.all.spanPwX.style.display="";
            document.all.spanPwO.style.display="none";
        }
        
        
        // E-Mail 텍스트박스 활성화 비활성화
        if(target.options[target.selectedIndex].value == "direct"){
     		document.all.chkEmail2.value = "";
     		$("#chkEmail2").attr("readonly",false);
        } else if(target.options[target.selectedIndex].value == "blank"){
     		document.all.chkEmail2.value = "";
     		$("#chkEmail2").attr("readonly",true);
        } else{
     		document.all.chkEmail2.value = target.options[target.selectedIndex].value;
 			$("#chkEmail2").attr("readonly",true);
        }
    }
    $(function(){
    	$(".joinbtn").click(function(){
    		alert($('#chkName').val()+"님 DTS E-sport토토 가입을 환영합니다.");
    	});
    	
    });
    
    
    $(document).ready(function(){
    	  //한글입력 안되게 처리
    	$("input[name=uId]").keyup(function(event){ 
    		if (!(event.keyCode >=37 && event.keyCode<=40)) {
    			var inputVal = $(this).val();
    			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
    		}	
    	});
    	$("input[name=uEmail1]").keyup(function(event){ 
    		if (!(event.keyCode >=37 && event.keyCode<=40)) {
    			var inputVal = $(this).val();
    			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
    		}	
    	});
    	$("input[name=uEmail2]").keyup(function(event){ 
    		if (!(event.keyCode >=37 && event.keyCode<=40)) {
    			var inputVal = $(this).val();
    			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
    		}	
    	});
	});

 </script>



</head>
<body>
	<h3>회원가입</h3>
	<form action="insertMember" method="post">
	
		<table style="width: 70%" class="table">
	        <tr>            
	            <td>아이디</td>
	            <td><input type="text" class="form-control id" name="uId" id="chkId" placeholder="아이디" value="${member.uId }" oninput="checkId()"  autofocus><br>
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
	            	<input type="password" class="form-control pass" name="uPw" id="chkPw1" placeholder="비밀번호" value="${member.uPw }" oninput="checkPwd()"><br>&nbsp;
	            	<span id="spanPwX" style="display: none">비밀번호가 일치하지 않습니다.</span>
              		<span id="spanPwO" style="display: none">비밀번호가 일치합니다.</span>
            	</td>
	            
	        </tr>
	        <tr>
	            <td>비밀번호 확인</td>
	            <td><input type="password" class="form-control pass" name="member" id="chkPw2" placeholder="비밀번호 확인" value="${member.uPw }" oninput="checkPwd()"></td>
	        </tr>
	        <tr>
	            <td>이름</td>
	            <td><input type="text" class="form-control name"  name="uName" id="chkName" placeholder="이름" value="${member.uName }" oninput="checkPwd()"></td>
	            <td colspan="2"><div style="visibility: hidden">빈공간입니당.빈공간입니당.빈공간입니당.빈공간입니당.</div></td>
	            
	        </tr>
	        <tr>
	            <td>주소</td>       
	            <td>
	            	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	                <input type="text" class="form-control address" id="roadAddress" placeholder="도로명주소" value="${member.uAddress }" oninput="checkPwd()" readonly>
	                <input type="text" class="form-control address" id="detailAddress" placeholder="상세주소 입력창" oninput="checkPwd()">
	                <input type="hidden" id="uAddress" name="uAddress">
	                <span id="guide" style="color:#999"></span>
	            </td>
	        </tr>
	        <tr>
               <td>휴대폰번호</td>
               <td>
                   <select name="phone1" id="phone1" class="form-control phone" oninput="checkPwd()">
                       <option value="010">010</option>
                       <option value="011">011</option>
                       <option value="012">012</option>
                       <option value="016">016</option>
                       <option value="017">017</option>
                       <option value="018">018</option>
                       <option value="019">019</option>                        
                   </select>
                   
                   <input type="text" id="phone2" class="form-control phone" name="member" maxlength=4 placeholder="휴대폰번호 앞자리" value="${member.uPhone }" oninput="checkPwd()"   onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
                   <input type="text" id="phone3" class="form-control phone" maxlength=4 placeholder="휴대폰번호 뒷자리" id="${member.uPhone }" oninput="checkPwd()"   onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
                   <input type="hidden" name="uPhone" id="uPhone" oninput="checkPwd()">
               </td>
           </tr>
	        <tr>
	            <td>생년월일</td>
	            <td>
	            	<input type="date" class="form-control date" name="uBirth" id="chkBirth" value="${member.uBirth }" oninput="checkPwd()">
	            </td>
	        </tr>
	        <tr>
	            <td>E-Mail</td>
	            <td>
	            	<input type="text" id="uEmail" name="uEmail"  value="${member.uEmail }">
	            	<input type="text" class="form-control email" name="uEmail1" id="chkEmail1" placeholder="이메일 아이디"  oninput="checkPwd()">
	            	<input type="text" class="form-control email" name="uEmail2" id="chkEmail2" placeholder="뭘까"  oninput="checkPwd()"  readonly>
	            	<select name="selectEmail" id="selectEmail" class="form-control phone" oninput="checkPwd()">
                       <option value="blank">--선택--</option>
                       <option value="naver.com">네이버</option>
                       <option value="gmail.com">구글</option>
                       <option value="daum.net">다음</option>
                       <option value="nate.com">네이트</option>
                       <option value="direct">직접입력</option>
                   </select>
	            </td>
	        </tr>        
	        <tr>
	            <td colspan="2"> 
	                <button class="form-control btn btn-primary joinbtn" disabled="disabled">가입</button> 
	            </td>
	        </tr>
	       
	    </table>
    </form>

</body>
</html>