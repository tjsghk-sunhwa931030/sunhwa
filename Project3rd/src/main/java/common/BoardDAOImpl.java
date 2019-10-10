package common;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;
import org.apache.ibatis.annotations.Param;


public interface BoardDAOImpl {
	
	// 게시물 수 카운트
	public int getTotalCount(@Param("bname") String bname, @Param("keyField") String keyField, @Param("keyString") String keyString,
			@Param("grade") String grade,@Param("subject") String subject);
	
	//리스트 출력
	public ArrayList<BoardDTO> listPage(
			@Param("bname") String bname, @Param("start") int start, @Param("end") int end, 
			@Param("keyField") String keyField, @Param("keyString") String keyString, 
			@Param("grade") String grade, @Param("subject") String subject);
	
	//글쓰기
	public void write(@Param("_name") String name, @Param("_title") String title,
			@Param("_contents") String contents, @Param("_id") String id,
			@Param("_attachedfile") String attachedfile, @Param("_bname") String bname,
			@Param("_grade") String grade, @Param("_subject") String subject);
	
	//상세보기
	public BoardDTO view(@Param("idx") int idx);
	
	//조회수증가
	public void updatevisit(@Param("idx") int idx);
	
	//수정하기
	public int edit(String title, String contents, String attachedfile, int idx, String grade, String subject);
	
	//삭제하기
	public int delete(int idx);
	
	//작성자이름....가져올거야....
	public String selectName(String id);
	
	//관리자 페이지 위한 게시판 리스트
	public ArrayList<BoardDTO> admin_board();
	public ArrayList<BoardDTO> admin_board_by_bname(String bname);
	
	//관리자 게시물 수정
	public ArrayList<BoardDTO> admin_Board_by_idx(String idx);
	public int admin_edit(String title, String contents, String id, String attachedfile, String bname, int idx, String grade, String subject);
	
	public void admin_write(@Param("_title") String title,
			@Param("_contents") String contents, @Param("_id") String id,
			@Param("_attachedfile") String attachedfile, @Param("_bname") String bname, @Param("_name") String name, @Param("_grade") String grade, @Param("_subject") String subject);
	

	
	
	
	
	
	
	
}