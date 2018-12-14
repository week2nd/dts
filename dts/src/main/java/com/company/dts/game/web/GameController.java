package com.company.dts.game.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.dts.game.GameService;
import com.company.dts.game.GameVO;
import com.company.dts.info.TeamService;
import com.company.dts.info.TeamVO;
import com.company.dts.member.MemberVO;
import com.company.dts.purchase.PurchaseVO;

@Controller
public class GameController {
	
	@Autowired
	GameService gameService;
	
	@Autowired
	TeamService teamService;
	
	//게임전체조회
	@RequestMapping("/getGameList")
	public String getGameList(Model model, GameVO vo, HttpSession session) {
		String id = ((MemberVO)session.getAttribute("membersession")).getuId();
		vo.setuId(id);
		model.addAttribute("gameList", gameService.getGameList(vo));
		return "user/game/getGameList";
	}
	
	/*@RequestMapping("/getGameList")
	public String getGameList(Model model, GameVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("uid");
		model.addAttribute("gameList", gameService.getGameList(vo));
		model.addAttribute("gameList", id);
		return "game/getGameList";
	}*/
	
	//게임단건조회
	@RequestMapping("/getGame")
	public String getGame(Model model, GameVO vo) {
		model.addAttribute("game", gameService.getGame(vo));
		return "user/game/getGame";
	}
	//게임추가폼
	@RequestMapping(value="/insertGame", method = RequestMethod.GET)
	public String insertGameform(Model model, GameVO vo) {
		model.addAttribute("gameList", gameService.getGameList(vo));
		TeamVO vo1 = new TeamVO();
		model.addAttribute("teamList", teamService.getTeamList(vo1));		
		return "user/game/insertGame";
	}	
	
	//게임등록
	@RequestMapping(value="insertGame", method = RequestMethod.POST)
	public String insertGame(Model model, GameVO vo) {
		gameService.insertGame(vo);
		model.addAttribute("gameList", gameService.getGameList(vo));
		return "redirect:getGameList";
	}
	//게임구매
	@RequestMapping(value="buyGame", method = RequestMethod.POST)
	public String buyGameform(PurchaseVO vo) {
		return "user/game/buyGame";
	}
	
	// 관리자게임조회
	@RequestMapping("/getGameListAd")
	public String getGameListAd(Model model, GameVO vo) {
		List<GameVO> li = new ArrayList<GameVO>();
		li = gameService.getGameListAd(vo);
		
		System.out.println("####"+li.size());
		
		for(GameVO v : li) {
			System.out.println(v.getGameDate());
			System.out.println(v.getState());
			System.out.println(v.getRedTeamId());
			
		}
		
		
		
		model.addAttribute("gameListAd", gameService.getGameListAd(vo));
		return "user/game/getGameListAd";
	}
	
	// 돈지급페이지
		@RequestMapping("/getGameListAd11")
		public String updateResult(Model model, GameVO vo) {
			model.addAttribute("gameList", gameService.getGameList(vo));
			return "redirect:getGameListAd";
		}

}
