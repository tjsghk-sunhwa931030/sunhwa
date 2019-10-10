package com.kosmo.project3rd;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import common.BoardDAOImpl;
import common.BoardDTO;
import common.BoardReplyDTO;
import common.ReplyDAOImpl;
import util.PagingUtil;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/board.do")
	public String board(HttpServletRequest req, Model model, HttpSession session) {		
		
		if(session.getAttribute("siteUserInfo")==null) {
			return "redirect:login.do";
		}
		
		String bname = req.getParameter("bname");
		String grade = req.getParameter("grade");
		String subject = req.getParameter("subject");
		String keyField = req.getParameter("keyField");
		String keyString = req.getParameter("keyString");
		
		model.addAttribute("bname",bname);

		String queryStr = "";
		if(bname!=null) {
			queryStr += "bname="+bname+"&";
		}
		
		if(grade!=null) {
			model.addAttribute("grade",grade);
			queryStr += "grade="+grade+"&";
		}
		if(subject!=null) {
			model.addAttribute("subject",subject);
			queryStr += "subject="+subject+"&";
		}

		if(keyString!=null) {
			model.addAttribute("keyField",keyField);
			model.addAttribute("keyString",keyString);
			queryStr+="keyField="+keyField+"&keyString="+keyString+"&";
		}
		
		//페이지 처리를 위한 설정값
		int pageSize = 4;
		int blockPage = 2; 
		
		//총 게시물 수
		int totalRecordCount = sqlSession.getMapper(BoardDAOImpl.class)
				.getTotalCount(bname, keyField, keyString, grade, subject);
		
		//전체페이지 수 계산
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		//시작 및 끝 rownum 구하기
		int nowPage = req.getParameter("nowPage")==null ? 1 :Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		//페이징처리
		String pagingImg =
			PagingUtil.pagingImg(
				totalRecordCount,
				pageSize, blockPage, nowPage,
				req.getContextPath()
					+"/board.do?"+queryStr);
		model.addAttribute("pagingImg", pagingImg);
		
		ArrayList<BoardDTO> lists = sqlSession.getMapper(BoardDAOImpl.class).listPage(bname, start, end, keyField, keyString, grade, subject);
		
		//일련번호
		int virtualNum = 0; //가상번호
		int countNum = 0;
		for(BoardDTO row : lists) {
			virtualNum = totalRecordCount - (((nowPage-1)*pageSize)+countNum++);
			row.setVirtualNum(virtualNum);
		}

		model.addAttribute("lists", lists);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("blockPage",blockPage);
		model.addAttribute("nowPage",nowPage);
		
		return "board/list";
	}
	
	@RequestMapping("/write.do")
	public String write(HttpServletRequest req, Model model, HttpSession session) {
		
		String id = (String) session.getAttribute("siteUserInfo");
		System.out.println("id="+id);
		
		if(session.getAttribute("siteUserInfo")==null) {
			return "redirect:login.do";
		}
		
		//작성자 이름... 
		String name = sqlSession.getMapper(BoardDAOImpl.class).selectName(id); 
		model.addAttribute("name",name); 
		 
		String bname = req.getParameter("bname");
		model.addAttribute("bname",bname);
		
		return "board/write";
	}
	
	@RequestMapping("/writeAction.do")
	public String writeAction(Model model, HttpServletRequest req){
		 
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
				
				//UUID를 통해 생성된 문자열과 확장자 조립
				saveFileName = getUuid() + ext;
				
				//설정한 경로에 파일저장
				File serverFullName = new File(path + File.separator + saveFileName);
				 
				mfile.transferTo(serverFullName);
			}
			
			sqlSession.getMapper(BoardDAOImpl.class).write(
					name,
					title,
					contents,
					id,
					saveFileName,
					bname,
					grade,
					subject
			); 
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		 
		return "redirect:board.do";
	}
	
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된 UUID:"+uuid);
		return uuid;
	}
	
	//파일 다운로드
	@RequestMapping("/download.do")
	public ModelAndView download(HttpServletRequest req
		, HttpServletResponse resp) throws Exception
	{
		String fileName = req.getParameter("fileName");
		String oriFileName = 
				req.getParameter("oriFileName");
		
		String saveDirectory = 
				req.getSession().getServletContext().getRealPath("/resources/upload");
		
		File downloadFile = 
			new File(saveDirectory+"/"+fileName);
		
		if(!downloadFile.canRead()) {
			throw new Exception("파일을 찾을수 없습니다");
		}		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("fileDownloadView");
		mv.addObject("downloadFile", downloadFile);
		mv.addObject("oriFileName", oriFileName);
		return mv;		
	}
	
	@RequestMapping("/view.do")
	public String view(Model model, HttpServletRequest req, HttpSession session) {
		
		String bname = req.getParameter("bname");
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int idx = Integer.parseInt(req.getParameter("idx"));
		//작성자 이름... 
		String id = (String)session.getAttribute("siteUserInfo");
		String name = sqlSession.getMapper(BoardDAOImpl.class).selectName(id); 
		model.addAttribute("name",name); 
		
		sqlSession.getMapper(BoardDAOImpl.class).updatevisit(idx);
		BoardDTO dto =  sqlSession.getMapper(BoardDAOImpl.class).view(idx);
		dto.setContents(dto.getContents().replace("\r\n", "<br/>"));

		model.addAttribute("viewRow", dto);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("idx",idx);
		model.addAttribute("bname",bname);
		
		return "board/view";
	}
	
	@RequestMapping("/edit.do")
	public String edit(Model model, HttpServletRequest req) {
		
		String bname = req.getParameter("bname");
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		BoardDTO dto =  sqlSession.getMapper(BoardDAOImpl.class).view(idx);
		
		model.addAttribute("dto", dto);
		model.addAttribute("bname",bname);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("idx",idx);
		
		return "board/edit";
	}
	
	@RequestMapping("/editAction.do")
	public String editAction(Model model, HttpServletRequest req) {
		
		//서버의 물리적 경로 가져오기
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		
		String bname="";
		int nowPage=0;
		int idx=0;
		
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
			String name = mhsr.getParameter("name"); 
			String contents= mhsr.getParameter("contents");
			String id = mhsr.getParameter("id");
			bname = mhsr.getParameter("bname");
			nowPage = Integer.parseInt(mhsr.getParameter("nowPage"));
			idx = Integer.parseInt(mhsr.getParameter("idx"));
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
			
			sqlSession.getMapper(BoardDAOImpl.class).edit(
					title,
					contents,
					saveFileName,
					idx,
					grade,
					subject
			);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return "redirect:view.do?bname="+bname+"&idx="+idx+"&nowPage="+nowPage;
	} 
	
	 
	@RequestMapping("/delete.do")
	public String delete(Model model, HttpServletRequest req) {
		
		String bname = req.getParameter("bname");
		
		model.addAttribute("bname",bname);
		
		sqlSession.getMapper(BoardDAOImpl.class).delete(
				Integer.parseInt(req.getParameter("idx"))
		);
		
		return "redirect:board.do";
	}
	
}

















