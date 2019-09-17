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
			String uname,String location,String p_type,String jobrate, String tuition
			);
	
	
	/*
	 * public UInfoDTO search( String uname, String location, String p_type,String
	 * jobrate, String tuition);
	 */

}
