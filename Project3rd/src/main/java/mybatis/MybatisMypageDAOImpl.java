package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import common.BoardDTO;
import common.BoardReplyDTO;

/*Project3rd의 DAO파일*/
public interface MybatisMypageDAOImpl {
	
	//수시성적출력
	public ArrayList<MySugradeDTO> SulistPage(String y, String s, String id);
	
	//수시성적저장
	public void sugrade(@Param("subject") String subject,
			@Param("subject_type") String subject_type,
			@Param("counts") int counts,
			@Param("rate") int rate,
			@Param("jumsu") int jumsu,
			@Param("avg") double avg,
			@Param("deviation") int deviation,
			@Param("totalman") int totalman,
			@Param("year") String year,
			@Param("semester") String semester,
			@Param("id") String id
			);
	
	//수시성적수정
	public int editsugrade(int idx, String id, String subject_type, int counts, int rate, double jumsu, double avg, int deviation, int totalman);
	
	
	
	//정시성적갯수
	public int count(String years, String dates, String year, String id);
	//정시성적출력
	public ArrayList<MyJunggradeDTO> junglist(String years, String dates, String year,String id);
	
	//정시성적저장된게있다면삭제
	public int deletejung(String id, String years, String year, String dates);
	
	//정시성적 저장
	public void junggrade(
			@Param("id") String id,
			@Param("years") String years,
			@Param("dates") String dates,
			@Param("ex_name") String ex_name,
			@Param("year") String year,
			@Param("natives") String natives,
			@Param("native_standard") int native_standard,
			@Param("native_percent") int native_percent,
			@Param("native_rate") int native_rate,
			@Param("math") String math,
			@Param("math_type") String math_type,
			@Param("math_standard") int math_standard,
			@Param("math_percent") int math_percent,
			@Param("math_rate") int math_rate,
			@Param("eng") String eng,
			@Param("eng_rate") int eng_rate,
			@Param("study1") String study1,
			@Param("study1_type") String study1_type,
			@Param("study1_standard") int study1_standard,
			@Param("study1_percent") int study1_percent,
			@Param("study1_rate") int study1_rate,
			@Param("study2") String study2,
			@Param("study2_type") String study2_type, 
			@Param("study2_standard") int study2_standard,
			@Param("study2_percent") int study2_percent,
			@Param("study2_rate") int study2_rate,
			@Param("foreign") String foreign,
			@Param("foreign_type") String foreign_type,
			@Param("foreign_standard") int foreign_standard,
			@Param("foreign_percent") int foreign_percent,
			@Param("foreign_rate") int foreign_rate,
			@Param("history") String history,
			@Param("history_rate") int history_rate
			
			);
	
	//관심대학일반출력
	public ArrayList<MyInterestunivDTO> interuniv1(String u_type1, String id);
	//관심대학전문출력
	public ArrayList<MyInterestunivDTO> interuniv2(String u_type2, String id);
	//관심대학삭제
	public int deleteinteruniv(int idx);
	
	
	//출결사항저장
	public void attensave(
			@Param("id") String id,
			@Param("absence1") int absence1,
			@Param("late1") int late1,
			@Param("leave1") int leave1,
			@Param("outcome1") int outcome1,
			@Param("absence2") int absence2,
			@Param("late2") int late2,
			@Param("leave2") int leave2,
			@Param("outcome2") int outcome2,
			@Param("absence3") int absence3,
			@Param("late3") int late3,
			@Param("leave3") int leave3,
			@Param("outcome3") int outcome3
			);
	
	//봉사활동저장
	public void volunsave(
			@Param("id") String id,
			@Param("hour1") int hour1,
			@Param("hour2") int hour2,
			@Param("hour3") int hour3
			);
	
	//출결레코드갯수
	public int count1(String id);
	//봉사레코드갯수
	public int count2(String id);
	//출결리스트
	public ArrayList<MyAttendanceDTO> attenlist(String id);
	//봉사활동리스트
	public ArrayList<MyVoluntaryDTO> volunlist(String id);
	//출결 삭제
	public int deleteatten(String id);
	//봉사 삭제
	public int deletevolun(String id);
	
	//개인정보출력
	public ArrayList<PersonalDTO> personallist(String id);
	//개인정보수정처리
	public int personalaction(String name, String email, String phone, String sms_ok, String email_ok, String id);
	//관리자에서 수정처리
	public int update_member(String name, String pass1, String email, String phone, String sms_ok, String email_ok, String auth, String id);
	//회원 탈퇴 / 삭제
	public int delete_member(String id);
	
	//현재비밀번호저장
	public String whatnowpass(String id);
	//비밀번호변경처리
	public int chpassaction(String chpass, String id);
	
	//내가쓴게시물출력
	public ArrayList<BoardDTO> myboard(String id);
	//내가쓴댓글출력
	public ArrayList<BoardReplyDTO> myboardreply(String id);
	//내가쓴댓글삭제
	public int deletereply(int idx);
	//내가쓴게시물삭제
	public int deletewrite(int idx);
	
	
	//달력일정가져오기
	public ArrayList<CalexDTO> selectcal(String userid,String username);
	//관심대학포함 일정 가져오기
	//public ArrayList<CalexDTO> selectcal2 (String userid,String username, ArrayList<MyInterestunivDTO> uname);
	//public ArrayList<CalexDTO> selectcal2 (String userid,String username, HashMap<String,Object> uname);
	public ArrayList<CalexDTO> selectcal2 (HashMap<String,Object> uname);
	//달력일정추가하기
	public void addcal(
			@Param("_id") String _id,
			@Param("userId") String userId,
			@Param("title") String title,
			@Param("start") String start,
			@Param("end") String end,
			@Param("description") String description,
			@Param("type") String type,
			@Param("username") String username,
			@Param("backgroundColor") String backgroundColor,
			@Param("textColor") String textColor,
			@Param("allDay") String allDay
			);
	//사용자아이디가져오기
	public String whatId(String id);
	//달력일정수정하기
	public int editcal(String title, String start, String end, String description, String type, String backgroundColor, String allDay,String id);
	//달력일정끌기로날짜수정하기
	public int editDate(String startDate, String endDate, String id);
	//달력일정삭제하기
	public int deletecal(String id);
	//시험일정가져오기
	public ArrayList<CalexDTO> examdday(String type,String id);
	//관심대학 대학명들 가져오기
	public ArrayList<String> univname(String id);
	
	
	

}