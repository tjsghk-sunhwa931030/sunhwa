
package mybatis;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

public interface MybatisMemberImpl{
	
	public void register(@Param("NAME") String NAME, 
			@Param("ID") String ID,
			@Param("PASS1") String PASS1,
			@Param("EMAIL") String EMAIL,
			@Param("PHONE") String PHONE,
			@Param("SMS_OK") String SMS_OK,
			@Param("EMAIL_OK") String EMAIL_OK
			);

	public CoconutDTO login(String ID, String PASS1);
	
	public ArrayList<CoconutDTO> all_member();
	
	public CoconutDTO admin_login(String ID, String PASS1);

	public int selectDupIdChk(@Param("ID") String ID);

	public List<CoconutDTO> findId(@Param("NAME") String NAME,@Param("EMAIL") String EMAIL,@Param("PHONE") String PHONE);

	public int searchid(@Param("ID") String ID,@Param("NAME") String NAME,@Param("EMAIL") String EMAIL,@Param("PHONE") String PHONE);
	
	public int update_pw(@Param("ID") String ID,@Param("NAME") String NAME,@Param("EMAIL") String EMAIL,@Param("PHONE") String PHONE, @Param("PASS1") String PASS1);
/*
	@Transactional
	public int update_pw(@Param("ID") String ID,@Param("NAME") String NAME,@Param("EMAIL") String EMAIL,@Param("PHONE") String PHONE) throws Exception;
	*/
	

	public void snslogin(@Param("NAME")String NAME,@Param("ID") String ID ,@Param("EMAIL") String EMAIL);
	
	
	public void snsnoemail(@Param("NAME")String NAME,@Param("ID") String ID);
}
