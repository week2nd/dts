package com.company.dts.game.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.dts.game.GameVO;

@Repository
public class GameDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 게임리스트유저조회
	public List<GameVO> getGameList(GameVO vo) {
		return mybatis.selectList("game.getGameList", vo);
	}
	
	// 게임리스트관리자조회
		public List<GameVO> getGameListAd(GameVO vo) {
			return mybatis.selectList("game.getGameListAd", vo);
		}
	
	// 게임단건조회
	public GameVO getGame(GameVO vo) {
		return mybatis.selectOne("game.getGame", vo);
	}
	// 게임추가
	public void insertGame(GameVO vo) {
		mybatis.update("game.insertGame",vo);
	}
	
	// 돈지급
	public List<GameVO> updateResult(GameVO vo) {
		return mybatis.selectList("game.getGameList", vo);
	}
}
