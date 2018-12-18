package com.company.dts.info;

import java.util.List;

public interface TeamService {
	// 등록
	public void insertTeam(TeamVO vo);
	// 수정
	public void updateTeam(TeamVO vo);
	// 단건조회
	public TeamVO getTeam(TeamVO vo);

	// 팀화면에서 선수목록 조회
	public List<TeamVO> getTeamJoin(TeamVO vo);
	
	// 팀화면에서 상대전적 조회
	public List<TeamVO> vsTeamList(TeamVO vo);
	
	// 전체조회
	public List<TeamVO> getTeamList(TeamVO vo);
	// 삭제
	public void deleteTeam(TeamVO vo);
}
