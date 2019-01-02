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
		
		if(page == undefined || page == ""){
			{page=1}
		};
		
		
		if(vid=="admin") {
			{vid="admin"}
		} else {
			{vid=""}
		};
		/* console.log(vid); */
		
		$.ajax({
			
			url : "getMhistoryListAjax",
			data : {page:page, uId:vid},
			type : "POST",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + "Http에러메시지 :" + msg);
			},
			success : function(data) {
				
				console.log(data.mhistoryList);
			//	console.log(data.mhistoryList[1].num);
				for (i = 0; i < data.mhistoryList.length; i++) {
					var tr = "<tr><td style='width:8%'>" + data.mhistoryList[i].num + 
					"</td><td style='width:10%'>" + data.mhistoryList[i].uId + 
					"</td><td style='width:15%'>" + data.mhistoryList[i].ahDate + 
					"</td><td style='width:20%'>" + data.mhistoryList[i].oldMileage + 
					"</td><td style='width:20%'>" + data.mhistoryList[i].newMileage + 
					"</td><td style='width:15%'>" + data.mhistoryList[i].ipAddr + 
					"</td><td style='width:12%'>"	+ data.mhistoryList[i].categorie + 
					"</td></tr>"
					$(tr).appendTo("#mhistoryList");
				}
				console.log(data.uId+"aaaaaa");
				
				if(data.uId != "admin") {
					
					
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
		$("#historyAll").click(go_page);
	});
	
	
	
	
</script>
</head>
<body>
	<div class="top-campaign">
		<div class="pull-right" style="margin-bottom:10px">
			<button class="btn btn-outline-secondary" id="historyAll">전체목록조회</button>
			<input class="btn btn-outline-secondary" type="button"
				id="historyAdmin" onclick='go_page("","admin")' value="관리자조회" />
		</div>
		<table class="table table-borderless table-data3" style="text-align: center;">
			<thead style="text-align: center;">
				<tr>
					<th style="width:8%">번호</th>
					<th style="width:10%">아이디</th>
					<th style="width:15%">입력날짜</th>
					<th style="width:20%">이전마일리지</th>
					<th style="width:20%">현재마일리지</th>
					<th style="width:15%">아이피</th>
					<th style="width:12%">구분</th>
				</tr>
			</thead>
		</table>
		<div>
			<table class="table">
				<thead>
				</thead>
				<tbody id="mhistoryList" style="text-align: center;">
				</tbody>
			</table>
		</div>
		<div align="center">
		<div id="pagination" class="pagination"></div>
		</div>
	</div>

</body>
</html>