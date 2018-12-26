package com.company.dts;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.dts.common.EmailVO;
import com.company.dts.common.SendEmailService;
import com.company.dts.member.MemberService;


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
	public String mailSend(EmailVO vo, Model model,
			        HttpServletResponse response) throws IOException {
		
		
		vo.setFrom("sangwoon0104@gmail.com");
		vo.setTo("sangwoon0104@gmail.com");
		vo.setSubject("제목");
		vo.setContent("내용");
		
		emailService.send(vo);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('mail send success!!!');");
		out.println("</script>");
		return "home";
	}
}
