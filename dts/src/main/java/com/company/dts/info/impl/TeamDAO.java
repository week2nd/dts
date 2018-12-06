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
		System.out.println("TeamService.java.mybatis jdbc getTeamList");
		return mybatis.selectList("Team.getTeamList", vo);
	}
	// 팀 단일 조회
	public TeamVO getTeam(TeamVO vo) {
		return mybatis.selectOne("Team.getTeam", vo);
	}
	// 팀 입력
	public void insertTeam(TeamVO vo) {
		mybatis.update("Team.insertTeam", vo);
	}
	// 팀 정보 수정
	public void updateTeam(TeamVO vo) {
		System.out.println("DAO updateTeam");
		mybatis.update("Team.updateTeam", vo);
	}
	// 팀 삭제
	public void deleteTeam(TeamVO vo) {
		System.out.println("DAO deleteTeam");
		mybatis.update("Team.deleteTeam", vo);
	}
}
