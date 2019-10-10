package com.kosmo.project3rd;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;

import common.BoardDAOImpl;
import common.BoardDTO;
import common.BoardReplyDTO;
import common.ReplyDAOImpl;
import mybatis.CalexDTO;
import mybatis.CoconutDTO;
import mybatis.GradeDTO;
import mybatis.GradeImpl;
import mybatis.MyLibraryDTO;
import mybatis.MybatisMemberImpl;
import mybatis.MybatisMypageDAOImpl;
import mybatis.PersonalDTO;
import mybatis.TestScheduleDTO;

@Controller
public class AdminController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("admin_main.do")
	public String admin_main() {
		
		return "admin/login";
	}
	
	@RequestMapping("main_page.do")
	public String main_page(HttpSession session) {
		
		ArrayList<CoconutDTO> vo = sqlSession.getMapper(MybatisMemberImpl.class).all_member();
		session.setAttribute("vo", vo);
		
		int[] visit_per_month = new int[12];
		
		for(int i = 0; i < 12; i++) {
			String month = Integer.toString(i+1);
			visit_per_month[i] = sqlSession.getMapper(GradeImpl.class).select_visit("2019", month);
		}
		
		session.setAttribute("month_1", visit_per_month[0]);
		session.setAttribute("month_2", visit_per_month[1]);
		session.setAttribute("month_3", visit_per_month[2]);
		session.setAttribute("month_4", visit_per_month[3]);
		session.setAttribute("month_5", visit_per_month[4]);
		session.setAttribute("month_6", visit_per_month[5]);
		session.setAttribute("month_7", visit_per_month[6]);
		session.setAttribute("month_8", visit_per_month[7]);
		session.setAttribute("month_9", visit_per_month[8]);
		session.setAttribute("month_10", visit_per_month[9]);
		session.setAttribute("month_11", visit_per_month[10]);
		session.setAttribute("month_12", visit_per_month[11]);
		
		return "admin/index";
	}
	
	@RequestMapping("admin_login.do")
	public String admin_login() {
		
		return "admin/login";
	}
	
	@RequestMapping("admin_charts.do")
	public String admin_charts() {
		
		return "admin/charts";
	}
	
	@RequestMapping("admin_tables.do")
	public String admin_tables(HttpSession session) {
		
		ArrayList<CoconutDTO> vo = sqlSession.getMapper(MybatisMemberImpl.class).all_member();
		
		session.setAttribute("vo", vo);
		
		return "admin/tables";
	}
	
	//로그인 처리
	@RequestMapping("admin_loginAction.do")
	public ModelAndView loginAction(HttpServletRequest req, HttpSession session, HttpServletResponse response)
			throws Exception {
		CoconutDTO vo = sqlSession.getMapper(MybatisMemberImpl.class).admin_login(req.getParameter("ID"),
				req.getParameter("PASS1"));

		ModelAndView mv = new ModelAndView();
		if (vo == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인하세요'); </script>");
			out.flush();
			mv.setViewName("admin/login");
			return mv;
		} 
		else {
			// 로그인에 성공한 경우 Session영역에 속성 저장
			session.setAttribute("siteUserInfo", vo.getID());
		}

		// 로그인 후 페이지 이동
		String backUrl = req.getParameter("backUrl");
		if (backUrl == null || backUrl.equals("")) {
			mv.setViewName("redirect:main_page.do");
		} else {
			// 로그인후 글쓰기 페이지로 이동함.
			mv.setViewName(backUrl);
		}
		return mv;
	}
	
	//로그아웃 처리
	@RequestMapping("admin_logout.do")
	public String logout(HttpSession session) {

		 kakao_restapi kr = new kakao_restapi();

		 JsonNode node = kr.Logout(session.getAttribute("siteUserInfo").toString());

		 System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));

		// 세션영역을 비워준다.
		session.setAttribute("siteUserInfo", null);
		return "admin/login";
	}
	
	//멤버 수정 페이지
	@RequestMapping("member_modify.do")
	public String member_modify(Model model, HttpServletRequest req) {
		
		String id=req.getParameter("id");
		
		ArrayList<PersonalDTO> lists = sqlSession.getMapper(MybatisMypageDAOImpl.class).personallist(id);
		model.addAttribute("lists", lists);
		
		return "admin/member_modify";
	}
	
	//개인정보수정처리
	@RequestMapping("/modify_action.do")
	public String modify_action(Model model, HttpServletRequest req, HttpSession session) {
		
		String email_ok="";
		String sms_ok="";
		String email_id = req.getParameter("email_id");
		String email_domain = req.getParameter("email_domain");
		String email = email_id+"@"+email_domain;
		
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
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).update_member(
				req.getParameter("name"),
				req.getParameter("pass1"),
				email,
				req.getParameter("phone"), 
				sms_ok,
				email_ok,
				req.getParameter("auth"),
				req.getParameter("id")
				);
		
		
		return "redirect:admin_tables.do";
	}
	
	//회원삭제
	@RequestMapping("/delete_member_admin.do")
	public String delete_member_admin(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
		
		String id=req.getParameter("id");
		
		sqlSession.getMapper(MybatisMypageDAOImpl.class).delete_member(id);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('계정이 삭제되었습니다'); </script>");
        out.flush();
        
		return "admin/tables";
	}
	
	//시험 스케줄
	@RequestMapping("/test_schedule.do")
	public String test_schedule(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
		
		ArrayList<CalexDTO> lists = sqlSession.getMapper(GradeImpl.class).test_schedule();
		session.setAttribute("lists", lists);
		
		return "admin/test_schedule";
	}
	
	//시험 스케줄 수정
	@RequestMapping("/test_modify.do")
	public String test_modify(Model model, HttpServletRequest req) {
		
		String id=req.getParameter("id");
		ArrayList<CalexDTO> lists = sqlSession.getMapper(GradeImpl.class).test_schedule_modify(id);
		model.addAttribute("lists", lists);
		
		return "admin/test_modify";
	}
		
	//시험 일정 수정처리
	@RequestMapping("/test_modify_action.do")
	public String test_modify_action(Model model, HttpServletRequest req, HttpSession session) {
		
		sqlSession.getMapper(GradeImpl.class).update_test_schedule(
				req.getParameter("title"),
				req.getParameter("descriptions"),
				req.getParameter("starts"),
				req.getParameter("ends"),
				req.getParameter("types"),
				req.getParameter("username"),
				req.getParameter("backgroundColor"),
				req.getParameter("textColor"),
				req.getParameter("allDay"),
				req.getParameter("id")
				);
		
		return "redirect:test_schedule.do";
	}	
	//시험 일정 삭제
	@RequestMapping("/delete_test_schedule.do")
	public String delete_test_schedule(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
		
		String id=req.getParameter("id");
		
		sqlSession.getMapper(GradeImpl.class).delete_test_schedule(id);
		
		/*
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		 * response.getWriter();
		 * out.println("<script>alert('시험 일정이 삭제되었습니다'); </script>"); out.flush();
		 */
        
		return "redirect:test_schedule.do";
	}
	
	//시험 일정 입력 진입
	@RequestMapping("/test_insert.do")
	public String test_insert(){
        
		return "admin/test_insert";
	}
	//시험 일정 입력 처리
	@RequestMapping("/test_insert_action.do")
	public String test_insert_action(Model model, HttpServletRequest req){
        
		String userId = req.getParameter("userId");
		
		sqlSession.getMapper(GradeImpl.class).insert_test_schedule(
				req.getParameter("id"),
				req.getParameter("title"),
				req.getParameter("descriptions"),
				req.getParameter("starts"),
				req.getParameter("ends"),
				req.getParameter("types"),
				req.getParameter("username"),
				req.getParameter("backgroundColor"),
				req.getParameter("textColor"),
				req.getParameter("allDay"),
				userId
		);
		
		return "redirect:test_schedule.do";
	}
	
	//도서관 관리
	@RequestMapping("/all_library.do")
	public String all_library(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
		
		ArrayList<MyLibraryDTO> lists = sqlSession.getMapper(GradeImpl.class).library();
		session.setAttribute("lists", lists);
		
		return "admin/library";
	}
	
	//도서관 수정
	@RequestMapping("/library_modify.do")
	public String library_modify(Model model, HttpServletRequest req) {
		
		String l_num = req.getParameter("l_num");
		ArrayList<MyLibraryDTO> lists = sqlSession.getMapper(GradeImpl.class).library_by_id(l_num);
		model.addAttribute("lists", lists);
		
		return "admin/library_modify";
	}
	
	//도서관 수정처리
	@RequestMapping("/library_modify_action.do")
	public String library_modify_action(Model model, HttpServletRequest req, HttpSession session) {
		
		
		String l_num = req.getParameter("l_num");
		
		System.out.println("what? " + l_num);
		
		sqlSession.getMapper(GradeImpl.class).update_library(
				req.getParameter("l_name"),
				req.getParameter("sido"),
				req.getParameter("sigungu"),
				req.getParameter("rest_day"),
				req.getParameter("weekday_start"),
				req.getParameter("weekday_end"),
				req.getParameter("saturday_start"),
				req.getParameter("saturday_end"),
				req.getParameter("holiday_start"),
				req.getParameter("holiday_end"),
				req.getParameter("phone_num"),
				req.getParameter("addr"),
				req.getParameter("hp_latitude"),
				req.getParameter("hp_longitude"), 
				Integer.parseInt(req.getParameter("l_like")),
				l_num
				);
		
		return "redirect:all_library.do";
	}	
	
	//도서관 삭제
	@RequestMapping("/delete_library.do")
	public String delete_library(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
		
		String l_num = req.getParameter("l_num");
		
		sqlSession.getMapper(GradeImpl.class).delete_library(l_num);
		
		/*
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		 * response.getWriter();
		 * out.println("<script>alert('시험 일정이 삭제되었습니다'); </script>"); out.flush();
		 */
        
		return "redirect:all_library.do";
	}
	
	//도서관 입력 진입
	@RequestMapping("/library_insert.do")
	public String library_insert(){
        
		return "admin/library_insert";
	}
	
	//도서관 입력 처리
	@RequestMapping("/library_insert_action.do")
	public String library_insert_action(Model model, HttpServletRequest req){
        
		sqlSession.getMapper(GradeImpl.class).insert_library(
				req.getParameter("l_name"),
				req.getParameter("sido"),
				req.getParameter("sigungu"),
				req.getParameter("addr"),
				req.getParameter("weekday_start"),
				req.getParameter("weekday_end"),
				req.getParameter("saturday_start"),
				req.getParameter("saturday_end"),
				req.getParameter("holiday_start"),
				req.getParameter("holiday_end"),
				req.getParameter("rest_day"),
				req.getParameter("phone_num"),
				req.getParameter("hp_latitude"),
				req.getParameter("hp_longitude"), 
				Integer.parseInt(req.getParameter("l_like"))
		);
		
		return "redirect:all_library.do";
	}
	
	//게시판 불러오기
	@RequestMapping("/admin_board.do")
	public String admin_board(HttpSession session, HttpServletRequest req) {
		
		String bname = "all";
		
		ArrayList<BoardDTO> lists = sqlSession.getMapper(BoardDAOImpl.class).admin_board(); 
		session.setAttribute("lists", lists);
		
		return "admin/admin_board";
	}
	
	//게시판 불러오기
	@RequestMapping("/admin_board2.do")
	public String admin_board2(HttpSession session, HttpServletRequest req) {
		
		String bname = "";
		
		if(req.getParameter("param") != null) {
			bname = req.getParameter("param"); 
		}
		
		ArrayList<BoardDTO> lists;
		if(bname.equals("all")) {
			lists = sqlSession.getMapper(BoardDAOImpl.class).admin_board();
		}
		else {
			lists = sqlSession.getMapper(BoardDAOImpl.class).admin_board_by_bname(bname);
		}
		
		session.setAttribute("lists", lists);
		
		return "admin/board_temp";
	} 
	
	//게시판 수정
	@RequestMapping("/admin_board_modify")
	public String admin_board_modify(HttpSession session, HttpServletRequest req) {
		
		String idx = req.getParameter("idx");
		
		ArrayList<BoardDTO> lists = sqlSession.getMapper(BoardDAOImpl.class).admin_Board_by_idx(idx);
		session.setAttribute("lists", lists);
		
		return "admin/board_modify";
	}
	
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된 UUID:"+uuid);
		return uuid;
	}
	
	//게시판 수정 처리
	@RequestMapping("/board_modify_action")
	public String board_modify_action(Model model, HttpServletRequest req) {
		//서버의 물리적 경로 가져오기
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		
		try {
			/*
			파일업로드를 위한 Multipart객체를 생성한다.
			생성과 동시에 업로드는 완료되고, 나머지 폼값은 Multipart가 통째로 받아서 처리한다.
			 */
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			
			//업로드폼의 file속성 필드의 이름을 모두 읽음
			Iterator itr = mhsr.getFileNames();
			
			MultipartFile mfile = null;
			String fileName = "";
			List resultList = new ArrayList();
			
			String originalfile = mhsr.getParameter("originalfile");
			
			//파일외 나머지 폼값 받기
			String title = mhsr.getParameter("title");
			String contents= mhsr.getParameter("contents");
			String id = mhsr.getParameter("id");
			String bname = mhsr.getParameter("bname");
			int idx = Integer.parseInt(mhsr.getParameter("idx"));
			String grade = mhsr.getParameter("grade");
			String subject = mhsr.getParameter("subject");
			
			
			/*
			File객체를 통해 물리적경로로 지정된 디렉토리가 존재하는지 확인 후 없으면 생성한다.
			 */
			File directory = new File(path);
			if(!directory.isDirectory()) {
				directory.mkdirs();
			}
			
			String saveFileName = "";
			while(itr.hasNext()) {
				fileName = (String)itr.next();
				
				//서버로 업로드 된 임시파일명 가져오기
				mfile = mhsr.getFile(fileName);
				System.out.println("mfile="+mfile);
				
				//한글깨짐방지 처리 후 업로드 된 파일명을 가져옴
				String originalName = new String(mfile.getOriginalFilename().getBytes(), "UTF-8");
				
				if("".equals(originalName)) {
					continue;
				}
				
				//파일의 확장자 가져오기
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				
				//UUID를 통해 생성된 문자열과 확장자 조립
				saveFileName = getUuid() + ext;
				
				//설정한 경로에 파일저장
				File serverFullName = new File(path + File.separator + saveFileName);
				
				mfile.transferTo(serverFullName);
			}
			
			if(originalfile=="") {
				saveFileName="";
			}
			
			if(saveFileName=="") {
				saveFileName=originalfile;
			}
			
			sqlSession.getMapper(BoardDAOImpl.class).admin_edit
			(title, contents, id, saveFileName, bname, idx, grade, subject);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:admin_board.do";
	}
	
	//게시판 삭제 처리
	@RequestMapping("/delete_board_admin")
	public String delete_board_admin(Model model, HttpServletRequest req) {
		
		String idx = req.getParameter("idx");
		sqlSession.getMapper(BoardDAOImpl.class).delete(
				Integer.parseInt(req.getParameter("idx"))
		);
		
		return "redirect:admin_board.do";
	}
	
	//게시판 글쓰기
	@RequestMapping("write_board_admin")
	public String write_board_admin(HttpServletRequest req, Model model, HttpSession session) {
		
		String id = req.getParameter("id");
		
		String name = sqlSession.getMapper(BoardDAOImpl.class).selectName(id);
		model.addAttribute("name",name);
		
		return "admin/board_admin_write";
	}
	
	//글쓰기 처리
	@RequestMapping("board_write_action.do")
	public String board_write_action(Model model, HttpServletRequest req) {
		
		//서버의 물리적 경로 가져오기
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
						
		try {
			/*
			파일업로드를 위한 Multipart객체를 생성한다.
			생성과 동시에 업로드는 완료되고, 나머지 폼값은 Multipart가 통째로 받아서 처리한다.
			 */
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			
			//업로드폼의 file속성 필드의 이름을 모두 읽음
			Iterator itr = mhsr.getFileNames();
			
			MultipartFile mfile = null;
			String fileName = "";
			List resultList = new ArrayList();
			 
			//파일외 나머지 폼값 받기
			String title = mhsr.getParameter("title");
			String name = mhsr.getParameter("name");
			String contents= mhsr.getParameter("contents");
			String id = mhsr.getParameter("id");
			String bname = mhsr.getParameter("bname");
			String grade = mhsr.getParameter("grade");
			String subject = mhsr.getParameter("subject");
			
			model.addAttribute("bname", bname);
			
			
			/*
			File객체를 통해 물리적경로로 지정된 디렉토리가 존재하는지 확인 후 없으면 생성한다.
			 */
			File directory = new File(path);
			if(!directory.isDirectory()) {
				directory.mkdirs();
			}
			
			String saveFileName = "";
			while(itr.hasNext()) {
				fileName = (String)itr.next();
				
				//서버로 업로드 된 임시파일명 가져오기
				mfile = mhsr.getFile(fileName);
				System.out.println("mfile="+mfile);
				
				//한글깨짐방지 처리 후 업로드 된 파일명을 가져옴
				String originalName = new String(mfile.getOriginalFilename().getBytes(), "UTF-8");
				
				if("".equals(originalName)) {
					continue;
				}
				 
				//파일의 확장자 가져오기
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				System.out.println("ext="+ext);
				
				//UUID를 통해 생성된 문자열과 확장자 조립
				saveFileName = getUuid() + ext;
				
				//설정한 경로에 파일저장
				File serverFullName = new File(path + File.separator + saveFileName);
				 
				mfile.transferTo(serverFullName);
			}
			
			sqlSession.getMapper(BoardDAOImpl.class).admin_write(title, contents, id, saveFileName, bname, name, grade, subject);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}	
		
		return "redirect:admin_board.do";
	}
	
	


	@RequestMapping("/admin_reply.do")
	public String admin_reply(HttpSession session, HttpServletRequest req) {
		
		String bname = "all";
		
		ArrayList<BoardReplyDTO> lists = sqlSession.getMapper(ReplyDAOImpl.class).admin_reply();
		session.setAttribute("lists", lists); 
		 
		return "admin/admin_reply";
	}
	
	
	@RequestMapping("/admin_reply2.do")
	public String admin_reply2(HttpSession session, HttpServletRequest req) {
		
		String bname = req.getParameter("param"); 

		
		System.out.println("bname="+bname);
		
		ArrayList<BoardReplyDTO> lists;
		if(bname.equals("all")) {
			lists = sqlSession.getMapper(ReplyDAOImpl.class).admin_reply();
		}
		else {
			lists = sqlSession.getMapper(ReplyDAOImpl.class).admin_reply_by_bname(bname);
		}
		
		return "admin/reply_temp";
	}
	
	
	@RequestMapping("/admin_reply_modify.do")
	public String admin_reply_modify(HttpSession session, HttpServletRequest req) {
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		ArrayList<BoardReplyDTO> lists = sqlSession.getMapper(ReplyDAOImpl.class).admin_reply_by_idx(idx);
		session.setAttribute("lists", lists);
		
		return "admin/reply_modify";
	}
	
	@RequestMapping("/reply_modify_action.do")
	public String reply_modify_action(Model model, HttpServletRequest req) {
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		String contents = req.getParameter("contents");
		
		sqlSession.getMapper(ReplyDAOImpl.class).admin_reply_edit(contents, idx);
		
		return "redirect:admin_reply.do";
	}
	
	
	@RequestMapping("/delete_reply_admin.do")
	public String delete_reply_admin(Model model, HttpServletRequest req) {
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		sqlSession.getMapper(ReplyDAOImpl.class).delete_reply_admin(idx);
		
		return "redirect:admin_reply.do";
	}
	
}	


	
	







































	
