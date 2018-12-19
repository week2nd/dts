package com.company.dts.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.company.dts.board.BoardService;
import com.company.dts.board.BoardVO;
import com.company.dts.common.Paging;

@Controller
public class BoardController {
@Autowired BoardService boardService;

	// 전체조회
	@RequestMapping(value= {"/getBoardList"}, method = RequestMethod.GET)		//http://localhost:8081/app/getBoardList
	public ModelAndView getBoardList(BoardVO vo,  Paging paging)  {
		ModelAndView mv = new ModelAndView();
		//페이징처리 - 선생님이 주신 boardcontroller 페이징에 있는것 복사해서 사용
				// 페이지번호 파라미터
		if( paging.getPage() == null) {
			paging.setPage(1);
		}	//get으로 받아온 page 가 널이면 1page를 set으로 받아온다.
		//한 페이지에 보여주는 레코드 건수, first와 last 가져오기 전에 적어줘야함
		paging.setPageUnit(5);
		//first/last	페이징 first, last 가져오는것
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		//전체 레코드 건수 구하는것(BoardVO 에 있는 내용을 vo에 담는다)
		paging.setTotalRecord(boardService.getCount(vo));
		
		mv.addObject("paging", paging);		/*페이징번호가 나오게 하는것*/
		
		mv.addObject("boardList", boardService.getBoardList(vo));
		mv.setViewName("board/getBoardList");
		return mv;
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
		
		vo.setBoardType(request.getParameter("type"));				
		
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
	public String deleteBoard(Model model, BoardVO vo, HttpServletRequest request)  {
		
		BoardVO nvo= new BoardVO();
		nvo=boardService.getBoard(vo);			//getBoard의 자료를 nvo 안에 담아놓고
		boardService.deleteBoard(vo);			//삭제처리를 한다.
		System.out.println(nvo.getBoardType());
		model.addAttribute("board", boardService.getAnalysisBoard(nvo));	//그리고 nvo 안에 담겨져 있는 type을 활용하여 AnalysisBoard를 불러온다.
		return "user/board/getAnalysisBoard";		//목록요청
	}
	

	
	// 여러개 삭제
	@RequestMapping("/deleteBoardList")
	public String deleteBoardList(BoardVO vo) {
		boardService.deleteBoardList(vo);	//여러개 삭제처리
		return "redirect:getBoardList";		//목록요청
	}
}
