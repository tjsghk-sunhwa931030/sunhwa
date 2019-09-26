package mybatis;

public class TestScheduleDTO {
	private String id;
	private String test_name;
	private String test_date;
	private String test_year;
	
	public TestScheduleDTO() {}
	
	public TestScheduleDTO(String id, String test_name, String test_date, String test_year) {
		super();
		this.id = id;
		this.test_name = test_name;
		this.test_date = test_date;
		this.test_year = test_year;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public String getTest_date() {
		return test_date;
	}
	public void setTest_date(String test_date) {
		this.test_date = test_date;
	}
	public String getTest_year() {
		return test_year;
	}
	public void setTest_year(String test_year) {
		this.test_year = test_year;
	}

	
}
