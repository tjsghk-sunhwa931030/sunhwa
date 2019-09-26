package mybatis;

import java.sql.Date;

public class CoconutDTO {

	private String NAME;
	private String ID;
	private String PASS1;	
	private String EMAIL;	
	private String PHONE;	
	private String SMS_OK;
	private String EMAIL_OK;
	private Date REGIDATE;
	private String AUTH; 
	
	public CoconutDTO() {}

	public CoconutDTO(String nAME, String iD, String pASS1, String eMAIL, String pHONE, String sMS_OK, String eMAIL_OK,
			Date rEGIDATE, String aUTH) {
		super();
		NAME = nAME;
		ID = iD;
		PASS1 = pASS1;
		EMAIL = eMAIL;
		PHONE = pHONE;
		SMS_OK = sMS_OK;
		EMAIL_OK = eMAIL_OK;
		REGIDATE = rEGIDATE;
		AUTH = aUTH;
	}



	public String getName() {
		return NAME;
	}

	public void setName(String NAME) {
		this.NAME = NAME;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPASS1() {
		return PASS1;
	}

	public void setPASS1(String pASS1) {
		PASS1 = pASS1;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getPHONE() {
		return PHONE;
	}

	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}

	public String getSMS_OK() {
		return SMS_OK;
	}

	public void setSMS_OK(String sMS_OK) {
		SMS_OK = sMS_OK;
	}

	public String getEMAIL_OK() {
		return EMAIL_OK;
	}

	public void setEMAIL_OK(String eMAIL_OK) {
		EMAIL_OK = eMAIL_OK;
	}

	public Date getREGIDATE() {
		return REGIDATE;
	}

	public void setREGIDATE(Date rEGIDATE) {
		REGIDATE = rEGIDATE;
	}

	public String getAUTH() {
		return AUTH;
	}

	public void setAUTH(String aUTH) {
		AUTH = aUTH;
	}

	
	
	
}
