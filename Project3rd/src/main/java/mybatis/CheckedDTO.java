package mybatis;

public class CheckedDTO {

	private String chkUname;
	private String chkLct;
	private String chkPtype;
	private String chkJob;
	private String chkTui;
	
	public String getChkUname() {
		return chkUname;
	}
	public void setChkUname(String chkUname) {
		this.chkUname = chkUname;
	}
	public String getChkLct() {
		return chkLct;
	}
	public void setChkLct(String chkLct) {
		this.chkLct = chkLct;
	}
	public String getChkPtype() {
		return chkPtype;
	}
	public void setChkPtype(String chkPtype) {
		this.chkPtype = chkPtype;
	}
	public String getChkJob() {
		return chkJob;
	}
	public void setChkJob(String chkJob) {
		this.chkJob = chkJob;
	}
	public String getChkTui() {
		return chkTui;
	}
	public void setChkTui(String chkTui) {
		this.chkTui = chkTui;
	}
	public CheckedDTO(String chkUname, String chkLct, String chkPtype, String chkJob, String chkTui) {
		super();
		this.chkUname = chkUname;
		this.chkLct = chkLct;
		this.chkPtype = chkPtype;
		this.chkJob = chkJob;
		this.chkTui = chkTui;
	}
	public CheckedDTO() {
		
	}
	
	
	
}
