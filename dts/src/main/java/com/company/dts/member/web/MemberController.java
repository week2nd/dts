package com.company.dts.member.web;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;

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
		model.addAttribute("member", memberService.getMemberList(vo));
		return "admin/member/getMemberListChart";
	}
	
	// 관리자 차트 폼
	@RequestMapping(value="/getMemberListChartData")
	@ResponseBody
	public List<Map<String, String>> getMemberListChartData(MemberVO vo) {
		return memberService.getMemberListChart(vo); 
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
	
	// 개인 맴버 비밀번호 수정폼   updateMemberform변경@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/updatePwForm")
	public String updatePwForm(Model model, MemberVO vo) {
		model.addAttribute("member", memberService.getMember(vo));
		return "user/member/updatePwForm";
	}
	// 개인 맴버 비밀번호 수정처리
	@RequestMapping("/updatePw")
	public String updatePw(MemberVO vo) {
		memberService.updatePw(vo);		//수정처리
		return "redirect:getMemberUser";		//목록요청
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
	
	
	// 비밀번호 찾기 폼
	@RequestMapping("/pwSearchForm")
	public String kswtest(Model model, MemberVO vo) {
	//	model.addAttribute("member", memberService.getMemberList(vo));
		return "guest/member/pwSearchForm";
	}
	
	
	// 회원가입 아이디 중복 체크
    @ResponseBody
    @RequestMapping(value="checkId")
    public boolean idCheck(Model model, MemberVO vo) {
        System.out.println("Controller.idCheck() 호출");
        boolean result=false;
        MemberVO user = memberService.getMember(vo);
        
        model.addAttribute("member", memberService.getMember(vo));
        
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
	
	
	
	
	
	@RequestMapping("/memberReport")
	public void report(HttpServletRequest request, HttpServletResponse response, MemberVO vo) throws Exception {
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			JasperReport report = JasperCompileManager
					.compileReport(request.getSession().getServletContext().getRealPath("reports/memberList.jrxml"));
			vo.setFirst(1);
			vo.setLast(100);
			JRDataSource JRdataSource = new JRBeanCollectionDataSource(memberService.getMemberList(vo));
			JasperPrint print = JasperFillManager.fillReport(report, map, JRdataSource);
			JRExporter exporter = new JRPdfExporter();
			OutputStream out;
			response.reset();
			out = response.getOutputStream();
			exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, "memberList.pdf");
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
			exporter.exportReport();
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 엑셀출력
	@RequestMapping("/memberExcel")
	public ModelAndView excelView(MemberVO vo, HttpServletResponse response) throws IOException {
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		vo.setFirst(1);
		vo.setLast(100000);
		List<MemberVO> list2 = memberService.getMemberList(vo);
		for(int i=0; i<list2.size(); i++) {
			Map<String, Object> temp = new HashMap<String, Object>();  
			temp.put("uId", list2.get(i).getuId());
			temp.put("uName", list2.get(i).getuName());
			temp.put("uAddress", list2.get(i).getuAddress());
			temp.put("uPhone", list2.get(i).getuPhone());
			temp.put("uMileage", new Integer(list2.get(i).getuMileage()));
			temp.put("uGrant", list2.get(i).getuGrant());
			temp.put("uBirth", list2.get(i).getuBirth());
			temp.put("uDate", list2.get(i).getuDate());
			temp.put("uWin", list2.get(i).getuWin());
			temp.put("uLose", list2.get(i).getuLose());
			temp.put("uEmail", list2.get(i).getuEmail());
			list.add(temp);
		}
		
		
		
		HashMap<String, Object> emap = new HashMap<String, Object>();
		String[] header = { "uId", "uName", "uAddress", "uPhone", "uMileage", "uGrant", "uBirth", "uDate", "uWin", "uLose", "uEmail" };
		emap.put("headers", header);
		emap.put("title", "DTS 회원정보");
		emap.put("filename", "excel_dept");
		emap.put("datas", list);
		return new ModelAndView("commonExcelView", emap);
	}
	
	// 마일리지 추가
		@RequestMapping("/updateMileage")
		public MemberVO updateMileage(MemberVO vo,HttpSession session) {
			memberService.updateMileage(vo);		//수정처리
			MemberVO membervo = memberService.getMember(vo);
			session.setAttribute("membersession", membervo);
			return vo;		//목록요청
		}
	
	
}
