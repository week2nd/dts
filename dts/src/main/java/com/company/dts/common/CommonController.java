package com.company.dts.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.dts.board.BoardService;
import com.company.dts.board.BoardVO;
import com.company.dts.info.MatchService;
import com.company.dts.info.MatchVO;
import com.company.dts.info.PlayerService;
import com.company.dts.info.TeamService;
import com.company.dts.member.MemberService;

@Controller
public class CommonController {
	@Autowired MemberService memberService;
	
	@Autowired
	PlayerService playerService;
	@Autowired
	TeamService teamService;
	@Autowired
	MatchService matchService;

	@Autowired
	BoardService boardService;

	// 도움
	@RequestMapping("/helper")
	public String helper() {
		return "user/common/helper";
	}
	
	
	// 전체조회(getAnalysisBoard)
	@RequestMapping("/guestMain")
	public String getAnalysisBoard(Model model, BoardVO vo, HttpServletRequest request,
			HttpSession session) {

		// 공지사항
		vo.setFirst(1); // 게시판 숫자에 따라서 first, last 값 가져옴
		vo.setLast(5);
		vo.setBoardType("notice"); // homeUser의 게시판 클릭시 type 받아오는 Parameter
		model.addAttribute("noticeboard", boardService.getBoardList(vo)); // getAnalysisBoard 실행
		
		// suggestion
		vo.setFirst(1); // 게시판 숫자에 따라서 first, last 값 가져옴
		vo.setLast(5);
		vo.setBoardType("suggestion"); // homeUser의 게시판 클릭시 type 받아오는 Parameter
		model.addAttribute("suggestionboard", boardService.getBoardList(vo)); // getAnalysisBoard 실행
		
		// free
		vo.setFirst(1); // 게시판 숫자에 따라서 first, last 값 가져옴
		vo.setLast(5);
		vo.setBoardType("free"); // homeUser의 게시판 클릭시 type 받아오는 Parameter
		model.addAttribute("freeboard", boardService.getBoardList(vo)); // getAnalysisBoard 실행
		
		// analysis
		vo.setFirst(1); // 게시판 숫자에 따라서 first, last 값 가져옴
		vo.setLast(5);
		vo.setBoardType("analysis"); // homeUser의 게시판 클릭시 type 받아오는 Parameter
		model.addAttribute("analysisboard", boardService.getBoardList(vo)); // getAnalysisBoard 실행
				
		MatchVO mv = new MatchVO();
		mv.setFirst(1); // 게시판 숫자에 따라서 first, last 값 가져옴
		mv.setLast(4);
		model.addAttribute("matchList", matchService.getMatchList(mv));
		return "guest/main/guestMain";

	}
	
	// 전체조회(getAnalysisBoard)
		@RequestMapping("/userMain")
		public String getAnalysisBoardUser(Model model, BoardVO vo, HttpServletRequest request,
				HttpSession session) {

			// 공지사항
			vo.setFirst(1); // 게시판 숫자에 따라서 first, last 값 가져옴
			vo.setLast(5);
			vo.setBoardType("notice"); // homeUser의 게시판 클릭시 type 받아오는 Parameter
			model.addAttribute("noticeboard", boardService.getBoardList(vo)); // getAnalysisBoard 실행
			
			// suggestion
			vo.setFirst(1); // 게시판 숫자에 따라서 first, last 값 가져옴
			vo.setLast(5);
			vo.setBoardType("suggestion"); // homeUser의 게시판 클릭시 type 받아오는 Parameter
			model.addAttribute("suggestionboard", boardService.getBoardList(vo)); // getAnalysisBoard 실행
			
			// free
			vo.setFirst(1); // 게시판 숫자에 따라서 first, last 값 가져옴
			vo.setLast(5);
			vo.setBoardType("free"); // homeUser의 게시판 클릭시 type 받아오는 Parameter
			model.addAttribute("freeboard", boardService.getBoardList(vo)); // getAnalysisBoard 실행
			
			// analysis
			vo.setFirst(1); // 게시판 숫자에 따라서 first, last 값 가져옴
			vo.setLast(5);
			vo.setBoardType("analysis"); // homeUser의 게시판 클릭시 type 받아오는 Parameter
			model.addAttribute("analysisboard", boardService.getBoardList(vo)); // getAnalysisBoard 실행
					
			MatchVO mv = new MatchVO();
			mv.setFirst(1); // 게시판 숫자에 따라서 first, last 값 가져옴
			mv.setLast(4);
			model.addAttribute("matchList", matchService.getMatchList(mv));
			return "user/main/userMain";

		}
	
	@RequestMapping(value="/adminMain")
	public String adminmain() {		
	return "admin/main/adminMain";
	}
	

		
	
}
