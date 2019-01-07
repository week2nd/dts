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


	function go_page(page,type) {
		
		$("#mhistoryList").empty();
		$("#mhistoryList").text(null);
		$("#pagination").html("");
		if(type==undefined) {
			type = $("#searchType").val();
		} else {
			$("#searchType").val(type);
		}
		
		if(type==1)	{
			$("#uId").val("");
		} else if(type==2) {
			$("#uId").val("");
			$("#searchKeyword").val("");
		} else if(type==3) {
			$("#uId").val("admin");
		}
				
		if(page == undefined || page == ""){
			page=1
			
		};		
		$("#page").val(page);
		
		$.ajax({
			
			url : "getMhistoryListAjax",
			data : $("#frm").serialize(),
			type : "POST",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + "Http에러메시지 :" + msg);
			},
			success : function(data) {
				console.log(data);
				
				for (i = 0; i < data.mhistoryList.length; i++) {
					var tr = "<tr><td style='width:8%'>" + data.mhistoryList[i].num + 
					"</td><td style='width:10%'>" + data.mhistoryList[i].uId + 
					"</td><td style='width:15%'>" + data.mhistoryList[i].ahDate + 
 					"</td><td style='width:20%'>" + data.mhistoryList[i].oldMileage.toLocaleString() + 
					"</td><td style='width:20%'>" + data.mhistoryList[i].newMileage.toLocaleString() +
					"</td><td style='width:15%'>" + data.mhistoryList[i].ipAddr + 
					"</td><td style='width:12%'>"	+ data.mhistoryList[i].categorie + 
					"</td></tr>"
					$(tr).appendTo("#mhistoryList");
				}
		
					
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
				
			}
		})
	};
	
	
</script>
</head>
<body>
	<div class="top-campaign">
		<div style="margin-bottom: 10px; display: inline-flex; width:100%">
			<form name="frm" id="frm" style="width:27%;">
				<select name="searchCondition" id="searchCondition" class="custom-select" style="width:40%">
					<option value="U_ID">아이디
					<option value="AH_DATE">입력날짜
					<option value="CATEGORIE">구분
				</select> <input type="text" name="searchKeyword" id="searchKeyword" style="margin-left:10px; border-bottom: 2px solid black;">
				<input type="hidden" name="uId" id="uId" >
				<input type="hidden" name="page" id="page" >
				<input type="hidden" name="searchType" id="searchType" >
			</form>
				<button style="margin-right:5px" class="btn btn-outline-secondary" id="historyBtn" onclick='go_page(1,1)'>검색</button>
			<div style="display: inline-block;">
				<button class="btn btn-outline-secondary" id="historyAll" onclick="go_page(1,2)">전체목록조회</button>
				<input class="btn btn-outline-secondary" type="button"
					id="historyAdmin" onclick='go_page(1,3)' value="관리자조회" />
			</div>
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
<script>
	go_page(1,2);
</script>
</body>
</html>