package common;

import java.sql.Date;

public class BoardDTO {
	
	private int idx;
	private String title;
	private String contents;
	private String id;
	private String attachedfile;
	private int visitcount;
	private String bname;
	private Date postdate;
	private String name;
	private String grade;
	private String subject;
	
	//가상번호
	private int virtualNum;
	
	
	public BoardDTO() {}
	
	public BoardDTO(int idx, String title, String contents, String id, String attachedfile, int visitcount,
			String bname, Date postdate, String name, int virtualNum, String grade, String subject) {
		super();
		this.idx = idx;
		this.title = title;
		this.contents = contents;
		this.id = id;
		this.attachedfile = attachedfile;
		this.visitcount = visitcount;
		this.bname = bname;
		this.postdate = postdate;
		this.name = name;
		this.virtualNum = virtualNum;
		this.grade = grade;
		this.subject = subject;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAttachedfile() {
		return attachedfile;
	}

	public void setAttachedfile(String attachedfile) {
		this.attachedfile = attachedfile;
	}

	public int getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getVirtualNum() {
		return virtualNum;
	}

	public void setVirtualNum(int virtualNum) {
		this.virtualNum = virtualNum;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
}


























