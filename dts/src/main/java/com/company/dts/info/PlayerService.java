package com.company.dts.info;

import java.util.List;

public interface PlayerService {

	// 등록
	public void insertPlayer(PlayerVO vo);
	// 수정
	public void updatePlayer(PlayerVO vo);
	// 단건조회
	public PlayerVO getPlayer(PlayerVO vo);
	// 단건 조회 내 최근 경기 목록
	public List<PlayerVO> playerRecordList(PlayerVO vo);
	// 전체조회
	public List<PlayerVO> getPlayerList(PlayerVO vo);
	// 삭제
	public void deletePlayer(PlayerVO vo);
}
