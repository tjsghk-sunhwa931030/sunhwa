package mybatis;

public class AllInfoDTO {

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
	private String major1;
	private String major2;
	private String major;
	private String majorman;
	private String mjobrate;
	private String lastminis;
	private String lastminij;
	private String ibresult;
	private String recruit_time; 
	private String enter_type; 
	private String enter_name;
	private String enter_ele; 
	private String enter_test; 
	private String enter_test1;
	private String enter_test2;
	private String enter_test3;
	private String enter_test4;
	private String enter_test5;
	private String enter_test6;
	private String rate_sj;
	private String recruit_num;
	private String ganada; 
	private String suc_reg; 
	private String unreg_suc; 
	private String unreg_end; 
	private String hak_avg; 
	private String hak_mini; 
	private String hak_max; 
	private String su_avg;  
	private String su_mini;  
	private String beak_avg;  
	private String beak_mini;
	private String bname;
	
	public AllInfoDTO(int idx, String u_type, String uname, String location, String p_type, String rate_univ,
			String jobrate, String tuition, String totalman, String major_num, String enter_num, String interest,
			String found, String major1, String major2, String major, String majorman, String mjobrate,
			String lastminis, String lastminij, String ibresult, String recruit_time, String enter_type,
			String enter_name, String enter_ele, String enter_test, String enter_test1, String enter_test2,
			String enter_test3, String enter_test4, String enter_test5, String enter_test6, String rate_sj,
			String recruit_num, String ganada, String suc_reg, String unreg_suc, String unreg_end, String hak_avg,
			String hak_mini, String hak_max, String su_avg, String su_mini, String beak_avg, String beak_mini,String bname) {
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
		this.major1 = major1;
		this.major2 = major2;
		this.major = major;
		this.majorman = majorman;
		this.mjobrate = mjobrate;
		this.lastminis = lastminis;
		this.lastminij = lastminij;
		this.ibresult = ibresult;
		this.recruit_time = recruit_time;
		this.enter_type = enter_type;
		this.enter_name = enter_name;
		this.enter_ele = enter_ele;
		this.enter_test = enter_test;
		this.enter_test1 = enter_test1;
		this.enter_test2 = enter_test2;
		this.enter_test3 = enter_test3;
		this.enter_test4 = enter_test4;
		this.enter_test5 = enter_test5;
		this.enter_test6 = enter_test6;
		this.rate_sj = rate_sj;
		this.recruit_num = recruit_num;
		this.ganada = ganada;
		this.suc_reg = suc_reg;
		this.unreg_suc = unreg_suc;
		this.unreg_end = unreg_end;
		this.hak_avg = hak_avg;
		this.hak_mini = hak_mini;
		this.hak_max = hak_max;
		this.su_avg = su_avg;
		this.su_mini = su_mini;
		this.beak_avg = beak_avg;
		this.beak_mini = beak_mini;
		this.bname = bname;
	}  
	
	public AllInfoDTO() {
		
	}

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

	public String getEnter_num() {
		return enter_num;
	}

	public void setEnter_num(String enter_num) {
		this.enter_num = enter_num;
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

	public String getRecruit_time() {
		return recruit_time;
	}

	public void setRecruit_time(String recruit_time) {
		this.recruit_time = recruit_time;
	}

	public String getEnter_type() {
		return enter_type;
	}

	public void setEnter_type(String enter_type) {
		this.enter_type = enter_type;
	}

	public String getEnter_name() {
		return enter_name;
	}

	public void setEnter_name(String enter_name) {
		this.enter_name = enter_name;
	}

	public String getEnter_ele() {
		return enter_ele;
	}

	public void setEnter_ele(String enter_ele) {
		this.enter_ele = enter_ele;
	}

	public String getEnter_test() {
		return enter_test;
	}

	public void setEnter_test(String enter_test) {
		this.enter_test = enter_test;
	}

	public String getEnter_test1() {
		return enter_test1;
	}

	public void setEnter_test1(String enter_test1) {
		this.enter_test1 = enter_test1;
	}

	public String getEnter_test2() {
		return enter_test2;
	}

	public void setEnter_test2(String enter_test2) {
		this.enter_test2 = enter_test2;
	}

	public String getEnter_test3() {
		return enter_test3;
	}

	public void setEnter_test3(String enter_test3) {
		this.enter_test3 = enter_test3;
	}

	public String getEnter_test4() {
		return enter_test4;
	}

	public void setEnter_test4(String enter_test4) {
		this.enter_test4 = enter_test4;
	}

	public String getEnter_test5() {
		return enter_test5;
	}

	public void setEnter_test5(String enter_test5) {
		this.enter_test5 = enter_test5;
	}

	public String getEnter_test6() {
		return enter_test6;
	}

	public void setEnter_test6(String enter_test6) {
		this.enter_test6 = enter_test6;
	}

	public String getRate_sj() {
		return rate_sj;
	}

	public void setRate_sj(String rate_sj) {
		this.rate_sj = rate_sj;
	}

	public String getRecruit_num() {
		return recruit_num;
	}

	public void setRecruit_num(String recruit_num) {
		this.recruit_num = recruit_num;
	}

	public String getGanada() {
		return ganada;
	}

	public void setGanada(String ganada) {
		this.ganada = ganada;
	}

	public String getSuc_reg() {
		return suc_reg;
	}

	public void setSuc_reg(String suc_reg) {
		this.suc_reg = suc_reg;
	}

	public String getUnreg_suc() {
		return unreg_suc;
	}

	public void setUnreg_suc(String unreg_suc) {
		this.unreg_suc = unreg_suc;
	}

	public String getUnreg_end() {
		return unreg_end;
	}

	public void setUnreg_end(String unreg_end) {
		this.unreg_end = unreg_end;
	}

	public String getHak_avg() {
		return hak_avg;
	}

	public void setHak_avg(String hak_avg) {
		this.hak_avg = hak_avg;
	}

	public String getHak_mini() {
		return hak_mini;
	}

	public void setHak_mini(String hak_mini) {
		this.hak_mini = hak_mini;
	}

	public String getHak_max() {
		return hak_max;
	}

	public void setHak_max(String hak_max) {
		this.hak_max = hak_max;
	}

	public String getSu_avg() {
		return su_avg;
	}

	public void setSu_avg(String su_avg) {
		this.su_avg = su_avg;
	}

	public String getSu_mini() {
		return su_mini;
	}

	public void setSu_mini(String su_mini) {
		this.su_mini = su_mini;
	}

	public String getBeak_avg() {
		return beak_avg;
	}

	public void setBeak_avg(String beak_avg) {
		this.beak_avg = beak_avg;
	}

	public String getBeak_mini() {
		return beak_mini;
	}

	public void setBeak_mini(String beak_mini) {
		this.beak_mini = beak_mini;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}
	
	
	
}
