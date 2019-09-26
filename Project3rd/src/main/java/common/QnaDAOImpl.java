package common;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface QnaDAOImpl {
	
	//게시물 수 카운트
	public int getTotalCount(@Param("grade") String grade, @Param("subject") String subject, 
			@Param("keyField") String keyField, @Param("keyString") String keyString);
	
	//리스트 출력
	public ArrayList<QnaDTO> listPage(
			@Param("start") int start, @Param("end") int end, 			
			@Param("grade") String grade, @Param("subject") String subject,
			@Param("keyField") String keyField, @Param("keyString") String keyString);
	
	//글쓰기
	public void write(@Param("name") String name, @Param("title") String title, @Param("contents") String contents,
			@Param("id") String id, @Param("attachedfile") String attachedfile, @Param("grade") String grade,
			@Param("subject") String subject);
	
	//조회수증가
	public void updatevisit(@Param("idx") int idx);
	
	//상세보기
	public QnaDTO view(int idx);

	//수정하기
	public int edit(String title, String contents, String attachedfile, int idx, String grade, String subject);
	
	//삭제하기
	public int delete(int idx);
}

 










































