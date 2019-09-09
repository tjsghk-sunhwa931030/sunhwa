package com.kosmo.project3rd;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping("/interuniv.do")
	public String interuniv() {
		
		return "mypage/interuniv";
	}
	
	
	@RequestMapping("/schedule.do")
	public String schedule() {
		
		return "mypage/schedule";
	}
	
	@RequestMapping("/sugrade.do")
	public String sugrade() {
		
		return "mypage/sugrade";
	}
	
	@RequestMapping("/junggrade.do")
	public String junggrade() {
		
		return "mypage/junggrade"; 
	}
	
	@RequestMapping("/attendence.do")
	public String attendence() {
	
		return "mypage/attendence";
	}
	
	@RequestMapping("/voluntary.do")
	public String voluntary() {
		
		return "mypage/voluntary";
	}
	
	@RequestMapping("/mylist.do")
	public String mylist() {
		
		return "mypage/mylist.do";
	}
	
	@RequestMapping("/personaldata.do")
	public String personaldata() {
		
		return "mypage/personaldata";
	}
	
	@RequestMapping("/chpassword.do")
	public String chpassword() {
		
		return "mypage/chpassword";
	}

}
