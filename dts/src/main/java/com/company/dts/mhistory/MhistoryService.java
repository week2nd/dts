package com.company.dts.mhistory;

import java.util.List;

public interface MhistoryService {
	
	public List<MhistoryVO> getMhistoryList(MhistoryVO vo);
	
	public int getCount(MhistoryVO vo);

}
