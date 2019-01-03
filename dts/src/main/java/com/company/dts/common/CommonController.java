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
	
	/*
	// 관리자 맴버 전체조회
	@RequestMapping(value= "/guestMain")		//http://localhost:8081/app/getMemberList
	public ModelAndView guestMain(MatchVO vo, Paging paging, HttpSession session)  {
/*		
		ModelAndView mv = new ModelAndView();
		
		// 페이징 처리
		// 페이지번호 파라미터
		if( paging.getPage() == null) {
			paging.setPage(1); 
		}
		
		//한페이지 출력할 레코드 건수
		paging.setPageUnit(10);
		
		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		// 전체 건수
		paging.setTotalRecord(memberService.getCount(vo));
		
		mv.addObject("paging", paging);
		mv.addObject("memberList", memberService.getMemberList(vo)); // 속성명, 값
		mv.setViewName("guest/main/guestMain"); 
		
		ModelAndView mv = new ModelAndView();

		// 페이징
		// 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		else if(paging.getPage() <= 0) {
				paging.setPage(1);
		}
		

		// 페이지당 최대수
		paging.setPageUnit(5);

		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(matchService.getCount(vo));


		mv.addObject("paging", paging);
		mv.addObject("matchList", matchService.getMatchList(vo));

			mv.setViewName("guest/main/guestMain");
		return mv;
	}

	
	*/
	
	
	
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
		mv.setLast(6);
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
			mv.setLast(6);
			model.addAttribute("matchList", matchService.getMatchList(mv));
			return "user/main/userMain";

		}
	
	@RequestMapping(value="/adminMain")
	public String adminmain() {		
	return "admin/main/adminMain";
	}
	

		
	
}
