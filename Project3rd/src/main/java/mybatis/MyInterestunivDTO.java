package mybatis;

public class MyInterestunivDTO {
	
	private int idx;
    private String id ;
    private String univ_uname ;
    private String location;
    private String totalman ;
    private String major_num;
    private String enter_num;
    private String u_type;
    private String recruit_time;
    private String enter_type;
    private String enter_name;
    private String enter_ele;
    private String enter_test;
    private String enter_test1;
    private String enter_test2;
    private String enter_test3;
    private String enter_test4;
    private String rate_s;
    private String suc_reg;
    private String unreg_suc;
    private String unreg_end;
    private String hak_avg;
    private String hak_mini;
    private String hak_max;
    private String su_avg;
    private String su_mini;
    
    public MyInterestunivDTO() {}

	public MyInterestunivDTO(int idx, String id, String univ_uname, String location, String totalman, String major_num,
			String enter_num, String u_type, String recruit_time, String enter_type, String enter_name,
			String enter_ele, String enter_test, String enter_test1, String enter_test2, String enter_test3,
			String enter_test4, String rate_s, String suc_reg, String unreg_suc, String unreg_end, String hak_avg,
			String hak_mini, String hak_max, String su_avg, String su_mini) {
		super();
		this.idx = idx;
		this.id = id;
		this.univ_uname = univ_uname;
		this.location = location;
		this.totalman = totalman;
		this.major_num = major_num;
		this.enter_num = enter_num;
		this.u_type = u_type;
		this.recruit_time = recruit_time;
		this.enter_type = enter_type;
		this.enter_name = enter_name;
		this.enter_ele = enter_ele;
		this.enter_test = enter_test;
		this.enter_test1 = enter_test1;
		this.enter_test2 = enter_test2;
		this.enter_test3 = enter_test3;
		this.enter_test4 = enter_test4;
		this.rate_s = rate_s;
		this.suc_reg = suc_reg;
		this.unreg_suc = unreg_suc;
		this.unreg_end = unreg_end;
		this.hak_avg = hak_avg;
		this.hak_mini = hak_mini;
		this.hak_max = hak_max;
		this.su_avg = su_avg;
		this.su_mini = su_mini;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUniv_uname() {
		return univ_uname;
	}

	public void setUniv_uname(String univ_uname) {
		this.univ_uname = univ_uname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
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

	public String getU_type() {
		return u_type;
	}

	public void setU_type(String u_type) {
		this.u_type = u_type;
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

	public String getRate_s() {
		return rate_s;
	}

	public void setRate_s(String rate_s) {
		this.rate_s = rate_s;
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
    
    
    

}