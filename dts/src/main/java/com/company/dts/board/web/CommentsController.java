package com.company.dts.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.dts.board.CommentsService;
import com.company.dts.board.CommentsVO;



@Controller
public class CommentsController {

	//서비스 injection
	   @Autowired
	   CommentsService commentService;
	   //댓글 목록
	   @RequestMapping("getCommentsList")
	   @ResponseBody
	   public List<CommentsVO> getCommentsList(CommentsVO vo){
	      vo.setPageUnit(10);
	      return commentService.getCommentsList(vo);
	   }
	   
	   //댓글등록
	   @RequestMapping(value="insertComments" , method = RequestMethod.GET)
	   @ResponseBody
	   public CommentsVO insertComments(Model model, CommentsVO vo, HttpServletRequest request) {
		   String type = request.getParameter("type");
		   model.addAttribute("type", type);
		   commentService.insertComments(vo);
		   return commentService.getComments(vo);
	   }
	   
	   //댓글삭제
	   @RequestMapping("deleteComments")
	   @ResponseBody
	   public CommentsVO deleteComments(CommentsVO vo){
		      commentService.deleteComments(vo);
		      return vo;
		   }
	   
	 //댓글수정
	   @RequestMapping("updateComments")
	   @ResponseBody
	   public CommentsVO updateComments(Model model, CommentsVO vo, HttpServletRequest request) {
		   String type = request.getParameter("type");
		   model.addAttribute("type", type);
		   commentService.updateComments(vo);
		   return commentService.getComments(vo);
	   }
}
