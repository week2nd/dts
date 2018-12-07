package com.company.dts.info.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.dts.info.PlayerService;
import com.company.dts.info.PlayerVO;
import com.company.dts.info.TeamService;
import com.company.dts.info.TeamVO;

@Controller
public class InfoController {

	@Autowired
	PlayerService playerService;
	@Autowired 
	TeamService teamService; 

	// 선수 전체 조회
	@RequestMapping("/getPlayerList")
	public String getPlayerList(Model model, PlayerVO vo) {
		model.addAttribute("playerList", playerService.getPlayerList(vo));
		System.out.println("Controller Info에서");
		return "info/getPlayerList";
	}

	// 선수 단일 조회
	@RequestMapping("/getPlayer")
	public String getPlayer(Model model, PlayerVO vo) {
		model.addAttribute("player", playerService.getPlayer(vo));
		return "info/getPlayer";
	}

	// 선수 입력 폼 이동
	@RequestMapping("/insertPlayerForm")
	public String insertForm() {
		return "info/insertPlayer";
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
		model.addAttribute("player",playerService.getPlayer(vo));
		return "info/updatePlayer";
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
	// 선수 전체 조회
		@RequestMapping("/getTeamList")
		public String getTeamList(Model model, TeamVO vo) {
			model.addAttribute("teamList", teamService.getTeamList(vo));
			System.out.println("Controller Info에서");
			return "info/getTeamList";
		}


		// 선수 단일 조회
		@RequestMapping("/getTeam")
		public String getTeam(Model model, TeamVO vo) {
			model.addAttribute("team", teamService.getTeam(vo));
			return "info/getTeam";
		}

		// 선수 입력 폼 이동
		@RequestMapping("/insertTeamForm")
		public String insertTeamForm() {
			return "info/insertTeam";
		}

		// 선수 입력 처리
		@RequestMapping("/insertTeam")
		public String insertTeam(TeamVO vo) {
			teamService.insertTeam(vo);
			return "redirect:getTeamList";
		}

//		// 선수 정보 수정 폼 이동
//		@RequestMapping("/updateTeamForm")
//		public String updateTeamForm(Model model, TeamVO vo) {
//			model.addAttribute("player",teamService.getTeam(vo));
//			return "info/updateTeam";
//		}
//		
//		// 선수 정보 수정 처리
//		@RequestMapping("/updateTeam")
//		public String updateTeam(TeamVO vo) {
//			teamService.updateTeam(vo);
//			return "redirect:getTeamList";
//		}
//		
//		// 선수 정보 삭제
//		@RequestMapping("/deleteTeam")
//		public String deleteTeam(TeamVO vo) {
//			teamService.deleteTeam(vo);
//			return "redirect:getTeamList";
//		}
}	
