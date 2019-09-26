package mybatis;

public class MyAttendanceDTO {
	
	private int idx;
    private String id ;
    private int absence1 ;
    private int late1;
    private int leave1 ;
    private int outcome1 ;
    private int absence2 ;
    private int late2 ;
    private int leave2 ;
    private int outcome2;
    private int absence3;
    private int late3 ;
    private int  leave3;
    private int outcome3;
    
    public MyAttendanceDTO() {}

	public MyAttendanceDTO(int idx, String id, int absence1, int late1, int leave1, int outcome1, int absence2, int late2,
			int leave2, int outcome2, int absence3, int late3, int leave3, int outcome3) {
		super();
		this.idx = idx;
		this.id = id;
		this.absence1 = absence1;
		this.late1 = late1;
		this.leave1 = leave1;
		this.outcome1 = outcome1;
		this.absence2 = absence2;
		this.late2 = late2;
		this.leave2 = leave2;
		this.outcome2 = outcome2;
		this.absence3 = absence3;
		this.late3 = late3;
		this.leave3 = leave3;
		this.outcome3 = outcome3;
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

	public int getAbsence1() {
		return absence1;
	}

	public void setAbsence1(int absence1) {
		this.absence1 = absence1;
	}

	public int getLate1() {
		return late1;
	}

	public void setLate1(int late1) {
		this.late1 = late1;
	}

	public int getLeave1() {
		return leave1;
	}

	public void setLeave1(int leave1) {
		this.leave1 = leave1;
	}

	public int getOutcome1() {
		return outcome1;
	}

	public void setOutcome1(int outcome1) {
		this.outcome1 = outcome1;
	}

	public int getAbsence2() {
		return absence2;
	}

	public void setAbsence2(int absence2) {
		this.absence2 = absence2;
	}

	public int getLate2() {
		return late2;
	}

	public void setLate2(int late2) {
		this.late2 = late2;
	}

	public int getLeave2() {
		return leave2;
	}

	public void setLeave2(int leave2) {
		this.leave2 = leave2;
	}

	public int getOutcome2() {
		return outcome2;
	}

	public void setOutcome2(int outcome2) {
		this.outcome2 = outcome2;
	}

	public int getAbsence3() {
		return absence3;
	}

	public void setAbsence3(int absence3) {
		this.absence3 = absence3;
	}

	public int getLate3() {
		return late3;
	}

	public void setLate3(int late3) {
		this.late3 = late3;
	}

	public int getLeave3() {
		return leave3;
	}

	public void setLeave3(int leave3) {
		this.leave3 = leave3;
	}

	public int getOutcome3() {
		return outcome3;
	}

	public void setOutcome3(int outcome3) {
		this.outcome3 = outcome3;
	}
    
    

}
