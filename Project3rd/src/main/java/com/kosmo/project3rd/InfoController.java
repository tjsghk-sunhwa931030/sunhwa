package com.kosmo.project3rd;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.UInfoDAOImpl;
import mybatis.UInfoDTO;
import paging.util.PagingUtil;

@Controller
public class InfoController {
	
	@Autowired
	private SqlSession sqlSession;

	
	@RequestMapping("/info.do")
	public String info(Model model, HttpServletRequest req) {
	

		return "info/info";
	}
	
	@RequestMapping("/hsearch.do")
	public String hsearch() {
		
		return "info/hsearch";
	}
	
	@RequestMapping("/jsearch.do")
	public String jsearch() {
		
		return "info/jsearch";
	}
	
	//검색을 처리하겠어 modelandview로 
	@RequestMapping(value ="/mybatis/searchBtn.do", method=RequestMethod.POST)
	public ModelAndView searchBtn(Model model, HttpServletRequest req, HttpSession session) {
		UInfoDTO dto = sqlSession.getMapper(UInfoDAOImpl.class).list(
					req.getParameter("uname"),
					req.getParameter("location"),
					req.getParameter("p_type"),
					req.getParameter("rate_univ"),
					req.getParameter("jobrate"),
					req.getParameter("totalman"),
					req.getParameter("major_num"),
					req.getParameter("enter_num"),
					req.getParameter("uinterest")
		);
		
		ModelAndView mv = new ModelAndView();
		if(dto==null) {
			//결과가 없을 경우
			mv.addObject("해당하는 대학없음","조회된 자료가 없습니다.");
	
			mv.setViewName("info/list");
			
			return mv;
		}
		else {
			//결과가 있으면 session영역에저장 -> 리스트에 나왔으면 좋겠다...ㅠㅠ
			session.setAttribute("siteUserInfo", dto);
		}
		
		int totalRecordCount = 
				sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount();
		
		int pageSize = 10;
		int blockPage = 5;
		
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		int nowPage = req.getParameter("nowPage")==null ? 1:
			Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		ArrayList<UInfoDTO> lists = 
				sqlSession.getMapper(UInfoDAOImpl.class).listPage(start,end);
		
		String pagingImg = 
				PagingUtil.pagingImg(totalRecordCount,
						pageSize, blockPage, nowPage, req.getContextPath()+"/mybatis/list.do?");
		model.addAttribute("pagingImg", pagingImg);

		model.addAttribute("lists", lists);
		
		
		
		
		return mv;
	}
	
}
