package mybatis;

public class MyJunggradeDTO {

	private int idx;
    private String id ;
    private String years;
    private String dates ;
    private String ex_name;
    private String natives;
    private int native_standard ;
    private int native_percent ;
    private int  native_rate;
    private String math ;
    private String math_type ;
    private int  math_standard ;
    private int math_percent ;
    private int math_rate ;
    private String  eng ;
    private int eng_rate ;
    private String  study1 ;
    private String study1_type ;
    private int  study1_standard  ;
    private int  study1_percent ;
    private int study1_rate ;
    private String  study2 ;
    private String study2_type ;
    private int  study2_standard ;
    private int study2_percent ;
    private int study2_rate  ;
    private String foreign ;
    private String foreign_type ;
    private int foreign_standard ;
    private int foreign_percent ;
    private int foreign_rate ;
    private String history ;
    private int history_rate ;
    private String year ;
    
    public MyJunggradeDTO() {}

	public MyJunggradeDTO(int idx, String id, String years, String dates, String ex_name, String natives,
			int native_standard, int native_percent, int native_rate, String math, String math_type, int math_standard,
			int math_percent, int math_rate, String eng, int eng_rate, String study1, String study1_type,
			int study1_standard, int study1_percent, int study1_rate, String study2, String study2_type,
			int study2_standard, int study2_percent, int study2_rate, String foreign, String foreign_type,
			int foreign_standard, int foreign_percent, int foreign_rate, String history, int history_rate,
			String year) {
		super();
		this.idx = idx;
		this.id = id;
		this.years = years;
		this.dates = dates;
		this.ex_name = ex_name;
		this.natives = natives;
		this.native_standard = native_standard;
		this.native_percent = native_percent;
		this.native_rate = native_rate;
		this.math = math;
		this.math_type = math_type;
		this.math_standard = math_standard;
		this.math_percent = math_percent;
		this.math_rate = math_rate;
		this.eng = eng;
		this.eng_rate = eng_rate;
		this.study1 = study1;
		this.study1_type = study1_type;
		this.study1_standard = study1_standard;
		this.study1_percent = study1_percent;
		this.study1_rate = study1_rate;
		this.study2 = study2;
		this.study2_type = study2_type;
		this.study2_standard = study2_standard;
		this.study2_percent = study2_percent;
		this.study2_rate = study2_rate;
		this.foreign = foreign;
		this.foreign_type = foreign_type;
		this.foreign_standard = foreign_standard;
		this.foreign_percent = foreign_percent;
		this.foreign_rate = foreign_rate;
		this.history = history;
		this.history_rate = history_rate;
		this.year = year;
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

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}

	public String getEx_name() {
		return ex_name;
	}

	public void setEx_name(String ex_name) {
		this.ex_name = ex_name;
	}

	public String getNatives() {
		return natives;
	}

	public void setNatives(String natives) {
		this.natives = natives;
	}

	public int getNative_standard() {
		return native_standard;
	}

	public void setNative_standard(int native_standard) {
		this.native_standard = native_standard;
	}

	public int getNative_percent() {
		return native_percent;
	}

	public void setNative_percent(int native_percent) {
		this.native_percent = native_percent;
	}

	public int getNative_rate() {
		return native_rate;
	}

	public void setNative_rate(int native_rate) {
		this.native_rate = native_rate;
	}

	public String getMath() {
		return math;
	}

	public void setMath(String math) {
		this.math = math;
	}

	public String getMath_type() {
		return math_type;
	}

	public void setMath_type(String math_type) {
		this.math_type = math_type;
	}

	public int getMath_standard() {
		return math_standard;
	}

	public void setMath_standard(int math_standard) {
		this.math_standard = math_standard;
	}

	public int getMath_percent() {
		return math_percent;
	}

	public void setMath_percent(int math_percent) {
		this.math_percent = math_percent;
	}

	public int getMath_rate() {
		return math_rate;
	}

	public void setMath_rate(int math_rate) {
		this.math_rate = math_rate;
	}

	public String getEng() {
		return eng;
	}

	public void setEng(String eng) {
		this.eng = eng;
	}

	public int getEng_rate() {
		return eng_rate;
	}

	public void setEng_rate(int eng_rate) {
		this.eng_rate = eng_rate;
	}

	public String getStudy1() {
		return study1;
	}

	public void setStudy1(String study1) {
		this.study1 = study1;
	}

	public String getStudy1_type() {
		return study1_type;
	}

	public void setStudy1_type(String study1_type) {
		this.study1_type = study1_type;
	}

	public int getStudy1_standard() {
		return study1_standard;
	}

	public void setStudy1_standard(int study1_standard) {
		this.study1_standard = study1_standard;
	}

	public int getStudy1_percent() {
		return study1_percent;
	}

	public void setStudy1_percent(int study1_percent) {
		this.study1_percent = study1_percent;
	}

	public int getStudy1_rate() {
		return study1_rate;
	}

	public void setStudy1_rate(int study1_rate) {
		this.study1_rate = study1_rate;
	}

	public String getStudy2() {
		return study2;
	}

	public void setStudy2(String study2) {
		this.study2 = study2;
	}

	public String getStudy2_type() {
		return study2_type;
	}

	public void setStudy2_type(String study2_type) {
		this.study2_type = study2_type;
	}

	public int getStudy2_standard() {
		return study2_standard;
	}

	public void setStudy2_standard(int study2_standard) {
		this.study2_standard = study2_standard;
	}

	public int getStudy2_percent() {
		return study2_percent;
	}

	public void setStudy2_percent(int study2_percent) {
		this.study2_percent = study2_percent;
	}

	public int getStudy2_rate() {
		return study2_rate;
	}

	public void setStudy2_rate(int study2_rate) {
		this.study2_rate = study2_rate;
	}

	public String getForeign() {
		return foreign;
	}

	public void setForeign(String foreign) {
		this.foreign = foreign;
	}

	public String getForeign_type() {
		return foreign_type;
	}

	public void setForeign_type(String foreign_type) {
		this.foreign_type = foreign_type;
	}

	public int getForeign_standard() {
		return foreign_standard;
	}

	public void setForeign_standard(int foreign_standard) {
		this.foreign_standard = foreign_standard;
	}

	public int getForeign_percent() {
		return foreign_percent;
	}

	public void setForeign_percent(int foreign_percent) {
		this.foreign_percent = foreign_percent;
	}

	public int getForeign_rate() {
		return foreign_rate;
	}

	public void setForeign_rate(int foreign_rate) {
		this.foreign_rate = foreign_rate;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

	public int getHistory_rate() {
		return history_rate;
	}

	public void setHistory_rate(int history_rate) {
		this.history_rate = history_rate;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
    
    
}
