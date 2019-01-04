<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp28942878'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	$(function() {
		$("#payBtn").click(function() {
			var t1 = $("select[name=won]").val();
			
			IMP.request_pay({
			    pg : 'html5_inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : 'DTS마일리지',
			    amount : t1,
			    buyer_email : '${membersession.uEmail}',
			    buyer_name : '${membersession.uId}',
			    buyer_tel : '${membersession.uPhone}',
			    buyer_addr :'${membersession.uAddress}',
			    buyer_postcode : '123-456',
			    //m_redirect_url : 'http://localhost:8081/app/payCharge'
			}, function(rsp) {
			    if ( rsp.success ) {
			    	console.log(rsp);	
			    	var uid = rsp.buyer_name;
			    	var umileage = rsp.paid_amount;
			    	var ucategorie = '마일리지충전';
			    	$.ajax({
			    		url : "updateMileage",
			    		data : {uId:uid, uMileage:umileage, uCategorie:ucategorie},
			    		type : "POST",
			    		dataType:"json",
			    			error : function(xhr, status, msg) {
			    				alert("상태값 :" + status + "Http에러메시지 :" + msg);
			    			},
			    			success : function(result) {
			    			window.location = 'getMemberUser';
			    			alert('결제성공');
			    			}
			    					
			    	});		        
			    	
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    
			    
			});			
		});		
	});

</script>
<!-- <style>
.table t1 {
width : 50%;
}
</style> -->
</head>
<body>
	<div align="center">
		<div class="row" style="width: 20%;">
			<select name="won">
				<option value="100">100원</option>
				<option value="10000">10000원</option>
				<option value="20000">20000원</option>
				<option value="30000">30000원</option>
				<option value="40000">40000원</option>
				<option value="50000">50000원</option>
				<option value="60000">60000원</option>
				<option value="70000">70000원</option>
				<option value="80000">80000원</option>
				<option value="90000">90000원</option>
				<option value="100000">100000원</option>
			</select> <input type="button" value="충전하기" id="payBtn" />
		</div>
		<div class="row" style="width: 45%">
			<p style="font-size:30px">나의 충전내역</p>
		</div>
		<div class="row" style="width: 50%; margin-top: 10px;">

			<table class="table t1" style="width: 70%; text-align: center;">
				<thead>
					<tr>
						<th style="text-align: center">충전일</th>
						<th style="text-align: center">충전금액</th>
					</tr>
				</thead>
				<c:forEach items="${mhistoryList}" var="mhistory">
					<tr>
						<td>${mhistory.chargeDate }</td>
						<td>${mhistory.chargeMoney }</td>
					</tr>
				</c:forEach>

			</table>

		</div>
	</div>
</body>
</html>