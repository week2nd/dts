package com.company.dts.game;

import java.util.List;

public interface GameService {
	
	public List<GameVO> getGameList(GameVO vo);
	
	public List<GameVO> getGameListAd(GameVO vo);
	
	public GameVO getGame(GameVO vo);
	
	public void insertGame(GameVO vo);
	
	public List<GameVO> updateResult(GameVO vo);

}
