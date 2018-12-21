package com.company.dts.member.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.member.MemberService;
import com.company.dts.member.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO dao;
	
	
	public void insertMember(MemberVO vo) {
		dao.insertMember(vo);
	}
	public void updateMember(MemberVO vo) {
		dao.updateMember(vo);
	}
	public void deleteMember(MemberVO vo) {
		dao.deleteMember(vo);
	}
	public void deleteMemberList(MemberVO vo) {
		dao.deleteMemberList(vo);
	}
	public MemberVO getMember(MemberVO vo) {
		return dao.getMember(vo);
	}
	public List<MemberVO> getMemberList(MemberVO vo) {		
		return dao.getMemberList(vo);
	}
	public int getCount(MemberVO vo) {		// 페이지 목록 건수조회
		return dao.getCount(vo);
	}
	public List<Map<String, Object>> getMemberListChart() {
		return dao.getMemberListChart();
	}
}
