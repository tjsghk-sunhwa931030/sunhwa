package mybatis;

public class MyLibraryDTO {
	private String l_num;
	private String l_name;
	private String sido;
	private String sigungu;
	private String l_type;
	private String rest_day;
	private String weekday_start;
	private String weekday_end;
	private String saturday_start;
	private String saturday_end;
	private String holiday_start;
	private String holiday_end;
	private String num_seats;
	private String num_books;
	private String addr;
	private String phone_num;
	private String l_url;
	private String hp_latitude;
	private String hp_longitude;
	private String disKM; //거리
	private String rNum;
	private int l_like;
	
	public MyLibraryDTO() {}
	
	

	public MyLibraryDTO(String l_num, String l_name, String sido, String sigungu, String l_type, String rest_day,
			String weekday_start, String weekday_end, String saturday_start, String saturday_end, String holiday_start,
			String holiday_end, String num_seats, String num_books, String addr, String phone_num, String l_url,
			String hp_latitude, String hp_longitude, String disKM, String rNum, int l_like) {
		super();
		this.l_num = l_num;
		this.l_name = l_name;
		this.sido = sido;
		this.sigungu = sigungu;
		this.l_type = l_type;
		this.rest_day = rest_day;
		this.weekday_start = weekday_start;
		this.weekday_end = weekday_end;
		this.saturday_start = saturday_start;
		this.saturday_end = saturday_end;
		this.holiday_start = holiday_start;
		this.holiday_end = holiday_end;
		this.num_seats = num_seats;
		this.num_books = num_books;
		this.addr = addr;
		this.phone_num = phone_num;
		this.l_url = l_url;
		this.hp_latitude = hp_latitude;
		this.hp_longitude = hp_longitude;
		this.disKM = disKM;
		this.rNum = rNum;
		this.l_like = l_like;
	}

	

	public String getL_num() {
		return l_num;
	}



	public void setL_num(String l_num) {
		this.l_num = l_num;
	}



	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSigungu() {
		return sigungu;
	}

	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}

	public String getL_type() {
		return l_type;
	}

	public void setL_type(String l_type) {
		this.l_type = l_type;
	}

	public String getRest_day() {
		return rest_day;
	}

	public void setRest_day(String rest_day) {
		this.rest_day = rest_day;
	}

	public String getWeekday_start() {
		return weekday_start;
	}

	public void setWeekday_start(String weekday_start) {
		this.weekday_start = weekday_start;
	}

	public String getWeekday_end() {
		return weekday_end;
	}

	public void setWeekday_end(String weekday_end) {
		this.weekday_end = weekday_end;
	}

	public String getSaturday_start() {
		return saturday_start;
	}

	public void setSaturday_start(String saturday_start) {
		this.saturday_start = saturday_start;
	}

	public String getSaturday_end() {
		return saturday_end;
	}

	public void setSaturday_end(String saturday_end) {
		this.saturday_end = saturday_end;
	}

	public String getHoliday_start() {
		return holiday_start;
	}

	public void setHoliday_start(String holiday_start) {
		this.holiday_start = holiday_start;
	}

	public String getHoliday_end() {
		return holiday_end;
	}

	public void setHoliday_end(String holiday_end) {
		this.holiday_end = holiday_end;
	}

	public String getNum_seats() {
		return num_seats;
	}

	public void setNum_seats(String num_seats) {
		this.num_seats = num_seats;
	}

	public String getNum_books() {
		return num_books;
	}

	public void setNum_books(String num_books) {
		this.num_books = num_books;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getL_url() {
		return l_url;
	}

	public void setL_url(String l_url) {
		this.l_url = l_url;
	}

	public String getHp_latitude() {
		return hp_latitude;
	}

	public void setHp_latitude(String hp_latitude) {
		this.hp_latitude = hp_latitude;
	}

	public String getHp_longitude() {
		return hp_longitude;
	}

	public void setHp_longitude(String hp_longitude) {
		this.hp_longitude = hp_longitude;
	}

	public String getDisKM() {
		return disKM;
	}

	public void setDisKM(String disKM) {
		this.disKM = disKM;
	}

	public String getrNum() {
		return rNum;
	}

	public void setrNum(String rNum) {
		this.rNum = rNum;
	}

	public int getL_like() {
		return l_like;
	}

	public void setL_like(int l_like) {
		this.l_like = l_like;
	}

	
	
	
	
}
