package com.company.dts.mhistory.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.mhistory.MhistoryService;
import com.company.dts.mhistory.MhistoryVO;

@Service
public class MhistoryServiceImpl implements MhistoryService {
	
	@Autowired MhistoryDAO dao;
	
	@Override
	public List<MhistoryVO> getMhistoryList(MhistoryVO vo) {
		return dao.getMhistoryList(vo);
	}
	
	@Override
	public int getCount(MhistoryVO vo) {
		return dao.getCount(vo);
	}
	
	@Override
	public List<MhistoryVO> getMhistoryListAjax(MhistoryVO vo) {
		return dao.getMhistoryListAjax(vo);
	}
}
