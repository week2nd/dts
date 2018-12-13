package com.company.dts.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.dts.board.BoardService;
import com.company.dts.board.BoardVO;

@Controller
public class BoardController {
@Autowired BoardService boardService;
	
	// 전체조회
	@RequestMapping(value= {"/getBoardList"}
					, method = RequestMethod.GET
					)		//http://localhost:8081/app/getBoardList
	public String getBoardList(Model model, BoardVO vo)  {
		/*vo.setBoardType(boardType);*/
		model.addAttribute("boardList", boardService.getBoardList(vo));
		return "user/board/getBoardList";
	}

	
	
	// 자유게시판 전체조회
	@RequestMapping("/getFreeBoard")
	public String getFreeBoard(Model model, BoardVO vo)  {
		model.addAttribute("board", boardService.getFreeBoard(vo));
		return "user/board/getFreeBoard";
	}
	
	
	// 분석게시판 전체조회
	@RequestMapping("/getAnalysisBoard")
	public String getAnalysisBoard(Model model, BoardVO vo)  {
	model.addAttribute("board", boardService.getAnalysisBoard(vo));
		return "user/board/getAnalysisBoard";
	}
	
	// 건의게시판 전체조회
	@RequestMapping("/getSuggestionBoard")
	public String getSuggestionBoard(Model model, BoardVO vo)  {
	model.addAttribute("board", boardService.getSuggestionBoard(vo));
		return "user/board/getSuggestionBoard";
	}
	
	// 공지사항 전체조회
	@RequestMapping("/getNoticeBoard")
	public String getNoticeBoard(Model model, BoardVO vo)  {
	model.addAttribute("board", boardService.getNoticeBoard(vo));
		return "user/board/getNoticeBoard";
	}
	
	
	
	// 단건조회
	@RequestMapping("/getBoard")		
	public String getBoard(Model model, BoardVO vo) {
		model.addAttribute("board", boardService.getBoard(vo));
		return "user/board/getBoard";
	}

	// 등록폼
	@RequestMapping(value="/insertBoard" , method = RequestMethod.GET)
	public String insertBoardform() {
		return "user/board/insertBoard";
	}
		
	// 등록처리
	@RequestMapping(value="/insertBoard", method = RequestMethod.POST)
	public String insertBoard(BoardVO vo) {	// 커맨드 객체
		boardService.insertBoard(vo);		//등록처리
		return "redirect:getFreeBoard";		//목록요청
	}
	
	//수정
	@RequestMapping("/updateBoardform")
	public String updateBoardform(Model model, BoardVO vo) {
		model.addAttribute("board", boardService.getBoard(vo));
		return "user/board/updateBoard";
	}
	//수정처리
	@RequestMapping("/updateBoard")
	public String updateBoard(BoardVO vo) {
		boardService.updateBoard(vo);		//수정처리
		return "user/board/getBoardList";		//목록요청
	}
	// 단건 삭제처리
	@RequestMapping("/deleteBoard")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);		//삭제처리
		return "redirect:getBoardList";		//목록요청
	}
	// 여러개 삭제
	@RequestMapping("/deleteBoardList")
	public String deleteBoardList(BoardVO vo) {
		boardService.deleteBoardList(vo);	//여러개 삭제처리
		return "redirect:getBoardList";		//목록요청
	}
}
