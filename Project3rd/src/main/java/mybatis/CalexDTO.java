package mybatis;

public class CalexDTO {
	
	private String id;
	private String title ;
	private String descriptions ;
	private String starts ;
	private String ends ;
	private String types;
	private String username ;
	private String backgroundColor ;
	private String textColor ;
	private String allDay ;
	
	public CalexDTO () {}

	public CalexDTO(String id, String title, String descriptions, String starts, String ends, String types,
			String username, String backgroundColor, String textColor, String allDay) {
		super();
		this.id = id;
		this.title = title;
		this.descriptions = descriptions;
		this.starts = starts;
		this.ends = ends;
		this.types = types;
		this.username = username;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.allDay = allDay;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public String getStarts() {
		return starts;
	}

	public void setStarts(String starts) { 
		this.starts = starts;
	}

	public String getEnds() {
		return ends;
	}

	public void setEnds(String ends) {
		this.ends = ends;
	}   

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getAllDay() {
		return allDay;
	}

	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	
	

}
