package com.kosmo.project3rd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.BoardDAOImpl;
import common.BoardReplyDTO;
import common.QnaDAOImpl;
import common.QnaReplyDAOImpl;
import common.QnaReplyDTO;
import common.ReplyDAOImpl;

@Controller
public class QnaReplyController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//댓글 리스트
	@RequestMapping("/qnaReply.do")
	public String reply(Model model, HttpServletRequest req, HttpSession session) {
		
		String id = (String)session.getAttribute("siteUserInfo");
		String name = sqlSession.getMapper(BoardDAOImpl.class).selectName(id); 
		model.addAttribute("name",name); 
		
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int idx = Integer.parseInt(req.getParameter("idx"));
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		
		System.out.println("nowPage="+nowPage);
		System.out.println("idx="+idx);
		System.out.println("b_idx="+b_idx);
		
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("idx",idx);
		model.addAttribute("b_idx",b_idx);
		
		//댓글 카운트
		int totalRecordCount = sqlSession.getMapper(QnaReplyDAOImpl.class).getTotalCount(b_idx);
		   
		ArrayList<QnaReplyDTO> lists = sqlSession.getMapper(QnaReplyDAOImpl.class).listPage(b_idx);
    
		//줄바꿈 처리 
		for(QnaReplyDTO dto : lists) {
			String temp = dto.getContents().replace("\r\n","<br/>");
			dto.setContents(temp);
			String reSpace = "";
			if(dto.getRstep() > 0) {
				//답변글을 rstep만큼 들여쓰기
				for(int i=0 ; i<dto.getRstep() ; i++) {
					reSpace += "&nbsp;&nbsp;&nbsp;&nbsp;";
					
				} 
				dto.setContents(reSpace + dto.getContents().replace("\r\n","<br/>"));
			}
		}
			
		model.addAttribute("lists",lists);
		
		return "qna/qnaReply";
	}
	
	//댓글쓰기
	@RequestMapping("/qnaReWrite.do")
	public String rewrite(Model model, HttpServletRequest req, HttpSession session) {
		
		if(session.getAttribute("siteUserInfo")==null) {
			return "redirect:login.do";
		}
		String id = req.getParameter("id"); 
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		String contents = req.getParameter("contents");
		
		//작성자 이름... 
		String name = sqlSession.getMapper(BoardDAOImpl.class).selectName(id); 
		model.addAttribute("name",name); 
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		
		sqlSession.getMapper(QnaReplyDAOImpl.class).rewrite(id, b_idx, contents, name);
		
		return "redirect:qnaView.do?idx="+idx+"&nowPage="+nowPage;
	} 
	
	@RequestMapping("/qnaReDelete.do")
	public String redelete(Model model, HttpServletRequest req, HttpSession session) {
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		
		System.out.println("idx="+idx);
		System.out.println("nowPage="+nowPage);
		
		if(session.getAttribute("siteUserInfo")==null) {
			return "redirect:login.do";
		}
		
		int re_idx = Integer.parseInt(req.getParameter("re_idx"));
		
		sqlSession.getMapper(QnaReplyDAOImpl.class).redelete(re_idx);
		
		return "redirect:qnaView.do?idx="+idx+"&nowPage="+nowPage;
	}
	
	//댓글수정
	@RequestMapping("/qnaReplyEdit.do")
	@ResponseBody
	public Map<String, Object> reedit(Model model, HttpServletRequest req) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = sqlSession.getMapper(QnaReplyDAOImpl.class).reedit(
				Integer.parseInt(req.getParameter("re_idx")), req.getParameter("contents"));
		
		if(result<=0) {
			map.put("statusCode",0);
		}
		else {
			map.put("statusCode",1);
		}
		
		return map;
	}
	
	//대댓글 작성
	@RequestMapping("/qnaReReWrite.do")
	public String rereWrite(Model model, HttpServletRequest req) {
		
		String id = req.getParameter("id");
		int idx = Integer.parseInt(req.getParameter("b_idx"));
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		String contents = req.getParameter("contents");
		int rgroup = Integer.parseInt(req.getParameter("rgroup"));
		int rstep = Integer.parseInt(req.getParameter("rstep"))+1;
		String name = req.getParameter("name");
		 
		model.addAttribute("idx",idx);
		model.addAttribute("nowPage", nowPage);
		
		//글쓰기 전에 레코드 업뎃
		sqlSession.getMapper(QnaReplyDAOImpl.class).replyPrevUpdate(rgroup, rstep);
		//글쓰기
		sqlSession.getMapper(QnaReplyDAOImpl.class).rerewrite(id, idx, contents, rgroup, rstep, name);
		 
		return "redirect:qnaView.do";		
	} 
			
	
	
	
	
	
	
}













































