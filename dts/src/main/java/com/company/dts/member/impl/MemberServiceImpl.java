package com.company.dts.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dts.member.MemberVO;

@Service
public class MemberServiceImpl {
	@Autowired MemberDAO dao;
	/*public void insertMember(MemberVO vo) {
		dao.insertMember(vo);
		System.out.println("========= uId ="+vo.getuId());
	}
	public void updateMember(MemberVO vo) {
		dao.updateMember(vo);
	}
	public void deleteMember(MemberVO vo) {
		dao.deleteMember(vo);
	}
	public void deleteMemberList(MemberVO vo) {
		dao.deleteMemberList(vo);
	}*/
	public MemberVO getMember(MemberVO vo) {
		return dao.getMember(vo);
	}
	public List<MemberVO> getMemberList(MemberVO vo) {		
		return dao.getMemberList(vo);
	}
}
