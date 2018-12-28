package com.company.dts.member;

public class MemberVO {
	private String uId;			// 유저 아이디
	private String uPw;			// 유저 비밀번호
	private String uName;		// 유저 이름
	private String uAddress;	// 유저 주소
	private String uPhone;		// 유저 폰번호
	private int uMileage;		// 유저 마일리지
	private String uEmail;		// 유저 이메일
	private String uCategorie;   // 구분값
	private String uGrant;		// 유저 권한
	private String uBirth;		// 유저 생일
	private String uDate;		// 유저 가입일
	private int uWin;			// 유저 베팅 승리횟수
	private int uLose;			// 유저 베팅 패배횟수
	
	private String mon;			// 차트 월
	private int cnt;			// 차트 월별 회원 수
	
	private String year;		// 차트 년도
	
				
	public String getuCategorie() {
		return uCategorie;
	}
	public void setuCategorie(String uCategorie) {
		this.uCategorie = uCategorie;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMon() {
		return mon;
	}
	public void setMon(String mon) {
		this.mon = mon;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	private String searchCondition;
	private String searchKeyword;
	private String sortCol;
	private String[] uidList;
	private int first;			// 페이지 목록
	private int last;			// 페이지 목록
	

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
	public String getSortCol() {
		return sortCol;
	}
	public void setSortCol(String sortCol) {
		this.sortCol = sortCol;
	}
	public String[] getUidList() {
		return uidList;
	}
	public void setUidList(String[] uidList) {
		this.uidList = uidList;
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
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public int getuMileage() {
		return uMileage;
	}
	public void setuMileage(int uMileage) {
		this.uMileage = uMileage;
	}
	public String getuGrant() {
		return uGrant;
	}
	public void setuGrant(String uGrant) {
		this.uGrant = uGrant;
	}
	public String getuBirth() {
		return uBirth;
	}
	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}
	public String getuDate() {
		return uDate;
	}
	public void setuDate(String uDate) {
		this.uDate = uDate;
	}
	public int getuWin() {
		return uWin;
	}
	public void setuWin(int uWin) {
		this.uWin = uWin;
	}
	public int getuLose() {
		return uLose;
	}
	public void setuLose(int uLose) {
		this.uLose = uLose;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	@Override
	public String toString() {
		return "MemberVO [uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uAddress=" + uAddress + ", uPhone="
				+ uPhone + ", uMileage=" + uMileage + ", uGrant=" + uGrant + ", uBirth=" + uBirth + ", uDate=" + uDate
				+ ", uWin=" + uWin + ", uLose=" + uLose + ", uEmail=" + uEmail + "]";
	}
}
