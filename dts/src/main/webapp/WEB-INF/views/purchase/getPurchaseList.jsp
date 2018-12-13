<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <form>
        <table class="table">
        <thead>
            <tr>                
                <th>구매번호</th>
                <th>아이디</th>
                <th>게임번호</th>
                <th>베팅금액</th>
                <th>배당률</th>
                <th>적중유무</th>
                <th>구매일</th>
                <th>선택팀</th>
            </tr>
        </thead>

        <tr>
            <c:forEach items="${purchaseList}" var="purchase">
            	<tr>
            		<td>${purchase.purchaseNum}</td>
            		<td>${purchase.uId}</td>
            		<td>${purchase.gameId}</td>
            		<td>${purchase.betMoney}</td>           	            	
            		<td>${purchase.betDrate}</td>           	            	
            		<td>${purchase.accuracy}</td>           	            	
            		<td>${purchase.betDate}</td>           	            	
            		<td>${purchase.choise}</td>    	            	
            	</tr>
            
            </c:forEach>
        </tr>
    </table>
    </form>
</body>
</html>