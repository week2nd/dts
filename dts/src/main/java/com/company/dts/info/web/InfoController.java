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
	
	// 전체 조회
	@RequestMapping("/getPlayerList")
	public String getPlayerList(Model model) {
		model.addAttribute("playerList", playerService.getPlayerList());
		return "info/getPlayerList";
	}
}
