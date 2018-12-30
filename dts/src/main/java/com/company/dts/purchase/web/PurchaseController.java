package com.company.dts.purchase.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.company.dts.common.Paging;
import com.company.dts.member.MemberService;
import com.company.dts.member.MemberVO;
import com.company.dts.purchase.PurchaseService;
import com.company.dts.purchase.PurchaseVO;

@Controller
public class PurchaseController {

	@Autowired
	PurchaseService purchaseService;
	@Autowired
	MemberService memberSerivce;

	// 유저구매전체조회
	@RequestMapping("/getPurchaseList")
	public String getPurchaseList(Model model, PurchaseVO vo, HttpSession session) {
		String uId = ((MemberVO) session.getAttribute("membersession")).getuId();
		vo.setuId(uId);
		model.addAttribute("purchaseList", purchaseService.getPurchaseList(vo));
		return "user/purchase/getPurchaseList";
	}

	/*
	 * // 유저구매전체조회
	 * 
	 * @RequestMapping("/getPurchaseListAd") 
	 * public String getPurchaseList(Model model, PurchaseVO vo) { 
	 * model.addAttribute("purchaseList", purchaseService.getPurchaseListAd(vo)); 
	 * return "user/purchase/getPurchaseListAd";
	 * }
	 */
	@RequestMapping("/getPurchaseListAd")
	public ModelAndView getPurchaseList(PurchaseVO vo, Paging paging) {

		ModelAndView mv = new ModelAndView();

		// 페이징 처리
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		// 한페이지 출력할 레코드 건수
		paging.setPageUnit(10);

		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		// 전체 건수
		paging.setTotalRecord(purchaseService.getCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("purchaseList", purchaseService.getPurchaseListAd(vo)); // 속성명, 값
		mv.setViewName("admin/purchase/getPurchaseListAd");
		return mv;
	}

	// 단건 조회
	@RequestMapping("/getPurchase")
	public String getPurchase(Model model, PurchaseVO vo, HttpSession session) {
		String id = ((MemberVO) session.getAttribute("membersession")).getuId();
		vo.setuId(id);
		model.addAttribute("purchaseList", purchaseService.getPurchaseList(vo));
		return "user/purchase/getPurchaseList";
	}

	// 단건조회
	/*
	 * @RequestMapping("/getPurchase") public String getPurchase(Model model,
	 * PurchaseVO vo, HttpSession session) { String id =
	 * ((MemberVO)session.getAttribute("membersession")).getuId(); vo.setuId(id);
	 * model.addAttribute("purchase", purchaseService.getPurchase(vo)); return
	 * "user/purchase/getPurchase"; }
	 */

	// 구매완료등록
	@RequestMapping(value = "insertPurchase", method = RequestMethod.POST)
	public String insertPurchase(Model model, PurchaseVO vo, HttpSession session) {
		MemberVO vo1 = new MemberVO();
		vo1.setuId(vo.getuId());
		purchaseService.insertPurchase(vo);
		MemberVO membervo = memberSerivce.getMember(vo1);
		
		session.setAttribute("membersession", membervo);
		return "redirect:getPurchaseList";
	}

	
	// 경기결과처리
	@RequestMapping(value = "setResult", method = RequestMethod.POST)
	public String setResult(PurchaseVO vo, HttpServletResponse response) throws IOException {
		purchaseService.setResult(vo);
		return "redirect:getMatchListAd";
	}

	// 경기결과처리
	@RequestMapping(value = "setMoney", method = RequestMethod.POST)
	public String setMoney(PurchaseVO vo) {
		purchaseService.setMoney(vo);
		return "redirect:getMatchListAd";
	}
	
	//충전페이지
	@RequestMapping(value="/payChargePage")
	public String pay() {
		return "user/common/pay";
	}
	
	
	// 마일리지 충전페이지
	@RequestMapping(value="/payCharge")
	public String payCharge(HttpSession session) {
		MemberVO vo = new MemberVO();
		String id = ((MemberVO) session.getAttribute("membersession")).getuId();
		vo.setuId(id);
		System.out.println(id+"@@@@@@@@");
		
		MemberVO membervo = memberSerivce.getMember(vo);		
		session.setAttribute("membersession", membervo);
		
		return "redirect:payChargePage";
	}
			

}
