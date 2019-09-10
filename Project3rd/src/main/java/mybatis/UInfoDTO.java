package mybatis;

public class UInfoDTO {
	
	private int idx;
	private String u_type;
	private String uname;
	private String location;
	private String p_type;
	private String rate_univ;
	private String jobrate;
	private String tuition;
	private String totalman;
	private String major_num;
	private String enter_num;
	private String interest;
	private String found;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getU_type() {
		return u_type;
	}
	public void setU_type(String u_type) {
		this.u_type = u_type;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getRate_univ() {
		return rate_univ;
	}
	public void setRate_univ(String rate_univ) {
		this.rate_univ = rate_univ;
	}
	public String getJobrate() {
		return jobrate;
	}
	public void setJobrate(String jobrate) {
		this.jobrate = jobrate;
	}
	public String getTuition() {
		return tuition;
	}
	public void setTuition(String tuition) {
		this.tuition = tuition;
	}
	public String getTotalman() {
		return totalman;
	}
	public void setTotalman(String totalman) {
		this.totalman = totalman;
	}
	public String getMajor_num() {
		return major_num;
	}
	public void setMajor_num(String major_num) {
		this.major_num = major_num;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getFound() {
		return found;
	}
	public void setFound(String found) {
		this.found = found;
	}
	public String getEnter_num() {
		return enter_num;
	}
	public void setEnter_num(String enter_num) {
		this.enter_num = enter_num;
	}
	public UInfoDTO(int idx, String u_type, String uname, String location, String p_type, String rate_univ,
			String jobrate, String tuition, String totalman, String major_num,String enter_num, String interest, String found) {
		super();
		this.idx = idx;
		this.u_type = u_type;
		this.uname = uname;
		this.location = location;
		this.p_type = p_type;
		this.rate_univ = rate_univ;
		this.jobrate = jobrate;
		this.tuition = tuition;
		this.totalman = totalman;
		this.major_num = major_num;
		this.enter_num = enter_num;
		this.interest = interest;
		this.found = found;
	}
	
	public UInfoDTO() {
	
	}
	
	
}
