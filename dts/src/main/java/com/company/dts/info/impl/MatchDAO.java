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
	
	// 전체구매페이지리스트조회
	public List<MatchVO> buyMatchList(MatchVO vo) {
		return mybatis.selectList("match.buyMatchList", vo);
	}
	
	// 관리가경기전체조회
	public List<MatchVO> getMatchListAd(MatchVO vo) {
		return mybatis.selectList("match.getMatchListAd", vo);
	}
	
	// 단일 조회
	
	public MatchVO getMatch(MatchVO vo) {
		return mybatis.selectOne("match.getMatch", vo);
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
	public void deleteMatch(MatchVO vo) {
		mybatis.update("match.deleteMatch", vo);
	}
	
}
