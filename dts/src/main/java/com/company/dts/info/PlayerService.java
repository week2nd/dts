package com.company.dts.info;

import java.util.List;

public interface PlayerService {

	// 등록
	public void insertPlayer();
	// 수정
	public void updatePlayer();
	// 단건조회
	public PlayerVO getPlayer();
	// 전체조회
	public List<PlayerVO> getPlayerList(PlayerVO vo);
}
