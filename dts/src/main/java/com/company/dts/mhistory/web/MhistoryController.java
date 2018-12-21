package com.company.dts.mhistory.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.company.dts.common.Paging;
import com.company.dts.mhistory.MhistoryService;
import com.company.dts.mhistory.MhistoryVO;
import com.company.dts.purchase.PurchaseService;
import com.company.dts.purchase.PurchaseVO;

@Controller
public class MhistoryController {
	
	@Autowired
	MhistoryService mhistoryService;
	@Autowired
	PurchaseService purchaseService;
	
	@RequestMapping(value="/getMhistoryList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getMhistoryList(MhistoryVO vo, Paging paging) {
		
		ModelAndView mv = new ModelAndView();		
		/*if (paging.getPage() == null) {
			paging.setPage(1);
		}
		
		paging.setPageUnit(10);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		paging.setTotalRecord(mhistoryService.getCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("mhistoryList", mhistoryService.getMhistoryList(vo)); // 속성명, 값
*/		mv.setViewName("admin/mhistory/getMhistoryList");
		return mv;
	}
	
	@RequestMapping(value="/getMhistoryListAjax", method = RequestMethod.POST)
	@ResponseBody
	public Map getMhistoryListAjax(MhistoryVO vo, Paging paging) {
		HashMap map = new HashMap();
		
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		
		paging.setPageUnit(15);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		paging.setTotalRecord(mhistoryService.getCount(vo));

		map.put("paging", paging);
		map.put("mhistoryList", mhistoryService.getMhistoryListAjax(vo));
		
		return map;
	}
	
	@RequestMapping(value="/totalpage", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView getMhistoryList(MhistoryVO vo) {
		ModelAndView mv = new ModelAndView();			
		mv.setViewName("admin/mhistory/totalChart");
		return mv;
	}
	
	@RequestMapping(value="/totalChart", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map totalChart(MhistoryVO vo, PurchaseVO vo1) {
		HashMap map = new HashMap();
		
		map.put("mhistoryList", mhistoryService.getMhistoryList(vo));
		map.put("purchaseList", purchaseService.getPurchaseListChart(vo1));
		
		return map;
	}

}
