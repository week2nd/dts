package com.company.dts.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.member.MemberService;
import com.company.dts.member.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO dao;

	/*
	 * public void insertMember(MemberVO vo) { dao.insertMember(vo);
	 * System.out.println("========= uId ="+vo.getuId()); } public void
	 * updateMember(MemberVO vo) { dao.updateMember(vo); } public void
	 * deleteMember(MemberVO vo) { dao.deleteMember(vo); } public void
	 * deleteMemberList(MemberVO vo) { dao.deleteMemberList(vo); }
	 */
	@Override
	public MemberVO getMember(MemberVO vo) {
		return dao.getMember(vo);
	}

	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		return dao.getMemberList(vo);
	}

	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteMember(MemberVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteMemberList(MemberVO vo) {
		// TODO Auto-generated method stub

	}
}
