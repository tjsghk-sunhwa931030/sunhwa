package mybatis;

import java.util.ArrayList;

public interface UInfoDAOImpl {
	
	public int getTotalCount();
	
	public ArrayList<UInfoDTO> listPage();
	
	
}
