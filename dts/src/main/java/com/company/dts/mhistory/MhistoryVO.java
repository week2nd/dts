package com.company.dts.mhistory;

public class MhistoryVO {
	
	private int num;
	private String uId;
	private String ahDate;
	private int oldMileage;
	private int newMileage;
	private String ipAddr;
	private String categorie;
	
	private int first;
	private int last;
	
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
	
	

}
