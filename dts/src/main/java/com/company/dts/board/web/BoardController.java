package com.company.dts.board.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.company.dts.board.BoardService;
import com.company.dts.board.BoardVO;
import com.company.dts.common.Paging;
import com.company.dts.member.MemberVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	// 전체조회(getAnalysisBoard)
	@RequestMapping("/getBoardList")
	public String getAnalysisBoard(Model model, BoardVO vo, Paging paging, HttpServletRequest request,
			HttpSession session) {

		if (paging.getPage() == null) {		 // get으로 받아온 page가 null이면 1page를 set으로 1페이지를 받아온다.
			paging.setPage(1);
		}
		paging.setPageUnit(10); 				// 한 페이지에 보여주는 레코드 건수, first와 last 가져오기 전에 적어줘야함
		vo.setFirst(paging.getFirst()); 	// 게시판 숫자에 따라서 first, last 값 가져옴
		vo.setLast(paging.getLast());
		vo.setBoardType(request.getParameter("type")); 		// homeUser의 게시판 클릭시 type 받아오는 Parameter
		paging.setTotalRecord(boardService.getCount(vo)); 	// 바로 위에서 받은 type을 기반으로 getCount(페이징갯수조회) 실행
		vo.setBoardType(request.getParameter("type")); 		// homeUser의 게시판 클릭시 type 받아오는 Parameter
		model.addAttribute("paging", paging); 				// model 안에 페이징 작업 넣기
		model.addAttribute("type", request.getParameter("type")); // 받아온 type을 model 안에 넣기
		model.addAttribute("board", boardService.getBoardList(vo)); // getAnalysisBoard 실행
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/board/getBoardList";
		} else {
			return "user/board/getBoardList";
		}

	}

	// 단건조회
	@RequestMapping("/getBoard")
	public String getBoard(Model model, BoardVO vo, HttpServletRequest request, HttpSession session) {
		boardService.updateBoardHits(vo);							// 페이지 들어가면 조회수 1 추가됨
		model.addAttribute("board", boardService.getBoard(vo));		// model에 단건조회 작업를 추가한다.
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/board/getBoard";
		} else {
			return "user/board/getBoard";
		}
	}

	// 조회수 추가 처리
	@RequestMapping("/updateBoardHits")
	public String updateBoardHits(Model model, BoardVO vo, HttpSession session) {
		boardService.updateBoardHits(vo); 							// 조회수추가작업
		model.addAttribute("board", boardService.getBoard(vo));		// model에 단건조회 작업를 추가한다.
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/board/getBoard";
		} else {
			return "user/board/getBoard";
		}
	}

	// 좋아요 추가 처리
	@RequestMapping("/insertLikecheck")
	public String insertLikecheck(Model model, BoardVO vo, HttpServletRequest request, HttpSession session) {	
		boardService.insertLikecheck(vo); 							// 좋아요 버튼 클릭시 추가
		model.addAttribute("board", boardService.getBoard(vo));		// model에 단건조회 작업를 추가한다.
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/board/getBoard";
		} else {
			return "user/board/getBoard";
		}
	}

	
	// 좋아요 취소 처리
	@RequestMapping("/deleteLikecheck")
	public String deleteLikecheck(Model model, BoardVO vo, HttpServletRequest request, HttpSession session) {
		boardService.deleteLikecheck(vo);							// 삭제처리 진행
		System.out.println(vo.getBoardType());						// Board
		model.addAttribute("board", boardService.getBoard(vo));		// model에 단건조회 작업를 추가한다.	
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/board/getBoard";
		} else {
			return "user/board/getBoard";
		}
	}
	

	// 등록폼
	@RequestMapping(value = "/insertBoardform", method = RequestMethod.GET)
	public String insertBoardform(Model model, HttpServletRequest request) {
		String type = request.getParameter("type");					// getBoard에서 입력을 눌렀을때의 type 을 request 로 받아온다.
		model.addAttribute("type", type);							// model에 type 추가한다.
		return "user/board/insertBoard";							// insertBoard 화면을 가져온다.
	}

	// 등록처리
	@RequestMapping(value = "/insertBoard", method = { RequestMethod.POST, RequestMethod.GET })
	public String insertBoard(Model model, BoardVO vo, Paging paging, HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException, IOException { // 커맨드 객체

		String path = request.getSession().getServletContext().getRealPath("/img");
		System.out.println("path======" + path);
		// ServletContext == 내장객체 Application과 동일하다.
		// 첨부파일이 있으면 첨부파일을 업로드(업로더 폴더로 저장)
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty() && uploadFile.getSize() > 0) { 	// 파일크기로 첨부여부확인
			String filename = uploadFile.getOriginalFilename(); 	// 업로드파일명
			uploadFile.transferTo(new File(path, filename)); 		// 파일이름
			vo.setUploadFileName(filename);
		}
		boardService.insertBoard(vo); // 등록처리

		return "redirect:getBoardList?type=" + vo.getBoardType();
	}

	// 수정
	@RequestMapping("/updateBoardform")
	public String updateBoardform(Model model, BoardVO vo) {
		model.addAttribute("board", boardService.getBoard(vo));		// model에 단건조회 작업를 추가한다.
		return "user/board/updateBoard";
	}

	// 수정처리
	@RequestMapping("/updateBoard")
	public String updateBoard(Model model, BoardVO vo, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/img");
		System.out.println("path======" + path);
		// ServletContext == 내장객체 Application과 동일하다.
		// 첨부파일이 있으면 첨부파일을 업로드(업로더 폴더로 저장)
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty() && uploadFile.getSize() > 0) { 	// 파일크기로 첨부여부확인
			String filename = uploadFile.getOriginalFilename(); 	// 업로드파일명
			uploadFile.transferTo(new File(path, filename)); 		// 파일이름
			vo.setUploadFileName(filename);
		}
		boardService.updateBoard(vo); 								// 수정처리
		model.addAttribute("board", boardService.getBoard(vo));		// model에 단건조회 작업를 추가한다.
		String grant = ((MemberVO) session.getAttribute("membersession")).getuGrant();
		if (grant.equals("admin")) {
			return "admin/board/getBoard";
		} else {
			return "user/board/getBoard";
		}
	}

	// 단건 삭제처리
	@RequestMapping("/deleteBoard")
	public String deleteBoard(Model model, BoardVO vo, HttpServletRequest request) {
		BoardVO nvo = new BoardVO();
		nvo = boardService.getBoard(vo); 								// getBoard의 자료를 nvo 안에 담아놓고
		boardService.deleteBoard(vo);									// 단건 삭제처리를 한다.
		System.out.println(nvo.getBoardType());							// BoardType을 보여준다.
		model.addAttribute("board", boardService.getBoardList(nvo)); 	// 그리고 nvo 안에 담겨져 있는 type을 활용하여 AnalysisBoard를 불러온다.																		
		return "redirect:getBoardList?type=" + nvo.getBoardType();		// 단건 삭제 후 이전 type 을 받아와서 BoardList 를 불러온다.
	}																	

	// 여러개 삭제
	@RequestMapping("/deleteBoardList")
	public String deleteBoardList(Model model, BoardVO vo, HttpServletRequest request) {
		String type = request.getParameter("type");						// type 을 받아온다.
		vo.setBoardType(type);											// type을 vo에 담는다.
		boardService.deleteBoardList(vo); 								// 여러개 삭제처리
		return "redirect:getBoardList?type=" + type;					// 여러건 삭제 후 이전 type 을 받아와서 BoardList 를 불러온다.
	}

	
	//파일 업로드 할 때 사용
	private String getBrowser(HttpServletRequest request) { // 한글 안깨지게 하기 위해 필요
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}
	//파일 업로드 할 때 사용
	private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String browser = getBrowser(request);
		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			throw new IOException("Not supported browser");
		}
		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);
		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}
	
	//파일 업로드 할 때 사용
	@RequestMapping(value = "/FileDown")
	public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String atchFileId = (String) commandMap.get("atchFileId");
		String path = request.getSession().getServletContext().getRealPath("/resources");
		File uFile = new File(path, atchFileId);
		long fSize = uFile.length();
		if (fSize > 0) {
			String mimetype = "application/x-msdownload";
			response.setContentType(mimetype);
			// response.setHeader("Content-Disposition", "attachment;
			// filename=\"" + URLEncoder.encode(fvo.getOrignlFileNm(), "utf-8") + "\"");
			setDisposition(atchFileId, request, response);
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());
				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (IOException ex) {
			} finally {
				in.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
		} else {
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<h2>Could not get file name:<br>" + atchFileId + "</h2>");
			printwriter.println("<center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("&copy; webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}
}
