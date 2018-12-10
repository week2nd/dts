package com.company.dts.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.dts.info.MatchVO;
import com.company.dts.info.MatchVO;

@Repository
public class MatchDAO {

	@Autowired 
	private SqlSessionTemplate mybatis;
	
	// 전체 조회
	public List<MatchVO> getMatchList(MatchVO vo) {
		return mybatis.selectList("match.getMatchList", vo);
	}
	// 단일 조회
	
	public MatchVO getMatch(MatchVO vo) {
		return mybatis.selectOne("player.getPlayer", vo);
	};
	
	// 등록
	
	public void insertMatch(MatchVO vo) {
		mybatis.update("match.insertMatch", vo);
	}
	
	// 수정
	public void updateMatch(MatchVO vo) {
		mybatis.update("match.updateMatch", vo);
	}
	
	// 삭제
	public void deletePlayer(MatchVO vo) {
		mybatis.update("match.deleteMatch", vo);
	}
	
}
