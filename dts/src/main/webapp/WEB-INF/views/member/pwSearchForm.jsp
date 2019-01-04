<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwSearchForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> <!-- ajax 스크립트 -->
<script>

var chkTemp = 0;
function checkId() {
	var inputId = $('.id').val();
	var inputEmail = $(".email").val();
	
	console.log(inputId);
	
	$.ajax({
        data : {
        	uId : inputId,
            uEmail : inputEmail
        
        },
        url : "checkId",
        success : function(data) {
        	
        	
            if (data == true) {				// 중복아이디를 입력했을 경우
            	chkTemp++;
            	if(document.all.uEmail.value==""){
            		chkTemp=0;
            	}
            	console.log(chkTemp+"@@");
            } else if(data == false){
            	chkTemp=0;
            	console.log(chkTemp+"##");
            }
        }
    });
	
}

$(function(){
	$(".searchBtn").click(function(){									
		if(chkTemp==1){
			alert("해당 아이디에 등록되어 있는 E-Mail에 비밀번호를 보냈습니다.");
		}else if(chkTemp==0){
			alert("아이디와 이메일을 확인해주세요.");
	    	document.all.uEmail.focus();
	    	return false;
		}
	});
});
</script>
<style>
	#all{
		background-color: #f2f2f2;
		margin:auto;  
		border-radius: 2em;
	}
	.id, #uEmail{
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
						<input type="text" class="id" name="uId" placeholder="아이디" onchange="checkId()"  autofocus><br>
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
						<input type="text"  class="email" name="uEmail" id="uEmail" placeholder="E-Mail" onchange="checkId()">	
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div style="text-align: center">
					
						<button class="searchBtn btn btn-primary btn-lg">비밀번호 찾기</button>
					</div>
				</div>
			</div>
		</div>
	    </div>
    </form>
</body>
</html>