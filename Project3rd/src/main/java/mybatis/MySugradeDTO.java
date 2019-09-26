package mybatis;

public class MySugradeDTO {
	
	private int idx; 
    private String id;
    private String subject;
    private String subject_type;
    private int counts;
    private int rate ;
    private int jumsu ;
    private double avg ;
    private int deviation ;
    private int totalman ;
    private String year;
    private String semester ;
    
    public MySugradeDTO() {}

	public MySugradeDTO(int idx, String id, String subject, String subject_type, int counts, int rate, int jumsu,
			double avg, int deviation, int totalman, String year, String semester) {
		super();
		this.idx = idx;
		this.id = id;
		this.subject = subject;
		this.subject_type = subject_type;
		this.counts = counts;
		this.rate = rate;
		this.jumsu = jumsu;
		this.avg = avg;
		this.deviation = deviation;
		this.totalman = totalman;
		this.year = year;
		this.semester = semester;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getSubject_type() {
		return subject_type;
	}

	public void setSubject_type(String subject_type) {
		this.subject_type = subject_type;
	}

	public int getCounts() {
		return counts;
	}

	public void setCounts(int counts) {
		this.counts = counts;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public int getJumsu() {
		return jumsu;
	}

	public void setJumsu(int jumsu) {
		this.jumsu = jumsu;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public int getDeviation() {
		return deviation;
	}

	public void setDeviation(int deviation) {
		this.deviation = deviation;
	}

	public int getTotalman() {
		return totalman;
	}

	public void setTotalman(int totalman) {
		this.totalman = totalman;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}
    
    

}
