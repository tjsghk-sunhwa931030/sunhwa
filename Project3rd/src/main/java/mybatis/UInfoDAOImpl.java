package mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import common.BoardDTO;




public interface UInfoDAOImpl {
	
	public int getTotalCount();
	public ArrayList<AllInfoDTO> listPage(int s, int e);


	//대학검색
	  public ArrayList<AllInfoDTO> searchC(String u_type,String uname,String location,String p_type,int start, int end );
	 
	
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
	public ArrayList<AllInfoDTO> searchJ(int major_idx,
			String u_type,String uname, String recruit_time, String enter_type, String enter_name, String location,
			String enter_ele, String major, String major1, String major2
			);
	
	//관심대학 추가
	public void interest_chk(@Param("_id")String id,@Param("_uname")String uname);
	//관심대학 삭제
	public void interest_unchk(String id, String univ_uname);
	
	//관심전형 추가
	public void interest_chkJ(@Param("_id")String id,@Param("_major_idx")int major_idx);
	//관심전형 삭제
	public void interest_unchkJ(String id, int major_idx);
	
}
