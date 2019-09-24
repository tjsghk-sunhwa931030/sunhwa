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

import mybatis.AllInfoDTO;
import mybatis.HInfoDTO;
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
				
	
		
		return "info/info";
	}
	
	//(대학 정보)체크된 폼값 전달받음 
	@RequestMapping("/checkAction.do")
	public String checkAction(HttpServletRequest req, Model model, HttpSession session) {
		
		
	
		 ArrayList<AllInfoDTO> lists =sqlSession.getMapper(UInfoDAOImpl.class).searchC(
				 req.getParameter("u_type"),
				 req.getParameter("searchWord"),
				 req.getParameter("location"), 
				 req.getParameter("p_type")
				
			);
		 
	
				 
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
		 
	
		 
		return "info/info";
		
	}
	

////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	
	
	//학과 홈페이지
	@RequestMapping("/hsearch.do")
	public String hsearch(Model model, HttpServletRequest req) {
		
		
		
		
		  ArrayList<AllInfoDTO> listsM1 =
		  sqlSession.getMapper(UInfoDAOImpl.class).listM1();
		  
		  
		  model.addAttribute("listsM1", listsM1);
		 
		 
		
		
		return "info/hsearch";
	}
	
	//(학과정보) 체크된 폼값 전달받음 
		@RequestMapping("/checkAction2.do")
		public String checkAction2(HttpServletRequest req, Model model, HttpSession session) {
	
		 //체크한 값
			 ArrayList<AllInfoDTO> listsH =sqlSession.getMapper(UInfoDAOImpl.class).searchH(
				
					 req.getParameter("u_type"),
					 req.getParameter("searchWord"),
					 req.getParameter("major"), //학과명
					 req.getParameter("major1"),	//대계열명
					 req.getParameter("major2"),		//중계열
					 req.getParameter("location")
					
				);
					 
			 model.addAttribute("listsH", listsH);
			 
			 System.out.println(listsH.size());

			 System.out.println("u_type"+req.getParameter("u_type"));
			 System.out.println("uname="+
					 req.getParameter("searchWord"));
			 System.out.println("location="+
					 req.getParameter("location"));
			 System.out.println("major="+
					 req.getParameter("major"));
			 System.out.println("major1="+
					 req.getParameter("major1"));
			 System.out.println("major2="+
					 req.getParameter("major2"));
		
			 System.out.println(listsH);
			 
		
			return "info/hsearch";
			
		}
		
	//대계열에서 선택
	  @RequestMapping("/CallMajor2.do") 
	  public String CallMajor2(HttpServletRequest req, Model model, HttpSession session) {
	  
	  ArrayList<AllInfoDTO> listsMj2 = sqlSession.getMapper(UInfoDAOImpl.class).listMj2(
			  req.getParameter("major1")
	  );
	  
	  model.addAttribute("listsMj2", listsMj2);
	  
	  return "info/CallMajor2"; 
	  }
	 
	  
	 //중계열에서 선택 
	  @RequestMapping("/CallMajor3.do") 
	  public String CallMajor3(HttpServletRequest req, Model model, HttpSession session) {
		  
		
	  ArrayList<AllInfoDTO> listsMj3 = sqlSession.getMapper(UInfoDAOImpl.class).listMj3(
	  
	  req.getParameter("major1"),
	  req.getParameter("major2")

	  );
	  
	  model.addAttribute("listsMj3", listsMj3);
	  
	  return "info/CallMajor3";
	  }
	
	
		
	
///////////////////////////////////////////////////////////////////////////	
	
	//전형 홈페이지 
	@RequestMapping("/jsearch.do")
	public String jsearch(Model model, HttpServletRequest req) {
		
		
		ArrayList<AllInfoDTO> listM1 =sqlSession.getMapper(UInfoDAOImpl.class).listM1(
						
						  );
				  
				  
				  model.addAttribute("listsM1", listM1);
				  
		
		
		
		return "info/jsearch";
	}
	
	//(전형정보) 체크된 폼값 전달받음 
			@RequestMapping("/checkAction3.do")
			public String checkAction3(HttpServletRequest req, Model model, HttpSession session) {

		
			 //체크한 값
				 ArrayList<AllInfoDTO> listsJ =sqlSession.getMapper(UInfoDAOImpl.class).searchJ(
					
						 req.getParameter("u_type"),
						 req.getParameter("searchWord"),
						 req.getParameter("recruit_time"),
						 req.getParameter("enter_type"),
						 req.getParameter("enter_name"),
						 req.getParameter("location"),
						 req.getParameter("enter_ele"),
						 req.getParameter("enter_test"),
						 req.getParameter("major"),
						 req.getParameter("major1"),
						 req.getParameter("major2")
					);
				
				 
				
				 model.addAttribute("listsJ", listsJ);
				 
				 System.out.println(listsJ.size());

				 System.out.println("u_type"+req.getParameter("u_type"));
				 System.out.println("uname="+
						 req.getParameter("searchWord"));
				 
				 System.out.println("location="+
						 req.getParameter("location"));
				 
				 System.out.println("searchKeyword="+
						 req.getParameter("major"));
				 
				 System.out.println("major1="+
						 req.getParameter("major1"));
				 
				 System.out.println("major2="+
						 req.getParameter("major2"));
				 
				 System.out.println("recruit_time="+
						 req.getParameter("recruit_time"));
				 
				 System.out.println("enter_type="+
						 req.getParameter("enter_type"));
				 
				 System.out.println("enter_name="+
						 req.getParameter("enter_name"));
				 
				 System.out.println("enter_ele="+
						 req.getParameter("enter_ele"));
				 
				 System.out.println("enter_test="+
						 req.getParameter("enter_test"));	
				 
				 System.out.println(listsJ);
				 
		
				 
				return "info/jsearch";
				
			}

	
}
