package common;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface ReplyDAOImpl {
	
	//1. 댓글 수 카운트
	public int getTotalCount(int b_idx);
	
	//2. 댓글 리스트 출력
	public ArrayList<BoardReplyDTO> listPage(int b_idx);
	
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
	
	//관리자 페이지 댓글 리스트
	public ArrayList<BoardReplyDTO> admin_reply();
	public ArrayList<BoardReplyDTO> admin_reply_by_bname(String bname);
	
	//관리자 댓글 수정
	public ArrayList<BoardReplyDTO> admin_reply_by_idx(int idx);
	public int admin_reply_edit(String contents, int idx);
	
	//관리자 댓글 삭제
	public void delete_reply_admin(int idx);
	
}
