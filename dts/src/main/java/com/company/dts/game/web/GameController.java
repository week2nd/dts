package com.company.dts.game.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.dts.game.GameService;
import com.company.dts.game.GameVO;
import com.company.dts.purchase.PurchaseVO;

@Controller
public class GameController {
	
	@Autowired
	GameService gameService;
	
	//게임전체조회
	@RequestMapping("/getGameList")
	public String getGameList(Model model, GameVO vo) {
		model.addAttribute("gameList", gameService.getGameList(vo));
		System.out.println("======================================================");
		return "game/getGameList";
	}
	//게임단건조회
	@RequestMapping("/getGame")
	public String getGame(Model model, GameVO vo) {
		model.addAttribute("game", gameService.getGame(vo));
		return "game/getGame";
	}
	//게임추가폼
	@RequestMapping(value="/insertGame", method = RequestMethod.GET)
	public String insertGameform(Model model, GameVO vo) {
		model.addAttribute("gameList", gameService.getGameList(vo));
		return "game/insertGame";
	}
	//게임등록
	@RequestMapping(value="insertGame", method = RequestMethod.POST)
	public String insertGame(Model model, GameVO vo) {
		gameService.insertGame(vo);
		model.addAttribute("gameList", gameService.getGameList(vo));
		return "game/getGameList";
	}
	//게임구매
	@RequestMapping("/buyGame")
	public String buyGameform(PurchaseVO vo) {
		return "game/buyGame";
	}

}
