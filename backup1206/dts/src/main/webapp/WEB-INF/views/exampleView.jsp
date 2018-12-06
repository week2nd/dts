<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 정보</title>
</head>
<body>
	<select id="callMatchup">
		<option>롤챔스5일차2경기</option>
		<option>롤챔스5일차1경기</option>
		<option>롤챔스4일차2경기</option>
		<option>롤챔스4일차1경기</option>
		<option>롤챔스3일차2경기</option>
		<option>롤챔스2일차1경기</option>
	</select>

	<!-- 경기 기록 시작-->
	<h3>경기 기록</h3>

	<!-- 경기 기록 화면에서 팀 검색 -->
	<div>
		<div>
			<span> 대회 </span> <span> <select>
					<option>전체</option>
					<option value="1">LOL Champions</option>
					<option value="1">LOL WorldCup</option>
			</select>
			</span> <span> <select>
					<option>전체</option>
					<option value="1">2018 Summer Champs</option>
					<option value="1">2018 Spring Champs</option>
			</select>
			</span>
		</div>
		<div>
			<span> 팀 </span> <span><input type="text" value=""
				placeholder="대상팀명을 입력하세요"> </span> <span><input type="text"
				value="" placeholder="상대팀명을 입력하세요"> </span>
		</div>
	</div>

	<table id="matchinfo" border="1">
		<tr>
			<td colspan="6">일시</td>
			<td align="center">대회명</td>
			<td colspan="6">경기정보</td>
		</tr>
		<tr>
			<td align="left" colspan="6">Blue Team</td>
			<td align="center">Kill Score</td>
			<td align="right" colspan="6">Red Team</td>
		</tr>
		<tr>
			<td>K</td>
			<td>#</td>
			<td>D</td>
			<td>#</td>
			<td>A</td>
			<td>#</td>
			<!-- 까지 블루팀 스코어 -->
			<td align="center">Play Time</td>
			<!-- 가지 레드팀 스코어 -->
			<td>K</td>
			<td>#</td>
			<td>D</td>
			<td>#</td>
			<td>A</td>
			<td>#</td>
		</tr>
		<!-- 픽창 -->
		<tr>
			<td>Blue Pick</td>
			<td>pick 1</td>
			<td>pick 2</td>
			<td>pick 3</td>
			<td>pick 4</td>
			<td>pick 5</td>
			<!-- 까지 블루팀 스코어 -->
			<td align="center" rowspan="2">## : ##</td>
			<!-- 가지 레드팀 스코어 -->
			<td>Blue Pick</td>
			<td>pick 1</td>
			<td>pick 2</td>
			<td>pick 3</td>
			<td>pick 4</td>
			<td>pick 5</td>
		</tr>
		<tr>
			<td>Blue Ban</td>
			<td>Ban1</td>
			<td>Ban2</td>
			<td>Ban3</td>
			<td>Ban4</td>
			<td>Ban5</td>

			<td>Blue Ban</td>
			<td>Ban1</td>
			<td>Ban2</td>
			<td>Ban3</td>
			<td>Ban4</td>
			<td>Ban5</td>
		</tr>
	</table>

	<table id="infodetail" border="1">
		<!-- 가로 7 + 7칸, 세로 10칸 -->
		<tr>
			<td>Spell</td>
			<td>Champ</td>
			<td>Kill</td>
			<td>Death</td>
			<td>Assist</td>
			<td>KDA</td>
			<td>킬관여율</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td>킬관여율</td>
			<td>KDA</td>
			<td>Assist</td>
			<td>Death</td>
			<td>Kill</td>
			<td>Champ</td>
			<td>Spell</td>
		</tr>
		<tr>
			<td>Flash</td>
			<td rowspan="2" align="center">Garen</td>
			<td colspan="5" align="left">SKT T1 Faker</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td colspan="5" align="right">KT_pann</td>
			<td rowspan="2" align="center">Darius</td>
			<td>Flash</td>
		</tr>
		<tr>
			<td>Teleport</td>
			<td align="center">K <br> #
			</td>
			<td align="center">D <br> #
			</td>
			<td align="center">A <br> #
			</td>
			<td align="center">K/D/A <br> #
			</td>
			<td align="center">킬관여율 <br> #
			</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td align="center">킬관여율 <br> #
			</td>
			<td align="center">K/D/A <br> #
			</td>
			<td align="center">A <br> #
			</td>
			<td align="center">D <br> #
			</td>
			<td align="center">K <br> #
			</td>
			<td>Ignite</td>
		</tr>

		<!-- 2pick -->
		<tr>
			<td>icon1</td>
			<td rowspan="2" align="center">Champ</td>
			<td colspan="5" align="left">Summoner2</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td colspan="5" align="right">Summoner2</td>
			<td rowspan="2" align="center">Champ</td>
			<td>icon2</td>
		</tr>
		<tr>
			<td>icon1</td>
			<td align="center">K <br> #
			</td>
			<td align="center">D <br> #
			</td>
			<td align="center">A <br> #
			</td>
			<td align="center">K/D/A <br> #
			</td>
			<td align="center">킬관여율 <br> #
			</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td align="center">킬관여율 <br> #
			</td>
			<td align="center">K/D/A <br> #
			</td>
			<td align="center">A <br> #
			</td>
			<td align="center">D <br> #
			</td>
			<td align="center">K <br> #
			</td>
			<td>icon2</td>
		</tr>
		<!-- 3pick -->
		<tr>
			<td>icon1</td>
			<td rowspan="2" align="center">Champ</td>
			<td colspan="5" align="left">Summoner3</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td colspan="5" align="right">Summoner3</td>
			<td rowspan="2" align="center">Champ</td>
			<td>icon2</td>
		</tr>
		<tr>
			<td>icon1</td>
			<td align="center">K <br> #
			</td>
			<td align="center">D <br> #
			</td>
			<td align="center">A <br> #
			</td>
			<td align="center">K/D/A <br> #
			</td>
			<td align="center">킬관여율 <br> #
			</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td align="center">킬관여율 <br> #
			</td>
			<td align="center">K/D/A <br> #
			</td>
			<td align="center">A <br> #
			</td>
			<td align="center">D <br> #
			</td>
			<td align="center">K <br> #
			</td>
			<td>icon2</td>
		</tr>
		<!-- 4pick -->
		<tr>
			<td>icon1</td>
			<td rowspan="2" align="center">Champ</td>
			<td colspan="5" align="left">Summoner4</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td colspan="5" align="right">Summoner4</td>
			<td rowspan="2" align="center">Champ</td>
			<td>icon2</td>
		</tr>
		<tr>
			<td>icon1</td>
			<td align="center">K <br> #
			</td>
			<td align="center">D <br> #
			</td>
			<td align="center">A <br> #
			</td>
			<td align="center">K/D/A <br> #
			</td>
			<td align="center">킬관여율 <br> #
			</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td align="center">킬관여율 <br> #
			</td>
			<td align="center">K/D/A <br> #
			</td>
			<td align="center">A <br> #
			</td>
			<td align="center">D <br> #
			</td>
			<td align="center">K <br> #
			</td>
			<td>icon2</td>
		</tr>
		<!-- 5pick -->
		<tr>
			<td>icon1</td>
			<td rowspan="2" align="center">Champ</td>
			<td colspan="5" align="left">Summoner5</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td colspan="5" align="right">Summoner5</td>
			<td rowspan="2" align="center">Champ</td>
			<td>icon2</td>
		</tr>
		<tr>
			<td>icon1</td>
			<td align="center">K <br> #
			</td>
			<td align="center">D <br> #
			</td>
			<td align="center">A <br> #
			</td>
			<td align="center">K/D/A <br> #
			</td>
			<td align="center">킬관여율 <br> #
			</td>
			<!-- 블루팀 || 레드팀 분할 -->
			<td align="center">킬관여율 <br> #
			</td>
			<td align="center">K/D/A <br> #
			</td>
			<td align="center">A <br> #
			</td>
			<td align="center">D <br> #
			</td>
			<td align="center">K <br> #
			</td>
			<td>icon2</td>
		</tr>
	</table>
	<!-- Match detail info for each -->

	<!-- 선수 단일 검색 시작-->
	<h3>전적 정보</h3>
	<div>
		<table border="1">
			<tr>
				<td><h3>SKT T1 Faker</h3></td>
				<td><h5>이상혁</h5></td>
				<td width="64%"></td>
				<td align="right"><h4>TeamName</h4></td>
			</tr>
		</table>
	</div>


	<!-- 최근 경기 테이블 -->

	최근 경기 전적
	<table border="1">
		<tr>
			<td>일자</td>
			<td>경기정보</td>
			<td>소환사명</td>
			<td>챔피언</td>
			<td colspan="2">소환사주문</td>
			<td>승패</td>
			<td>K</td>
			<td>D</td>
			<td>A</td>
			<td>K/D/A</td>
			<td>킬관여</td>
		</tr>
		<!-- 아래 <tr>은 Jstl을 이용하여 실질적 데이터 입력 할 것 -->
		<tr>
			<td>18.##.##</td>
			<td>2018 롤챔스 섬머 1세트</td>
			<td>SKT T1 Faker</td>
			<td>아리</td>
			<td>icon1</td>
			<td>icon2</td>
			<td>win</td>
			<td>#</td>
			<td>#</td>
			<td>#</td>
			<td>#.#</td>
			<td>#%</td>
		</tr>
		<tr>
			<td>18.##.##</td>
			<td>2018 롤챔스 섬머 2세트</td>
			<td>SKT T1 Faker</td>
			<td>알리스타</td>
			<td>icon1</td>
			<td>icon2</td>
			<td>win</td>
			<td>#</td>
			<td>#</td>
			<td>#</td>
			<td>#.#</td>
			<td>#%</td>
		</tr>
	</table>


	<!-- 선수 단일 검색 끝 -->
	<!-- 가로16칸 -->

	<!-- 선수 전체 검색 시작-->
	<h3>선수 통산 정보</h3>
	<div>
		<span>소환사 검색</span> <span><input type="text" placeholder="소환사명"></span>
	</div>
	<table border="1">
		<tr>
			<td>순위</td>
			<td>이름</td>
			<td>소환사명</td>
			<td>최근 소속</td>
			<td align="center">M</td>
			<td align="center">W</td>
			<td align="center">L</td>
			<td align="center">승률</td>
			<td align="center">TK</td>
			<td align="center">TD</td>
			<td align="center">TA</td>
			<td align="center">KDA</td>
			<td align="center">킬관여</td>
		</tr>
		<!-- JSTL을 이용해서 선수정보 입력할 것!! -->
		<tr>
			<td>#</td>
			<td>##</td>
			<td>Faker</td>
			<td>최근 소속</td>
			<td align="center">#</td>
			<td align="center">#</td>
			<td align="center">#</td>
			<td align="center">#%</td>
			<td align="center">#</td>
			<td align="center">#</td>
			<td align="center">#</td>
			<td align="center">#.#</td>
			<td align="center">#%</td>
		</tr>
		<tr>
			<td>#</td>
			<td>##</td>
			<td>Mata</td>
			<td>최근 소속</td>
			<td align="center">#</td>
			<td align="center">#</td>
			<td align="center">#</td>
			<td align="center">#%</td>
			<td align="center">#</td>
			<td align="center">#</td>
			<td align="center">#</td>
			<td align="center">#.#</td>
			<td align="center">#%</td>
		</tr>
	</table>

	<!-- 선수 전체 검색 끝-->


	<!-- 팀 전체 정보보기 시작-->
	<!-- 가로 10칸 -->

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

	<!-- 팀 단일 정보보기 시작-->
	<!-- 가로 9칸 -->

	<h3>통산전적</h3>
	<table border="1">
		<tr>
			<th align="center">팀명</th>
			<th>M</th>
			<th>W</th>
			<th>L</th>
			<th>승률</th>
			<th>TK</th>
			<th>TD</th>
			<th>TA</th>
			<th>KDA</th>
		</tr>
		<tr>
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

	<!-- 상대 전적 테이블-->
	<div>
		<h3>상대 전적</h3>
		<table border="1">
			<tr>
				<th align="center">팀명</th>
				<th>M</th>
				<th>W</th>
				<th>L</th>
				<th>승률</th>
				<th>TK</th>
				<th>TD</th>
				<th>TA</th>
				<th>KDA</th>
			</tr>
			<tr>
				<td>vs KT</td>
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
	<!-- 팀 단일 정보보기 끝-->

	<!-- 팀 최근 소속 선수 보기 시작 -->
	<!-- 11칸-->
	<div>
		<font size="4" color="orange"> SKT T1 </font>
		<table border="1">
			<tr>
				<th>포지션</th>
				<th>이름</th>
				<th>소환사명</th>
				<th align="center">M</th>
				<th align="center">W</th>
				<th align="center">L</th>
				<th align="center">승률</th>
				<th align="center">TK</th>
				<th align="center">TD</th>
				<th align="center">TA</th>
				<th align="center">KDA</th>
				<th align="center">킬관여</th>
			</tr>
			<tr>
				<td>Mid</td>
				<td>이상혁</td>
				<td>Faker</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#%</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#.#</td>
				<td>#%</td>
			</tr>
		</table>
	</div>
	<!-- 팀 최근 소속 선수 보기 끝 -->

	<!-- 현재 소속 선수 시작 -->
	<font size="4" color="orange"> 최근 소속 선수 명단 </font>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>소환사명</th>
			<th>포지션</th>
		</tr>
		<tr>
			<!-- JSTL 쓰자 -->
			<td>이상혁</td>
			<td>Faker</td>
			<td>Mid</td>
		</tr>
	</table>
	<!-- 현재 소속 선수 끝-->

	<!-- 이전 소속 선수 시작-->
	<font size="4" color="orange"> 이전 소속 선수 명단 </font>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>소환사명</th>
			<th>포지션</th>
		</tr>
		<tr>
			<!-- JSTL 쓰자 -->
			<td>배성웅</td>
			<td>Bengi</td>
			<td>Jungle</td>
		</tr>
	</table>
	<!-- 이전 소속 선수 끝-->
</body>
</html>