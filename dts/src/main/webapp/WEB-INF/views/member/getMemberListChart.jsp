<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMemberListChart.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Ajax -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 구글차트 -->

<script>
	function go_sort(sortCol) { // 정렬
		document.frm.sortCol.value = sortCol;
		document.frm.submit();
	}
	function go_page(page) { // 페이징
		//	location.href="getMemberList?page="+page;
		document.frm.page.value = page;
		document.frm.submit(); // 검색폼
	}

	$(function() {
		$(".deleteBtn").click(function() { // 다중 삭제 버튼을 눌렀을 경우
			if (confirm("정말 삭제하시겠습니까??") == true) { // 다중 삭제 확인을 눌렀을 경우 	
				alert("회원 탈퇴 완료 되었습니다.");
				return true;
			} else { // 다중 삭제 취소를 눌렀을 경우
				return false;
			}
		});
		if ("${memberVO.searchCondition}" != "") {

			document.frm.searchCondition.value = "${memberVO.searchCondition}";
		}
	});

      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);


	function drawChart() {

		var myArray1 = [];
		$.ajax({
			url : "getMemberListChartData",
			type : "post",
			dataType : "json",
			/* error : function(xhr, status, msg) {
				alert("상태값 :" + status + "Http에러메시지 :" + msg);
			}, */
			success : function(result) {
				var myArray=[];
				myArray.push([ "Member", "Number" ]);
				var temp=0;
				for(var i=1; i<13; i++){
					if( i != parseInt(result[temp].MON)){
						
						if(i<10)
							myArray.push( ["0"+i,0]);
						else
							myArray.push( [i,0]);
					}else{
						myArray.push( [result[temp].MON, parseInt(result[temp].CNT)]);
						temp++;
					}
				}
				
				var options = {
					chart : {
						title : 'DTS Company Performance',
						subtitle : 'Member, Number, and Profit: 2017-2019',
					}
				};

				var data = google.visualization.arrayToDataTable(myArray);
				var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

				chart.draw(data, google.charts.Bar.convertOptions(options));
			}
		});
	}
</script>
<style>
body { /* 글자 폰트 */
	font-family: Arial, Helvetica, sans-serif;
}

</style>
</head>
<body>
	<h3>getUserListChart</h3>


	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>

</body>
</html>