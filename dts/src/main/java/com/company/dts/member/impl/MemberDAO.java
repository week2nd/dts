package com.company.dts.member.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.company.dts.member.MemberVO;

public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	/*// 등록
	public void insertMember(MemberVO vo) {
		System.out.println("mybatis insertMember() 가능 처리");
		mybatis.update("member.insertMember", vo);
	}
	// 수정
	public void updateMember(MemberVO vo) {
		System.out.println("mybatis updateMember() 가능 처리");
		mybatis.update("member.updateMember", vo);
	}
	// 삭제
	public void deleteMember(MemberVO vo) {
		System.out.println("mybatis deleteMember() 가능 처리");
		mybatis.update("member.deleteMember", vo.getuId());
	}
	// 여러개 삭제
	public void deleteMemberList(MemberVO vo) {
		System.out.println("mybatis deleteMemberList() 가능 처리");
		mybatis.update("member.deleteMemberList", vo);
	}
	*/
	//전체조회
	public List<MemberVO> getMemberList(MemberVO vo) {
		System.out.println("mybatis getMemberList() 기능 처리");
		return mybatis.selectList("member.getMemberList", vo);
	}
	//단건조회
	public MemberVO getMember(MemberVO vo) {
		System.out.println("mybatis getMember() 기능 처리");
		return mybatis.selectOne("member.getMember", vo);
		
	}
}
