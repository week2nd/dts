package com.company.dts.info;

import java.util.List;

public interface TeamService {
	// 등록
	public void insertTeam(TeamVO vo);
	// 수정
	public void updateTeam(TeamVO vo);
	// 단건조회
	public TeamVO getTeam(TeamVO vo);
	// 전체조회
	public List<TeamVO> getTeamList(TeamVO vo);
	// 삭제
	public void deleteTeam(TeamVO vo);
}
