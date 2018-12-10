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
	public void insertPurchase(PurchaseVO vo) {
		dao.insertPurchase(vo);
	}
}
