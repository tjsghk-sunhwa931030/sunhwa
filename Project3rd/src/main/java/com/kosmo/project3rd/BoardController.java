package com.kosmo.project3rd;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/board.do")
	public String board() {
		
		return "board/board";
	}
	

}
