package com.company.dts.board;

public class BoardVO {
	private int boardNumber;			//게시판번호
	private String boardTitle;			//게시판제목
	private String boardContent;		//게시판제목
	private String postDate;			//작성일
	private String boardHits;			//조회수
	private String boardLike;			//추천수
	private String uId;					//user아이디
	private String boardType;			//게시판타입

	private String searchCondition;		//속성검색
	private String searchKeyword;		//단어검색
	private String sortCol;				//정렬
	private String[] bnumberList;		//값을 담는 배열
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getBoardHits() {
		return boardHits;
	}
	public void setBoardHits(String boardHits) {
		this.boardHits = boardHits;
	}
	public String getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(String boardLike) {
		this.boardLike = boardLike;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
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
	public String getSortCol() {
		return sortCol;
	}
	public void setSortCol(String sortCol) {
		this.sortCol = sortCol;
	}
	public String[] getBnumberList() {
		return bnumberList;
	}
	public void setBnumberList(String[] bnumberList) {
		this.bnumberList = bnumberList;
	}


}
