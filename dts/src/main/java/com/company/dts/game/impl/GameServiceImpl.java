package com.company.dts.game.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.game.GameService;
import com.company.dts.game.GameVO;

@Service
public class GameServiceImpl implements GameService{
	
	@Autowired GameDAO dao;
	
	@Override
	public GameVO getGame(GameVO vo) {
		return dao.getGame(vo);
	}
	
	@Override
	public List<GameVO> getGameList(GameVO vo) {
		return dao.getGameList(vo);
	}
	
	@Override
	public void insertGame(GameVO vo) {
		dao.insertGame(vo);
	}

}
