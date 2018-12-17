package com.company.dts.info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.info.MatchService;
import com.company.dts.info.MatchVO;

@Service
public class MatchServiceImpl implements MatchService {

	@Autowired MatchDAO dao;
	// 등록
		@Override
		public void insertMatch(MatchVO vo) {
			System.out.println("MatchServiceImpl insertmatch"+ '\n');
			dao.insertMatch(vo);
		}

		// 수정
		@Override
		public void updateMatch(MatchVO vo) {
			System.out.println("MatchServiceImpl updatematch"+ '\n');
			dao.updateMatch(vo);
		}

		// 단건 조회
		@Override
		public MatchVO getMatch(MatchVO vo) {
			System.out.println("MatchServiceImpl getMatch"+'\n');
			return dao.getMatch(vo);
		}

//		전체 조회
		@Override
		public List<MatchVO> getMatchList(MatchVO vo) {
			System.out.println("MatchServiceImpl getMatchList 진행중" + '\n' + "=");
			return dao.getMatchList(vo);
		}
		
		// 구매페이지 전체조회
		public List<MatchVO> buyMatchList(MatchVO vo) {
			return dao.buyMatchList(vo);
		}
		
		// 관리자경기전체조회
		public List<MatchVO> getMatchListAd(MatchVO vo) {
			return dao.getMatchListAd(vo);
		}

		// 삭제
		@Override
		public void deleteMatch(MatchVO vo) {
			System.out.println("ServiceImpl deletematch");
			dao.deleteMatch(vo);
		}

}
