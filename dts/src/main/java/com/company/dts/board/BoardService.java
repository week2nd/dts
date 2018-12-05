package com.company.dts.board;

import java.util.List;
import com.company.dts.board.BoardVO;


public interface BoardService {

	public void insertBoard(BoardVO vo);
	public void updateBoard(BoardVO vo);
	public void deleteBoard(BoardVO vo);
	public BoardVO getBoard(BoardVO vo);
	public List<BoardVO> getBoardList(BoardVO vo);
	public void deleteBoardList(BoardVO vo);
}
