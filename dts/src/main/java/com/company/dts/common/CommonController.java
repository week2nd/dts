package com.company.dts.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.company.dts.info.MatchService;
import com.company.dts.info.MatchVO;
import com.company.dts.info.PlayerService;
import com.company.dts.info.TeamService;
import com.company.dts.member.MemberService;
import com.company.dts.member.MemberVO;

@Controller
public class CommonController {
	@Autowired MemberService memberService;
	
	@Autowired
	PlayerService playerService;
	@Autowired
	TeamService teamService;
	@Autowired
	MatchService matchService;

	
	
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
		mv.setViewName("guest/main/guestMain"); */
		
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

	
	
	// 경기 전체 조회
		
	public ModelAndView getMatchList(MatchVO vo, Paging paging) {

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

		mv.setViewName("guest/main/getMatchList");
		return mv;
	}
	
	
}
