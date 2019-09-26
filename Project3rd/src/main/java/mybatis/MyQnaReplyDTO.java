package mybatis;

import java.sql.Date;

public class MyQnaReplyDTO {
	
	private int re_idx ;
	private int qna_idx  ;
	private String id ;
	private String contents ;
	private Date replydate;
	private int rgroup ;
	private int rstep ;
	private int rindent ;
	
	public MyQnaReplyDTO() {}

	public MyQnaReplyDTO(int re_idx, int qna_idx, String id, String contents, Date replydate, int rgroup, int rstep,
			int rindent) {
		super();
		this.re_idx = re_idx;
		this.qna_idx = qna_idx;
		this.id = id;
		this.contents = contents;
		this.replydate = replydate;
		this.rgroup = rgroup;
		this.rstep = rstep;
		this.rindent = rindent;
	}

	public int getRe_idx() {
		return re_idx;
	}

	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}

	public int getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
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

	public int getRindent() {
		return rindent;
	}

	public void setRindent(int rindent) {
		this.rindent = rindent;
	}
	
	

}
