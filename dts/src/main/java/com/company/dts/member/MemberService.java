package com.company.dts.member;

import java.util.List;

public interface MemberService {
	public void insertMember(MemberVO vo); 
	public void updateMember(MemberVO vo);
	public void deleteMember(MemberVO vo);
	public void deleteMemberList(MemberVO vo);
	public MemberVO getMember(MemberVO vo);
	public List<MemberVO> getMemberList(MemberVO vo);
}
