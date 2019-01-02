<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>totalChart</title>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>
	
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

				var myArray = [];
				myArray.push(["day", "발매티켓수"]);
				
				for(var i=0; i<data.purchaseList.length; i++) {
					myArray.push([data.purchaseList[i].day, data.purchaseList[i].cnt]);
				}
				
				var options = {
						height : "500px",
					title : '일자별 판매',
					/* curveType : 'function',
					legend : {
						position : 'bottom'
					} */
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
						height : "500px",
						title : '일자별 이익',
						subtitle : 'Sales, Expenses, and Profit: 2014-2017',
						//seriesType: 'bars',
				        bar: { groupWidth: '30%' }						
						
					}
				};
				//
			
				var datas1 = google.visualization.arrayToDataTable(myArray1);
				var chart1 = new google.charts.Bar(document.getElementById('columnchart_material'));

				chart1.draw(datas1, google.charts.Bar.convertOptions(options1));
				
			//////////////////////////////////////////////////////////
				
				var myArray2 = [];
					myArray2.push(["게임번호", "구입갯수"]);
					
					for(var j=0; j<data.purchaseGame.length; j++) {
						myArray2.push([data.purchaseGame[j].gameId, data.purchaseGame[j].gameCnt]);
					}
			
				var options2 = {
						
						chart : {
							title : '게임별 판매수',
							subtitle : 'Member, Number, and Profit: 2017-2019',
							height : '500px'
						}
					};
	
					var datas2= google.visualization.arrayToDataTable(myArray2);
					var chart2 = new google.charts.Bar(document.getElementById('columnchart_material2'));
	
					chart2.draw(datas2, google.charts.Bar.convertOptions(options2));
			/////////////////////////////////////////////////////////
			
				var myArray3 = [];
					myArray3.push(["게임번호", "총판매금액", "총환급금액"]);
					
					for(var j=0; j<data.purchaseGameMoney.length; j++) {
						myArray3.push([data.purchaseGameMoney[j].gameId, data.purchaseGameMoney[j].gameMoney, data.purchaseGameMoney[j].gameReturnMoney]);
					}
			
					var options3 = {
							
							vAxis : {
								minValue: 5000,
					            maxValue: 1000000
								
							} ,
					          chart: {
					            title: '게임수익',
					            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
					            height : "500px"
					          },
					          colors: ['#1b9e77', '#d95f02', '#7570b3']
					          
					        };
					var datas3 = google.visualization.arrayToDataTable(myArray3);
			        var chart3 = new google.charts.Bar(document.getElementById('chart_div'));
			        
			        chart3.draw(datas3, options3);
			/////////////////////////////////////////////////////////////
		
				var myArray4 = [];
					myArray4.push(["선택팀", "선택횟수"]);
					
					for(var j=0; j<data.purchaseTeam.length; j++) {
						myArray4.push([data.purchaseTeam[j].choise, data.purchaseTeam[j].teamCnt]);
					}
			
			        var options4 = {
			                title: 'My Daily Activities',
			                pieHole: 0.4,
			              };

				        var datas4 = google.visualization.arrayToDataTable(myArray4);
				        var chart4 = new google.visualization.PieChart(document.getElementById('donutchart'));
				        chart4.draw(datas4, options4);
			        
			        
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
							height : '500px'
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="overview-wrap">
					<h2 class="title-1">통계차트</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="au-card recent-report">
					<div id="curve_chart" style="height: 500px"></div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="au-card recent-report">
					<div id="columnchart_material" style="height: 500px;"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="au-card recent-report">
					<div id="chart_div" style="height: 500px;"></div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="au-card recent-report">
					<div id="columnchart_material2" style="height: 500px;"></div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="au-card recent-report">
					<div id="donutchart" style="height: 500px;"></div>
				</div>
			</div>
			
			<div class="col-lg-6">
				<div class="au-card recent-report">
					<form name="frm" action="./getMemberListChartData" method="post">
						<input type="hidden" name="year" value="${memberVO.year }">
						<select name="year" id="year" oninput="drawChart1()">
							<option value="2019">2019</option>
							<option value="2018">2018</option>
							<option value="2017">2017</option>
						</select>
						<span>년-월별 가입자수</span>
					</form>
					<div id="columnchart_material1" style="height: 500px;"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>