package com.company.dts.info;

import org.springframework.web.multipart.MultipartFile;

public class TeamVO {
	private String teamId;
	private String director;
	private String headCoach;
	private String name;
	private int win;
	private int lose;

	//파입 업로드용
	private String fileName;
	private MultipartFile uploadFile;
	
	//조인용
	private String nickName;
	private String playerName;
	private String playerLine;
	private String playerWin;
	private String playerLose;
	private String playerKill;
	private String playerDeath;
	private String playerAssist;
	private String playerKda;
	
	// 통계
	private int rank;
	private float rate;
	private int playerMatch;
	private String vsTeam;
	//검색
	private String searchCondition;
	private String searchKeyword;
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getVsTeam() {
		return vsTeam;
	}

	public void setVsTeam(String vsTeam) {
		this.vsTeam = vsTeam;
	}

	public int getPlayerMatch() {
		return playerMatch;
	}

	public void setPlayerMatch(int playerMatch) {
		this.playerMatch = playerMatch;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public String getPlayerLine() {
		return playerLine;
	}

	public void setPlayerLine(String playerLine) {
		this.playerLine = playerLine;
	}

	public String getPlayerWin() {
		return playerWin;
	}

	public void setPlayerWin(String playerWin) {
		this.playerWin = playerWin;
	}

	public String getPlayerLose() {
		return playerLose;
	}

	public void setPlayerLose(String playerLose) {
		this.playerLose = playerLose;
	}

	public String getPlayerKill() {
		return playerKill;
	}

	public void setPlayerKill(String playerKill) {
		this.playerKill = playerKill;
	}

	public String getPlayerDeath() {
		return playerDeath;
	}

	public void setPlayerDeath(String playerDeath) {
		this.playerDeath = playerDeath;
	}

	public String getPlayerAssist() {
		return playerAssist;
	}

	public void setPlayerAssist(String playerAssist) {
		this.playerAssist = playerAssist;
	}

	public String getPlayerKda() {
		return playerKda;
	}

	public void setPlayerKda(String playerKda) {
		this.playerKda = playerKda;
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

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getHeadCoach() {
		return headCoach;
	}

	public void setHeadCoach(String headCoach) {
		this.headCoach = headCoach;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

		public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

}
