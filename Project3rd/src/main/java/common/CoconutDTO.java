package common;

public class CoconutDTO {
	
	private String name;
	private String id ;
	private String pass1;
	private String email;
	private String phone;
	private String sms_ok;
	private String email_ok;
	
	public CoconutDTO() {}

	public CoconutDTO(String name, String id, String pass1, String email, String phone, String sms_ok,
			String email_ok) {
		super();
		this.name = name;
		this.id = id;
		this.pass1 = pass1;
		this.email = email;
		this.phone = phone;
		this.sms_ok = sms_ok;
		this.email_ok = email_ok;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass1() {
		return pass1;
	}

	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSms_ok() {
		return sms_ok;
	}

	public void setSms_ok(String sms_ok) {
		this.sms_ok = sms_ok;
	}

	public String getEmail_ok() {
		return email_ok;
	}

	public void setEmail_ok(String email_ok) {
		this.email_ok = email_ok;
	}
	
	
	
}
