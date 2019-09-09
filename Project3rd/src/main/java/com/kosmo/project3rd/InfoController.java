package com.kosmo.project3rd;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {

	
	@RequestMapping("/info.do")
	public String info() {
		
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
