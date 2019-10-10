package mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import mybatis.MyLibraryDTO;


public interface GradeImpl {
	public ArrayList<GradeDTO> all_grade();
	public ArrayList<GradeDTO> all_grade_by_id(String id);
	public int count_all_grade_by_id(String id);
	
	public ArrayList<GradeDTO> grade(@Param("year") String year, @Param("semester") String semester, @Param("id") String id);
	
	public Integer jumsu(@Param("subject") String subject, @Param("year") String year, 
			@Param("semester") String semester, @Param("id") String id);
	public Integer rate(@Param("subject") String subject, @Param("year") String year, 
			@Param("semester") String semester, @Param("id") String id);
	
	//정시성적출력
	public ArrayList<MyJunggradeDTO> junglist(String years, String dates, String year,String id);
	public ArrayList<MyJunggradeDTO> jung_exam_by_id_idx(String id, String idx);
	public String get_major_name(String idx);
	public ArrayList<MyJunggradeDTO> all_junglist(String id);
	public ArrayList<MyJunggradeDTO> select_one(String idx);
	
	//시험 일정 출력
	public ArrayList<CalexDTO> test_schedule();
	//아이디에 따른 시험 일정 출력
	public ArrayList<CalexDTO> test_schedule_modify(String id);
	//시험 일정 수정
	public int update_test_schedule(
			String title, String descriptions, String starts, String ends,
			String types, String username, String backgroundColor, String textColor,
			String allDay, String id
	);
	//시험 삭제
	public int delete_test_schedule(String id);
	//시험 추가
	public void insert_test_schedule(
			String id, String title, String descriptions, String starts, String ends,
			String types, String username, String backgroundColor, String textColor,
			String allDay, String userId
	);
	
	public ArrayList<MyLibraryDTO> searchLibrary(int distance, 
			double latTxt, double lngTxt);
	public ArrayList<MyLibraryDTO> library();
	public ArrayList<MyLibraryDTO> library_by_id(String l_num);
	public int delete_library(String l_num);
	public int update_library(
		String l_name, String sido, String sigungu, String rest_day, 
		String weekday_start, String weekday_end, String saturday_start, String saturday_end, 
		String holiday_start, String holiday_end, String addr, 
		String phone_num, String hp_latitude, String hp_longitude, int l_like,
		String l_num
	);
	public void insert_library(
			@Param("l_name") String l_name,
			@Param("sido") String sido,
			@Param("sigungu") String sigungu,
			@Param("addr") String addr,
			@Param("weekday_start") String weekday_start,
			@Param("weekday_end") String weekday_end,
			@Param("saturday_start") String saturday_start,
			@Param("saturday_end") String saturday_end,
			@Param("holiday_start") String holiday_start,
			@Param("holiday_end") String holiday_end,
			@Param("rest_day") String rest_day,
			@Param("phone_num") String phone_num,
			@Param("hp_latitude") String hp_latitude,
			@Param("hp_longitude") String hp_longitude,
			@Param("l_like") int l_like
	);
	
	//도서관 좋아요 입력
	public int like_action(String id, String l_num);
	
	//도서관 좋아요 개수
	public int like_count(String l_num);
	
	public void like_update(String l_num, int l_count);
	
	public void update_visit(@Param("visit_year") String visit_year,
			@Param("visit_month") String visit_month, @Param("visit_day") String visit_day
	);
	
	public int select_visit(String visit_year, String visit_month);
	
   //좋아요 중복체크
   public int like_check(String id, String l_num);
   
   //좋아요 취소
   public void unlike(String id, String l_num);
}
