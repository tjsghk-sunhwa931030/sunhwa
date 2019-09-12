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

import mybatis.CheckedDTO;
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
	

	
	
	//검색을 처리하겠어 modelandview로 
	@RequestMapping(value ="/searchBtn.do", method=RequestMethod.POST)
	public ModelAndView searchBtn(Model model, HttpServletRequest req, HttpSession session,
			@RequestParam(value="pageNum", defaultValue = "1") String pageNum,
			@RequestParam(value="checklist", defaultValue = "all")String checklist,
			@RequestParam(value="unamekey", defaultValue = "") String unamekey) {
		
		//전체 대학 리스트에서 체크된 값과 검색한대학이름을 가지고 오겠다 
		ArrayList<UInfoDTO> lists = 
				sqlSession.getMapper(UInfoDAOImpl.class).listPage();
		
		int totalRecordCount = 
				sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount();
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list",lists);
		map.put("totalRecordCount",totalRecordCount);
		map.put("checklist",checklist);
		map.put("unamekey",unamekey);

		
		

		/*
		 * //맵퍼로 DTO 객체를 파라미터로 전달함 ....... UInfoDTO dto =
		 * sqlSession.getMapper(UInfoDAOImpl.class);
		 * 
		 * 
		 * 
		 * if(dto==null) { //결과가 없을 경우 mv.addObject("해당하는 대학없음","조회된 자료가 없습니다.");
		 * mv.setViewName("info/list"); return mv; } else { //결과가 있으면 session영역에저장 ->
		 * 리스트에 나왔으면 좋겠다...ㅠㅠ session.setAttribute("univListinfo", dto); }
		 * 
		 * 
		 * 
		 * 
		 * 
		 * model.addAttribute("lists", lists);
		 */

		

		
	
		
		
		return mv;
	}
	
}
