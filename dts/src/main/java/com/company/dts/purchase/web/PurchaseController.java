package com.company.dts.purchase.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.dts.member.MemberVO;
import com.company.dts.purchase.PurchaseService;
import com.company.dts.purchase.PurchaseVO;

@Controller
public class PurchaseController {

	@Autowired
	PurchaseService purchaseService;
	
	// 유저구매전체조회
	@RequestMapping("/getPurchaseList")
	public String getPurchaseList(Model model, PurchaseVO vo, HttpSession session) {
		String uId = ((MemberVO)session.getAttribute("membersession")).getuId();
		vo.setuId(uId);
		model.addAttribute("purchaseList", purchaseService.getPurchaseList(vo));
		return "user/purchase/getPurchaseList";
	}
	
	// 유저구매전체조회
		@RequestMapping("/getPurchaseListAd")
		public String getPurchaseList(Model model, PurchaseVO vo) {
			model.addAttribute("purchaseList", purchaseService.getPurchaseListAd(vo));
			return "user/purchase/getPurchaseListAd";
		}
	
	// 단건 조회
	@RequestMapping("/getPurchase")
	public String getPurchase(Model model, PurchaseVO vo, HttpSession session) {
		String id = ((MemberVO)session.getAttribute("membersession")).getuId();
		vo.setuId(id);
		model.addAttribute("purchaseList", purchaseService.getPurchaseList(vo));
		return "user/purchase/getPurchaseList";
	}
	
	
	
	// 단건조회
	/*@RequestMapping("/getPurchase")
	public String getPurchase(Model model, PurchaseVO vo, HttpSession session) {
		String id = ((MemberVO)session.getAttribute("membersession")).getuId();
		vo.setuId(id);
		model.addAttribute("purchase", purchaseService.getPurchase(vo));
		return "user/purchase/getPurchase";
	}*/
	
	// 구매완료등록
	@RequestMapping(value="insertPurchase", method = RequestMethod.POST)
	public String insertPurchase(Model model, PurchaseVO vo) {
		purchaseService.insertPurchase(vo);
		return "redirect:getPurchaseList";
	}
}
