package com.company.dts.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.filters.RequestFilter;
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

	
	// 단건조회
	@RequestMapping("/getBoard")		
	public String getBoard(Model model, BoardVO vo) {
		model.addAttribute("board", boardService.getBoard(vo));
		return "user/board/getBoard";
	}
	
	// 분석게시판 전체조회
	@RequestMapping("/getAnalysisBoard")
	public String getAnalysisBoard(Model model, BoardVO vo, HttpServletRequest request)  {
		
		vo.setBoardType(request.getParameter("type"));		//homeuser의 타입을 받아온다.		
		
		model.addAttribute("type", request.getParameter("type"));
		model.addAttribute("board", boardService.getAnalysisBoard(vo));
		return "user/board/getAnalysisBoard";
	}
	

	// 등록폼
	@RequestMapping(value="/insertBoardform" , method = RequestMethod.GET )
	public String insertBoardform(Model model, HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type"); 
		
		model.addAttribute("type", type);
		return "user/board/insertBoard";
	}
		
	// 등록처리
		@RequestMapping( value="/insertBoard", method = RequestMethod.POST)
		public String insertBoard(Model model, BoardVO vo ) {	// 커맨드 객체
			boardService.insertBoard(vo);		//등록처리
			
			String type = vo.getBoardType();	
			String map = "";
			model.addAttribute("board", boardService.getAnalysisBoard(vo));			//모델객체를 view에 전달
			if(type.equals("free")) {
				map = "user/board/getAnalysisBoard";
			} else if(type.equals("analysis")) {
				map = "user/board/getAnalysisBoard";
			} else if(type.equals("suggestion")) {
				map = "user/board/getAnalysisBoard";
			} else if(type.equals("notice")) {
				map = "user/board/getAnalysisBoard";
			} 
					
			return map;
		}
	
	
	
		
	
	//수정
	@RequestMapping("/updateBoardform")
	public String updateBoardform(Model model, BoardVO vo) {	
		model.addAttribute("board", boardService.getBoard(vo));
		return "user/board/updateBoard";
	}
	
	//수정처리
	@RequestMapping("/updateBoard")
	public String updateBoard(Model model, BoardVO vo) {
		boardService.updateBoard(vo);		//수정처리
		model.addAttribute("board", boardService.getBoard(vo));
		return "user/board/getBoard";		//목록요청
	}
		
	
	
	
	// 단건 삭제처리
	@RequestMapping("/deleteBoard")
	public String deleteBoard(Model model, BoardVO vo) {
		boardService.deleteBoard(vo);			//삭제처리
		return "redirect:getBoardList";		//목록요청
	}
	
	
	// 여러개 삭제
	@RequestMapping("/deleteBoardList")
	public String deleteBoardList(BoardVO vo) {
		boardService.deleteBoardList(vo);	//여러개 삭제처리
		return "redirect:getBoardList";		//목록요청
	}
}
