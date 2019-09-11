package mybatis;

import java.util.ArrayList;

public interface UInfoDAOImpl {
	
	public int getTotalCount();
	
	public ArrayList<UInfoDTO> listPage(int s,int e);
	
	//리스트 항목
	public UInfoDTO list(String uname, String location, String p_type, String rate_univ,
			String jobrate, String totalman, String major_num, String enter_num, String interest);
	
}
