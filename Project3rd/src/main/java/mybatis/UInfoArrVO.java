package mybatis;

public class UInfoArrVO {

	private String[] lst_location_list;
	private String[] lst_ptype_list;
	private String utype;
	private String uinfoarr;
	
	
	public String[] getLst_location_list() {
		return lst_location_list;
	}
	public void setLst_location_list(String[] lst_location_list) {
		this.lst_location_list = lst_location_list;
	}
	public String[] getLst_ptype_list() {
		return lst_ptype_list;
	}
	public void setLst_ptype_list(String[] lst_ptype_list) {
		this.lst_ptype_list = lst_ptype_list;
	}
	public String getUtype() {
		return utype;
	}
	public void setUtype(String utype) {
		this.utype = utype;
	}
	
	public String getUinfoarr() {
		return uinfoarr;
	}
	public void setUinfoarr(String uinfoarr) {
		this.uinfoarr = uinfoarr;
	}
	public UInfoArrVO(String[] lst_location_list, String[] lst_ptype_list, String utype, String uinfoarr) {
		super();
		this.lst_location_list = lst_location_list;
		this.lst_ptype_list = lst_ptype_list;
		this.utype = utype;
		this.uinfoarr = uinfoarr;
	}
	
	public UInfoArrVO() {
		
	}
	
	
	
	
}
