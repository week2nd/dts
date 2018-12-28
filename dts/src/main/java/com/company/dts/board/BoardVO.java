package com.company.dts.board;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class BoardVO {
	private int boardNumber;			//게시판번호
	private String boardTitle;			//게시판제목
	private String boardContent;		//게시판제목
	private String postDate;			//작성일
	private int boardHits;				//조회수
	private int boardLike;				//추천수
	private String uId;					//user아이디
	private String boardType;			//게시판타입

	private String uploadFileName;		//파일업로드할때 사용
	private MultipartFile uploadFile;	//파일업로드할때 사용
	private String searchCondition;		//속성검색(게시판검색때사용)
	private String searchKeyword;		//단어검색(게시판검색때사용)
	private String sortCol;				//정렬
	private String[] bnumberList;		//값을 담는 배열
	private int first;					//페이징 처음값
	private int last;					//페이징 마지막값
	
	
	
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	@JsonIgnore
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
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
	public int getBoardHits() {
		return boardHits;
	}
	public void setBoardHits(int boardHits) {
		this.boardHits = boardHits;
	}
	public int getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(int boardLike) {
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
	@Override
	public String toString() {
		return "BoardVO [boardNumber=" + boardNumber + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", postDate=" + postDate + ", boardHits=" + boardHits + ", boardLike=" + boardLike + ", uId=" + uId
				+ ", boardType=" + boardType + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", sortCol=" + sortCol + ", bnumberList=" + Arrays.toString(bnumberList) + ", first="
				+ first + ", last=" + last + "]";
	}
	


}
