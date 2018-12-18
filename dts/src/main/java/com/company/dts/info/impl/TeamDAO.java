package com.company.dts.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.dts.info.TeamVO;

@Repository
public class TeamDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 팀 전체 조회
	public List<TeamVO> getTeamList(TeamVO vo) {
		return mybatis.selectList("team.getTeamList", vo);
	}
	// 팀 단일 조회
	public TeamVO getTeam(TeamVO vo) {
		return mybatis.selectOne("team.getTeam", vo);
	}
	
	// 팀+선수 조인 조회
	public List<TeamVO> getTeamJoin(TeamVO vo) {
		return mybatis.selectList("team.getTeamJoin", vo);
	}
	
	// ..
	public List<TeamVO> vsTeamList(TeamVO vo) {
		return mybatis.selectList("team.vsTeam", vo);
	}
	
	// 팀 입력
	public void insertTeam(TeamVO vo) {
		mybatis.update("team.insertTeam", vo);
	}
	// 팀 정보 수정
	public void updateTeam(TeamVO vo) {
		mybatis.update("team.updateTeam", vo);
	}
	// 팀 삭제
	public void deleteTeam(TeamVO vo) {
		mybatis.update("team.deleteTeam", vo);
	}
}
