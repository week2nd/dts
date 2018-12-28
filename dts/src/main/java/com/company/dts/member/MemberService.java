package com.company.dts.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	public void insertMember(MemberVO vo); 				// 등록
	public void updateMember(MemberVO vo);				// 수정
	public void updateMileage(MemberVO vo);				// 수정
	public void updatePw(MemberVO vo);					// 수정
	public void deleteMember(MemberVO vo);				// 삭제
	public void deleteMemberList(MemberVO vo);			// 다중선택삭제
	public MemberVO getMember(MemberVO vo);				// 단일보기
	public List<MemberVO> getMemberList(MemberVO vo);	// 다중보기
	public int getCount(MemberVO vo);					// 페이지 목록
	public List<Map<String, String>> getMemberListChart(MemberVO vo);
	
}
