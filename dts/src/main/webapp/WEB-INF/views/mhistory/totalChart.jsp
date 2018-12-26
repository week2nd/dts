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
	
	
	$(function(){
		 google.charts.load('current', {'packages':['bar']});
	     google.charts.setOnLoadCallback(drawChart);
	});
	
	
	function drawChart1() {
		
		var inputYear = $('#year').val();
		document.all.year.value = inputYear;
		 $.ajax({
			url : "getMemberListChartData?year="+inputYear,
			type : "post",
			dataType : "json",
			 error : function(xhr, status, msg) {
				alert("상태값 :" + status + "Http에러메시지 :" + msg);
			}, 
			success : function(result) {
				console.log(result);
				if(result!=""){			// result 값이 null이 아닌경우(DB에 값이 있을 경우만)
					var myArray=[];		// 배열 담는 변수
					myArray.push([ "Member", "Number" ]);		// 회원, 가입인원
					var temp=0;			// 
					var resultcnt = result.length;				// result 값
					for(var i=1; i<13; i++){
						console.log(result[temp].MON);
						if( i != parseInt(result[temp].MON)){
							
							if(i<10)
								myArray.push( ["0"+i+"월",0]);
							else
								myArray.push( [i+"월",0]);
						}else{
							myArray.push( [result[temp].MON+"월", parseInt(result[temp].CNT)]);
							temp++;
							if(temp == resultcnt)
								temp--;
						}
					}
					
					var options = {
						chart : {
							title : 'DTS Company Performance',
							subtitle : 'Member, Number, and Profit: 2017-2019',
						}
					};
	
					var data = google.visualization.arrayToDataTable(myArray);
					var chart = new google.charts.Bar(document.getElementById('columnchart_material1'));
	
					chart.draw(data, google.charts.Bar.convertOptions(options));
				} else if(result.length==0){
					$('#columnchart_material1').empty();
					console.log("@@@");
				}
			}
		}); 
	}
	
	
</script>
<style>
	body { /* 글자 폰트 */
		font-family: Arial, Helvetica, sans-serif;
	}
	# year{
	 	size: 40px;
	 	border: 1px solid #f2f2f2; 
	 	padding: 10px 20px;
	 }
</style>
</head>
<body>
	<form name="frm" action="./getMemberListChartData" method="post">
		<h3>getUserListChart</h3>
		<input type="hidden" name="year" value="${memberVO.year }" >
		   <select name="year" id="year" oninput="drawChart1()">
		   	<option value="2019">2019</option>
		   	<option value="2018">2018</option>
		    <option value="2017">2017</option>
		   </select>
	</form>
	<div id="columnchart_material1" style="width: 800px; height: 500px;"></div>
	<div id="curve_chart" style="width: 800px; height: 500px"></div>
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>

</body>
</html>