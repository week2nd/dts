<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getUserList.jsp</title>
<script>
 	function go_sort(sortCol){				// 정렬
 		document.frm.sortCol.value = sortCol;
 		document.frm.submit();
 	} 
 	function go_page(page){					// 페이징
 	//	location.href="getMemberList?page="+page;
		document.frm.page.value=page;
		document.frm.submit();			// 검색폼
	}
 	
 	
 	$(function(){
 		$(".deleteBtn").click(function(){									// 다중 삭제 버튼을 눌렀을 경우
 			if($(".hide:checked").length==0){
 				alert("체크박스를 선택하세요");
 				return false;
 			}else{
	 			if (confirm("정말 삭제하시겠습니까??")== true && $(".hide:checked").length>0){						// 다중 삭제 확인을 눌렀을 경우 	
					alert("회원 탈퇴 완료 되었습니다.");
					
	 				return true;
	 			}else if($(".hide:checked").length==0){															// 다중 삭제 취소를 눌렀을 경우
	 				console.log($(".hide:checked").length);
	 				alert("체크박스가 선택안됫다.");
					return false;
				}else {
					alert("취소해서 요기 왔냐");
					return false;
				}
 			}
 		});
 		if("${memberVO.searchCondition}"!=""){

 			document.frm.searchCondition.value="${memberVO.searchCondition}";
 		}
 	});
 	
 	
</script>
<style>
	body {								/* 글자 폰트 */
		font-family: Arial, Helvetica, sans-serif;
	}

	.deleteBtn {						/* delete 버튼 */
		background-color: #aaaaaa;
		color: white;					/* 글자색 */
		padding: 8px 20px;				/* 버튼 크기 위아래 8px, 좌우 20px */
		margin: 20px 0;					/* 상하 여백 20px, 좌우 여백 0px */
		cursor: pointer;				/* 마우스 hover 시 마우시 포인터 손가락으로 변경 */
		width: 7%;						/* 버튼 넓이 7% */
	}
	.deleteBtn:hover, #selectBtn:hover {					/* delete버튼 마우스 hover 시 */
		opacity: 0.8;					
		background-color: #3e8e41;		/* 배경색깔 기존 색보다 좀 더 연하게 */
		box-shadow: 3px 2px #666;		/* 아래로 그림자 생성 오른쪽 3px, 아래 2px */
	  	transform: translateY(2px);		/* 그림자 길이 2px */
	}
	#selectBtn{						/* delete 버튼 */
		background-color: #aaaaaa;
		color: white;					/* 글자색 */
		padding: 8px 20px;				/* 버튼 크기 위아래 8px, 좌우 20px */
		margin: 20px 0;					/* 상하 여백 20px, 좌우 여백 0px */
		cursor: pointer;				/* 마우스 hover 시 마우시 포인터 손가락으로 변경 */
		width: 5%;						/* 버튼 넓이 7% */
	}
	
	table {								/* th, td에 여백 15px, 글자 왼쪽정렬 */
		border: 1px solid #f2f2f2; 
		border-collapse: collapse;
		width: 100%;					/* 넓이 100%  */
		margin: 0 0 20px 0;				/* 아랫쪽 테이블 간격 20px  */
	}
	 
	th, td {							/* th, td에 여백 15px, 글자 왼쪽정렬  */						
 		padding: 15px;
 		text-align: left;
	}
			 
	tr:hover {							/* 홀수번째 마우스 hover 시 진한 회색 */							
		background-color:#c1c1c1;
	}
	 
	tr:nth-child(even) {				/* 짝수번째 연한 회색 */			
		background-color: #f2f2f2;
	}
	 
	tr:nth-child(even):hover {			/* 짝수번째 마우스 hover 시 진한 회색 */		
		background-color: #c1c1c1;
	}
	input{
	 	size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 8px 20px;
	}	
	#ab{
	 	size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 10px 20px;
	}	
		
		
	
	.hide {
	  clip: rect(10 10 10 10);
	  height: -10px;
	  margin: -1px;
	  padding: 0;
	  position: absolute;
	  width: 1px;
	}
	
	label {
	  display: block;
	  position: relative;
	  cursor: pointer;
	  outline: none;
	  -webkit-user-select: none;
	     -moz-user-select: none;
	      -ms-user-select: none;
	          user-select: none;
	  padding: 2px;
	  width: 40px;
	  height: 20px;
	  border-radius: 24px;
	  background: #919191;
	  -webkit-transition: box-shadow 0.4s;
	  transition: box-shadow 0.4s;
	}
	label:after {
	  display: block;
	  position: absolute;
	  content: "";
	  top: 0;
	  left: 0;
	  bottom: 0;
	  margin: auto 0;
	  width: 30px;
	  height: 30px;
	  background: #fff;
	  border-radius: 50%;
	  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	  -webkit-transition: background 0.4s, left 0.4s, height 0.2s, width 0.2s;
	  transition: background 0.4s, left 0.4s, height 0.2s, width 0.2s;
	}
	
	input:checked + label {
	  box-shadow: inset 0 0 0 48px #8bb1e3;
	}
	
	label:active:after,
	input:checked + label:active:after {
	  height: 25px;
	  width: 25px;
	}
	
	input:checked + label:after {
	  left: calc(100% - 30px);
	  background: #1663c7;
	}

		
		
		
		
		
</style>
</head>
<body>

<hr>
<input type="button" value="pdf내려받기"
	onclick="location.href='./memberReport'"/>
<input type="button" value="엑셀내려받기"
	onclick="location.href='./memberExcel'"/>
<hr>

<h3>getUserList아아아아</h3>

<form name="frm">
	<select id="ab" name="searchCondition"  >
			<option value="U_ID">아이디
			<option value="U_NAME">이름
	</select>
	<input type="text" name="searchKeyword" value="${memberVO.searchKeyword}">
	<button id="selectBtn">검색</button>
	<input type="hidden" name="sortCol" value="${memberVO.sortCol}"/>
	<input type="hidden" name="page" />
</form>


 <form action="deleteMemberList" >	

	<button class="deleteBtn">선택삭제</button>
	<a href="getMemberListChart?year=${memberVO.year }"><input id="chartBtn" type="button" value="회원차트">
				</a>
	<!-- ?year=${member.year } -->
	<table border="1" >
		<tr>
			<th>선택</th>
			<th>아이디<a href="#" onclick="go_sort('u_id')">▲</a></th>
			<th>비밀번호<a href="#" onclick="go_sort('u_pw')">▲</a></th>				
			<th>이름<a href="#" onclick="go_sort('u_name')">▲</a></th>
			<th>주소<a href="#" onclick="go_sort('u_address')">▲</a></th>
			<th>폰번호<a href="#" onclick="go_sort('u_phone')">▲</a></th>
			<th>마일리지<a href="#" onclick="go_sort('u_mileage')">▲</a></th>
			<th>권한<a href="#" onclick="go_sort('u_grant')">▲</a></th>
			<th>생년월일<a href="#" onclick="go_sort('u_birth')">▲</a></th>
			<th>가입일<a href="#" onclick="go_sort('u_date')">▲</a></th>
			<th>승리<a href="#" onclick="go_sort('u_win')">▲</a></th>
			<th>패배<a href="#" onclick="go_sort('u_lose')">▲</a></th>
			<th>E-Mail<a href="#" onclick="go_sort('u_email')">▲</a></th>
		</tr>
		<c:forEach items="${memberList }" var="member" varStatus="status">
			<tr>
				<td>
					<!-- <input type="checkbox" name="uidList" value="${member.uId}" /> -->
					<input type="checkbox" name="uidList" value="${member.uId}" id="toggle${status.count}"  class="hide" />
					
					<label for="toggle${status.count}"><span class="hide"></span></label>
				</td>
 				<td><a href="./getMember?uId=${member.uId }">${member.uId }</a></td>
				<td>${member.uPw }</td>
				<td>${member.uName }</td>
				<td>${member.uAddress }</td>
				<td>${member.uPhone }</td>
				<td>${member.uMileage }</td>
				<td>${member.uGrant }</td>
				<td>${member.uBirth }</td>
				<td>${member.uDate }</td>
				<td>${member.uWin }</td>
				<td>${member.uLose }</td>
				<td>${member.uEmail }</td>
			</tr>
		</c:forEach> 
	</table>
</form>	 
<my:paging paging="${paging}" jsFunc="go_page"/>
</body>
</html>