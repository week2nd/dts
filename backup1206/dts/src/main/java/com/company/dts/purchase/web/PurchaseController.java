package com.company.dts.purchase.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.dts.purchase.PurchaseService;
import com.company.dts.purchase.PurchaseVO;

@Controller
public class PurchaseController {

	@Autowired
	PurchaseService purchaseService;
	
	// 전체조회
	@RequestMapping("/getPurchaseList")
	public String getPurchaseList(Model model, PurchaseVO vo) {
		model.addAttribute("purchaseList", purchaseService.getPurchaseList(vo));
		return "purchase/getPurchaseList";
	}
	
	// 단건조회
	@RequestMapping("/getPurchase")
	public String getPurchase(Model model, PurchaseVO vo) {
		model.addAttribute("purchase", purchaseService.getPurchase(vo));
		return "purchase/getPurchase";
	}
}
