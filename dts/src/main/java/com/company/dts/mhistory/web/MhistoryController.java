package com.company.dts.mhistory.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.company.dts.common.Paging;
import com.company.dts.mhistory.MhistoryService;
import com.company.dts.mhistory.MhistoryVO;

@Controller
public class MhistoryController {
	
	@Autowired
	MhistoryService mhistoryService;
	
	@RequestMapping(value="/getMhistoryList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getMhistoryList(MhistoryVO vo, Paging paging) {
		
		ModelAndView mv = new ModelAndView();
		
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		
		paging.setPageUnit(10);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		paging.setTotalRecord(mhistoryService.getCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("mhistoryList", mhistoryService.getMhistoryList(vo)); // 속성명, 값
		mv.setViewName("admin/mhistory/getMhistoryList");
		return mv;
	}
	
	@RequestMapping(value="/getMhistoryListAjax", method = RequestMethod.POST)
	@ResponseBody
	public List<MhistoryVO> getMhistoryListAjax() {
			return mhistoryService.getMhistoryListAjax(null);
	}

}
