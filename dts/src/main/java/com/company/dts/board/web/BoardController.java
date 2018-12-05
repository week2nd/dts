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
		model.addAttribute("boardList", boardService.getBoardList(vo));
		return "board/getBoardList";
	}
	
	// 단건조회
	@RequestMapping("/getBoard")		//http://localhost:8081/app/getBoardList
	public String getBoard(Model model, BoardVO vo) {
		model.addAttribute("board", boardService.getBoard(vo));
		return "board/getBoard";
	}

/*	// 등록폼
	@RequestMapping(value="/insertBoard" , method = RequestMethod.GET)
	public String insertBoardform() {
		return "board/insertBoard";
	}
		
	// 등록처리
	@RequestMapping(value="/insertBoard", method = RequestMethod.POST)
	public String insertBoard(BoardVO vo) {	// 커맨드 객체
		boardService.insertBoard(vo);		//등록처리
		return "redirect:getBoardList";		//목록요청
	}
	
	//수정
	@RequestMapping("/updateBoardform")
	public String updateBoardform(Model model, BoardVO vo) {
		model.addAttribute("board", boardService.getBoard(vo));
		return "board/updateBoard";
	}
	//수정처리
	@RequestMapping("/updateBoard")
	public String updateBoard(BoardVO vo) {
		boardService.updateBoard(vo);		//수정처리
		return "redirect:getBoardList";		//목록요청
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
	}*/
}
