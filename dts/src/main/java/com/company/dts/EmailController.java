package com.company.dts;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.dts.common.EmailVO;
import com.company.dts.common.SendEmailService;
import com.company.dts.member.MemberService;
import com.company.dts.member.MemberVO;


@Controller
public class EmailController {
	@Autowired MemberService memberService;
	@Autowired SendEmailService emailService;
	//메일보내기폼
	@RequestMapping("mailForm")
	public String mailForm() {
		return "email/mailForm";
	}
	
	//메일발송처리
	@RequestMapping("mailSend")
	public String mailSend(EmailVO vo, MemberVO mv,
			        HttpServletResponse response) throws IOException {
		MemberVO nvo = new MemberVO();
		nvo = memberService.getMember(mv);
		vo.setFrom("sangwoon0104@gmail.com");
		vo.setTo(nvo.getuEmail());
		String  uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
		        uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌. 
		vo.setSubject("분실하신 비밀번호입니다.");
		vo.setContent("임시비밀번호 입니다."+'\n'+uuid);
		nvo.setuPw(uuid);
		memberService.updateMember(nvo);
		
		emailService.send(vo);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		return "home";
	}
}
