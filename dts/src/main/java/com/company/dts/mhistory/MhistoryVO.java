package com.company.dts.mhistory;

public class MhistoryVO {
	
	private int num;
	private String uId;
	private String ahDate;
	private int oldMileage;
	private int newMileage;
	private String ipAddr;
	private String categorie;
	private int cntMileage;
	private String day;
	private int first;
	private int last;
	private int month;
	private int year;
	private String chargeDate;
	private int chargeMoney;
	private String searchCondition;
	private String searchKeyword;
	
		
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
	public String getChargeDate() {
		return chargeDate;
	}
	public void setChargeDate(String chargeDate) {
		this.chargeDate = chargeDate;
	}
	public int getChargeMoney() {
		return chargeMoney;
	}
	public void setChargeMoney(int chargeMoney) {
		this.chargeMoney = chargeMoney;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	public int getCntMileage() {
		return cntMileage;
	}
	public void setCntMileage(int cntMileage) {
		this.cntMileage = cntMileage;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getAhDate() {
		return ahDate;
	}
	public void setAhDate(String ahDate) {
		this.ahDate = ahDate;
	}
	public int getOldMileage() {
		return oldMileage;
	}
	public void setOldMileage(int oldMileage) {
		this.oldMileage = oldMileage;
	}
	public int getNewMileage() {
		return newMileage;
	}
	public void setNewMileage(int newMileage) {
		this.newMileage = newMileage;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	@Override
	public String toString() {
		return "MhistoryVO [num=" + num + ", uId=" + uId + ", ahDate=" + ahDate + ", oldMileage=" + oldMileage
				+ ", newMileage=" + newMileage + ", ipAddr=" + ipAddr + ", categorie=" + categorie + ", cntMileage="
				+ cntMileage + ", day=" + day + ", first=" + first + ", last=" + last + "]";
	}
	
	

}
