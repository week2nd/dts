<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script>
	function go_page(page) {
		location.href = "getPurchaseListAd?page=" + page;
		document.frm.page.value=page;
		document.frm.submit();
		
		/* if("${purchaseVO.searchCondition}" != "") {
			document.frm.searchCondition.value = "${purchaseVO.searchCondition}"; */
		
	}
</script>
</head>
<body>
	<div class="top-campaign">
	<p style="font-size:30px; text-align:center">전체구매목록</p>
		<div style="margin-bottom: 10px; display: inline-flex; width:100%" >
			<form name="frm" style="width:95%;">
				<select name="searchCondition" class="custom-select" style="width:15%">
					<option <c:if test="${purchaseVO.searchCondition=='GAME_ID'}">selected</c:if>value="GAME_ID">게임번호
					<option <c:if test="${purchaseVO.searchCondition=='U_ID'}">selected</c:if>value="U_Id">아이디
					<option <c:if test="${purchaseVO.searchCondition=='CHOISE'}">selected </c:if>value="CHOISE">선택팀
				</select> <input type="text" name="searchKeyword" value="${purchaseVO.searchKeyword}" style="margin-left:10px; border-bottom: 2px solid black;">
				<input type="hidden" name="page"/>
				<button class="btn btn-outline-secondary">검색</button>
			</form>
			<div style="display: inline-block;"><button  class="btn btn-outline-secondary" onclick="window.location.href='getPurchaseListAd'">전체보기</button>
			</div>
		</div>
		
		<form>
			<table class="table table-borderless table-data3" style="text-align: center;">
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
						<th>상대팀</th>
						<th>지급확인</th>
					</tr>
				</thead>

				
					<c:forEach items="${purchaseList}" var="purchase">				
						<tr>		
							<td>${purchase.purchaseNum}</td>
							<td>${purchase.uId}</td>
							<td>${purchase.gameId}</td>
							<%-- <td>${purchase.betMoney}</td> --%>
							
							<td><fmt:formatNumber value="${purchase.betMoney}" pattern="##,###,###"></fmt:formatNumber></td>
							<td>${purchase.betDrate}</td>							
							<c:if test="${purchase.accuracy=='적중성공'}">
							<td style="color:#28a745">${purchase.accuracy}</td>
							</c:if>
							<c:if test="${purchase.accuracy=='적중실패'}">
							<td style="color:red">${purchase.accuracy}</td>
							</c:if>
							<c:if test="${purchase.accuracy==null}">
							<td>${purchase.accuracy}</td>
							</c:if>
							<td>${purchase.betDate}</td>
							<td>${purchase.choise}</td>
							<td>${purchase.vsTeam}</td>
							<td>${purchase.returnCheck}</td>
						<tr>						
					</c:forEach>
				
			</table>
		</form>
		<div align="center" style="margin-top:10px">
			<my:paging paging="${paging}" jsFunc="go_page" />
		</div>
	</div>
</body>
</html>