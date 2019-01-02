package com.company.dts.info;

import java.util.List;

public interface MatchService {

	// 모든 경기 검색
	public List<MatchVO> getMatchList(MatchVO vo);
	
	// 구매리스트경기검색
	public List<MatchVO> buyMatchList(MatchVO vo);
	
	// 관리자경기리스트
	public List<MatchVO> getMatchListAd(MatchVO vo);
		
	// 단일 경기 검색
	public MatchVO getMatch(MatchVO vo);
	
	// 미리보기
	public MatchVO preView(MatchVO vo);
	
	// 경기결과 등록
	public void insertMatch(MatchVO vo);
	
	// 경기결과 수정
	public void updateMatch(MatchVO vo);
	
	// 경기결과 삭제
	public void deleteMatch(MatchVO vo);
	
	// 페이징
	public int getCount(MatchVO vo);
}
