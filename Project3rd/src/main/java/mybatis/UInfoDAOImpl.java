package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

public interface UInfoDAOImpl {
	
	public int getTotalCount();
	

	public ArrayList<HInfoDTO> listPage();

	public ArrayList<AllInfoDTO> searchC(
			String u_type,String uname,String location,String p_type
			);
	
	public ArrayList<AllInfoDTO> searchH(
			String u_type,String uname, String major, String major1, String major2, String location
			);
	
	public ArrayList<AllInfoDTO> searchJ(
			String u_type,String uname, String recruit_time, String enter_type, String enter_name, String location,
			String enter_ele,String enter_test, String major, String major1, String major2
			);
	
	/*
	 * public ArrayList<UInfoDTO> searchW( String uname );
	 */
	
	
	/*
	 * public UInfoDTO search( String uname, String location, String p_type,String
	 * jobrate, String tuition);
	 */

}
