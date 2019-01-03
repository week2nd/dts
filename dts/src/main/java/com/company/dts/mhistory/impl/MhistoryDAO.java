package com.company.dts.mhistory.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.dts.mhistory.MhistoryVO;

@Repository
public class MhistoryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 마일리지 조회
	public List<MhistoryVO> getMhistoryList(MhistoryVO vo) {
		return mybatis.selectList("mhistory.getMhistoryList", vo);
	}
	
	public int getCount(MhistoryVO vo) {
		return mybatis.selectOne("mhistory.getCount", vo);
	}
	
	public List<MhistoryVO> getMhistoryListAjax(MhistoryVO vo) {
		return mybatis.selectList("mhistory.getMhistoryListAjax", vo);
	}
	
	public List<MhistoryVO> totalChart(MhistoryVO vo) {
		return mybatis.selectList("mhistory.getMhistoryList", vo);
	}
	
	public List<MhistoryVO> totalChartMileage(MhistoryVO vo) {
		return mybatis.selectList("mhistory.totalChartMileage", vo);
	}
	public List<MhistoryVO> chargeCheck(MhistoryVO vo) {
		return mybatis.selectList("mhistory.chargeCheck", vo);
	}
}
