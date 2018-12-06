package com.company.dts.info.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.dts.info.PlayerService;
import com.company.dts.info.PlayerVO;

@Controller
public class InfoController {

	@Autowired
	PlayerService playerService;

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
}
