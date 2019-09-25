package mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;




public interface UInfoDAOImpl {
	
	public int getTotalCount();
	

	public ArrayList<HInfoDTO> listPage();

	//대학검색
	  public ArrayList<AllInfoDTO> searchC( String u_type,String uname,String location,String p_type );
	 
	
	//public ArrayList<AllInfoDTO> searchC(UInfoArrVO uarr );
	
	
	//학과검색
	public ArrayList<AllInfoDTO> searchH(
			String u_type,String uname, String major, String major1, String major2, String location
			);
	
		//학과대계열검색
		public ArrayList<AllInfoDTO> listM1();
		//학과 중계열 검색
		public ArrayList<AllInfoDTO> listMj2(String major1);
		//학과명 검색
		public ArrayList<AllInfoDTO> listMj3(String major1,String major2);

	//전형검색
	public ArrayList<AllInfoDTO> searchJ(
			String u_type,String uname, String recruit_time, String enter_type, String enter_name, String location,
			String enter_ele, String major, String major1, String major2
			);
	
	
	public void interest_chk(@Param("_id")String id,@Param("_uname")String uname,@Param("_location")String location,
			@Param("_totalman")String totalman,@Param("_major_num")String major_num,@Param("_enter_num")String enter_num,
			@Param("_interest_num")String interest_num,@Param("_interest_chk")String interest_chk);
	
}
