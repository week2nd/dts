package com.company.dts.info;

public class PlayerVO {

	// 기본 정보
	private String playerId;
	private String nickname;
	private String name;
	private String birth;
	private String line;
	private String tier;
	private String teamId;
	private String teamname;
	private int kill;
	private int death;
	private int assist;
	private int win;
	private int lose;
	private String attend;

	// 통계정보
	private int playerRank; // 선수 순위
	private int match; // win + lose 경기수
	private int winrate; // WIN/(WIN+LOSE) 승률
	private float kda; // ROUND((KILL+ASSIST)/DEATH,1) KDA

	// 조인내용
	private String matchDate;
	private String matchName;
	private String matchInfo;
	private String blueGamer3;
	private String redGamer3;
	private String game_id;
	private String blueResult;
	private int bluePick3Kill;
	private int bluePick3Death;
	private int bluePick3Assist;
	private String bluePick3;
	private String bluePick3Spell1;
	private String bluePick3Spell2;
	// 검색
	private String searchCondition;
	private String searchKeyword;

	
	
	public String getTeamname() {
		return teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public String getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(String matchDate) {
		this.matchDate = matchDate;
	}

	public String getMatchName() {
		return matchName;
	}

	public void setMatchName(String matchName) {
		this.matchName = matchName;
	}

	public String getMatchInfo() {
		return matchInfo;
	}

	public void setMatchInfo(String matchInfo) {
		this.matchInfo = matchInfo;
	}

	public String getBlueGamer3() {
		return blueGamer3;
	}

	public void setBlueGamer3(String blueGamer3) {
		this.blueGamer3 = blueGamer3;
	}

	public String getRedGamer3() {
		return redGamer3;
	}

	public void setRedGamer3(String redGamer3) {
		this.redGamer3 = redGamer3;
	}

	public String getGame_id() {
		return game_id;
	}

	public void setGame_id(String game_id) {
		this.game_id = game_id;
	}

	public String getBlueResult() {
		return blueResult;
	}

	public void setBlueResult(String blueResult) {
		this.blueResult = blueResult;
	}

	public int getBluePick3Kill() {
		return bluePick3Kill;
	}

	public void setBluePick3Kill(int bluePick3Kill) {
		this.bluePick3Kill = bluePick3Kill;
	}

	public int getBluePick3Death() {
		return bluePick3Death;
	}

	public void setBluePick3Death(int bluePick3Death) {
		this.bluePick3Death = bluePick3Death;
	}

	public int getBluePick3Assist() {
		return bluePick3Assist;
	}

	public void setBluePick3Assist(int bluePick3Assist) {
		this.bluePick3Assist = bluePick3Assist;
	}

	public String getBluePick3() {
		return bluePick3;
	}

	public void setBluePick3(String bluePick3) {
		this.bluePick3 = bluePick3;
	}

	public String getBluePick3Spell1() {
		return bluePick3Spell1;
	}

	public void setBluePick3Spell1(String bluePick3Spell1) {
		this.bluePick3Spell1 = bluePick3Spell1;
	}

	public String getBluePick3Spell2() {
		return bluePick3Spell2;
	}

	public void setBluePick3Spell2(String bluePick3Spell2) {
		this.bluePick3Spell2 = bluePick3Spell2;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public int getPlayerRank() {
		return playerRank;
	}

	public void setPlayerRank(int playerRank) {
		this.playerRank = playerRank;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	// 통계정보 get/set

	public int getMatch() {
		return match;
	}

	public void setMatch(int match) {
		this.match = match;
	}

	public int getWinrate() {
		return winrate;
	}

	public void setWinrate(int winrate) {
		this.winrate = winrate;
	}

	public float getKda() {
		return kda;
	}

	public void setKda(float kda) {
		this.kda = kda;
	}

	// 기본 정보 get/set
	public String getPlayerId() {
		return playerId;
	}

	public void setPlayerId(String playerId) {
		this.playerId = playerId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public int getKill() {
		return kill;
	}

	public void setKill(int kill) {
		this.kill = kill;
	}

	public int getDeath() {
		return death;
	}

	public void setDeath(int death) {
		this.death = death;
	}

	public int getAssist() {
		return assist;
	}

	public void setAssist(int assist) {
		this.assist = assist;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public int getLose() {
		return lose;
	}

	public void setLose(int lose) {
		this.lose = lose;
	}

	public String getAttend() {
		return attend;
	}

	public void setAttend(String attend) {
		this.attend = attend;
	}

	@Override
	public String toString() {
		return "PlayerVO [playerId=" + playerId + ", nickname=" + nickname + ", name=" + name + ", birth=" + birth
				+ ", line=" + line + ", tier=" + tier + ", teamId=" + teamId + ", kill=" + kill + ", death=" + death
				+ ", assist=" + assist + ", win=" + win + ", lose=" + lose + ", attend=" + attend + ", playerRank="
				+ playerRank + ", match=" + match + ", winrate=" + winrate + ", kda=" + kda + ", matchDate=" + matchDate
				+ ", matchName=" + matchName + ", matchInfo=" + matchInfo + ", blueGamer3=" + blueGamer3
				+ ", redGamer3=" + redGamer3 + ", game_id=" + game_id + ", blueResult=" + blueResult
				+ ", bluePick3Kill=" + bluePick3Kill + ", bluePick3Death=" + bluePick3Death + ", bluePick3Assist="
				+ bluePick3Assist + ", bluePick3=" + bluePick3 + ", bluePick3Spell1=" + bluePick3Spell1
				+ ", bluePick3Spell2=" + bluePick3Spell2 + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + "]";
	}

}
