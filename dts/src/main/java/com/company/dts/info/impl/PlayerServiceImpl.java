package com.company.dts.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.info.PlayerService;
import com.company.dts.info.PlayerVO;

@Service
public class PlayerServiceImpl implements PlayerService {

	@Autowired	PlayerDAO dao;

	// 등록
	@Override
	public void insertPlayer(PlayerVO vo) {
		System.out.println("PlayerServiceImpl insertplayer"+ '\n');
		dao.insertPlayer(vo);
	}

	// 수정
	@Override
	public void updatePlayer(PlayerVO vo) {
		System.out.println("PlayerServiceImpl updateplayer"+ '\n');
		dao.updatePlayer(vo);
	}

	// 단건 조회
	@Override
	public PlayerVO getPlayer(PlayerVO vo) {
		System.out.println("PlayerServiceImpl getPlayer"+'\n');
		return dao.getPlayer(vo);
	}

//	전체 조회
	@Override
	public List<PlayerVO> getPlayerList(PlayerVO vo) {
		System.out.println("PlayerServiceImpl getPlayerList 진행중" + '\n' + "=");
		return dao.getPlayerList(vo);
	}

}
