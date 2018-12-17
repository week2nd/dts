package com.company.dts.board;

import java.util.List;
import com.company.dts.board.BoardVO;


public interface BoardService {

	public void insertBoard(BoardVO vo);					//게시판입력
	public void updateBoard(BoardVO vo);					//게시판업데이트
	public void deleteBoard(BoardVO vo);					//게시판삭제
	public BoardVO getBoard(BoardVO vo);					//게시판단건조회
	public List<BoardVO> getBoardList(BoardVO vo);			//게시판전체조회
	public List<BoardVO> getAnalysisBoard(BoardVO vo);		//분석게시판전체조회
	public void deleteBoardList(BoardVO vo);				//게시판전체삭제
	public int getCount(BoardVO vo);						//페이징건수가져오기
}
