package common;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface QnaReplyDAOImpl {
	
	//1. 댓글 수 카운트
	public int getTotalCount(int b_idx);
	
	//2. 댓글 리스트 출력
	public ArrayList<QnaReplyDTO> listPage(int b_idx);	
	
	//3. 댓글쓰기 
	public int rewrite(@Param("id") String id, @Param("b_idx") int b_idx, @Param("contents") String contents, @Param("name") String name);

	//4. 댓글삭제
	public int redelete(int re_idx);
	
	//5. 댓글수정
	public int reedit(int re_idx, String contents);

	//6. 대댓글 작성하기 전에 레코드 업뎃
	public int replyPrevUpdate(int rgroup, int rstep);
	
	//7. 대댓글 쓰기
	public int rerewrite(String id, int idx, String contents, int rgroup, int rstep, String name);


}
