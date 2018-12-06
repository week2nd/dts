package com.company.dts.member.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.dts.member.MemberService;
import com.company.dts.member.MemberVO;

@Controller
public class MemberController {
	@Autowired MemberService memberService;
	
	// 전체조회
	@RequestMapping(value= {"/getMemberList", "/getListMemeber", "/getMembers"}
					, method = RequestMethod.GET
					)		//http://localhost:8081/app/getMemberList
	public String getMemberList(Model model, MemberVO vo)  {
		model.addAttribute("memberList", memberService.getMemberList(vo));
		return "member/getMemberList";
	}
	
	// 단건조회
	@RequestMapping("/getMember")		//http://localhost:8081/app/getMemberList
	public String getMember(Model model, MemberVO vo) {
		model.addAttribute("member", memberService.getMember(vo));
		return "member/getMember";
	}

	// 등록폼
	@RequestMapping(value="/insertMember" , method = RequestMethod.GET)
	public String insertMemberform() {
		return "member/insertMember";
	}
		
	// 등록처리
	@RequestMapping(value="insertMember", method = RequestMethod.POST)
	public String insertMember(MemberVO vo) {	// 커맨드 객체
		memberService.insertMember(vo);		//등록처리
		return "redirect:getMemberList";		//목록요청
		
	}
	
	//수정   updateMemberform변경
	@RequestMapping("/updateMemberform")
	public String updateMemberform(Model model, MemberVO vo) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		model.addAttribute("member", memberService.getMember(vo));
		return "member/getMember";
	}
	//수정처리
	@RequestMapping("/updateMember")
	public String updateMember(MemberVO vo) {
		System.out.println("############################");
		memberService.updateMember(vo);		//수정처리
		return "redirect:getMemberList";		//목록요청
	}
	// 단건 삭제처리
	@RequestMapping("/deleteMember")
	public String deleteMember(MemberVO vo) {
		memberService.deleteMember(vo);		//삭제처리
		return "redirect:getMemberList";		//목록요청
	}
	// 여러개 삭제
	@RequestMapping("/deleteMemberList")
	public String deleteMemberList(MemberVO vo) {
		memberService.deleteMemberList(vo);	//여러개 삭제처리
		return "redirect:getMemberList";		//목록요청
	}
	
	@RequestMapping("login")   // 
	public String login(@ModelAttribute("member") MemberVO vo, HttpSession session) {
		// id 단건조회
		MemberVO membervo = memberService.getMember(vo);
		// id가 있으면 패스워드 비교
		if(membervo == null) { // id 없으면
			return "home";
		} else if (! vo.getuPw().equals(membervo.getuPw())) { // ! <- not
			return "home";
		} else {
			session.setAttribute("uid", membervo.getuId());
			return "redirect:getPurchaseList";
		}
	}
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 무효화 (로그아웃)
		return "home";
	}
	
	
	
	
}
