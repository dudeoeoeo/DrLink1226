package dr_Link.dto;

/*
 create table SEARCH (   -- 의사
    d_name varchar2(10) not null,
    d_content varchar2(100) not null,
    d_dept varchar2(30) not null,
    d_rank varchar2(50) not null,
    d_field varchar2(50) not null,
    d_photo varchar2(50),
    d_regdate date default sysdate 
);
*/

public class SearchDTO {
	
	private String d_name;
	private String d_content;
	private String d_dept;
	private String d_rank;
	private String d_field;
	private String d_photo;
	private String d_regdate;
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
	public String getD_dept() {
		return d_dept;
	}
	public void setD_dept(String d_dept) {
		this.d_dept = d_dept;
	}
	public String getD_rank() {
		return d_rank;
	}
	public void setD_rank(String d_rank) {
		this.d_rank = d_rank;
	}
	public String getD_field() {
		return d_field;
	}
	public void setD_field(String d_field) {
		this.d_field = d_field;
	}
	public String getD_photo() {
		return d_photo;
	}
	public void setD_photo(String d_photo) {
		this.d_photo = d_photo;
	}
	public String getD_regdate() {
		return d_regdate;
	}
	public void setD_regdate(String d_regdate) {
		this.d_regdate = d_regdate;
	}
	
	
}
