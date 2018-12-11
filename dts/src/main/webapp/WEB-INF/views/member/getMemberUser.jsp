<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMemberUser.jsp</title>

</head>
<body>
<h3>유저보기</h3>
 	<form action="getMemberUser" method="post">
 	<input type="hidden" name="uId" value="${member.uId }" /> 
 	<table style="width: 100%">
        <tr>            
            <td>아이디</td>
            <td>${member.uId }</td>
            <td>*아이디는 변경하실 수 없습니다.</td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="text" name="uPw" ></td>
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
            <td>휴대폰번호</td>
            <td>${member.uPhone }</td> 
        </tr>
        <tr>
            <td>생년월일</td>
            <td>${member.uBirth}</td>
        </tr>        
        <tr>
            <td colspan="5"> 
      	   		<button>수정</button> 
                <a href="deleteMember?uId=${member.uId }"><input type="button" value="회원탈퇴"></a>
            </td>
            
        </tr>
    </table>
 	</form>
</body>
</html>