package com.kosmo.project3rd;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpServerErrorException;

import com.fasterxml.jackson.databind.JsonNode;

import mybatis.CalexDTO;
import mybatis.GradeImpl;
import mybatis.MyAttendanceDTO;
import mybatis.MyBoardDTO;
import mybatis.MyBoardReplyDTO;
import mybatis.MyInterestunivDTO;
import mybatis.MyJunggradeDTO;
import mybatis.MyQnaDTO;
import mybatis.MyQnaReplyDTO;
import mybatis.MySugradeDTO;
import mybatis.MyVoluntaryDTO;
import mybatis.MybatisMypageDAOImpl;
import mybatis.PersonalDTO;
import mybatis.TestScheduleDTO;

@Controller
public class MypageController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//마이페이지진입(관심대학페이지)
	@RequestMapping(value="/interuniv.do")
	public String interuniv(Model model, HttpServletRequest req) {
		
		String u_type1="일반대";
		String u_type2="전문대";
		String id=req.getParameter("id");
		
		ArrayList<MyInterestunivDTO> lists1 = sqlSession.getMapper(MybatisMypageDAOImpl.class).interuniv1(u_type1,id);
		ArrayList<MyInterestunivDTO> lists2 = sqlSession.getMapper(MybatisMypageDAOImpl.class).interuniv2(u_type2,id);
		
		model.addAttribute("lists1",lists1);
		model.addAttribute("lists2",lists2);
		
		return "mypage/interuniv";
	}
	
	//관심대학삭제
	@RequestMapping("/deleteinteruniv.do")
	public String deleteinteruniv(HttpServletRequest req, Model model, HttpSession session) {
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).deleteinteruniv(Integer.parseInt(req.getParameter("idx")));
		 
		return "redirect:interuniv.do?id="+req.getParameter("id");  
	}
	
	
	//일정페이지진입
	@RequestMapping("/schedule.do")
	public String schedule() {
		
		return "mypage/schedule";
	}
	
	
	//수시성적페이지진입
	@RequestMapping("/sugrade.do")
	public String sugrade(Model model, HttpServletRequest req) {
		
		String year="";
		String semester="";
		String id = req.getParameter("id");
		
		if(req.getParameter("year")==null) {
			year="1학년";
		}
		else {
			year=req.getParameter("year");
		}
		
		if(req.getParameter("semester")==null) {
			semester="1학기";
		}
		else {
			semester=req.getParameter("semester");
		}
		
		ArrayList<MySugradeDTO> lists = sqlSession.getMapper(MybatisMypageDAOImpl.class).SulistPage(year,semester,id);
		
		model.addAttribute("lists",lists);
		
		return "mypage/sugrade";
	}
	
	
	//수시성적저장
	@RequestMapping(value="/suAction.do",method=RequestMethod.POST)
	public String sugradeok(Model model, HttpServletRequest req, HttpSession session) {
		
		/*
		 * //로그인이 해제되었는제 확인후 작성완료 if(session.getAttribute("siteUserInfo")==null) {
		 * return "redirect:login.do"; //페이지이름은 바뀔수있음. }
		 */
		
		//Mybatis사용
		sqlSession.getMapper(MybatisMypageDAOImpl.class).sugrade(
				req.getParameter("subject"), 
				req.getParameter("subject_type"),
				Integer.parseInt(req.getParameter("counts")),
				Integer.parseInt(req.getParameter("rate")),
				Integer.parseInt(req.getParameter("jumsu")),
				Double.parseDouble(req.getParameter("avg")),
				Integer.parseInt(req.getParameter("deviation")),
				Integer.parseInt(req.getParameter("totalman")),
				req.getParameter("year"),
				req.getParameter("semester"),
				req.getParameter("id")
				);
		
		
		return "redirect:sugrade.do?id="+req.getParameter("id");
	}
	
	
	//수시성적 수정
	@RequestMapping("/suedit.do")
	public String edit(HttpServletRequest req, Model model, HttpSession session) {
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		String id = req.getParameter("id");
		String subject_type = req.getParameter("subject_type");
		int counts = Integer.parseInt(req.getParameter("counts"));
		int rate = Integer.parseInt(req.getParameter("rate"));
		double jumsu = Double.parseDouble(req.getParameter("jumsu"));
		double avg = Double.parseDouble(req.getParameter("avg"));
		int deviation = Integer.parseInt(req.getParameter("deviation"));
		int totalman = Integer.parseInt(req.getParameter("totalman"));
		
 
		sqlSession.getMapper(MybatisMypageDAOImpl.class).editsugrade(
				idx,id,subject_type,counts,rate,jumsu,avg,deviation,totalman
				);
		
		return "redirect:sugrade.do?id="+req.getParameter("id");
	}
	
	//정시성적페이지진입
	@RequestMapping("/junggrade.do")
	public String junggrade(Model model, HttpServletRequest req) {
		
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
		
		System.out.println(years);
		System.out.println(dates);
		System.out.println(year);
		System.out.println(id);
		
		int count = sqlSession.getMapper(MybatisMypageDAOImpl.class).count(years,dates,year,id);
		ArrayList<MyJunggradeDTO> lists = sqlSession.getMapper(MybatisMypageDAOImpl.class).junglist(years,dates,year,id);
		ArrayList<CalexDTO> test_lists = sqlSession.getMapper(GradeImpl.class).test_schedule();
		
		model.addAttribute("count",count);
		model.addAttribute("lists",lists);
		model.addAttribute("test_lists",test_lists);
		
		return "mypage/junggrade"; 
	}
	
	
	//정시성적저장
	@RequestMapping(value="/jungAction.do",method=RequestMethod.POST)
	public String jungAction(Model model, HttpServletRequest req, HttpSession session) throws UnsupportedEncodingException {
		
		System.out.println(req.getParameter("years"));
		System.out.println(req.getParameter("year"));
		System.out.println(req.getParameter("ex_name"));
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).deletejung(req.getParameter("id"),req.getParameter("years"),req.getParameter("year"),req.getParameter("dates"));
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).junggrade(
					req.getParameter("id"),
					req.getParameter("years"),
					req.getParameter("dates"),
					req.getParameter("ex_name"),
					req.getParameter("year"),
					req.getParameter("natives"),
					Integer.parseInt(req.getParameter("native_standard")),
					Integer.parseInt(req.getParameter("native_percent")),
					Integer.parseInt(req.getParameter("native_rate")),
					req.getParameter("math"),
					req.getParameter("math_type"),
					Integer.parseInt(req.getParameter("math_standard")),
					Integer.parseInt(req.getParameter("math_percent")),
					Integer.parseInt(req.getParameter("math_rate")),
					req.getParameter("eng"),
					Integer.parseInt(req.getParameter("eng_rate")),
					req.getParameter("study1"),
					req.getParameter("study1_type"),
					Integer.parseInt(req.getParameter("study1_standard")),
					Integer.parseInt(req.getParameter("study1_percent")),
					Integer.parseInt(req.getParameter("study1_rate")),
					req.getParameter("study2"),
					req.getParameter("study2_type"),
					Integer.parseInt(req.getParameter("study2_standard")),
					Integer.parseInt(req.getParameter("study2_percent")),
					Integer.parseInt(req.getParameter("study2_rate")),
					req.getParameter("foreign"),
					req.getParameter("foreign_type"),
					Integer.parseInt(req.getParameter("foreign_standard")),
					Integer.parseInt(req.getParameter("foreign_percent")),
					Integer.parseInt(req.getParameter("foreign_rate")),
					req.getParameter("history"),
					Integer.parseInt(req.getParameter("history_rate"))
				);
		
		
		return "redirect:junggrade.do?id="+req.getParameter("id")+"&years="+req.getParameter("years")+"&dates="+req.getParameter("dates")+"&ex_name="+req.getParameter("ex_name")+"&year="+req.getParameter("year");
	}
	
	
	//출결사항/봉사활동페이지진입(정보출력)
	@RequestMapping("/attenvolun.do")
	public String attendence(Model model, HttpServletRequest req) {
		
		String id=req.getParameter("id");
		
		int count1 = sqlSession.getMapper(MybatisMypageDAOImpl.class).count1(id);
		int count2 = sqlSession.getMapper(MybatisMypageDAOImpl.class).count2(id);
		
		ArrayList<MyAttendanceDTO> lists1 = sqlSession.getMapper(MybatisMypageDAOImpl.class).attenlist(id);
		ArrayList<MyVoluntaryDTO> lists2 = sqlSession.getMapper(MybatisMypageDAOImpl.class).volunlist(id);
		
		model.addAttribute("count1",count1);
		model.addAttribute("count2",count2);
		model.addAttribute("lists1",lists1);
		model.addAttribute("lists2",lists2);
	
		return "mypage/attenvolun";
	}
	
	//출결사항저장
	@RequestMapping(value="/attenAction.do",method=RequestMethod.POST)
	public String attenaction(Model model, HttpServletRequest req, HttpSession session) {

		sqlSession.getMapper(MybatisMypageDAOImpl.class).deleteatten(req.getParameter("id"));
	
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).attensave(
				req.getParameter("id"),
				Integer.parseInt(req.getParameter("absence1")),
				Integer.parseInt(req.getParameter("late1")),
				Integer.parseInt(req.getParameter("leave1")),
				Integer.parseInt(req.getParameter("outcome1")),
				Integer.parseInt(req.getParameter("absence2")),
				Integer.parseInt(req.getParameter("late2")),
				Integer.parseInt(req.getParameter("leave2")),
				Integer.parseInt(req.getParameter("outcome2")),
				Integer.parseInt(req.getParameter("absence3")),
				Integer.parseInt(req.getParameter("late3")),
				Integer.parseInt(req.getParameter("leave3")),
				Integer.parseInt(req.getParameter("outcome3"))
				);
		
		
	
		return "redirect:attenvolun.do?id="+req.getParameter("id");
	}
	
	//봉사활동저장
	@RequestMapping(value="/volunAction.do", method=RequestMethod.POST)
	public String vlunaction(Model model, HttpServletRequest req, HttpSession session) {
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).deletevolun(req.getParameter("id"));
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).volunsave(
				req.getParameter("id"),
				Integer.parseInt(req.getParameter("hour1")),
				Integer.parseInt(req.getParameter("hour2")),
				Integer.parseInt(req.getParameter("hour3"))
				);
		
		return "redirect:attenvolun.do?id="+req.getParameter("id");
	}
	
	
	//나의글페이지진입
	@RequestMapping("/mylist.do")
	public String mylist(Model model, HttpServletRequest req) {
		
		String id = req.getParameter("id");
		
		ArrayList<MyBoardDTO> lists1 = sqlSession.getMapper(MybatisMypageDAOImpl.class).myboard(id);
		ArrayList<MyBoardReplyDTO> lists2 = sqlSession.getMapper(MybatisMypageDAOImpl.class).myboardreply(id);
		ArrayList<MyQnaDTO> lists4 = sqlSession.getMapper(MybatisMypageDAOImpl.class).myqna(id);
		ArrayList<MyQnaReplyDTO> lists3 = sqlSession.getMapper(MybatisMypageDAOImpl.class).myqnareply(id);
		
		model.addAttribute("lists1",lists1);
		model.addAttribute("lists2",lists2);
		model.addAttribute("lists4",lists4);
		model.addAttribute("lists3",lists3);
		
		return "mypage/mylist";
	}
	
	//질문항목삭제
	@RequestMapping("/deleteqna.do")
	public String deleteqna(Model model, HttpServletRequest req, HttpSession session) {
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).deleteqna(Integer.parseInt(req.getParameter("idx")));
		
		return "redirect:mylist.do?id="+req.getParameter("id");
	}
	//댓글항목삭제
	@RequestMapping("/deletereply.do")
	public String deletereply(Model model, HttpServletRequest req, HttpSession session) {
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).deletereply(Integer.parseInt(req.getParameter("idx")));
		
		return "redirect:mylist.do?id="+req.getParameter("id");
	}
	//게시물삭제
	@RequestMapping("/deletewrite.do")
	public String deletewrite(Model model, HttpServletRequest req, HttpSession session) {
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).deletewrite(Integer.parseInt(req.getParameter("idx")));
		
		return "redirect:mylist.do?id="+req.getParameter("id");
	}
	//질문댓글항목삭제
	@RequestMapping("/deleteqnareply.do")
	public String deleteqnareply(Model model, HttpServletRequest req, HttpSession session){
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).deleteqnareply(Integer.parseInt(req.getParameter("idx")));
		
		return "redirect:mylist.do?id="+req.getParameter("id");
	}
	
	//개인정보수정페이지진입
	@RequestMapping("/personaldata.do")
	public String personaldata(Model model, HttpServletRequest req) {
		
		String id=req.getParameter("id");
		
		ArrayList<PersonalDTO> lists = sqlSession.getMapper(MybatisMypageDAOImpl.class).personallist(id);
		
		model.addAttribute("lists", lists);
		
		return "mypage/personaldata";
	}
	
	//개인정보수정처리
	@RequestMapping("/personalAction.do")
	public String personalaction(Model model, HttpServletRequest req, HttpSession session) {
		
		String email_ok="";
		String sms_ok="";
		String email_id = req.getParameter("email_id");
		String email_domain = req.getParameter("email_domain");
		String email = email_id+"@"+email_domain;
		
		System.out.println(email);
		
		if(req.getParameter("sms_ok")==null) {
			sms_ok="0";
		}
		else {
			sms_ok = req.getParameter("sms_ok");
		}
		
		if(req.getParameter("email_ok")==null) {
			email_ok = "0";
		}
		else {
			email_ok = req.getParameter("email_ok");
		}
		
		System.out.println(sms_ok);
		System.out.println(email_ok);
		System.out.println(req.getParameter("name"));
		System.out.println(req.getParameter("phone"));
		System.out.println(req.getParameter("id"));
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).personalaction(
				req.getParameter("name"),
				email,
				req.getParameter("phone"), 
				sms_ok,
				email_ok,
				req.getParameter("id")
				);
		
		
		return "redirect:personaldata.do?id="+req.getParameter("id");
	}
	
	//회원탈퇴
	@RequestMapping("/delete_member.do")
	public String delete_member(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
		
		String id=req.getParameter("id");
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).delete_member(id);
		
		//로그아웃 처리
			kakao_restapi kr = new kakao_restapi();
			JsonNode node = kr.Logout(session.getAttribute("siteUserInfo").toString());
			// 세션영역을 비워준다.
			session.setAttribute("siteUserInfo", null);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('계정이 삭제되었습니다'); </script>");
        out.flush();
        
		return "main/main";
	}
	
	//비밀번호바꾸기페이지진입(현재비밀번호뭔지저장하기)
	@RequestMapping("/chpassword.do")
	public String chpassword(Model model, HttpServletRequest req) {
		
		String id = req.getParameter("id");
		
		String nowpass = sqlSession.getMapper(MybatisMypageDAOImpl.class).whatnowpass(id);
		
		model.addAttribute("whatnowpass",nowpass);
		
		return "mypage/chpassword";
	}
	//비밀번호변경처리
	@RequestMapping("/chpassAction.do")
	public String chpassaction(Model model, HttpServletRequest req, HttpSession session) {
		
		String chpass = req.getParameter("chpass");
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).chpassaction( 
				chpass,
				req.getParameter("id")
				);
		
		return "redirect:chpassword.do?id="+req.getParameter("id");
	}
	
	
	
	
	
	
	
	
		//달력에 데이터받아와서 표시
		@RequestMapping("/jsonView.do")
		@ResponseBody
		public ArrayList<Map> responseBodyView(Model model, HttpServletRequest req,HttpSession session) {
			
			String userId = (String)session.getAttribute("siteUserInfo");
			
			if(userId==null) {
				userId="???";
			}
			
			String auth = "admin";
			System.out.println("dfsdfsfsdfd"+userId);
			
			
			ArrayList<CalexDTO> lists = sqlSession.getMapper(MybatisMypageDAOImpl.class).selectcal(userId,auth);
			
			ArrayList<Map> list = new ArrayList<Map>(); //[]형태
			
			
			for(int i=0; i<lists.size(); i++) {
				Map<String ,Object> map = new HashMap<String, Object>();
				
				lists.get(i).getId();
				map.put("_id", lists.get(i).getId());
				map.put("title", lists.get(i).getTitle());
				map.put("description", lists.get(i).getDescriptions());
				map.put("start", lists.get(i).getStarts());
				map.put("end", lists.get(i).getEnds());
				map.put("type", lists.get(i).getTypes());
				map.put("username", lists.get(i).getUsername());
				map.put("backgroundColor", lists.get(i).getBackgroundColor());
				map.put("textColor", lists.get(i).getTextColor());
				map.put("allDay", lists.get(i).getAllDay());
				
				System.out.println(lists.get(i).getId());
				System.out.println(lists.get(i).getTitle());
				System.out.println(lists.get(i).getDescriptions());
				System.out.println(lists.get(i).getStarts());
				System.out.println(lists.get(i).getEnds());
				System.out.println(lists.get(i).getTypes());
				System.out.println(lists.get(i).getUsername());
				System.out.println(lists.get(i).getBackgroundColor());
				System.out.println(lists.get(i).getTextColor());
				System.out.println(lists.get(i).getAllDay());
				
				list.add(map);
			}
			
			return list;
		}
		
		
		//새로운 일정 저장
		@RequestMapping(value="savecal.do", method=RequestMethod.GET)
		public String savecal(Model model, HttpServletRequest req, HttpSession session) {
			
			String userId = req.getParameter("userId");
			System.out.println(userId);
			
			sqlSession.getMapper(MybatisMypageDAOImpl.class).addcal(
						req.getParameter("_id"),
						req.getParameter("userId"),
						req.getParameter("title"),
						req.getParameter("start"),
						req.getParameter("end"),
						req.getParameter("description"),
						req.getParameter("type"),
						req.getParameter("username"),
						req.getParameter("backgroundColor"),
						req.getParameter("textColor"),
						req.getParameter("allDay")
					);
			
			System.out.println(req.getParameter("_id"));
			System.out.println(req.getParameter("userId"));
			System.out.println(req.getParameter("title"));
			System.out.println(req.getParameter("start"));
			System.out.println(req.getParameter("end"));
			System.out.println(req.getParameter("description"));
			System.out.println(req.getParameter("type"));
			System.out.println(req.getParameter("username"));
			System.out.println(req.getParameter("backgroundColor"));
			System.out.println(req.getParameter("textColor"));
			System.out.println(req.getParameter("allDay"));
			
			return "redirect:jsonView.do";
		}
		
		 
		//일정수정
		@RequestMapping("editcal.do")
		public String editcal(HttpServletRequest req, Model model, HttpSession session, HttpServletResponse response) {
			
			String userId = (String)session.getAttribute("siteUserInfo");
			String id = req.getParameter("id");
			String title = req.getParameter("title");
			String start = req.getParameter("start");
			String end = req.getParameter("end");
			String description = req.getParameter("description");
			String type = req.getParameter("type");
			String backgroundColor = req.getParameter("backgroundColor");
			String allDay = req.getParameter("allDay");
			
			String whatId = sqlSession.getMapper(MybatisMypageDAOImpl.class).whatId(id);
			
			System.out.println("일정의 사용자아이디"+whatId);
			 
			int a= 0;
			
			if(userId.equals(whatId)) {
				System.out.println("?????????????????????????????????????");
				sqlSession.getMapper(MybatisMypageDAOImpl.class).editcal(
						title,start,end,description,type,backgroundColor,allDay,id
						);
				
				a = 1;
			}
			else {
				System.out.println("|||||||||||||||||||||||||||||||||||");
				a = 0;
			}
			
			System.out.println(id);
			System.out.println(userId);
		/*
		 * System.out.println(title); System.out.println(start);
		 * System.out.println(end); System.out.println(description);
		 * System.out.println(type); System.out.println(backgroundColor);
		 * System.out.println(allDay);
		 */
			
			
			model.addAttribute("result",a);
			
			return "redirect:jsonView.do";
			
		}
		
		//드롭일정수정(날짜)
		@RequestMapping("editDate.do")
		public String editdate(HttpServletRequest req, Model model, HttpSession session) {
			
			String id = req.getParameter("id");
			String startDate = req.getParameter("startDate");
			String endDate = req.getParameter("endDate"); 
			
			System.out.println(id);
			System.out.println(startDate);
			System.out.println(endDate);
			
			sqlSession.getMapper(MybatisMypageDAOImpl.class).editDate(
					startDate,endDate,id
					
					);
			
			
			return "redirect:jsonView.do";
		}
		
		
		//일정삭제
		@RequestMapping("deletecal.do")
		public String deletecal(HttpServletRequest req, Model model, HttpSession session) {
			
			String id = req.getParameter("id");
			System.out.println(id);
			
			sqlSession.getMapper(MybatisMypageDAOImpl.class).deletecal(id);
			
			return "redirect:jsonView.do";
		}

}