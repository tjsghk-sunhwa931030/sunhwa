package mybatis;

import java.sql.Date;

public class MyBoardDTO {
	
	private int idx;
    private String name ;
    private String title ;
    private String content ;
    private String id ;
    private String files;
    private int visitcount;
    private String bname ;
    private Date postdate;
    
    public MyBoardDTO() {}

	public MyBoardDTO(int idx, String name, String title, String content, String id, String files, int visitcount,
			String bname, Date postdate) {
		super();
		this.idx = idx;
		this.name = name;
		this.title = title;
		this.content = content;
		this.id = id;
		this.files = files;
		this.visitcount = visitcount;
		this.bname = bname;
		this.postdate = postdate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
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
    
    

}
