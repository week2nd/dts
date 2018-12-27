package com.company.dts.purchase;

import java.util.List;

public interface PurchaseService {
	
	public List<PurchaseVO> getPurchaseList(PurchaseVO vo);
	
	public List<PurchaseVO> getPurchaseListChart(PurchaseVO vo);
	
	public List<PurchaseVO> getPurchaseGameChart(PurchaseVO vo);
	
	public List<PurchaseVO> getPurchaseGameMoney(PurchaseVO vo);
	
	public List<PurchaseVO> getPurchaseTeam(PurchaseVO vo);
	
	public List<PurchaseVO> getPurchaseListAd(PurchaseVO vo);
	
	public List<PurchaseVO> setResult(PurchaseVO vo);
	
	public List<PurchaseVO> setMoney(PurchaseVO vo);
	
	public PurchaseVO getPurchase(PurchaseVO vo);
	
	public void insertPurchase(PurchaseVO vo);
	
	public int getCount(PurchaseVO vo);

}
