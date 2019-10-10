package mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface UInfoDAOImpl {
   
	public int getTotalCount1();
	public int getTotalCount2();
	public int getTotalCount3();
	public ArrayList<AllInfoDTO> listPage(int s, int e);


	//대학검색 비로그인
	  public ArrayList<AllInfoDTO> searchC(String u_type,String uname,String location,String p_type,int start, int end );
	//대학검색 로그인  
	  public ArrayList<AllInfoDTO> searchC1(String id,String u_type,String uname,String location,String p_type,int start, int end );
	 
	
	//학과검색
	public ArrayList<AllInfoDTO> searchH(
			String u_type,String uname, String major, String major1, String major2, String location,int start, int end 
			);
	
		//학과대계열검색
		public ArrayList<AllInfoDTO> listM1();
		//학과 중계열 검색
		public ArrayList<AllInfoDTO> listMj2(String major1);
		//학과명 검색
		public ArrayList<AllInfoDTO> listMj3(String major1,String major2);

	//전형검색 비로그인
	public ArrayList<AllInfoDTO> searchJ(
			String u_type,String uname, String recruit_time, String enter_type, String enter_name, String location,
			String enter_ele, String major, String major1, String major2,int start, int end 
			);
	//전형검색 로그인
	public ArrayList<AllInfoDTO> searchJ1( String id,
			String u_type,String uname, String recruit_time, String enter_type, String enter_name, String location,
			String enter_ele, String major, String major1, String major2,int start, int end 
			);
   
   //전형검색-성적분석용
   public ArrayList<AllInfoDTO> searchJ_all(
	         String uname, String recruit_time, String enter_type , String enter_name, String location,
	         String enter_ele, String major, String major1, String major2
	         );
   
   //전형검색-메인
   public ArrayList<AllInfoDTO> searchJ_main(String type, double avg);
   //전형검색-메인-카운트
   public int searchJ_main_count(String type, double avg);
   public ArrayList<AllInfoDTO> select_junh_by_id(String idx);
   
 //관심대학 추가
 	public void interest_chk(@Param("_id")String id,@Param("_univ_uname")String _univ_uname);

	/*
	 * //관심대학추가... public void interest_chkNew(@Param("_uname")String
	 * uname,@Param("_u_type")String u_type,@Param("_location")String
	 * location,@Param("_p_type")String p_type ,@Param("_rate_univ")String
	 * rate_univ,@Param("_jobrate")String jobrate,@Param("_tuition")String
	 * tuition,@Param("_totalman")String totalman,
	 * 
	 * @Param("_major_num")String major_num,@Param("_enter_num")String
	 * enter_num,@Param("_interest")String interest,@Param("_found")String found);
	 */
 	//관심대학 삭제
 	public void interest_unchk(String id, String univ_uname);
 	
 	//관심전형 추가
	public void interest_chkJ(@Param("_junh_idx")int junh_idx,@Param("_id")String id);
	//관심전형 삭제
	public void interest_unchkJ(int junh_idx,String id);
	
	
 		
 }
 	