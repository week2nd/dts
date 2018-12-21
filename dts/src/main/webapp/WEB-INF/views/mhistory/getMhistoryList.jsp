<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="com.company.dts.common.Paging" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMhistoryList</title>
<style>
	.pagination {
	  display: inline-block;
	}
	
	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	}
	
	.pagination a.active {
	  background-color: #4CAF50;
	  color: white;
	  border-radius: 5px;
	}
	
	.pagination a:hover:not(.active) {
	  background-color: #ddd;
	  border-radius: 5px;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

	function go_page(page, vid) {
		
		$("#mhistoryList").empty();
		$("#pagination").html("");
		console.log(vid);
		if(page == undefined || page == ""){
			{page=1}
		};
		
		
		if(vid=="admin") {
			{vid="admin"}
		} else {
			{vid=null}
		};
			
		
		console.log(page);
		console.log(vid);
		
		$.ajax({
			url : "getMhistoryListAjax",
			data : {page:page, uId:vid},
			type : "POST",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + "Http에러메시지 :" + msg);
			},
			success : function(data) {
				//console.log(data);
				//console.log(data.mhistoryList);
			//	console.log(data.mhistoryList[1].num);
				for (i = 0; i < data.mhistoryList.length; i++) {
					var tr = "<tr><td>" + data.mhistoryList[i].num + 
					"</td><td>" + data.mhistoryList[i].uId + 
					"</td><td>" + data.mhistoryList[i].ahDate + 
					"</td><td>" + data.mhistoryList[i].oldMileage + 
					"</td><td>" + data.mhistoryList[i].newMileage + 
					"</td><td>" + data.mhistoryList[i].ipAddr + 
					"</td><td>"	+ data.mhistoryList[i].categorie + 
					"</td></tr>"
					$(tr).appendTo("#mhistoryList");
				}
				if(data.mhistoryList[0].uId != "admin") {
					
				var dd = "<a href='#' onclick='go_page(1)' >&laquo;</a>";
				$(dd).appendTo("#pagination");
				
				var begin = data.paging.startPage;
				var end = data.paging.endPage;					
				for(j = begin; j <= end; j++ ) {
					if(j != data.paging.page) {
						var bb = "<a href='#' onclick='go_page("+j+")'>"+j+"</a>";
						$(bb).appendTo("#pagination");
					}
				    else if(j == data.paging.page) {
						var cc = "<a href='#' class='active'>"+j+"</a>";
						$(cc).appendTo("#pagination");
					}
				}
				var ee = "<a href='#' onclick='go_page("+data.paging.lastPage+")'>&raquo;</a>";
				$(ee).appendTo("#pagination");
				
				} else {
					
					var dd = "<a href='#' onclick='go_page(1,\"admin\")' >&laquo;</a>";
					$(dd).appendTo("#pagination");
					var vid = "admin";
					
					var begin = data.paging.startPage;
					var end = data.paging.endPage;					
					for(j = begin; j <= end; j++ ) {
						if(j != data.paging.page) {
							var bb = "<a href='#' onclick='go_page("+j+","+"\"admin\""+")'>"+j+"</a>";
							$(bb).appendTo("#pagination");
						}
					    else if(j == data.paging.page) {
							var cc = "<a href='#' class='active'>"+j+"</a>";
							$(cc).appendTo("#pagination");
						}
					}
					var ee = "<a href='#' onclick='go_page("+data.paging.lastPage+",\"admin\")'>&raquo;</a>";
					$(ee).appendTo("#pagination");
				}
			}
		})
	};
	$(function() {
		//$("#historyAdmin").click({vid:'admin'}, go_page);
		
		//$("#historyAdmin").on( "click", {page:null, vid:"admin"}, go_page);
		$("#historyAll").click(go_page);
		


	});
	
	
	
	
</script>
</head>
<body>
	<button class= "btn" id="historyAll">전체목록조회</button> <input class="btn" type="button" id="historyAdmin" onclick='go_page("","admin")') value="관리자조회" />
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>업데이트날짜</th>
					<th>이전마일리지</th>
					<th>현재마일리지</th>
					<th>아이피</th>
					<th>구분</th>
				</tr>
			</thead>
		</table>
	<div>
		<table class="table">
		<thead>
		</thead>
			<tbody id = "mhistoryList">
			</tbody>
			<%-- <tr>
				<c:forEach items="${mhistoryList}" var="mhistory">
					<tr>
						<td>${mhistory.num}</td>
						<td>${mhistory.uId}</td>
						<td>${mhistory.ahDate}</td>
						<td>${mhistory.newMileage}</td>
						<td>${mhistory.oldMileage}</td>
						<td>${mhistory.ipAddr}</td>
						<td>${mhistory.categorie}</td>
					</tr>
				</c:forEach>
			</tr> --%>
		</table>
	</div>
	<div id="pagination" class="pagination">
	</div>


</body>
</html>