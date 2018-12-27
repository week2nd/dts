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
	
	public List<PurchaseVO> getPurchaseListChart(PurchaseVO vo) {
		return mybatis.selectList("purchase.getPurchaseListChart", vo);
	}
	
	public List<PurchaseVO> getPurchaseGameChart(PurchaseVO vo) {
		return mybatis.selectList("purchase.getPurchaseGameChart", vo);
	}
	
	public List<PurchaseVO> getPurchaseGameMoney(PurchaseVO vo) {
		return mybatis.selectList("purchase.getPurchaseGameMoney", vo);
	}
	
	public List<PurchaseVO> getPurchaseTeam(PurchaseVO vo) {
		return mybatis.selectList("purchase.getPurchaseTeam", vo);
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
	
	// 게임티켓결과처리
	public List<PurchaseVO> setResult(PurchaseVO vo) {
		return mybatis.selectList("purchase.setResult", vo);
	}
	
	// 게임적중금액처리
	public List<PurchaseVO> setMoney(PurchaseVO vo) {
		return mybatis.selectList("purchase.setMoney", vo);
	}
	// 건수
	public int getCount(PurchaseVO vo) {
		return mybatis.selectOne("purchase.getCount", vo);
	}
	
}
