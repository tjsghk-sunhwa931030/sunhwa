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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import mybatis.UInfoDAOImpl;
import mybatis.UInfoDTO;
import paging.util.PagingUtil;

@Controller
public class InfoController {
	
	@Autowired
	private SqlSession sqlSession;

	//대학 홈페이지
	@RequestMapping("/info.do")
	public String info(Model model, HttpServletRequest req) {
		
		int totalRecordCount = 
				sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount();
		model.addAttribute("totalRecordCount", totalRecordCount);
			
		/*
		 * ArrayList<UInfoDTO> lists =
		 * sqlSession.getMapper(UInfoDAOImpl.class).listPage();
		 * model.addAttribute("lists", lists);
		 */
		
		return "info/info";
	}
	
	@RequestMapping("/info/checkAction.do")
	public ModelAndView checkAction(HttpServletRequest req, Model model, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		UInfoDTO dto = sqlSession.getMapper(UInfoDAOImpl.class).search2(
				req.getParameter("uname"),
				req.getParameter("location"),
				req.getParameter("p_type"),
				req.getParameter("jobrate"),
				req.getParameter("tuition")
		);
		
		int totalRecordCount = 
				sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount();
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		ArrayList<UInfoDTO> lists =
				sqlSession.getMapper(UInfoDAOImpl.class).search1(
						req.getParameter("uname"),
						req.getParameter("location"),
						req.getParameter("rate_univ"),
						req.getParameter("totalman"),
						req.getParameter("major_num"),
						req.getParameter("enter_num"),
						req.getParameter("interest")
						);
		model.addAttribute("lists", lists);
		
		System.out.println(dto);
		return mv;
	}
	
	
	@RequestMapping("/info/searchUAction.do")
	public ModelAndView searchUAction(HttpServletRequest req, Model model, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		UInfoDTO dto = sqlSession.getMapper(UInfoDAOImpl.class).searchU(
				req.getParameter("uname"),
				req.getParameter("location"),
				req.getParameter("rate_univ"),
				req.getParameter("totalman"),
				req.getParameter("major_num"),
				req.getParameter("enter_num"),
				req.getParameter("interest")
		);
		
		int totalRecordCount = 
				sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount();
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		ArrayList<UInfoDTO> lists =
				sqlSession.getMapper(UInfoDAOImpl.class).searchU(
						req.getParameter("uname")
						);
		model.addAttribute("lists", lists);
		
		System.out.println(dto);
		return mv;
	}
	
	
	
	
	
	
	
	
	
	//학과 홈페이지
	@RequestMapping("/hsearch.do")
	public String hsearch() {
		
		return "info/hsearch";
	}
	
	//전형 홈페이지 
	@RequestMapping("/jsearch.do")
	public String jsearch() {
		
		return "info/jsearch";
	}
	


	
}
