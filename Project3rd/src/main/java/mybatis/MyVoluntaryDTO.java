package mybatis;

public class MyVoluntaryDTO {

	private int idx;
    private String id;
    private int hour1;
    private int hour2;
    private int hour3 ;
    
    public MyVoluntaryDTO() {}
    
	public MyVoluntaryDTO(int idx, String id, int hour1, int hour2, int hour3) {
		super();
		this.idx = idx;
		this.id = id;
		this.hour1 = hour1;
		this.hour2 = hour2;
		this.hour3 = hour3;
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

	public int getHour1() {
		return hour1;
	}

	public void setHour1(int hour1) {
		this.hour1 = hour1;
	}

	public int getHour2() {
		return hour2;
	}

	public void setHour2(int hour2) {
		this.hour2 = hour2;
	}

	public int getHour3() {
		return hour3;
	}

	public void setHour3(int hour3) {
		this.hour3 = hour3;
	}
    
    
    
}
