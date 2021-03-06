package com.company.dts.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.dts.board.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 등록
	public void insertBoard(BoardVO vo) {
		System.out.println("mybatis jdbc insertBoard() 기능처리");
		// Object[] params = {vo.getTitle(), vo.getWriter(),vo.getcontent()};
		mybatis.update("board.insertBoard", vo);
	}

	// 페이징건수조회
	public int getCount(BoardVO vo) {
		return mybatis.selectOne("board.getCount", vo);
	}

	// 수정
	public void updateBoard(BoardVO vo) {
		System.out.println("mybatis jdbc updateBoard() 기능처리");
		mybatis.update("updateBoard", vo);
	}

	// 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("mybatis jdbc deleteBoard() 기능처리");
		mybatis.update("deleteBoard", vo.getBoardNumber());
	}

	// 선택삭제
	public void deleteBoardList(BoardVO vo) {
		System.out.println("mybatis jdbc deleteBoardList() 기능처리");
		mybatis.update("board.deleteBoardList", vo);
	}

	// 전체조회
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("mybatis jdbc getBoardList() 기능처리");
		return mybatis.selectList("board.getBoardList", vo);
	}

	// 단건조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("spring jdbc getBoard() 기능처리");
		return mybatis.selectOne("getBoard", vo);
	}

	// 게시글조회수증가
	public void updateBoardHits(BoardVO vo) {
		System.out.println("mybatis jdbc updateBoardHits() 기능처리");
		mybatis.update("updateBoardHits", vo);
	}

	// 좋아요증가
	public void insertLikecheck(BoardVO vo) {
		System.out.println("mybatis jdbc insertLikecheck() 기능처리");
		mybatis.update("insertLikecheck", vo);
	}
	
	// 좋아요취소
		public void deleteLikecheck(BoardVO vo) {
			System.out.println("mybatis jdbc deleteLikecheck() 기능처리");
			mybatis.update("deleteLikecheck", vo);
		}
}
