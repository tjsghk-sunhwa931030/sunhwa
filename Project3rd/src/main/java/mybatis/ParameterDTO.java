package mybatis;

public class ParameterDTO {
	
	private String year;
	private String semester;

	public ParameterDTO() {}
	
	public ParameterDTO(String year, String semester) {
		super();
		this.year = year;
		this.semester = semester;
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
