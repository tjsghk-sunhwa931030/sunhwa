package com.kosmo.project3rd;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import mybatis.UInfoDAOImpl;
import mybatis.UInfoDTO;

@Controller
public class InfoController {
	
	@Autowired
	private SqlSession sqlSession;

	
	@RequestMapping("/info.do")
	public String info(Model model, HttpServletRequest req) {
		
		int totalRecordCount = sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount();
		ArrayList<UInfoDTO> lists = sqlSession.getMapper(UInfoDAOImpl.class).listPage();
		model.addAttribute("lists", lists);
				
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
	
}
