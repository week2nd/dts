<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>팀 통산 기록</h3>
	<div id="teamsearch">
		<span>팀 검색</span> <span><input type="input"
			placeholder="팀명을 입력하세요"></span>
	</div>

	<div>
		<span> 특정 대회 검색 </span> <span> <select id="matchlocation">
				<option>전체</option>
				<option value="1">LOL Champions</option>
				<option value="1">LOL WorldCup</option>
		</select>
		</span> <select id="matchname">
			<option>전체</option>
			<option value="1">2018 Summer Champs</option>
			<option value="1">2018 Spring Champs</option>
		</select> </span>
	</div>

	<div>
		<table border="1">
			<tr>
				<td>순위</td>
				<td>팀명</td>
				<td>M</td>
				<td>W</td>
				<td>L</td>
				<td>승률</td>
				<td>TK</td>
				<td>TD</td>
				<td>TA</td>
				<td>KDA</td>
			</tr>
			<tr>
				<td>#</td>
				<td>SKT T1</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#%</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#.#</td>
			</tr>

		</table>
	</div>
	<!-- 팀 전체 정보보기 끝-->

</body>
</html>