package mybatis;

public class PersonalDTO {
	
	private String name ;
	private String id ;
	private String pass1;
	private String email ;
	private String phone ;
	private String sms_ok ;
	private String email_ok ;
	private String auth;
	
	public PersonalDTO() {}

	public PersonalDTO(String name, String id, String pass1, String email, String phone, String sms_ok, String email_ok,
			String auth) {
		super();
		this.name = name;
		this.id = id;
		this.pass1 = pass1;
		this.email = email;
		this.phone = phone;
		this.sms_ok = sms_ok;
		this.email_ok = email_ok;
		this.auth = auth;
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

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	
	
	

}
