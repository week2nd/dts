package com.company.dts.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.board.BoardService;
import com.company.dts.board.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO dao;

	/*
	 * public void insertBoard(BoardVO vo) { dao.insertBoard(vo);
	 * System.out.println("========= uId ="+vo.getuId()); } public void
	 * updateBoard(BoardVO vo) { dao.updateBoard(vo); } public void
	 * deleteBoard(BoardVO vo) { dao.deleteBoard(vo); } public void
	 * deleteBoardList(BoardVO vo) { dao.deleteBoardList(vo); }
	 */
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return dao.getBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return dao.getBoardList(vo);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBoardList(BoardVO vo) {
		// TODO Auto-generated method stub

	}
}
