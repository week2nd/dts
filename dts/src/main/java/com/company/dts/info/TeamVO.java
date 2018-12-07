package com.company.dts.info;

public class TeamVO {
	private String teamId;
	private String director;
	private String headCoach;
	private String name;
	private int win;
	private int lose;
	private int rate;

	public String getteamId() {
		return teamId;
	}

	public void setteamId(String teamId) {
		this.teamId = teamId;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getheadCoach() {
		return headCoach;
	}

	public void setheadCoach(String headCoach) {
		this.headCoach = headCoach;
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

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

}
