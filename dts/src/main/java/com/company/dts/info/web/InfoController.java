package com.company.dts.info.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.dts.info.MatchService;
import com.company.dts.info.MatchVO;
import com.company.dts.info.PlayerService;
import com.company.dts.info.PlayerVO;
import com.company.dts.info.TeamService;
import com.company.dts.info.TeamVO;
import com.company.dts.info.impl.MatchServiceImpl;

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
	public String getPlayerList(Model model, PlayerVO vo) {
		model.addAttribute("playerList", playerService.getPlayerList(vo));
		System.out.println("Controller Info에서");
		return "user/info/getPlayerList";
	}
	
	// 선수 단일 조회
	@RequestMapping("/getPlayer")
	public String getPlayer(Model model, PlayerVO vo) {
		model.addAttribute("player", playerService.getPlayer(vo));
		return "user/info/getPlayer";
	}

	// 선수 입력 폼 이동
	@RequestMapping("/insertPlayerForm")
	public String insertForm() {
		return "user/info/insertPlayer";
	}

	// 선수 입력 처리
	@RequestMapping("/insertPlayer")
	public String insertPlayer(PlayerVO vo) {
		playerService.insertPlayer(vo);
		return "redirect:getPlayerList";
	}

	// 선수 정보 수정 폼 이동
	@RequestMapping("/updatePlayerForm")
	public String updatePlayerForm(Model model, PlayerVO vo) {
		model.addAttribute("player", playerService.getPlayer(vo));
		return "user/info/updatePlayer";
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
	public String getTeamList(Model model, TeamVO vo) {
		model.addAttribute("teamList", teamService.getTeamList(vo));
		System.out.println("Controller Info에서");
		return "user/info/getTeamList";
	}

	// 팀 단일 조회
	@RequestMapping("/getTeam")
	public String getTeam(Model model, TeamVO vo) {
		model.addAttribute("team", teamService.getTeam(vo));
		return "user/info/getTeam";
	}

	// 팀 입력 폼 이동
	@RequestMapping("/insertTeamForm")
	public String insertTeamForm() {
		return "user/info/insertTeam";
	}

	// 팀 입력 처리
	@RequestMapping("/insertTeam")
	public String insertTeam(TeamVO vo) {
		teamService.insertTeam(vo);
		return "redirect:getTeamList";
	}

	// 팀 정보 수정 폼 이동
	@RequestMapping("/updateTeamForm")
	public String updateTeamForm(Model model, TeamVO vo) {
		model.addAttribute("team", teamService.getTeam(vo));
		return "user/info/insertTeam";
	}

	// 팀 정보 수정 처리
	@RequestMapping("/updateTeam")
	public String updateTeam(TeamVO vo) {
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
	public String getMatchList(Model model, MatchVO vo) {
		model.addAttribute("matchList", matchService.getMatchList(vo));
		System.out.println("Controller Info에서");
		return "user/info/getMatchList";
	}

	// 경기 단일 조회
	@RequestMapping("/getMatch")
	public String getMatch(Model model, MatchVO vo) {
		model.addAttribute("match", matchService.getMatch(vo));
		return "user/info/getMatch";
	}

	// 경기 입력 폼 이동
	@RequestMapping("/insertMatchForm")
	public String insertMatchForm() {
		return "user/info/insertMatch";
	}

	// 경기 입력 처리
	@RequestMapping("/insertMatch22")
	public void insertMatch(MatchVO vo, HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("#####");
		
		matchService.insertMatch(vo);
		//return "redirect:getMatchList";
	}

	// 경기 정보 수정 폼 이동
	@RequestMapping("/updateMatchForm")
	public String updateMatchForm(Model model, MatchVO vo) {
		model.addAttribute("match", matchService.getMatch(vo));
		return "user/info/updateMatch";
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
}
