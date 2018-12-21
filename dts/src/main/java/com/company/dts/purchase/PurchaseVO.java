package com.company.dts.purchase;

public class PurchaseVO {
	private int purchaseNum;
	private String uId;
	private int gameId;
	private int betMoney;
	private float betDrate;
	private String accuracy;
	private String betDate;
	private String choise;
	private String returnCheck;
	private String searchCondition;
	private String searchKeyword;
	
	private String day;
	private int cnt;
	
	
	private int first;
	private int last;
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public String getReturnCheck() {
		return returnCheck;
	}
	public void setReturnCheck(String returnCheck) {
		this.returnCheck = returnCheck;
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
	public int getPurchaseNum() {
		return purchaseNum;
	}
	public void setPurchaseNum(int purchaseNum) {
		this.purchaseNum = purchaseNum;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public int getBetMoney() {
		return betMoney;
	}
	public void setBetMoney(int betMoney) {
		this.betMoney = betMoney;
	}
	public float getBetDrate() {
		return betDrate;
	}
	public void setBetDrate(float betDrate) {
		this.betDrate = betDrate;
	}
	public String getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(String accuracy) {
		this.accuracy = accuracy;
	}
	public String getBetDate() {
		return betDate;
	}
	public void setBetDate(String betDate) {
		this.betDate = betDate;
	}
	public String getChoise() {
		return choise;
	}
	public void setChoise(String choise) {
		this.choise = choise;
	}
	@Override
	public String toString() {
		return "PurchaseVO [purchaseNum=" + purchaseNum + ", uId=" + uId + ", gameId=" + gameId + ", betMoney="
				+ betMoney + ", betDrate=" + betDrate + ", accuracy=" + accuracy + ", betDate=" + betDate + ", choise="
				+ choise + "]";
	}
	

	
}
