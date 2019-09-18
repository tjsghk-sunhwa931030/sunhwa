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
				
		/*
		 * ArrayList<UInfoDTO> lists =
		 * sqlSession.getMapper(UInfoDAOImpl.class).listPage();
		 * 
		 * 
		 * model.addAttribute("lists", lists);
		 */
		
		
		return "info/info";
	}
	
	//체크된 폼값 전달받음 
	@RequestMapping("/checkAction.do")
	public String checkAction(HttpServletRequest req, Model model, HttpSession session) {
		
		/* ModelAndView mv = new ModelAndView(); */
		
		/*
		 * UInfoDTO dto = sqlSession.getMapper(UInfoDAOImpl.class).search(
		 * req.getParameter("uname"), req.getParameter("location"),
		 * req.getParameter("p_type"), req.getParameter("jobrate"),
		 * req.getParameter("tuition") );
		 */
		
		int totalRecordCount = 
				sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount();
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
	 //체크한 값
		
		 ArrayList<UInfoDTO> lists =sqlSession.getMapper(UInfoDAOImpl.class).searchC(
				 req.getParameter("u_type"),
				 req.getParameter("searchWord"),
				 req.getParameter("location"), 
				 req.getParameter("p_type")
				
			);
		 
		/* ArrayList<UInfoDTO> lists2 =sqlSession.getMapper(UInfoDAOImpl.class).searchW( */
				 
		 model.addAttribute("lists", lists);
		 
		 System.out.println(lists.size());

		 System.out.println("u_type"+req.getParameter("u_type"));
		 System.out.println("uname="+
				 req.getParameter("searchWord"));
		 System.out.println("location="+
				 req.getParameter("location"));
		 System.out.println("p_type="+
				 req.getParameter("p_type"));
	
		 System.out.println(lists);
		 
		 
		/*
		 * mv.addObject("lists", lists); System.out.println(lists);
		 * mv.setViewName("info/info");
		 */
		 
		return "info/info";
		
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
