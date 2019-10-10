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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.AllInfoDTO;
import mybatis.CalexDTO;
import mybatis.GradeDTO;
import mybatis.GradeImpl;
import mybatis.MyJunggradeDTO;
import mybatis.MyLibraryDTO;
import mybatis.MybatisMypageDAOImpl;
import mybatis.TestScheduleDTO;
import mybatis.UInfoDAOImpl;


@Controller
public class GradeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//학생부 성적 분석-주요교과 분석
	@RequestMapping("/s_grade.do")
	public String s_grade(Model model, HttpServletRequest req) {
		
		String id=req.getParameter("id");
		
		ArrayList<GradeDTO> lists =
				sqlSession.getMapper(GradeImpl.class).all_grade();
		
		ArrayList<GradeDTO> lists11 = sqlSession.getMapper(GradeImpl.class).grade("1학년", "1학기", id);
		ArrayList<GradeDTO> lists12 = sqlSession.getMapper(GradeImpl.class).grade("1학년", "2학기", id);
		ArrayList<GradeDTO> lists21 = sqlSession.getMapper(GradeImpl.class).grade("2학년", "1학기", id);
		ArrayList<GradeDTO> lists22 = sqlSession.getMapper(GradeImpl.class).grade("2학년", "2학기", id);
		ArrayList<GradeDTO> lists31 = sqlSession.getMapper(GradeImpl.class).grade("3학년", "1학기", id);
		ArrayList<GradeDTO> lists32 = sqlSession.getMapper(GradeImpl.class).grade("3학년", "2학기", id);
		
		Integer rate_korea11 = sqlSession.getMapper(GradeImpl.class).rate("국어", "1학년", "1학기", id);
		Integer rate_english11 = sqlSession.getMapper(GradeImpl.class).rate("영어", "1학년", "1학기", id);
		Integer rate_math11 = sqlSession.getMapper(GradeImpl.class).rate("수학", "1학년", "1학기", id);
		Integer rate_society11 = sqlSession.getMapper(GradeImpl.class).rate("사회", "1학년", "1학기", id);
		Integer rate_science11 = sqlSession.getMapper(GradeImpl.class).rate("과학", "1학년", "1학기", id);
		
		Integer rate_korea12 = sqlSession.getMapper(GradeImpl.class).rate("국어", "1학년", "2학기", id);
		Integer rate_english12 = sqlSession.getMapper(GradeImpl.class).rate("영어", "1학년", "2학기", id);
		Integer rate_math12 = sqlSession.getMapper(GradeImpl.class).rate("수학", "1학년", "2학기", id);
		Integer rate_society12 = sqlSession.getMapper(GradeImpl.class).rate("사회", "1학년", "2학기", id);
		Integer rate_science12 = sqlSession.getMapper(GradeImpl.class).rate("과학", "1학년", "2학기", id);
		
		Integer rate_korea21 = sqlSession.getMapper(GradeImpl.class).rate("국어", "2학년", "1학기", id);
		Integer rate_english21 = sqlSession.getMapper(GradeImpl.class).rate("영어", "2학년", "1학기", id);
		Integer rate_math21 = sqlSession.getMapper(GradeImpl.class).rate("수학", "2학년", "1학기", id);
		Integer rate_society21 = sqlSession.getMapper(GradeImpl.class).rate("사회", "2학년", "1학기", id);
		Integer rate_science21 = sqlSession.getMapper(GradeImpl.class).rate("과학", "2학년", "1학기", id);
		
		Integer rate_korea22 = sqlSession.getMapper(GradeImpl.class).rate("국어", "2학년", "2학기", id);
		Integer rate_english22 = sqlSession.getMapper(GradeImpl.class).rate("영어", "2학년", "2학기", id);
		Integer rate_math22 = sqlSession.getMapper(GradeImpl.class).rate("수학", "2학년", "2학기", id);
		Integer rate_society22 = sqlSession.getMapper(GradeImpl.class).rate("사회", "2학년", "2학기", id);
		Integer rate_science22 = sqlSession.getMapper(GradeImpl.class).rate("과학", "2학년", "2학기", id);
		
		Integer rate_korea31 = sqlSession.getMapper(GradeImpl.class).rate("국어", "3학년", "1학기", id);
		Integer rate_english31 = sqlSession.getMapper(GradeImpl.class).rate("영어", "3학년", "1학기", id);
		Integer rate_math31 = sqlSession.getMapper(GradeImpl.class).rate("수학", "3학년", "1학기", id);
		Integer rate_society31 = sqlSession.getMapper(GradeImpl.class).rate("사회", "3학년", "1학기", id);
		Integer rate_science31 = sqlSession.getMapper(GradeImpl.class).rate("과학", "3학년", "1학기", id);
		
		Integer rate_korea32 = sqlSession.getMapper(GradeImpl.class).rate("국어", "3학년", "2학기", id);
		Integer rate_english32 = sqlSession.getMapper(GradeImpl.class).rate("영어", "3학년", "2학기", id);
		Integer rate_math32 = sqlSession.getMapper(GradeImpl.class).rate("수학", "3학년", "2학기", id);
		Integer rate_society32 = sqlSession.getMapper(GradeImpl.class).rate("사회", "3학년", "2학기", id);
		Integer rate_science32 = sqlSession.getMapper(GradeImpl.class).rate("과학", "3학년", "2학기", id);
				
		Integer korea11 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "1학년", "1학기", id);
		Integer english11 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "1학년", "1학기", id);
		Integer math11 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "1학년", "1학기", id);
		Integer society11 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "1학년", "1학기", id);
		Integer science11 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "1학년", "1학기", id);
		
		Integer korea12 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "1학년", "2학기", id);
		Integer english12 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "1학년", "2학기", id);
		Integer math12 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "1학년", "2학기", id);
		Integer society12 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "1학년", "2학기", id);
		Integer science12 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "1학년", "2학기", id);
		
		Integer korea21 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "2학년", "1학기", id);
		Integer english21 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "2학년", "1학기", id);
		Integer math21 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "2학년", "1학기", id);
		Integer society21 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "2학년", "1학기", id);
		Integer science21 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "2학년", "1학기", id);
		
		Integer korea22 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "2학년", "2학기", id);
		Integer english22 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "2학년", "2학기", id);
		Integer math22 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "2학년", "2학기", id);
		Integer society22 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "2학년", "2학기", id);
		Integer science22 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "2학년", "2학기", id);
		
		Integer korea31 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "3학년", "1학기", id);
		Integer english31 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "3학년", "1학기", id);
		Integer math31 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "3학년", "1학기", id);
		Integer society31 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "3학년", "1학기", id);
		Integer science31 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "3학년", "1학기", id);
		
		Integer korea32 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "3학년", "2학기", id);
		Integer english32 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "3학년", "2학기", id);
		Integer math32 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "3학년", "2학기", id);
		Integer society32 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "3학년", "2학기", id);
		Integer science32 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "3학년", "2학기", id);
		
		double rate_korea = (rate_korea11 + rate_korea12 + rate_korea21 + rate_korea22 + rate_korea31 + rate_korea32)/6;
		double rate_english = (rate_english11 + rate_english12 + rate_english21 + rate_english22 + rate_english31 + rate_english32)/6;
		double rate_math = (rate_math11 + rate_math12 + rate_math21 + rate_math22 + rate_math31 + rate_math32)/6;
		double rate_society = (rate_society11 + rate_society12 + rate_society21 + rate_society22 + rate_society31 + rate_society32)/6;
		double rate_science = (rate_science11 + rate_science12 + rate_science21 + rate_science22 + rate_science31 + rate_science32)/6;
		
		model.addAttribute("rate_korea11", rate_korea11);
		model.addAttribute("rate_english11", rate_english11);
		model.addAttribute("rate_math11", rate_math11);
		model.addAttribute("rate_society11", rate_society11);
		model.addAttribute("rate_science11", rate_science11);
		
		model.addAttribute("rate_korea12", rate_korea12);
		model.addAttribute("rate_english12", rate_english12);
		model.addAttribute("rate_math12", rate_math12);
		model.addAttribute("rate_society12", rate_society12);
		model.addAttribute("rate_science12", rate_science12);
		
		model.addAttribute("rate_korea21", rate_korea21);
		model.addAttribute("rate_english21", rate_english21);
		model.addAttribute("rate_math21", rate_math21);
		model.addAttribute("rate_society21", rate_society21);
		model.addAttribute("rate_science21", rate_science21);
		
		model.addAttribute("rate_korea22", rate_korea22);
		model.addAttribute("rate_english22", rate_english22);
		model.addAttribute("rate_math22", rate_math22);
		model.addAttribute("rate_society22", rate_society22);
		model.addAttribute("rate_science22", rate_science22);
		
		model.addAttribute("rate_korea31", rate_korea31);
		model.addAttribute("rate_english31", rate_english31);
		model.addAttribute("rate_math31", rate_math31);
		model.addAttribute("rate_society31", rate_society31);
		model.addAttribute("rate_science31", rate_science31);
		
		model.addAttribute("rate_korea32", rate_korea32);
		model.addAttribute("rate_english32", rate_english32);
		model.addAttribute("rate_math32", rate_math32);
		model.addAttribute("rate_society32", rate_society32);
		model.addAttribute("rate_science32", rate_science32);
		
		
		model.addAttribute("korea11", korea11);
		model.addAttribute("english11", english11);
		model.addAttribute("math11", math11);
		model.addAttribute("society11", society11);
		model.addAttribute("science11", science11);
		
		model.addAttribute("korea12", korea12);
		model.addAttribute("english12", english12);
		model.addAttribute("math12", math12);
		model.addAttribute("society12", society12);
		model.addAttribute("science12", science12);
		
		model.addAttribute("korea21", korea21);
		model.addAttribute("english21", english21);
		model.addAttribute("math21", math21);
		model.addAttribute("society21", society21);
		model.addAttribute("science21", science21);
		
		model.addAttribute("korea22", korea22);
		model.addAttribute("english22", english22);
		model.addAttribute("math22", math22);
		model.addAttribute("society22", society22);
		model.addAttribute("science22", science22);
		
		model.addAttribute("korea31", korea31);
		model.addAttribute("english31", english31);
		model.addAttribute("math31", math31);
		model.addAttribute("society31", society31);
		model.addAttribute("science31", science31);
		
		model.addAttribute("korea32", korea32);
		model.addAttribute("english32", english32);
		model.addAttribute("math32", math32);
		model.addAttribute("society32", society32);
		model.addAttribute("science32", science32); 
		
		model.addAttribute("lists11", lists11);
		model.addAttribute("lists12", lists12);
		model.addAttribute("lists21", lists21);
		model.addAttribute("lists22", lists22);
		model.addAttribute("lists31", lists31);
		model.addAttribute("lists32", lists32);

		model.addAttribute("rate_korea", rate_korea);
		model.addAttribute("rate_english", rate_english);
		model.addAttribute("rate_math", rate_math);
		model.addAttribute("rate_society", rate_society);
		model.addAttribute("rate_science", rate_science); 
		
		return "/grade/s_grade";
	}
	
	//학생부 성적 분석-고교조합 분석
	@RequestMapping("/s_grade2.do")
	public String s_grade2(Model model, HttpServletRequest req) {
		
		String id=req.getParameter("id");
		
		ArrayList<GradeDTO> lists =
				sqlSession.getMapper(GradeImpl.class).all_grade();
		
		ArrayList<GradeDTO> lists11 = sqlSession.getMapper(GradeImpl.class).grade("1학년", "1학기", id);
		ArrayList<GradeDTO> lists12 = sqlSession.getMapper(GradeImpl.class).grade("1학년", "2학기", id);
		ArrayList<GradeDTO> lists21 = sqlSession.getMapper(GradeImpl.class).grade("2학년", "1학기", id);
		ArrayList<GradeDTO> lists22 = sqlSession.getMapper(GradeImpl.class).grade("2학년", "2학기", id);
		ArrayList<GradeDTO> lists31 = sqlSession.getMapper(GradeImpl.class).grade("3학년", "1학기", id);
		ArrayList<GradeDTO> lists32 = sqlSession.getMapper(GradeImpl.class).grade("3학년", "2학기", id);
		
		Integer rate_korea11 = sqlSession.getMapper(GradeImpl.class).rate("국어", "1학년", "1학기", id);
		Integer rate_english11 = sqlSession.getMapper(GradeImpl.class).rate("영어", "1학년", "1학기", id);
		Integer rate_math11 = sqlSession.getMapper(GradeImpl.class).rate("수학", "1학년", "1학기", id);
		Integer rate_society11 = sqlSession.getMapper(GradeImpl.class).rate("사회", "1학년", "1학기", id);
		Integer rate_science11 = sqlSession.getMapper(GradeImpl.class).rate("과학", "1학년", "1학기", id);
		
		Integer rate_korea12 = sqlSession.getMapper(GradeImpl.class).rate("국어", "1학년", "2학기", id);
		Integer rate_english12 = sqlSession.getMapper(GradeImpl.class).rate("영어", "1학년", "2학기", id);
		Integer rate_math12 = sqlSession.getMapper(GradeImpl.class).rate("수학", "1학년", "2학기", id);
		Integer rate_society12 = sqlSession.getMapper(GradeImpl.class).rate("사회", "1학년", "2학기", id);
		Integer rate_science12 = sqlSession.getMapper(GradeImpl.class).rate("과학", "1학년", "2학기", id);
		
		Integer rate_korea21 = sqlSession.getMapper(GradeImpl.class).rate("국어", "2학년", "1학기", id);
		Integer rate_english21 = sqlSession.getMapper(GradeImpl.class).rate("영어", "2학년", "1학기", id);
		Integer rate_math21 = sqlSession.getMapper(GradeImpl.class).rate("수학", "2학년", "1학기", id);
		Integer rate_society21 = sqlSession.getMapper(GradeImpl.class).rate("사회", "2학년", "1학기", id);
		Integer rate_science21 = sqlSession.getMapper(GradeImpl.class).rate("과학", "2학년", "1학기", id);
		
		Integer rate_korea22 = sqlSession.getMapper(GradeImpl.class).rate("국어", "2학년", "2학기", id);
		Integer rate_english22 = sqlSession.getMapper(GradeImpl.class).rate("영어", "2학년", "2학기", id);
		Integer rate_math22 = sqlSession.getMapper(GradeImpl.class).rate("수학", "2학년", "2학기", id);
		Integer rate_society22 = sqlSession.getMapper(GradeImpl.class).rate("사회", "2학년", "2학기", id);
		Integer rate_science22 = sqlSession.getMapper(GradeImpl.class).rate("과학", "2학년", "2학기", id);
		
		Integer rate_korea31 = sqlSession.getMapper(GradeImpl.class).rate("국어", "3학년", "1학기", id);
		Integer rate_english31 = sqlSession.getMapper(GradeImpl.class).rate("영어", "3학년", "1학기", id);
		Integer rate_math31 = sqlSession.getMapper(GradeImpl.class).rate("수학", "3학년", "1학기", id);
		Integer rate_society31 = sqlSession.getMapper(GradeImpl.class).rate("사회", "3학년", "1학기", id);
		Integer rate_science31 = sqlSession.getMapper(GradeImpl.class).rate("과학", "3학년", "1학기", id);
		
		Integer rate_korea32 = sqlSession.getMapper(GradeImpl.class).rate("국어", "3학년", "2학기", id);
		Integer rate_english32 = sqlSession.getMapper(GradeImpl.class).rate("영어", "3학년", "2학기", id);
		Integer rate_math32 = sqlSession.getMapper(GradeImpl.class).rate("수학", "3학년", "2학기", id);
		Integer rate_society32 = sqlSession.getMapper(GradeImpl.class).rate("사회", "3학년", "2학기", id);
		Integer rate_science32 = sqlSession.getMapper(GradeImpl.class).rate("과학", "3학년", "2학기", id);
		
		double kor_mat_eng1 = (rate_korea11 + rate_math11 + rate_english11 + rate_korea12 + rate_math12 + rate_english12)/6;
		double kor_mat_eng2 = (rate_korea21 + rate_math21 + rate_english21 + rate_korea22 + rate_math22 + rate_english22)/6;
		double kor_mat_eng3 = (rate_korea31 + rate_math31 + rate_english31 + rate_korea32 + rate_math32 + rate_english32)/6;
		
		double kor_mat_eng_soc1 = (rate_korea11 + rate_math11 + rate_english11 + rate_society11 + rate_korea12 + rate_math12 + rate_english12 + rate_society12)/8;
		double kor_mat_eng_soc2 = (rate_korea21 + rate_math21 + rate_english21 + rate_society21 + rate_korea22 + rate_math22 + rate_english22 + rate_society22)/8;
		double kor_mat_eng_soc3 = (rate_korea31 + rate_math31 + rate_english31 + rate_society31 + rate_korea32 + rate_math32 + rate_english32 + rate_society32)/8;
		
		double kor_mat_eng_sci1 = (rate_korea11 + rate_math11 + rate_english11 + rate_science11 + rate_korea12 + rate_math12 + rate_english12 + rate_science12)/8;
		double kor_mat_eng_sci2 = (rate_korea21 + rate_math21 + rate_english21 + rate_science21 + rate_korea22 + rate_math22 + rate_english22 + rate_science22)/8;
		double kor_mat_eng_sci3 = (rate_korea31 + rate_math31 + rate_english31 + rate_science31 + rate_korea32 + rate_math32 + rate_english32 + rate_science32)/8;
		
		double mat_eng_sci1 = (rate_math11 + rate_english11 + rate_science11 + rate_math12 + rate_english12 + rate_science12)/6;
		double mat_eng_sci2 = (rate_math21 + rate_english21 + rate_science21 + rate_math22 + rate_english22 + rate_science22)/6;
		double mat_eng_sci3 = (rate_math31 + rate_english31 + rate_science31 + rate_math32 + rate_english32 + rate_science32)/6;
		
		double kor_eng_soc1 = (rate_korea11 + rate_english11 + rate_society11 + rate_korea12 + rate_english12 + rate_society12)/6;
		double kor_eng_soc2 = (rate_korea21 + rate_english21 + rate_society21 + rate_korea22 + rate_english22 + rate_society22)/6;
		double kor_eng_soc3 = (rate_korea31 + rate_english31 + rate_society31 + rate_korea32 + rate_english32 + rate_society32)/6;
		
		double all1 = (rate_korea11 + rate_math11 + rate_english11 + rate_society11 + rate_science11 + rate_korea12 + rate_math12 + rate_english12 + rate_society12 + rate_science12)/10;
		double all2 = (rate_korea21 + rate_math21 + rate_english21 + rate_society21 + rate_science21 + rate_korea22 + rate_math22 + rate_english22 + rate_society22 + rate_science22)/10;
		double all3 = (rate_korea31 + rate_math31 + rate_english31 + rate_society31 + rate_science31 + rate_korea32 + rate_math32 + rate_english32 + rate_society32 + rate_science32)/10;
		
		Integer korea11 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "1학년", "1학기", id);
		Integer english11 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "1학년", "1학기", id);
		Integer math11 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "1학년", "1학기", id);
		Integer society11 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "1학년", "1학기", id);
		Integer science11 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "1학년", "1학기", id);
		
		Integer korea12 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "1학년", "2학기", id);
		Integer english12 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "1학년", "2학기", id);
		Integer math12 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "1학년", "2학기", id);
		Integer society12 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "1학년", "2학기", id);
		Integer science12 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "1학년", "2학기", id);
		
		Integer korea21 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "2학년", "1학기", id);
		Integer english21 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "2학년", "1학기", id);
		Integer math21 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "2학년", "1학기", id);
		Integer society21 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "2학년", "1학기", id);
		Integer science21 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "2학년", "1학기", id);
		
		Integer korea22 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "2학년", "2학기", id);
		Integer english22 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "2학년", "2학기", id);
		Integer math22 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "2학년", "2학기", id);
		Integer society22 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "2학년", "2학기", id);
		Integer science22 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "2학년", "2학기", id);
		
		Integer korea31 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "3학년", "1학기", id);
		Integer english31 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "3학년", "1학기", id);
		Integer math31 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "3학년", "1학기", id);
		Integer society31 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "3학년", "1학기", id);
		Integer science31 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "3학년", "1학기", id);
		
		Integer korea32 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "3학년", "2학기", id);
		Integer english32 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "3학년", "2학기", id);
		Integer math32 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "3학년", "2학기", id);
		Integer society32 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "3학년", "2학기", id);
		Integer science32 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "3학년", "2학기", id);
		
		model.addAttribute("rate_korea11", rate_korea11);
		model.addAttribute("rate_english11", rate_english11);
		model.addAttribute("rate_math11", rate_math11);
		model.addAttribute("rate_society11", rate_society11);
		model.addAttribute("rate_science11", rate_science11);
		
		model.addAttribute("rate_korea12", rate_korea12);
		model.addAttribute("rate_english12", rate_english12);
		model.addAttribute("rate_math12", rate_math12);
		model.addAttribute("rate_society12", rate_society12);
		model.addAttribute("rate_science12", rate_science12);
		
		model.addAttribute("rate_korea21", rate_korea21);
		model.addAttribute("rate_english21", rate_english21);
		model.addAttribute("rate_math21", rate_math21);
		model.addAttribute("rate_society21", rate_society21);
		model.addAttribute("rate_science21", rate_science21);
		
		model.addAttribute("rate_korea22", rate_korea22);
		model.addAttribute("rate_english22", rate_english22);
		model.addAttribute("rate_math22", rate_math22);
		model.addAttribute("rate_society22", rate_society22);
		model.addAttribute("rate_science22", rate_science22);
		
		model.addAttribute("rate_korea31", rate_korea31);
		model.addAttribute("rate_english31", rate_english31);
		model.addAttribute("rate_math31", rate_math31);
		model.addAttribute("rate_society31", rate_society31);
		model.addAttribute("rate_science31", rate_science31);
		
		model.addAttribute("rate_korea32", rate_korea32);
		model.addAttribute("rate_english32", rate_english32);
		model.addAttribute("rate_math32", rate_math32);
		model.addAttribute("rate_society32", rate_society32);
		model.addAttribute("rate_science32", rate_science32);
		
		model.addAttribute("kor_mat_eng_soc1", kor_mat_eng_soc1);
		model.addAttribute("kor_mat_eng_soc2", kor_mat_eng_soc2);
		model.addAttribute("kor_mat_eng_soc3", kor_mat_eng_soc3);
		
		model.addAttribute("kor_mat_eng_sci1", kor_mat_eng_sci1);
		model.addAttribute("kor_mat_eng_sci2", kor_mat_eng_sci2);
		model.addAttribute("kor_mat_eng_sci3", kor_mat_eng_sci3);

		model.addAttribute("mat_eng_sci1", mat_eng_sci1);
		model.addAttribute("mat_eng_sci2", mat_eng_sci2);
		model.addAttribute("mat_eng_sci3", mat_eng_sci3);
		
		model.addAttribute("kor_eng_soc1", kor_eng_soc1);
		model.addAttribute("kor_eng_soc2", kor_eng_soc2);
		model.addAttribute("kor_eng_soc3", kor_eng_soc3);
		
		model.addAttribute("all1", all1);
		model.addAttribute("all2", all2);
		model.addAttribute("all3", all3);
		
		model.addAttribute("kor_mat_eng1", kor_mat_eng1);
		model.addAttribute("kor_mat_eng2", kor_mat_eng2);
		model.addAttribute("kor_mat_eng3", kor_mat_eng3);
		
		model.addAttribute("korea11", korea11);
		model.addAttribute("english11", english11);
		model.addAttribute("math11", math11);
		model.addAttribute("society11", society11);
		model.addAttribute("science11", science11);
		
		model.addAttribute("korea12", korea12);
		model.addAttribute("english12", english12);
		model.addAttribute("math12", math12);
		model.addAttribute("society12", society12);
		model.addAttribute("science12", science12);
		
		model.addAttribute("korea21", korea21);
		model.addAttribute("english21", english21);
		model.addAttribute("math21", math21);
		model.addAttribute("society21", society21);
		model.addAttribute("science21", science21);
		
		model.addAttribute("korea22", korea22);
		model.addAttribute("english22", english22);
		model.addAttribute("math22", math22);
		model.addAttribute("society22", society22);
		model.addAttribute("science22", science22);
		
		model.addAttribute("korea31", korea31);
		model.addAttribute("english31", english31);
		model.addAttribute("math31", math31);
		model.addAttribute("society31", society31);
		model.addAttribute("science31", science31);
		
		model.addAttribute("korea32", korea32);
		model.addAttribute("english32", english32);
		model.addAttribute("math32", math32);
		model.addAttribute("society32", society32);
		model.addAttribute("science32", science32);
		
		
		model.addAttribute("lists11", lists11);
		model.addAttribute("lists12", lists12);
		model.addAttribute("lists21", lists21);
		model.addAttribute("lists22", lists22);
		model.addAttribute("lists31", lists31);
		model.addAttribute("lists32", lists32);
		
		return "/grade/s_grade2";
	}
	//수능 성적 분석
	@RequestMapping("/j_grade.do")
	public String j_grade(Model model, HttpServletRequest req) {
		
		String years=req.getParameter("years");
		String dates=req.getParameter("dates");
		String year=req.getParameter("year");
		String id=req.getParameter("id");
		
		if(years==null) {
			years="2019";
		}
		if(year==null) {
			year="1y";
		}
		
		if(dates == null) {
			dates = "2019-11-20";
		}
		
		
		//국영수사과 등급 가져오기
		ArrayList<MyJunggradeDTO> lists = sqlSession.getMapper(MybatisMypageDAOImpl.class).junglist(years,dates,year,id);
		model.addAttribute("lists",lists);
		
		ArrayList<CalexDTO> test_lists = sqlSession.getMapper(GradeImpl.class).test_schedule();
		model.addAttribute("test_lists",test_lists);
		
		return "/grade/j_grade";
	}
	
	//대학별 성적 분석
	@RequestMapping("/u_grade.do")
	public String u_grade(HttpServletRequest req, Model model, HttpSession session) {
		
		ArrayList<AllInfoDTO> listM1 =sqlSession.getMapper(UInfoDAOImpl.class).listM1();
		model.addAttribute("listsM1", listM1);
		
		return "/grade/u_grade";
	}
	
	//(전형정보) 체크된 폼값 전달받음 
	@RequestMapping("/u_grade_checkAction.do")
	public String u_grade_checkAction(HttpServletRequest req, Model model, HttpSession session) {


	 //체크한 값
	 ArrayList<AllInfoDTO> listsJ =sqlSession.getMapper(UInfoDAOImpl.class).searchJ_all(

			 req.getParameter("searchWord"),
			 req.getParameter("recruit_time"),
			 req.getParameter("enter_type"),
			 req.getParameter("enter_name"),
			 req.getParameter("location"),
			 req.getParameter("enter_ele"),
			 req.getParameter("major"),
			 req.getParameter("major1"),
			 req.getParameter("major2")
		);

	 model.addAttribute("listsJ", listsJ);
	 
	return "/grade/u_grade";
		
	}
	
	@RequestMapping("/get_grade.do")
	public String get_grade(HttpServletRequest req, Model model, HttpSession session) {
		
		String idx = "";
		if(req.getParameter("idx") != null) {
			idx = req.getParameter("idx"); 
		}
		String recruit_time = "";
		if(req.getParameter("recruit_time") != null) {
			recruit_time = req.getParameter("recruit_time"); 
		}
		String id = "";
		if(req.getParameter("id") != null) {
			id = req.getParameter("id"); 
		}
		
		String uname = "";
		if(req.getParameter("uname") != null) {
			uname = req.getParameter("uname"); 
		}
		
		if(recruit_time.contains("수시")) {
			
			Integer rate_korea11 = sqlSession.getMapper(GradeImpl.class).rate("국어", "1학년", "1학기", id);
			Integer rate_english11 = sqlSession.getMapper(GradeImpl.class).rate("영어", "1학년", "1학기", id);
			Integer rate_math11 = sqlSession.getMapper(GradeImpl.class).rate("수학", "1학년", "1학기", id);
			Integer rate_society11 = sqlSession.getMapper(GradeImpl.class).rate("사회", "1학년", "1학기", id);
			Integer rate_science11 = sqlSession.getMapper(GradeImpl.class).rate("과학", "1학년", "1학기", id);
			
			Integer rate_korea12 = sqlSession.getMapper(GradeImpl.class).rate("국어", "1학년", "2학기", id);
			Integer rate_english12 = sqlSession.getMapper(GradeImpl.class).rate("영어", "1학년", "2학기", id);
			Integer rate_math12 = sqlSession.getMapper(GradeImpl.class).rate("수학", "1학년", "2학기", id);
			Integer rate_society12 = sqlSession.getMapper(GradeImpl.class).rate("사회", "1학년", "2학기", id);
			Integer rate_science12 = sqlSession.getMapper(GradeImpl.class).rate("과학", "1학년", "2학기", id);
			
			Integer rate_korea21 = sqlSession.getMapper(GradeImpl.class).rate("국어", "2학년", "1학기", id);
			Integer rate_english21 = sqlSession.getMapper(GradeImpl.class).rate("영어", "2학년", "1학기", id);
			Integer rate_math21 = sqlSession.getMapper(GradeImpl.class).rate("수학", "2학년", "1학기", id);
			Integer rate_society21 = sqlSession.getMapper(GradeImpl.class).rate("사회", "2학년", "1학기", id);
			Integer rate_science21 = sqlSession.getMapper(GradeImpl.class).rate("과학", "2학년", "1학기", id);
			
			Integer rate_korea22 = sqlSession.getMapper(GradeImpl.class).rate("국어", "2학년", "2학기", id);
			Integer rate_english22 = sqlSession.getMapper(GradeImpl.class).rate("영어", "2학년", "2학기", id);
			Integer rate_math22 = sqlSession.getMapper(GradeImpl.class).rate("수학", "2학년", "2학기", id);
			Integer rate_society22 = sqlSession.getMapper(GradeImpl.class).rate("사회", "2학년", "2학기", id);
			Integer rate_science22 = sqlSession.getMapper(GradeImpl.class).rate("과학", "2학년", "2학기", id);
			
			Integer rate_korea31 = sqlSession.getMapper(GradeImpl.class).rate("국어", "3학년", "1학기", id);
			Integer rate_english31 = sqlSession.getMapper(GradeImpl.class).rate("영어", "3학년", "1학기", id);
			Integer rate_math31 = sqlSession.getMapper(GradeImpl.class).rate("수학", "3학년", "1학기", id);
			Integer rate_society31 = sqlSession.getMapper(GradeImpl.class).rate("사회", "3학년", "1학기", id);
			Integer rate_science31 = sqlSession.getMapper(GradeImpl.class).rate("과학", "3학년", "1학기", id);
			
			Integer rate_korea32 = sqlSession.getMapper(GradeImpl.class).rate("국어", "3학년", "2학기", id);
			Integer rate_english32 = sqlSession.getMapper(GradeImpl.class).rate("영어", "3학년", "2학기", id);
			Integer rate_math32 = sqlSession.getMapper(GradeImpl.class).rate("수학", "3학년", "2학기", id);
			Integer rate_society32 = sqlSession.getMapper(GradeImpl.class).rate("사회", "3학년", "2학기", id);
			Integer rate_science32 = sqlSession.getMapper(GradeImpl.class).rate("과학", "3학년", "2학기", id);
					
			Integer korea11 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "1학년", "1학기", id);
			Integer english11 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "1학년", "1학기", id);
			Integer math11 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "1학년", "1학기", id);
			Integer society11 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "1학년", "1학기", id);
			Integer science11 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "1학년", "1학기", id);
			
			Integer korea12 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "1학년", "2학기", id);
			Integer english12 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "1학년", "2학기", id);
			Integer math12 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "1학년", "2학기", id);
			Integer society12 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "1학년", "2학기", id);
			Integer science12 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "1학년", "2학기", id);
			
			Integer korea21 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "2학년", "1학기", id);
			Integer english21 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "2학년", "1학기", id);
			Integer math21 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "2학년", "1학기", id);
			Integer society21 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "2학년", "1학기", id);
			Integer science21 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "2학년", "1학기", id);
			
			Integer korea22 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "2학년", "2학기", id);
			Integer english22 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "2학년", "2학기", id);
			Integer math22 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "2학년", "2학기", id);
			Integer society22 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "2학년", "2학기", id);
			Integer science22 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "2학년", "2학기", id);
			
			Integer korea31 = sqlSession.getMapper(GradeImpl.class).jumsu("국어", "3학년", "1학기", id);
			Integer english31 = sqlSession.getMapper(GradeImpl.class).jumsu("영어", "3학년", "1학기", id);
			Integer math31 = sqlSession.getMapper(GradeImpl.class).jumsu("수학", "3학년", "1학기", id);
			Integer society31 = sqlSession.getMapper(GradeImpl.class).jumsu("사회", "3학년", "1학기", id);
			Integer science31 = sqlSession.getMapper(GradeImpl.class).jumsu("과학", "3학년", "1학기", id);
			
			double rate_korea = (rate_korea11 + rate_korea12 + rate_korea21 + rate_korea22 + rate_korea31)/5;
			double rate_english = (rate_english11 + rate_english12 + rate_english21 + rate_english22 + rate_english31)/5;
			double rate_math = (rate_math11 + rate_math12 + rate_math21 + rate_math22 + rate_math31)/5;
			double rate_society = (rate_society11 + rate_society12 + rate_society21 + rate_society22 + rate_society31)/5;
			double rate_science = (rate_science11 + rate_science12 + rate_science21 + rate_science22 + rate_science31)/5;
			
			double avg;
			if(rate_society < rate_science) {
				avg = (rate_korea + rate_english + rate_math + rate_society)/4;
			}
			else {
				avg = (rate_korea + rate_english + rate_math + rate_science)/4;
			}
			
			model.addAttribute("rate_korea", rate_korea);
			model.addAttribute("rate_english", rate_english);
			model.addAttribute("rate_math", rate_math);
			model.addAttribute("rate_society", rate_society);
			model.addAttribute("rate_science", rate_science);
			model.addAttribute("avg", avg);
			
		}
		else {
			ArrayList<MyJunggradeDTO> lists = sqlSession.getMapper(GradeImpl.class).all_junglist(id);
			model.addAttribute("lists",lists);
		}
		
		model.addAttribute("recruit_time", recruit_time);
		
		ArrayList<AllInfoDTO> selected_junh = sqlSession.getMapper(UInfoDAOImpl.class).select_junh_by_id(idx);
		model.addAttribute("selected_junh", selected_junh);
		
		model.addAttribute("uname", uname);
		
		return "/grade/grade_temp";
	}
	
	@RequestMapping("/get_grade2.do")
	public String get_grade2(HttpServletRequest req, Model model, HttpSession session) {
		
		String idx = "";
		if(req.getParameter("idx") != null) {
			idx = req.getParameter("idx"); 
		}
		
		String junh_idx = "";
		if(req.getParameter("junh_idx") != null) {
			junh_idx = req.getParameter("junh_idx"); 
		}
		
		ArrayList<MyJunggradeDTO> lists = sqlSession.getMapper(GradeImpl.class).select_one(idx);
		model.addAttribute("lists",lists);
		
		ArrayList<AllInfoDTO> selected_junh = sqlSession.getMapper(UInfoDAOImpl.class).select_junh_by_id(junh_idx);
		model.addAttribute("selected_junh", selected_junh);
		
		String uname = "";
		if(req.getParameter("uname") != null) {
			uname = req.getParameter("uname"); 
		}
		model.addAttribute("uname", uname);
		
		return "/grade/grade_temp2";
	}
	
	//지도 가져오기
	@RequestMapping("/library.do")
	public String library(Model model, HttpServletRequest req) {
		
		int distance = (req.getParameter("distance") == null) ?
				0 : Integer.parseInt(req.getParameter("distance"));
		double latTxt = (req.getParameter("latTxt") == null) ?
				0 : Double.parseDouble(req.getParameter("latTxt"));
		double lngTxt = (req.getParameter("lngTxt") == null) ?
				
				0 : Double.parseDouble(req.getParameter("lngTxt"));
		
		ArrayList<MyLibraryDTO> searchLists = null;
		
		if(distance != 0) {
			searchLists = sqlSession.getMapper(GradeImpl.class).searchLibrary(distance, latTxt, lngTxt);
		}
		
		model.addAttribute("searchLists", searchLists);
		
		return "/board/library";
	}
	
	@RequestMapping("/like_action.do")
   @ResponseBody
   public Map<String, Object> like_action(Model model, HttpServletRequest req, HttpSession session) {
      
      
      Map<String, Object> map = new HashMap<String, Object>();
      
      String id = (String)session.getAttribute("siteUserInfo");
      String l_num = req.getParameter("l_num");
      
      //중복체크 먼저
      int like_check = sqlSession.getMapper(GradeImpl.class).like_check(id, l_num);
      System.out.println("like_check="+like_check);
      
      if(like_check > 0) {
         sqlSession.getMapper(GradeImpl.class).unlike(id, l_num);
         map.put("statusCode",2);
      }
      else if(like_check==0) {
         //좋아요 등록
         int result = sqlSession.getMapper(GradeImpl.class).like_action(id, l_num);
         
         if(result<=0) {
            map.put("statusCode",0);
         }
         else {
            map.put("statusCode",1);
         }
      }
      
      //좋아요 총 개수
      int l_count = sqlSession.getMapper(GradeImpl.class).like_count(l_num);
      map.put("l_count",l_count);
      
      sqlSession.getMapper(GradeImpl.class).like_update(l_num, l_count); 
      
      return map;
   }
	
}
