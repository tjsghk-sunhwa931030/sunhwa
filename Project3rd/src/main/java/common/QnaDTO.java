package common;

import java.sql.Date;

public class QnaDTO {
	
    private int idx;
    private String title;
    private String contents;
    private String id;
    private String attachedfile;
    private int visitcount;
    private Date postdate;
    private String subject;
    private String grade;
    private String name;
    
    //가상번호
    private int virtualNum;
    
	public QnaDTO() {}  
	
	public QnaDTO(int idx, String title, String contents, String id, String attachedfile, int visitcount, Date postdate,
			String subject, String grade, String name, int virtualNum) {
		super();
		this.idx = idx;
		this.title = title;
		this.contents = contents;
		this.id = id;
		this.attachedfile = attachedfile;
		this.visitcount = visitcount;
		this.postdate = postdate;
		this.subject = subject;
		this.grade = grade;
		this.name = name;
		this.virtualNum = virtualNum;
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

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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
	
	
}
