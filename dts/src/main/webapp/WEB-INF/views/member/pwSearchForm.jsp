<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwSearchForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> <!-- ajax 스크립트 -->
<script>


function checkId() {
	var inputId = $('.id').val();
	$.ajax({
        data : {
            uId : inputId
        },
        url : "checkId",
        success : function(data) {
        	
        	
            if (data == true) {				// 중복아이디를 입력했을 경우
                $(".searchBtn").prop("disabled", false);					
                $(".searchBtn").css("background-color", "#4CAF50");		// 가입버튼 회색
                $("#chkId").css("background-color", "#B0F6AC");			// 아이디 텍스트박스 빨강색
                document.all.spanIdX.style.display="";					// 중복 아이디 span 활성화
            } else if(data == false){
            	$(".searchBtn").prop("disabled", true);					
                $(".searchBtn").css("background-color", "#aaaaaa");		// 가입버튼 회색
                $("#chkId").css("background-color", "#FFCECE");			// 아이디 텍스트박스 빨강색
                document.all.spanIdX.style.display="none";					// 중복 아이디 span 활성화
            }
            
        }
    });
}

$(function(){
	$(".searchBtn").click(function(){									// 회원수정 버튼을 눌렀을 경우
		alert("해당 아이디에 등록되어 있는 E-Mail에 비밀번호를 보냈습니다.");
	});
});
</script>
<body>
<h3>회원 비밀번호 찾기</h3>
	<form action="mailSend" method="post">
	
		<table id="tb">
	        <tr>            
	            <td>아이디</td>
	            <td><input type="text" class="id" name="uId" id="uId" placeholder="아이디" value="${member.uId }" oninput="checkId()"  autofocus><br>
	            	<span id="spanIdX" style="display: none">중복 아이디 입니다.</span>
	            </td>
	        </tr>
	        <%-- <tr>
	            <td>E-Mail</td>
	            <td><input type="text" class="email" name="uEmail" id="uEmail" placeholder="E-Mail" value="${member.uEmail }" oninput="checkId()"></td>
	        </tr> --%>
		</table>
	    <button class="searchBtn" disabled="disabled">비밀번호 찾기</button>
    </form>
</body>
</html>