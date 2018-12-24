package com.company.dts.member.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.company.dts.common.Paging;
import com.company.dts.member.MemberService;
import com.company.dts.member.MemberVO;

@Controller
public class MemberController {
	@Autowired MemberService memberService;
	
	// 관리자 맴버 전체조회
	@RequestMapping(value= {"/getMemberList", "/getListMemeber", "/getMembers"}
					, method = RequestMethod.GET
					)		//http://localhost:8081/app/getMemberList
	public ModelAndView getMemberList(MemberVO vo, Paging paging)  {
		
		ModelAndView mv = new ModelAndView();
		
		// 페이징 처리
		// 페이지번호 파라미터
		if( paging.getPage() == null) {
			paging.setPage(1); 
		}
		
		//한페이지 출력할 레코드 건수
		paging.setPageUnit(10);
		
		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		// 전체 건수
		paging.setTotalRecord(memberService.getCount(vo));
		
		mv.addObject("paging", paging);
		mv.addObject("memberList", memberService.getMemberList(vo)); // 속성명, 값
		mv.setViewName("admin/member/getMemberList");
		return mv;
	}
	
	
	// 관리자 차트 폼
	@RequestMapping(value="/getMemberListChart")
	public String getMemberListChart(Model model, MemberVO vo) {
		model.addAttribute("memberList", memberService.getMemberList(vo));
		return "admin/member/getMemberListChart";
	}
	
	// 관리자 차트 폼
	@RequestMapping(value="/getMemberListChartData")
	@ResponseBody
	public List<Map<String, String>> getMemberListChartData() {
		return memberService.getMemberListChart(); 
	}
	
	
	/*@RequestMapping(value="/getMemberListChartData")
	@ResponseBody
	public List<Map<String, Object>>  getMemberListChartData() {
		return memberService.getMemberListChart();
	}*/
	
	/*@RequestMapping(value="/getMemberListChart", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map  getMemberListChart(MemberVO vo) {
		HashMap map = new HashMap();
		
		map.put("memberList", memberService.getMemberListChart(vo));
		
		return map;
	}*/
	
	
	// 관리자 맴버 단건조회
	@RequestMapping("/getMember")		//http://localhost:8081/app/getMemberList
	public String getMember(Model model, MemberVO vo) {		
		model.addAttribute("member", memberService.getMember(vo));
		return "admin/member/getMember";
	}

	// 회원가입 등록폼
	@RequestMapping(value="/insertMember" , method = RequestMethod.GET)
	public String insertMemberform() {
		return "guest/member/insertMember";
	}
		
	// 회원가입 등록처리
	@RequestMapping(value="insertMember", method = RequestMethod.POST)
	public String insertMember(MemberVO vo) {	// 커맨드 객체
		memberService.insertMember(vo);		//등록처리
		return "home";		//목록요청
		
	}
	// 개인 맴버 정보확인 (수정폼 전)
	@RequestMapping("/getMemberUser")
	public String getMemberUser(Model model, MemberVO vo, HttpSession session) {
		String id = ((MemberVO)session.getAttribute("membersession")).getuId();
		vo.setuId(id);
		model.addAttribute("member", memberService.getMember(vo));
		return "user/member/getMemberUser";
	}
	// 개인 맴버 수정폼   updateMemberform변경
	@RequestMapping("/updateMemberForm")
	public String updateMemberForm(Model model, MemberVO vo) {
		model.addAttribute("member", memberService.getMember(vo));
		return "user/member/getMemberUserForm";
	}
	// 개인 맴버 수정처리
	@RequestMapping("/updateMemberUser")
	public String updateMemberUser(MemberVO vo) {
		memberService.updateMember(vo);		//수정처리
		return "redirect:getMemberUser";		//목록요청
	}
	// 개인 맴버 단건 삭제처리
	@RequestMapping("/deleteMemberUser")
	public String deleteMemberUser(MemberVO vo) {
		memberService.deleteMember(vo);		//삭제처리
		return "home";		//목록요청
	}
	
	
	// 관리자 맴버 수정처리
	@RequestMapping("/updateMember")
	public String updateMember(MemberVO vo) {
		memberService.updateMember(vo);		//수정처리
		return "redirect:getMemberList";		//목록요청
	}
	// 관리자 맴버 단건 삭제처리
	@RequestMapping("/deleteMember")
	public String deleteMember(MemberVO vo) {
		memberService.deleteMember(vo);		//삭제처리
		return "redirect:getMemberList";		//목록요청
	}
	// 관리자 맴버 여러개 삭제
	@RequestMapping("/deleteMemberList")
	public String deleteMemberList(MemberVO vo) {
		memberService.deleteMemberList(vo);	//여러개 삭제처리
		return "redirect:getMemberList";		//목록요청
	}
	
	// 회원가입 아이디 중복 체크
    @ResponseBody
    @RequestMapping(value="checkId")
    public boolean idCheck(Model model, MemberVO vo) {
        System.out.println("Controller.idCheck() 호출");
        boolean result=false;
        MemberVO user = memberService.getMember(vo);
        if(user!=null) result=true;
        else System.out.println("아이디사용가능@@@@@@@@@@@@@@@@@");
        return result;
    }

    
    
	// 로그인폼
	@RequestMapping("/loginForm")
	public String loginForm() {		
		return "guest/member/loginForm";
	}
	
	
	
	@RequestMapping("login")   // 
	public String login(MemberVO vo, HttpSession session) {
		// id 단건조회
		MemberVO membervo = memberService.getMember(vo);
		// id가 있으면 패스워드 비교
		if(membervo == null) { // id 없으면
			return "guest/member/loginForm";
		} else if (! vo.getuPw().equals(membervo.getuPw())) { // ! <- not
			return "guest/member/loginForm";
		} else {
			session.setAttribute("membersession", membervo);
			if (membervo.getuGrant().equals("admin")) {
				return "admin/main/adminMain";
			} else {
				return "user/main/userMain";				
			}			
		}
	}
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 무효화 (로그아웃)
		return "guest/main/guestMain";
	}
	
	
	
	
}
