package com.company.dts.purchase;

import java.util.List;

public interface PurchaseService {
	
	public List<PurchaseVO> getPurchaseList(PurchaseVO vo);
	
	public PurchaseVO getPurchase(PurchaseVO vo);
}
