package com.kosmo.project3rd;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mybatis.AllInfoDTO;
import mybatis.CalexDTO;
import mybatis.GradeImpl;
import mybatis.MyJunggradeDTO;
import mybatis.MybatisMypageDAOImpl;
import mybatis.UInfoDAOImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@RequestMapping("main.do")
	public String main(Model model, HttpServletRequest req, HttpSession session) {
		
		String id = (String)session.getAttribute("siteUserInfo");
		
		if(id==null) {
	          id="???";
	    }
		
		ArrayList<MyJunggradeDTO> lists = sqlSession.getMapper(GradeImpl.class).all_junglist(id);
		model.addAttribute("lists",lists);
				
		return "main/main";
	}
	
	@RequestMapping("get_graph.do")
	public String get_graph(Model model, HttpServletRequest req, HttpSession session) {
		
		String id = (String)session.getAttribute("siteUserInfo");
		String idx = "";
		idx = req.getParameter("value");
		
		ArrayList<MyJunggradeDTO> lists = sqlSession.getMapper(GradeImpl.class).jung_exam_by_id_idx(id, idx);
		String major_name = sqlSession.getMapper(GradeImpl.class).get_major_name(idx);
		
		int extra = 0;
		if(lists.get(0).getStudy1_rate() > lists.get(0).getStudy2_rate()) {
			extra = lists.get(0).getStudy2_rate();
		}
		else {
			extra = lists.get(0).getStudy1_rate();
		}
		
		double avg = (lists.get(0).getNative_rate() + lists.get(0).getMath_rate() 
				+ lists.get(0).getEng_rate() + extra)/4;
		
		avg = Double.parseDouble(String.format("%.2f", avg));
		model.addAttribute("avg", avg);
		model.addAttribute("major_name", major_name);
		String type = "정시";

		int count = sqlSession.getMapper(UInfoDAOImpl.class).searchJ_main_count(type, avg);

		ArrayList<AllInfoDTO> lists2 = sqlSession.getMapper(UInfoDAOImpl.class).searchJ_main(type, avg);
		model.addAttribute("lists2", lists2); 
		model.addAttribute("count", count); 

		return "main/temp_main";
	}
	
	
	@RequestMapping("main2.do")
	public String main2() {
		
		return "main/main2";
	}
	
}






























