package com.company.dts.purchase.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.dts.purchase.PurchaseVO;

@Repository
public class PurchaseDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 구매전체조회
	public List<PurchaseVO> getPurchaseList(PurchaseVO vo) {
		return mybatis.selectList("purchase.getPurchaseList", vo);
	}
	
	// 구매단건조회
	public PurchaseVO getPurchase(PurchaseVO vo) {
		return mybatis.selectOne("purchase.getPurchase",vo);
	}

}
