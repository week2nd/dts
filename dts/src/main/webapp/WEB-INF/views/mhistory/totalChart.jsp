<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>totalChart</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	
<script type="text/javascript">
	google.charts.load('current', {'packages' : [ 'corechart' ]});
	google.charts.setOnLoadCallback(drawChart); 
	
	 google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);
		
	function drawChart() {
		$.ajax({
			url : "totalChart",
			//data : {page : page,uId : vid},
			type : "POST",
			dataType : "json",
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + "Http에러메시지 :" + msg);
			},
			success : function(data) {
				console.log(data);
								
				console.log("@@@@");
				var myArray = [];
				myArray.push(["day", "발매티켓수"]);
				
				for(var i=0; i<data.purchaseList.length; i++) {
					myArray.push([data.purchaseList[i].day, data.purchaseList[i].cnt]);
				}
				
				var options = {
					title : '일자별 판매',
					curveType : 'function',
					legend : {
						position : 'bottom'
					}
				};
				var datas = google.visualization.arrayToDataTable(myArray);
				var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

				chart.draw(datas, options); 
			///////////////////////////////////////////////////////////
				
				var myArray1 = [];
				myArray1.push(["날짜", "이익"]);
				
				for(var j=0; j<data.mhistoryList.length; j++) {
					myArray1.push([data.mhistoryList[j].betdate, data.mhistoryList[j].cntMileage]);
				}
				
			
				var options1 = {
					chart : {
						title : 'Company Performance',
						subtitle : 'Sales, Expenses, and Profit: 2014-2017',
						//seriesType: 'bars',
				        bar: { groupWidth: '30%' }						
						
					}
				};
				//
			
				var datas1 = google.visualization.arrayToDataTable(myArray1);
				var chart1 = new google.charts.Bar(document.getElementById('columnchart_material'));

				chart1.draw(datas1, google.charts.Bar.convertOptions(options1));
			}
		});
	}
	
</script>
</head>
<body>
	<div id="curve_chart" style="width: 800px; height: 500px"></div>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
	<button type="button" onclick="chart1_options1.bar.groupWidth='50%'; drawChart()">50%</button>
	

</body>
</html>