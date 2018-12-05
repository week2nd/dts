package com.company.dts.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.info.PlayerService;
import com.company.dts.info.PlayerVO;

@Service
public class PlayerServiceImpl implements PlayerService{
	
//	@Autowired PlayerDAO dao;
	@Autowired PlayerDAOMybatis dao;

	//등록
	@Override
	public void insertPlayer() {
	}

	//수정
	@Override
	public void updatePlayer() {
	}

	//단건 조회
	@Override
	public PlayerVO getPlayer() {
		return null;
	}
	
//	전체 조회
	@Override
	public List<PlayerVO> getPlayerList(PlayerVO vo) {
		return dao.getPlayerList(vo);
	}
	
}
