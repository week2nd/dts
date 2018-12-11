package com.company.dts.member.impl;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.dts.member.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	

	
	// 회원가입 등록
	public void insertMember(MemberVO vo) {
		System.out.println("mybatis insertMember() 가능 처리");
		mybatis.update("member.insertMember", vo);
	}
	// 관리자 맴버 수정
	public void updateMember(MemberVO vo) {
		System.out.println("mybatis updateMember() 가능 처리");
		mybatis.update("member.updateMember", vo);
	}
	// 관리자 맴버 단일 삭제
	public void deleteMember(MemberVO vo) {
		System.out.println("mybatis deleteMember() 가능 처리");
		mybatis.update("member.deleteMember", vo);
	}
	// 관리자 맴버 여러개 삭제
	public void deleteMemberList(MemberVO vo) {
		System.out.println("mybatis deleteMemberList() 가능 처리");
		mybatis.update("member.deleteMemberList", vo);
	}
	
	// 관리자 맴버 전체조회
	public List<MemberVO> getMemberList(MemberVO vo) {
		System.out.println("mybatis getMemberList() 기능 처리");
		return mybatis.selectList("member.getMemberList", vo);
	}
	// 관리자 맴버 단건조회
	public MemberVO getMember(MemberVO vo) {
		System.out.println("mybatis getMember() 기능 처리");
		return mybatis.selectOne("member.getMember", vo);
		
	}
}
