<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwSearchForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> <!-- ajax 스크립트 -->
<script>
function checkEmail(){
	
}

function checkId() {
	var inputId = $('.id').val();
	var inputEmail = $(".email").val();
	
	$.ajax({
        data : {
        	uId : inputId,
            uEmail : inputEmail
        
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
                console.log(document.all.uEmail.value);
                console.log("${member.uEmail }");
            }
            
        }
    });
//	console.log(document.all.uEmail.value);
//	console.log(document.all.temp.value);
//	console.log($('.id').val());
}

$(function(){
	$(".searchBtn").click(function(){									// 회원수정 버튼을 눌렀을 경우
		alert("해당 아이디에 등록되어 있는 E-Mail에 비밀번호를 보냈습니다.");
	});
});
</script>
<style>
	#all{
		background-color: #f2f2f2;
		margin:auto;  
		border-radius: 2em;
	}
	#uId, #uEmail{
		size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 8px 20px;
		width: 100%;
		margin: 20px 0px;
	}
	label{
		margin: 20px 0px;
	}
	.searchBtn{
		margin: 0px 0px 20px 0px;
	}
</style>
<body>

	<form action="mailSend" method="post">
		
		
			<h2 align="center">회원 비밀번호 찾기</h2><br>
			<div id="all" class="col-lg-5">
			<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="overview-wrap">
						<label id="label1">아이디</label>
					</div>
				</div>
				<div class="col-md-9">
					<div class="overview-wrap">
						<input type="text" class="id" name="uId" id="uId" placeholder="아이디" oninput="checkId()"  autofocus><br>
	            		<span id="spanIdX" style="display: none">중복 아이디 입니다.</span>	
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="overview-wrap">
						<label id="label2">E-Mail</label>
					</div>
				</div>
				<div class="col-md-9">
					<div class="overview-wrap">
						<input type="text"  class="email" name="uEmail" id="uEmail" placeholder="E-Mail" oninput="checkId()">	
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div style="text-align: center">
					
						<button class="searchBtn btn btn-primary btn-lg" disabled="disabled">비밀번호 찾기</button>
					</div>
				</div>
			</div>
		</div>
	    </div>
    </form>
</body>
</html>