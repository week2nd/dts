<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getUser.jsp</title>
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
 
 </script>




</head>
<body>
<h3>유저보기</h3>
 	
 	<table style="width: 100%">
        <tr>            
            <td>아이디</td>
            <td>${member.uId }</td>
            <td>*아이디는 변경하실 수 없습니다.</td>
        </tr>
        <tr>
            <td>기존 비밀번호</td>
            <td><input type="password" name="oldpw" value="${member.uPw }"></td>
        </tr>
        <tr>
            <td>새 비밀번호</td>
            <td><input type="password" name="newpw1" value="${member.uPw }"></td>
        </tr>
        <tr>
            <td>새 비밀번호 확인</td>
            <td><input type="password" name="newpw2" value="${member.uPw }"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td>${member.uName }</td>
            <td>*개명을 한경우 본인확인기관에서 등록된 정보로만 변경이 가능합니다.</td>
        </tr>
        <tr>
            <td>주소</td>
            <td>${member.uAddress }</td>
        </tr>
        <tr>
        	<td></td>
            <td>
                <input type="text" id="sample4_postcode" placeholder="우편번호">
                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
                <input type="text" id="sample4_jibunAddress" placeholder="지번주소">
                <span id="guide" style="color:#999"></span>
            </td>
        </tr>
        <tr>
            <td>휴대폰번호</td>
            <td>
                <select name="phone1">
                    <option value="zero">010</option>
                    <option value="one">011</option>
                    <option value="two">012</option>
                    <option value="three">013</option>
                    <option value="four">014</option>
                    <option value="five">015</option>                        
                </select>
                -
                <input type="text" name="phone2" value="${member.uPhone }"> -
                <input type="text" name="phone3" value="${member.uPhone }">
            </td>
        </tr>
            <td>생년월일</td>
            <td>${member.uBirth}</td>
        </tr>        
        <tr>
            <td colspan="5"> 
                <a href="updateMemberform?uId=${member.uId }"><input type="button" value="수정"></a> 
                <a href="deleteMember?uId=${member.uId }"><input type="button" value="삭제"></a>
                <a href="getMemberList"><input type="button" value="취소"></a>
            </td>
            
        </tr>
    </table>
 	
</body>
</html>