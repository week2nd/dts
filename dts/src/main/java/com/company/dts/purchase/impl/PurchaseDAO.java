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
	
	// 유저구매전체조회
	public List<PurchaseVO> getPurchaseList(PurchaseVO vo) {
		return mybatis.selectList("purchase.getPurchaseList", vo);
	}
	
	// 관리자구매전체조회
		public List<PurchaseVO> getPurchaseListAd(PurchaseVO vo) {
			return mybatis.selectList("purchase.getPurchaseListAd", vo);
		}
	
	// 구매단건조회
	public PurchaseVO getPurchase(PurchaseVO vo) {
		return mybatis.selectOne("purchase.getPurchase",vo);
	}
	// 게임구매
	public void insertPurchase(PurchaseVO vo) {
		mybatis.update("purchase.insertPurchase",vo);
	}

}
