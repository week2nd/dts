package com.company.dts.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.dts.info.PlayerVO;

@Repository
public class PlayerDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 선수 전체 조회
	public List<PlayerVO> getPlayerList(PlayerVO vo) {
		System.out.println("PlayerService.java.mybatis jdbc getPlayerList");
		return mybatis.selectList("player.getPlayerList", vo);
	}

	// 선수 단일 조회
	public PlayerVO getPlayer(PlayerVO vo) {
		return mybatis.selectOne("player.getPlayer", vo);
	}

}
