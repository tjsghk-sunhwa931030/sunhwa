package mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

public interface UInfoDAOImpl {
	
	public int getTotalCount();
	

	public ArrayList<UInfoDTO> listPage();
	
	public ArrayList<UInfoDTO> search1(String uname, String location, String p_type,String jobrate, String tuition);
	public UInfoDTO search2(String uname, String location, String p_type,String jobrate, String tuition);

	public ArrayList<UInfoDTO> searchU(String uname);
}
