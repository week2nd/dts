package com.company.dts.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.board.BoardService;
import com.company.dts.board.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO dao;

	// 게시판 단건조회
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return dao.getBoard(vo);
	}

	// 게시판 전체조회
	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return dao.getBoardList(vo);
	}

	// 게시판 입력
	@Override
	public void insertBoard(BoardVO vo) {
		dao.insertBoard(vo);
		System.out.println("========== = " + vo.getBoardNumber());
	}

	// 게시판 업데이트
	@Override
	public void updateBoard(BoardVO vo) {
		dao.updateBoard(vo);

	}

	// 게시판 삭제
	@Override
	public void deleteBoard(BoardVO vo) {
		dao.deleteBoard(vo);

	}

	// 게시판 전체리스트 삭제
	@Override
	public void deleteBoardList(BoardVO vo) {
		dao.deleteBoardList(vo);

	}

	/* 페이징건수가져오기 */
	public int getCount(BoardVO vo) {
		return dao.getCount(vo);
	}

	// 조회수 추가
	@Override
	public void updateBoardHits(BoardVO vo) {
		dao.updateBoardHits(vo);
	}

	// 좋아요 추가
	@Override
	public void insertLikecheck(BoardVO vo) {
		dao.insertLikecheck(vo);
	}
	
	// 좋아요 취소
	@Override
	public void deleteLikecheck(BoardVO vo) {
		dao.deleteLikecheck(vo);
	}
}
