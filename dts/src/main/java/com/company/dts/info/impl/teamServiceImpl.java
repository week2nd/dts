package com.company.dts.info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.info.TeamService;
import com.company.dts.info.TeamVO;

@Service
public class teamServiceImpl implements TeamService {

	@Autowired
	TeamDAO dao;

	// 등록
	@Override
	public void insertTeam(TeamVO vo) {
		System.out.println("TeamServiceImpl insertplayer" + '\n');
		dao.insertTeam(vo);
	}

	// 수정
	@Override
	public void updateTeam(TeamVO vo) {
		System.out.println("TeamServiceImpl updateplayer" + '\n');
		dao.updateTeam(vo);
	}

	// 단건 조회
	@Override
	public TeamVO getTeam(TeamVO vo) {
		System.out.println("TeamServiceImpl getTeam" + '\n');
		return dao.getTeam(vo);
	}

//	전체 조회
	@Override
	public List<TeamVO> getTeamList(TeamVO vo) {
		System.out.println("TeamServiceImpl getTeamList 진행중" + '\n' + "=");
		return dao.getTeamList(vo);
	}

	// 삭제
	@Override
	public void deleteTeam(TeamVO vo) {
		System.out.println("ServiceImpl deleteplayer");
		dao.deleteTeam(vo);
	}
}
