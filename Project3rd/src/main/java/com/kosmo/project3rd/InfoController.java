package com.kosmo.project3rd;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import mybatis.AllInfoDTO;
import mybatis.UInfoDAOImpl;
import mybatis.UInfoDTO;
import util.PagingUtil;

@Controller
public class InfoController {

	@Autowired
	private SqlSession sqlSession;

	// 대학 홈페이지
	@RequestMapping("/info.do")
	public String info(Model model, HttpServletRequest req, HttpSession session) {

		return "info/info";
	}

	// (대학 정보)체크된 폼값 전달받음
	@RequestMapping("/checkAction.do")
	public String checkAction(HttpServletRequest req, Model model, HttpSession session) throws Exception {
		
	
		// 페이지 처리 시작
		int totalRecordCount = sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount1();
		int pageSize = 10;
		int blockPage = 5;
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		ArrayList<AllInfoDTO> pagelists = sqlSession.getMapper(UInfoDAOImpl.class).listPage(start, end);
		
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/checkAction.do?u_type=" + req.getParameter("u_type") + "&searchWord="
						+ req.getParameter("searchWord") + "&location=" + req.getParameter("location") + "&p_type="
						+ req.getParameter("p_type") + "&");
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("pagelists", pagelists);
		
		//리스트 시작
		String id = (String) session.getAttribute("siteUserInfo");
		String univ_uname = req.getParameter("univ_uname");
		
		 
			//로그인을 한경우
			if(id==null) {
				ArrayList<AllInfoDTO> lists = sqlSession.getMapper(UInfoDAOImpl.class).searchC(
						req.getParameter("u_type"),
						req.getParameter("searchWord"), 
						req.getParameter("location"), 
						req.getParameter("p_type"),
						start, end
				);
				model.addAttribute("lists", lists);
			}
			else if(id != null){
				ArrayList<AllInfoDTO> lists = sqlSession.getMapper(UInfoDAOImpl.class).searchC1(
						id,
						req.getParameter("u_type"),
						req.getParameter("searchWord"), 
						req.getParameter("location"), 
						req.getParameter("p_type"),
						start, end
				);
				model.addAttribute("lists", lists);
			}
		
		return "info/info";

	}

////////////////////////////////////////////////////////////////////////////////////	

	// 학과 홈페이지
	@RequestMapping("/hsearch.do")
	public String hsearch(Model model, HttpServletRequest req) {

		ArrayList<AllInfoDTO> listsM1 = sqlSession.getMapper(UInfoDAOImpl.class).listM1(
				
				);

		model.addAttribute("listsM1", listsM1);

		return "info/hsearch";
	}

	// (학과정보) 체크된 폼값 전달받음
	@RequestMapping("/checkAction2.do")
	public String checkAction2(HttpServletRequest req, Model model, HttpSession session) {
		
		// 페이지 처리 시작
		int totalRecordCount = sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount2();
		int pageSize = 10;
		int blockPage = 5;
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		ArrayList<AllInfoDTO> pagelists = sqlSession.getMapper(UInfoDAOImpl.class).listPage(start, end);
		
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/checkAction2.do?u_type=" + req.getParameter("u_type") + "&searchWord="
						+ req.getParameter("searchWord") + "&major=" + req.getParameter("major") + "&major1="
						+ req.getParameter("major1") +"&major2=" + req.getParameter("major2")+"&location=" 
						+ req.getParameter("location") + "&");
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("pagelists", pagelists);

		
		//대계열 다시 선택가능
		ArrayList<AllInfoDTO> listsM1 = sqlSession.getMapper(UInfoDAOImpl.class).listM1();
		model.addAttribute("listsM1", listsM1);
		
		//리스트 처리 시작
		ArrayList<AllInfoDTO> listsH = sqlSession.getMapper(UInfoDAOImpl.class).searchH(

				req.getParameter("u_type"), req.getParameter("searchWord"), req.getParameter("major"), // 학과명
				req.getParameter("major1"), // 대계열명
				req.getParameter("major2"), // 중계열
				req.getParameter("location"),start, end

		);
		model.addAttribute("listsH", listsH);

		return "info/hsearch";

	}

	// 대계열에서 선택
	@RequestMapping("/CallMajor2.do")
	public String CallMajor2(HttpServletRequest req, Model model, HttpSession session) {

		ArrayList<AllInfoDTO> listsMj2 = sqlSession.getMapper(UInfoDAOImpl.class).listMj2(req.getParameter("major1"));
		model.addAttribute("listsMj2", listsMj2);

		return "info/CallMajor2";
	}

	// 중계열에서 선택
	@RequestMapping("/CallMajor3.do")
	public String CallMajor3(HttpServletRequest req, Model model, HttpSession session) {

		ArrayList<AllInfoDTO> listsMj3 = sqlSession.getMapper(UInfoDAOImpl.class).listMj3(
				req.getParameter("major1"), req.getParameter("major2")

		);
		model.addAttribute("listsMj3", listsMj3);

		return "info/CallMajor3";
	}

///////////////////////////////////////////////////////////////////////////	

	// 전형 홈페이지
	@RequestMapping("/jsearch.do")
	public String jsearch(Model model, HttpServletRequest req) {

		ArrayList<AllInfoDTO> listM1 = sqlSession.getMapper(UInfoDAOImpl.class).listM1();
		model.addAttribute("listsM1", listM1);

		return "info/jsearch";
	}

	// (전형정보) 체크된 폼값 전달받음
	@RequestMapping("/checkAction3.do")
	public String checkAction3(HttpServletRequest req, Model model, HttpSession session) {
		
		// 페이지 처리 시작
		int totalRecordCount = sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount3();
		int pageSize = 10;
		int blockPage = 5;
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		ArrayList<AllInfoDTO> pagelists = sqlSession.getMapper(UInfoDAOImpl.class).listPage(start, end);
		
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/checkAction3.do?u_type=" + req.getParameter("u_type") + "&searchWord="
						+ req.getParameter("searchWord") + "&recruit_time=" + req.getParameter("recruit_time") + "&enter_type="
						+ req.getParameter("enter_type")+ "&enter_name="+ req.getParameter("enter_name")+"&location="
						+ req.getParameter("location")+"&enter_ele="+ req.getParameter("enter_ele") + "&major=" 
						+ req.getParameter("major") + "&major1="+ req.getParameter("major1") +"&major2=" 
						+ req.getParameter("major2")+"&");
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("pagelists", pagelists);
		
		
		
		
		//대계열 다시 선택가능
		ArrayList<AllInfoDTO> listM1 = sqlSession.getMapper(UInfoDAOImpl.class).listM1();
		model.addAttribute("listsM1", listM1);
		
		//리스트 처리시작
		String id = (String) session.getAttribute("siteUserInfo");
		String univ_uname = req.getParameter("univ_uname");

		if(id==null) {
			
			ArrayList<AllInfoDTO> listsJ = sqlSession.getMapper(UInfoDAOImpl.class).searchJ(
					req.getParameter("u_type"), req.getParameter("searchWord"), req.getParameter("recruit_time"),
					req.getParameter("enter_type"), req.getParameter("enter_name"), req.getParameter("location"),
					req.getParameter("enter_ele"), req.getParameter("major"), req.getParameter("major1"),
					req.getParameter("major2"),start, end);

			model.addAttribute("listsJ", listsJ);
			
		}
		else if(id != null){
			
			ArrayList<AllInfoDTO> listsJ = sqlSession.getMapper(UInfoDAOImpl.class).searchJ1(
					id,
					req.getParameter("u_type"), req.getParameter("searchWord"), req.getParameter("recruit_time"),
					req.getParameter("enter_type"), req.getParameter("enter_name"), req.getParameter("location"),
					req.getParameter("enter_ele"), req.getParameter("major"), req.getParameter("major1"),
					req.getParameter("major2"),start, end);
			
			model.addAttribute("listsJ", listsJ);
			
		}
		// 체크한 값

		return "info/jsearch";

	}
////////////////////////////////////////////////////////////////////////////////////////

	// 관심설정
	   @RequestMapping("/interest_chk.do")
	   public String interest_chk(Model model, HttpServletRequest req, HttpSession session) {

	      String id = (String) session.getAttribute("siteUserInfo");
	      
	      String uname = req.getParameter("uname");
	      String u_type = req.getParameter("u_type");
	      String location = req.getParameter("location");
	      String p_type = req.getParameter("p_type");
	      String rate_univ = req.getParameter("rate_univ");
	      String jobrate = req.getParameter("jobrate");
	      String tuition = req.getParameter("tuition");
	      String totalman = req.getParameter("totalman");
	      String major_num = req.getParameter("major_num");
	      String enter_num = req.getParameter("major_num");
	      String interest = req.getParameter("interest");
	      String found = req.getParameter("found");
	      
	      System.out.println(uname);
	      System.out.println(u_type);
	      System.out.println(location);
	      
	      String nullId = "";
	      String nullNm="";

	      
	      sqlSession.getMapper(UInfoDAOImpl.class).interest_chk(id, uname);
		/*
		 * sqlSession.getMapper(UInfoDAOImpl.class).interest_chkNew(uname,u_type,
		 * location,p_type,rate_univ,
		 * jobrate,tuition,totalman,major_num,enter_num,interest,found);
		 */
	      
	      
	      return "info/info";
	      
	   }

	   // 관심설정 취소
	   @RequestMapping("/interest_unchk.do")
	   public String interest_unchk(Model model, HttpServletRequest req, HttpSession session) {

	      String id = (String) session.getAttribute("siteUserInfo");
	      String univ_uname = req.getParameter("uname");
	     
	      
	      sqlSession.getMapper(UInfoDAOImpl.class).interest_unchk(id, univ_uname);
	      return "info/info";
	      
	   }
	
//////////////////////////////////////////////////////////////////////////////////////////////	
	
	// 전형관심설정
	@RequestMapping("/interest_chkJ.do")
	public String interest_chkJ(Model model, HttpServletRequest req, HttpSession session) {

		String id = (String)session.getAttribute("siteUserInfo");
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("id=" + id);
		System.out.println(idx);

		sqlSession.getMapper(UInfoDAOImpl.class).interest_chkJ(idx,id);

		return "info/jsearch";
	
	}

	// 전형관심설정 취소
	@RequestMapping("/interest_unchkJ.do")
	public String interest_unchkJ(Model model, HttpServletRequest req, HttpSession session) {

		String id = (String)session.getAttribute("siteUserInfo");
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		System.out.println("id=" + id);
		System.out.println(idx);

		
			sqlSession.getMapper(UInfoDAOImpl.class).interest_unchkJ(idx,id);

			return "info/jsearch";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
