package com.company.dts.info.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.company.dts.common.Paging;
import com.company.dts.info.MatchService;
import com.company.dts.info.MatchVO;
import com.company.dts.info.PlayerService;
import com.company.dts.info.PlayerVO;
import com.company.dts.info.TeamService;
import com.company.dts.info.TeamVO;
import com.company.dts.member.MemberVO;
import com.company.dts.purchase.PurchaseVO;

@Controller
public class InfoController {

	@Autowired
	PlayerService playerService;
	@Autowired
	TeamService teamService;
	@Autowired
	MatchService matchService;

	// 선수 전체 조회
	@RequestMapping("/getPlayerList")
	public String getPlayerList(Model model, PlayerVO vo, HttpSession session) {

		model.addAttribute("playerList", playerService.getPlayerList(vo));
		System.out.println("Controller Info에서");
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/info/getPlayerList";
		} else {
			return "user/info/getPlayerList";
		}
	}

	// 선수 단일 조회
	@RequestMapping("/getPlayer")
	public String getPlayer(Model model, PlayerVO vo, HttpSession session) {
		System.out.println(vo);
		model.addAttribute("player", playerService.getPlayer(vo));
		model.addAttribute("playerRecordList", playerService.playerRecordList(vo));
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/info/getPlayer";
		} else {
			return "user/info/getPlayer";
		}
	}

	// 선수 입력 폼 이동
	@RequestMapping("/insertPlayerForm")
	public String insertForm(Model model, TeamVO vo) {
		model.addAttribute("teamList", teamService.getTeamList(vo));
		return "admin/info/insertPlayer";
	}

	// 선수 입력 처리
	@RequestMapping("/insertPlayer")
	public String insertPlayer(PlayerVO vo) {
		playerService.insertPlayer(vo);
		return "redirect:getPlayerList";
	}

	// 선수 정보 수정 폼 이동
	@RequestMapping("/updatePlayerForm")
	public String updatePlayerForm(Model model, PlayerVO vo, TeamVO tvo) {
		model.addAttribute("teamList", teamService.getTeamList(tvo));
		model.addAttribute("player", playerService.getPlayer(vo));
		return "admin/info/updatePlayer";
	}

	// 선수 정보 수정 처리
	@RequestMapping("/updatePlayer")
	public String updatePlayer(PlayerVO vo) {
		playerService.updatePlayer(vo);
		return "redirect:getPlayerList";
	}

	// 선수 정보 삭제
	@RequestMapping("/deletePlayer")
	public String deletePlayer(PlayerVO vo) {
		playerService.deletePlayer(vo);
		return "redirect:getPlayerList";
	}

//		선수
//		
//		팀
	// 팀 전체 조회
	@RequestMapping("/getTeamList")
	public String getTeamList(Model model, TeamVO vo, HttpSession session) {
		model.addAttribute("teamList", teamService.getTeamList(vo));
		System.out.println("Controller Info에서");
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/info/getTeamList";
		} else {
			return "user/info/getTeamList";
		}

	}

	// 팀 단일 조회
	@RequestMapping(value= {"/getTeam"})
	public String getTeam(Model model, TeamVO vo, HttpSession session) {
		model.addAttribute("team", teamService.getTeam(vo));
		model.addAttribute("teamJoin", teamService.getTeamJoin(vo));
		model.addAttribute("vsTeam", teamService.vsTeamList(vo));
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/info/getTeam";
		} else {
			return "user/info/getTeam";
		}
	}

	// 경기 프리뷰 
	@RequestMapping("/preView")
	public String preView(Model model, TeamVO vo, HttpSession session) {
		
		/*model.addAttribute("vsTeam", teamService.vsTeamList(vo));*/
		
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/info/preView";
		} else {
			return "user/info/preView";
		}
	}

	// 팀 입력 폼 이동
	@RequestMapping("/insertTeamForm")
	public String insertTeamForm(Model model, TeamVO vo) {
		model.addAttribute("teamList", teamService.getTeamList(vo));
		return "admin/info/insertTeam";
	}

	// 팀 입력 처리
	@RequestMapping("/insertTeam")
	public String insertTeam(TeamVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/img");
		System.out.println("path==" + path);
		MultipartFile upfile = vo.getUploadFile();
		if( ! upfile.isEmpty() && upfile.getSize() > 0) {
			String filename = upfile.getOriginalFilename();
			upfile.transferTo(new File(path, filename));
			vo.setFileName(filename);
		}
		
		teamService.insertTeam(vo);
		return "redirect:getTeamList";
	}

	// 팀 정보 수정 폼 이동
	@RequestMapping("/updateTeamForm")
	public String updateTeamForm(Model model, TeamVO vo) {
		model.addAttribute("teamList", teamService.getTeamList(vo));
		model.addAttribute("team", teamService.getTeam(vo));
		return "admin/info/updateTeam";
	}

	// 팀 정보 수정 처리
	@RequestMapping("/updateTeam")
	public String updateTeam(TeamVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/img");
		MultipartFile upfile = vo.getUploadFile();
		if(! upfile.isEmpty() && upfile.getSize() > 0) {
			String filename = upfile.getOriginalFilename();
			upfile.transferTo(new File(path, filename));
			vo.setFileName(filename);
		}
		
		teamService.updateTeam(vo);
		return "redirect:getTeamList";
	}

	// 팀 정보 삭제
	@RequestMapping("/deleteTeam")
	public String deleteTeam(TeamVO vo) {
		teamService.deleteTeam(vo);
		return "redirect:getTeamList";
	}

	// 팀
	//
	// 경기

	// 경기 전체 조회
	@RequestMapping("/getMatchList")
	public ModelAndView getMatchList(MatchVO vo, HttpSession session, Paging paging) {

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

		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();

		mv.addObject("paging", paging);
		mv.addObject("matchList", matchService.getMatchList(vo));

		if (grant.equals("admin")) {
			mv.setViewName("admin/info/getMatchList");
			return mv;
		} else {
			mv.setViewName("user/info/getMatchList");
			return mv;
		}
	}

	// 경기 단일 조회
	@RequestMapping("/getMatch")
	public String getMatch(Model model, MatchVO vo, HttpSession session) {
		model.addAttribute("match", matchService.getMatch(vo));
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/info/getMatch";
		} else {
			return "user/info/getMatch";
		}
	}

	// 경기 입력 폼 이동
	@RequestMapping("/insertMatchForm")
	public String insertMatchForm(Model model, TeamVO vo) {
		model.addAttribute("teamList", teamService.getTeamList(vo));
		return "admin/info/insertMatch";
	}

	// 경기 입력 처리
	@RequestMapping("/insertMatch")
	public String insertMatch(MatchVO vo) {

		System.out.println("#####");

		matchService.insertMatch(vo);
		return "redirect:getMatchList";
	}

	// 경기 정보 수정 폼 이동
	@RequestMapping("/updateMatchForm")
	public String updateMatchForm(Model model, MatchVO vo, TeamVO tvo) {
		model.addAttribute("teamList", teamService.getTeamList(tvo));
		model.addAttribute("match", matchService.getMatch(vo));
		return "admin/info/updateMatch";
	}

	// 경기 정보 수정 처리
	@RequestMapping("/updateMatch")
	public String updateMatch(MatchVO vo) {
		matchService.updateMatch(vo);
		return "redirect:getMatchList";
	}

	// 경기 정보 삭제
	@RequestMapping("/deleteMatch")
	public String deleteMatch(MatchVO vo) {
		matchService.deleteMatch(vo);
		return "redirect:getMatchList";
	}

	// 구매페이지 전체조회
	@RequestMapping("/buyMatchList")
	public String getGameList(Model model, MatchVO vo, HttpSession session) {
		String id = ((MemberVO) session.getAttribute("membersession")).getuId();
		vo.setuId(id);
		model.addAttribute("buyMatchList", matchService.buyMatchList(vo));
		return "user/info/buyMatchList";
	}

	// 게임구매확인
	@RequestMapping(value = "buyGame", method = RequestMethod.POST)
	public String buyGameform(PurchaseVO vo) {
		return "user/info/buyMatchCheck";
	}

	// 관리자경기전체조회
	@RequestMapping("/getMatchListAd")
	public String getMatchListAd(Model model, MatchVO vo) {
		model.addAttribute("matchListAd", matchService.getMatchListAd(vo));
		return "admin/info/getMatchListAd";
	}
}
