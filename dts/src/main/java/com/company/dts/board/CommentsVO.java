package com.company.dts.board;

public class CommentsVO {

	private int commentsSeq; // 댓글번호
	private String commentsName; // 댓글이름
	private String commentsContent; // 댓글내용
	private String commentsDate;	//댓글작성일자
	private int boardNumber; // 게시글번호(참조키)
	private String boardType; // 게시글타입(참조키)
	private int    pageUnit;	//검색시페이지제한
	
	

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public String getCommentsDate() {
		return commentsDate;
	}

	public void setCommentsDate(String commentsDate) {
		this.commentsDate = commentsDate;
	}

	public int getCommentsSeq() {
		return commentsSeq;
	}

	public void setCommentsSeq(int commentsSeq) {
		this.commentsSeq = commentsSeq;
	}

	public String getCommentsName() {
		return commentsName;
	}

	public void setCommentsName(String commentsName) {
		this.commentsName = commentsName;
	}

	public String getCommentsContent() {
		return commentsContent;
	}

	public void setCommentsContent(String commentsContent) {
		this.commentsContent = commentsContent;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "CommentsVO [commentsSeq=" + commentsSeq + ", commentsName=" + commentsName + ", commentsContent="
				+ commentsContent + ", commentsDate=" + commentsDate + ", boardNumber=" + boardNumber + ", boardType="
				+ boardType + "]";
	}

	

}
