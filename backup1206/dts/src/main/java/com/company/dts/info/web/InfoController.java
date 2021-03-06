package com.company.dts.info.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.dts.info.PlayerService;
import com.company.dts.info.PlayerVO;

@Controller
public class InfoController {

	@Autowired PlayerService playerService;
	
	// 선수 전체 조회
	@RequestMapping("/getPlayerList")
	public String getPlayerList(Model model,PlayerVO vo) {
		model.addAttribute("playerList", playerService.getPlayerList(vo));
		System.out.println("Controller Info에서");
		return "info/getPlayerList";
	}
	
	// 선수 단일 조회
	@RequestMapping("/getPlayer")
	public String getPlayer(Model model, PlayerVO vo) {
		model.addAttribute("player",playerService.getPlayer(vo));
		return "info/getPlayer";
	}
}
