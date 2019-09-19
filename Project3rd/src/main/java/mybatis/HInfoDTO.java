package mybatis;

public class HInfoDTO {
	private String u_type;
	private String uname;
	private String major1;
	private String major2;
	private String major;
	private String location;
	private String majorman;
	private String mjobrate;
	private String lastminis;
	private String lastminij;
	private String ibresult;
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
	public String getMajor1() {
		return major1;
	}
	public void setMajor1(String major1) {
		this.major1 = major1;
	}
	public String getMajor2() {
		return major2;
	}
	public void setMajor2(String major2) {
		this.major2 = major2;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMajorman() {
		return majorman;
	}
	public void setMajorman(String majorman) {
		this.majorman = majorman;
	}
	public String getMjobrate() {
		return mjobrate;
	}
	public void setMjobrate(String mjobrate) {
		this.mjobrate = mjobrate;
	}
	public String getLastminis() {
		return lastminis;
	}
	public void setLastminis(String lastminis) {
		this.lastminis = lastminis;
	}
	public String getLastminij() {
		return lastminij;
	}
	public void setLastminij(String lastminij) {
		this.lastminij = lastminij;
	}
	public String getIbresult() {
		return ibresult;
	}
	public void setIbresult(String ibresult) {
		this.ibresult = ibresult;
	}
	public HInfoDTO(String u_type, String uname, String major1, String major2, String major, String location,
			String majorman, String mjobrate, String lastminis, String lastminij, String ibresult) {
		super();
		this.u_type = u_type;
		this.uname = uname;
		this.major1 = major1;
		this.major2 = major2;
		this.major = major;
		this.location = location;
		this.majorman = majorman;
		this.mjobrate = mjobrate;
		this.lastminis = lastminis;
		this.lastminij = lastminij;
		this.ibresult = ibresult;
	}
	public HInfoDTO() {
	
	}
	
}
