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
	private int kda; // ROUND((KILL+ASSIST)/DEATH,1) KDA

	// 통계정보 get/set
	public int getplayerRank() {
		return playerRank;
	}

	public void setplayerRank(int playerRank) {
		this.playerRank = playerRank;
	}

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

	public int getKda() {
		return kda;
	}

	public void setKda(int kda) {
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

	public String getteamId() {
		return teamId;
	}

	public void setteamId(String teamId) {
		this.teamId = teamId;
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

}
