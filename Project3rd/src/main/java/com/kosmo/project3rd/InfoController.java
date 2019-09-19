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
				
		/*
		 * ArrayList<UInfoDTO> lists =
		 * sqlSession.getMapper(UInfoDAOImpl.class).listPage();
		 * 
		 * 
		 * model.addAttribute("lists", lists);
		 */
		
		
		return "info/info";
	}
	
	//(대학 정보)체크된 폼값 전달받음 
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
		
		 ArrayList<AllInfoDTO> lists =sqlSession.getMapper(UInfoDAOImpl.class).searchC(
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
	

////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	
	
	//학과 홈페이지
	@RequestMapping("/hsearch.do")
	public String hsearch(Model model, HttpServletRequest req) {
		
		
		/*
		 * ArrayList<HInfoDTO> listsH =
		 * sqlSession.getMapper(UInfoDAOImpl.class).listPage();
		 * 
		 * 
		 * model.addAttribute("listsH", listsH);
		 */
		 
		
		
		return "info/hsearch";
	}
	
	//(학과정보) 체크된 폼값 전달받음 
		@RequestMapping("/checkAction2.do")
		public String checkAction2(HttpServletRequest req, Model model, HttpSession session) {

	
		 //체크한 값
			 ArrayList<AllInfoDTO> listsH =sqlSession.getMapper(UInfoDAOImpl.class).searchH(
				
					 req.getParameter("u_type"),
					 req.getParameter("searchWord"),
					 req.getParameter("searchKeyword"), //학과명
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
			 System.out.println("searchKeyword="+
					 req.getParameter("major"));
			 System.out.println("major1="+
					 req.getParameter("major1"));
			 System.out.println("major2="+
					 req.getParameter("major2"));
		
			 System.out.println(listsH);
			 
			 
			/*
			 * mv.addObject("lists", lists); System.out.println(lists);
			 * mv.setViewName("info/info");
			 */
			 
			return "info/hsearch";
			
		}
		
	
///////////////////////////////////////////////////////////////////////////	
	
	//전형 홈페이지 
	@RequestMapping("/jsearch.do")
	public String jsearch() {
		
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
						 req.getParameter("searchKeyword"),
						 req.getParameter("major1"),
						 req.getParameter("major2")
					);
						 
				 model.addAttribute("listsH", listsJ);
				 
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
			
				 System.out.println(listsJ);
				 
				 
				/*
				 * mv.addObject("lists", lists); System.out.println(lists);
				 * mv.setViewName("info/info");
				 */
				 
				return "info/jsearch";
				
			}

	
}
