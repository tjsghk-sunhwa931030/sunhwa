package common;

import java.sql.Date;

public class BoardReplyDTO {
    private int re_idx;
    private int b_idx;
    private String id;
    private String contents;
    private Date replydate;
    private int rgroup;
    private int rstep;
    private String name;
    private String show;
    private String bname;
    
    public BoardReplyDTO() {}
    
	public BoardReplyDTO(int re_idx, int b_idx, String id, String contents, Date replydate, int rgroup, int rstep, String name, String show, String bname) {
		super();
		this.re_idx = re_idx;
		this.b_idx = b_idx;
		this.id = id;
		this.contents = contents;
		this.replydate = replydate;
		this.rgroup = rgroup;
		this.rstep = rstep;
		this.name = name;
		this.show = show;
		this.bname = bname;
	}

	public int getRe_idx() {
		return re_idx;
	}

	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getReplydate() {
		return replydate;
	}

	public void setReplydate(Date replydate) {
		this.replydate = replydate;
	}

	public int getRgroup() {
		return rgroup;
	}

	public void setRgroup(int rgroup) {
		this.rgroup = rgroup;
	}

	public int getRstep() {
		return rstep;
	}

	public void setRstep(int rstep) {
		this.rstep = rstep;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}
	
	
	
}
