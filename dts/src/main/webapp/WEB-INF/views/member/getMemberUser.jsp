<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMemberUser.jsp</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawStuff);

    // 원형차트1번
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);   

    //원형차트
    function drawChart() {

        var data = google.visualization.arrayToDataTable([
        ['가444444444444444', '나4444444444444'],
        ['실패',     11],
        ['적중',      2]
        ]);

        var options = {
          title: 'OOO님 적중률'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
    }
    
    //원형차트
  
    function drawStuff() {

    var chartDiv4 = document.getElementById('chart_div4');
    var data4 = google.visualization.arrayToDataTable([
        ['탈출', '하자', '예담'],
        ['1번', 580, 1.3],
        ['2번', 400, 4.5]
    ]);

    var materialOptions4 = {
        // 차트넓이
        width: 300, height: 300,
        chart: {
 //       title: 'DTS king god',
 //       subtitle: 'Lift is Good'
        },
        series: {
        0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
        1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
        },
        axes: {
        y: {
    //        distance: {label: '아무거나22'}, // Left y-axis.
     //       brightness: {side: 'right', label: '떼이귀22'} // Right y-axis.
        }
        }
    };

    function drawMaterialChart4() {
        var materialChart = new google.charts.Bar(chartDiv4);
        materialChart.draw(data4, google.charts.Bar.convertOptions(materialOptions4));
       
    }
    function drawClassicChart4() {
        var classicChart = new google.visualization.ColumnChart(chartDiv4);
        classicChart.draw(data4, classicOptions);
    }

    drawMaterialChart4();
};

/////////////////////////////////////////////////////////////

//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
var idCheck = 0;
var pwdCheck = 0;
//아이디 체크하여 가입버튼 비활성화, 중복확인.

function checkId() {
  var inputed = $('.id').val();
  
  console.log(inputed);
  $.ajax({
      data : {
          uId : inputed
      },
      url : "checkId",
      success : function(data) {
          if(inputed=="" && data==false || inputed.length<4) {			// 아이디 값을 지웠을 경우
              $(".joinbtn").prop("disabled", true);
              $(".joinbtn").css("background-color", "#aaaaaa");
              $("#chkid").css("background-color", "#FFCECE");
              idCheck = 0;
              document.all.labelido.style.display="none";
          } else if (data == false) {					// 사용가능한 아이디로 입력을 바꿨을때
              $("#chkid").css("background-color", "#B0F6AC");
              document.all.labelido.style.display="";
              document.all.labelidx.style.display="none";
              idCheck = 1;
              if(idCheck==1 && pwdCheck == 1) {
                  $(".joinbtn").prop("disabled", false);
                  $(".joinbtn").css("background-color", "#4CAF50");
              } 
          } else if (data == true) {					// 중복아이디를 입력했을 경우
              $(".joinbtn").prop("disabled", true);
              $(".joinbtn").css("background-color", "#aaaaaa");
              $("#chkid").css("background-color", "#FFCECE");
              idCheck = 0;
              document.all.labelido.style.display="none";
              document.all.labelidx.style.display="";
          } 
          if(inputed.length<4){
              console.log(inputed.length);
              document.all.countid.style.display="";
              $("#chkid").css("background-color", "#FFCECE");
           } else if(inputed.length>3){
              document.all.countid.style.display="none";
           }
      }
  });
}





</script>

</head>
<body>
	<h3>유저보기</h3>
	<form action="getMemberUser" method="post">
		<input type="hidden" class="form-control id" name="uId" value="${member.uId }" />
		<input type="hidden" class="form-control pass" name="uPw" value="${member.uPw }" />
		<input type="hidden" class="form-control name" name="uName" value="${member.uName }" />
		<input type="hidden" class="form-control address" name="uAddress" value="${member.uAddress }" />
		<input type="hidden" class="form-control phone" name="uPhone" value="${member.uPhone }" />
		<input type="hidden" class="form-control date" name="uBirth" value="${member.uBirth }" />
		<table style="width: 70%" class="table">
			<tr>
				<td><div style="width: 50px;">아이디</div></td>
				<td >${member.uId }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="uPw" class="form-control"></td>
				<td colspan="2"><div style="visibility: hidden">빈공간입니당.빈공간입니당.빈공간입니당.빈공간입니당.</div></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.uName }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${member.uAddress }</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>${member.uPhone }</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${member.uBirth}</td>
			</tr>
			<tr>	
				<td colspan="2"> <div id="piechart" style="width: 700px; height: 700px;"></div></td>
			</tr>			
		</table>
		<table style="width: 30%">
			<tr>
				<td>
					<a href="updateMember?uId=${member.uId }">
					<button class="form-control btn update">회원수정</button></a>
				</td>
				<td>	
					 <a href="deleteMember?uId=${member.uId }">
					<input class="form-control btn delete" type="button" value="회원탈퇴"></a>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>