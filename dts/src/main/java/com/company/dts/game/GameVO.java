package com.company.dts.game;

public class GameVO {
	private int gameId;
	private String result;
	private String redTeamId;
	private String state;
	private float redRate;
	private String blueTeamId;
	private float blueRate;
	private String gameDate;
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
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
		return "GameVO [gameId=" + gameId + ", result=" + result + ", redTeamId=" + redTeamId + ", state=" + state
				+ ", redRate=" + redRate + ", blueTeamId=" + blueTeamId + ", blueRate=" + blueRate + ", gameDate="
				+ gameDate + "]";
	}
	
	
	
}
