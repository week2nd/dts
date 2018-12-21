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
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
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
				console.log(data)
				var datas = google.visualization.arrayToDataTable([
						[ 'Year', 'Sales' ], [ data.purchaseList[0].day, data.purchaseList[0].cnt],
						[ data.purchaseList[1].day, data.purchaseList[1].cnt], [ data.purchaseList[2].day, data.purchaseList[2].cnt]
						]);

				var options = {
					title : 'Company Performance',
					curveType : 'function',
					legend : {
						position : 'bottom'
					}
				};

				var chart = new google.visualization.LineChart(document
						.getElementById('curve_chart'));

				chart.draw(datas, options);
			}
		})
	}
</script>
</head>
<body>
	<div id="curve_chart" style="width: 900px; height: 500px"></div>

</body>
</html>