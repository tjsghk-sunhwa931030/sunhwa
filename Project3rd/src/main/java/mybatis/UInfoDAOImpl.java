package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

public interface UInfoDAOImpl {
	
	public int getTotalCount();
	

	public ArrayList<UInfoDTO> listPage();

	public ArrayList<UInfoDTO> searchC(
			String u_type,String uname,String location,String p_type
			);
	
	/*
	 * public ArrayList<UInfoDTO> searchW( String uname );
	 */
	
	
	/*
	 * public UInfoDTO search( String uname, String location, String p_type,String
	 * jobrate, String tuition);
	 */

}
