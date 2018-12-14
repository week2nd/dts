<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMemberUserForm.jsp</title>

<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
	daum.postcode.load(function() {
		/*  new daum.Postcode({
		      oncomplete: function(data) {
		          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		          // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		      }
		  }).open();  팝업창 차단*/
	});

	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}

	function checkPwd() {
		var inputed = $('#chkpw1').val();
		var reinputed = $('#chkpw2').val();
		var nameinputed = $('#chkname').val();
		var phoneinputed1 = $('#phone2').val();
		var phoneinputed2 = $('#phone3').val();

		var birthinputed = $('#chkbirth').val();

		var addressinputed1 = $('#sample4_roadAddress').val(); // 주소와 상세주소 합치는 과정
		var addressinputed2 = $('#sample4_detail').val();
		var addresssum = addressinputed1 + "-" + addressinputed2
		document.all.uAddress.value = addresssum;

		var one = $('#phone1').val(); // 휴대폰번호 하이픈 합치는 과정
		var two = $('#phone2').val();
		var thr = $('#phone3').val();
		var fou = one + "-" + two + "-" + thr;
		document.all.uPhone.value = fou;

		//      console.log(addressinputed1);
		//      console.log(addressinputed2);
		//      console.log(addresssum);

		if (nameinputed == "" || addressinputed1 == "" || addressinputed2 == ""
				|| birthinputed == "" || phoneinputed1.length < 3
				|| phoneinputed2.length < 4) { // 이름, 주소, 휴대폰번호, 생년월일 입력삭제 시 가입버튼 비활성화
			$(".joinbtn").prop("disabled", true); // 휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능
			$(".joinbtn").css("background-color", "#aaaaaa");
		}

		if (reinputed == "" || inputed == ""
				&& (inputed != reinputed || inputed == reinputed)) { //
			$(".joinbtn").prop("disabled", true);
			$(".joinbtn").css("background-color", "#aaaaaa");
			$("#chkpw1").css("background-color", "#FFCECE");
			$("#chkpw2").css("background-color", "#FFCECE");
			document.all.labelpwo.style.display = "none";
			document.all.labelpwx.style.display = "none";
		} else if (inputed == reinputed) { // 비밀번호 input색깔 초록색으로
			$("#chkpw1").css("background-color", "#B0F6AC");
			$("#chkpw2").css("background-color", "#B0F6AC");
			pwdCheck = 1;
			document.all.labelpwo.style.display = "none";
			document.all.labelpwx.style.display = "";
			if (idCheck == 1 && pwdCheck == 1 && nameinputed != ""
					&& addressinputed1 != "" && addressinputed2 != ""
					&& birthinputed != "" && phoneinputed1.length > 2
					&& phoneinputed2.length == 4) { // 비밀번호(이름, 주소, 휴대폰번호, 생년월일) 맞으면 가입버튼 활성화
				$(".joinbtn").prop("disabled", false); // 휴대폰번호는 중간자리는 3~4자리가능, 마지막자리는 4자리만가능
				$(".joinbtn").css("background-color", "#4CAF50");
			}
		} else if (inputed != reinputed) { // 비밀번호 틀리면 가입버튼 비활성화 및 비밀번호 input색깔 붉은색으로
			pwdCheck = 0;
			$(".joinbtn").prop("disabled", true);
			$(".joinbtn").css("background-color", "#aaaaaa");
			$("#chkpw1").css("background-color", "#FFCECE");
			$("#chkpw2").css("background-color", "#FFCECE");
			document.all.labelpwo.style.display = "";
			document.all.labelpwx.style.display = "none";
		}

		//     console.log(nameinputed);
		//	console.log(addressinputed1);
		//	console.log(phoneinputed);
		//	console.log(birthinputed);

	}
	
	$(function(){
		
		var tempphone2 =  $('#member.uPhone').val();
		var tempphone3 =  $('#member.uPhone').val();
		
		document.all.phone2.value = tempphone2;
		document.all.phone3.value = tempphone3;
		
		console.log(tempphone2);
		console.log(tempphone3);
		console.log($('#member.uPhone').val());
	});
</script>




</head>
<body>
	<h3>단일유저 정보 수정폼</h3>
	<form action="getMemberUser" method="post">
		<input type="hidden" name="uId" value="${member.uId }" /> <input
			type="hidden" name="uPw" value="${member.uPw }" />
		<table class="table">
			<tr>
				<td>아이디</td>
				<td>${member.uId }</td>
				<td colspan="2"><div style="visibility: hidden">빈공간입니당.빈공간입니당.빈공간입니당.빈공간입니당.</div></td>
			</tr>
			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password"></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" name="newpw1"></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" name="newpw2"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.uName }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${member.uAddress }</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="button" onclick="sample4_execDaumPostcode()"value="우편번호 찾기"><br>
				<input type="text" class="form-control address" id="sample4_roadAddress" placeholder="도로명주소" value="${member.uAddress }" oninput="checkPwd()" readonly> 
				<input type="text" class="form-control address" id="sample4_detail"	placeholder="상세주소 입력창" oninput="checkPwd()"> 
				<input type="hidden" id="uAddress" name="uAddress"> 
				<span id="guide" style="color: #999"></span></td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td><select name="phone1">
						<option value="zero">010</option>
						<option value="one">011</option>
						<option value="two">012</option>
						<option value="three">013</option>
						<option value="four">014</option>
						<option value="five">015</option>
				</select> - <input type="text" name="phone2">
					- <input type="text" name="phone3" >
					<input type="hidden" id="uPhone" name="uPhone" value="${member.uPhone }"> 
				</td>
			</tr>


			<tr>
				<td>생년월일</td>
				<td>${member.uBirth}</td>
			</tr>

			<tr>
				<td colspan="5">
					<!--     <a href="updateMemberform?uId=${member.uId }"><input type="button" value="수정"></a> -->
					<button>수정</button> <a href="getMemberUser"><input
						type="button" value="취소"></a>
				</td>

			</tr>
		</table>
	</form>
</body>
</html>