package com.company.dts.game;

public class GameVO {
	private int gameId;
	private String redTeamId;
	private String state;
	private float redRate;
	private String blueTeamId;
	private float blueRate;
	private String gameDate;
	private int buyCheck;
	private String uId;
	
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public int getBuyCheck() {
		return buyCheck;
	}
	public void setBuyCheck(int buyCheck) {
		this.buyCheck = buyCheck;
	}
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public String getRedTeamId() {
		return redTeamId;
	}
	public void setRedTeamId(String redTeamId) {
		this.redTeamId = redTeamId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public float getRedRate() {
		return redRate;
	}
	public void setRedRate(float redRate) {
		this.redRate = redRate;
	}
	public String getBlueTeamId() {
		return blueTeamId;
	}
	public void setBlueTeamId(String blueTeamId) {
		this.blueTeamId = blueTeamId;
	}
	public float getBlueRate() {
		return blueRate;
	}
	public void setBlueRate(float blueRate) {
		this.blueRate = blueRate;
	}
	public String getGameDate() {
		return gameDate;
	}
	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}
	@Override
	public String toString() {
		return "GameVO [gameId=" + gameId + ", redTeamId=" + redTeamId + ", state=" + state + ", redRate=" + redRate
				+ ", blueTeamId=" + blueTeamId + ", blueRate=" + blueRate + ", gameDate=" + gameDate + ", buyCheck="
				+ buyCheck + ", uId=" + uId + "]";
	}	
	
}
