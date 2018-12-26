package com.company.dts.purchase.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.purchase.PurchaseService;
import com.company.dts.purchase.PurchaseVO;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired PurchaseDAO dao;
	
	@Override
	public PurchaseVO getPurchase(PurchaseVO vo) {
		return dao.getPurchase(vo);
	}
	
	@Override
	public List<PurchaseVO> getPurchaseList(PurchaseVO vo) {
		return dao.getPurchaseList(vo);
	}
	
	@Override
	public List<PurchaseVO> getPurchaseListChart(PurchaseVO vo) {
		return dao.getPurchaseListChart(vo);
	}
	
	@Override
	public List<PurchaseVO> getPurchaseListAd(PurchaseVO vo) {
		return dao.getPurchaseListAd(vo);
	}
	
	@Override
	public void insertPurchase(PurchaseVO vo) {
		dao.insertPurchase(vo);
	}
	
	@Override
	public List<PurchaseVO> setResult(PurchaseVO vo) {
		return dao.setResult(vo);
	}
	
	@Override
	public List<PurchaseVO> setMoney(PurchaseVO vo) {
		return dao.setMoney(vo);
	}
	
	@Override
	public int getCount(PurchaseVO vo) {
		return dao.getCount(vo);
	}
	
	@Override
	public int checkSetResult(PurchaseVO vo) {
		return dao.checkSetResult(vo);
	}
}
