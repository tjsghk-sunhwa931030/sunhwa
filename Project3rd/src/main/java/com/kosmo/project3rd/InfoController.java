package com.kosmo.project3rd;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.BoardDAOImpl;
import common.BoardDTO;
import mybatis.AllInfoDTO;
import mybatis.UInfoArrVO;
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
		
	
		// 페이지 처리

		int totalRecordCount = sqlSession.getMapper(UInfoDAOImpl.class).getTotalCount();

		int pageSize = 7;
		int blockPage = 5;

		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;

		ArrayList<AllInfoDTO> pagelists = sqlSession.getMapper(UInfoDAOImpl.class).listPage(start, end);

		ArrayList<AllInfoDTO> lists = sqlSession.getMapper(UInfoDAOImpl.class).searchC(
				req.getParameter("u_type"),
				req.getParameter("searchWord"), 
				req.getParameter("location"), 
				req.getParameter("p_type"), 
				start, end

		);

		model.addAttribute("lists", lists);

		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/checkAction.do?u_type=" + req.getParameter("u_type") + "&searchWord="
						+ req.getParameter("searchWord") + "&location=" + req.getParameter("location") + "&p_type="
						+ req.getParameter("p_type") + "&");
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("pagelists", pagelists);

		return "info/info";

	}

////////////////////////////////////////////////////////////////////////////////////	

	// 학과 홈페이지
	@RequestMapping("/hsearch.do")
	public String hsearch(Model model, HttpServletRequest req) {

		ArrayList<AllInfoDTO> listsM1 = sqlSession.getMapper(UInfoDAOImpl.class).listM1();

		model.addAttribute("listsM1", listsM1);

		return "info/hsearch";
	}

	// (학과정보) 체크된 폼값 전달받음
	@RequestMapping("/checkAction2.do")
	public String checkAction2(HttpServletRequest req, Model model, HttpSession session) {

		// 체크한 값
		ArrayList<AllInfoDTO> listsH = sqlSession.getMapper(UInfoDAOImpl.class).searchH(

				req.getParameter("u_type"), req.getParameter("searchWord"), req.getParameter("major"), // 학과명
				req.getParameter("major1"), // 대계열명
				req.getParameter("major2"), // 중계열
				req.getParameter("location")

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

		ArrayList<AllInfoDTO> listM1 = sqlSession.getMapper(UInfoDAOImpl.class).listM1(

		);

		model.addAttribute("listsM1", listM1);

		return "info/jsearch";
	}

	// (전형정보) 체크된 폼값 전달받음
	@RequestMapping("/checkAction3.do")
	public String checkAction3(HttpServletRequest req, Model model, HttpSession session) {

		// 체크한 값
		ArrayList<AllInfoDTO> listsJ = sqlSession.getMapper(UInfoDAOImpl.class).searchJ(
				Integer.parseInt(req.getParameter("major_idx")),
				req.getParameter("u_type"), req.getParameter("searchWord"), req.getParameter("recruit_time"),
				req.getParameter("enter_type"), req.getParameter("enter_name"), req.getParameter("location"),
				req.getParameter("enter_ele"), req.getParameter("major"), req.getParameter("major1"),
				req.getParameter("major2"));

		model.addAttribute("listsJ", listsJ);

		return "info/jsearch";

	}
////////////////////////////////////////////////////////////////////////////////////////

	// 관심설정
	@RequestMapping("/interest_chk.do")
	public String interest_chk(Model model, HttpServletRequest req, HttpSession session) {

		String id = (String) session.getAttribute("siteUserInfo");
		String univ_uname = req.getParameter("univ_uname");
		System.out.println("id=" + id);
		System.out.println(univ_uname);

		if (session.getAttribute("siteUserInfo") == null || id == null) {

			return "redirect:login.do";
		}

		else {

			sqlSession.getMapper(UInfoDAOImpl.class).interest_chk(id, univ_uname);

			return "info/info";
		}
	}

	// 관심설정 취소
	@RequestMapping("/interest_unchk.do")
	public String interest_unchk(Model model, HttpServletRequest req, HttpSession session) {

		String id = (String) session.getAttribute("siteUserInfo");
		String univ_uname = req.getParameter("univ_uname");
		System.out.println("id=" + id);
		System.out.println(univ_uname);

		if (session.getAttribute("siteUserInfo") == null) {
			
			return "redirect:login.do";
		} 
		else {
			sqlSession.getMapper(UInfoDAOImpl.class).interest_unchk(id, univ_uname);

			return "info/info";
		}
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////	
	
	// 전형관심설정
		@RequestMapping("/interest_chkJ.do")
		public String interest_chkJ(Model model, HttpServletRequest req, HttpSession session) {

			String id = (String) session.getAttribute("siteUserInfo");
			int major_idx = Integer.parseInt(req.getParameter("major_idx"));
			System.out.println("id=" + id);
			System.out.println(major_idx);

			if (session.getAttribute("siteUserInfo") == null || id == null) {

				return "redirect:login.do";
			}

			else {

				sqlSession.getMapper(UInfoDAOImpl.class).interest_chkJ(id, major_idx);

				return "info/jsearch";
			}
		}

		// 전형관심설정 취소
		@RequestMapping("/interest_unchkJ.do")
		public String interest_unchkJ(Model model, HttpServletRequest req, HttpSession session) {

			String id = (String) session.getAttribute("siteUserInfo");
			int major_idx = Integer.parseInt(req.getParameter("major_idx"));
			System.out.println("id=" + id);
			System.out.println(major_idx);

			if (session.getAttribute("siteUserInfo") == null) {
				
				return "redirect:login.do";
			} 
			else {
				sqlSession.getMapper(UInfoDAOImpl.class).interest_unchkJ(id, major_idx);

				return "info/jsearch";
			}
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
