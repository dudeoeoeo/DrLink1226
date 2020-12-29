package dr_Link.doctorProfile;

import org.springframework.web.multipart.MultipartFile;

import dr_Link.dto.DepartmentDTO;
import dr_Link.review.Doc_ReviewDTO;

public class DoctorDTO {
	
	/*
	doctor_num number(4) CONSTRAINT doctor_num_pk primary key,
    dep_num number,
    d_id varchar2(20) not null,
    d_pwd varchar2(20) not null,
    d_name varchar2(15) not null,
    d_gender char(2) not null,
    d_jumin_num char(13) not null,
    d_phone_num char(13) not null,
    d_zipcode varchar2(50) not null,
    d_address1 varchar2(60) not null,
    d_address2  varchar2(50),
    d_email varchar2(30) not null,
    d_graduation varchar2(150) not null,
    d_career varchar2(200),
    d_licence varchar2(100),
    d_licence_num varchar2(20),
    d_photo varchar2(50),
    d_regdate date default sysdate, 
    d_content varchar2(500),
    d_field varchar2(100)
	 
	 */
    
    private int doctor_num, dep_num;
	private String d_id, d_pwd, d_name, d_jumin_num, d_phone_num, d_zipcode, d_address1, d_address2, d_email;
	private String d_licence, d_licence_num, d_regdate, d_gender,d_content, d_photo;
	private String d_graduation,d_career,d_field;
	private MultipartFile file;
	private DepartmentDTO departmentDTO;
	private Doc_ReviewDTO doc_ReviewDTO;
	private String[] d_fields;
	private String d_retire_date;
	
		
	public String getD_retire_date() {
		return d_retire_date;
	}
	public void setD_retire_date(String d_retire_date) {
		this.d_retire_date = d_retire_date;
	}
	public Doc_ReviewDTO getDoc_ReviewDTO() {
		return doc_ReviewDTO;
	}
	public void setDoc_ReviewDTO(Doc_ReviewDTO doc_ReviewDTO) {
		this.doc_ReviewDTO = doc_ReviewDTO;
	}
	public String[] getD_fields() {
		if(this.d_field != null) {
			int cnt=0;
			String[] arr = new String[5];
			for(String str : this.d_field.split(",")) {
				arr[cnt] = str;
				cnt++;
			}
			
			return arr;
		}
		
		 return null;
	}
	public void setD_fields(String[] d_fields) {
		this.d_fields = d_fields;
	}
	public DepartmentDTO getDepartmentDTO() {
		return departmentDTO;
	}
	public void setDepartmentDTO(DepartmentDTO departmentDTO) {
		this.departmentDTO = departmentDTO;
	}
	
	
	public String getD_licence_num() {
		return d_licence_num;
	}
	public void setD_licence_num(String d_licence_num) {
		this.d_licence_num = d_licence_num;
	}
	public int getDep_num() {
		return dep_num;
	}
	public void setDep_num(int dep_num) {
		this.dep_num = dep_num;
	}

	public String getD_gender() {
		return d_gender;
	}
	
	public void setD_gender(String d_gender) {
		this.d_gender = d_gender;
	}
	
	public int getDoctor_num() {
		return doctor_num;
	}
	public void setDoctor_num(int doctor_num) {
		this.doctor_num = doctor_num;
	}
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public String getD_pwd() {
		return d_pwd;
	}
	public void setD_pwd(String d_pwd) {
		this.d_pwd = d_pwd;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_jumin_num() {
		return d_jumin_num;
	}
	public void setD_jumin_num(String d_jumin_num) {
		this.d_jumin_num = d_jumin_num;
	}
	public String getD_phone_num() {
		return d_phone_num;
	}
	public void setD_phone_num(String d_phone_num) {
		this.d_phone_num = d_phone_num;
	}
	
	public String getD_email() {
		return d_email;
	}
	public void setD_email(String d_email) {
		this.d_email = d_email;
	}
	public String getD_graduation() {
		return d_graduation;
	}
	public void setD_graduation(String d_graduation) {
		//System.out.println("else문 안의 d_graduation : " + d_graduation);
		this.d_graduation = d_graduation;
	}
	public String getD_career() {
		return d_career;
	}
	public void setD_career(String d_career) {
		this.d_career = d_career;
	}
	public String getD_licence() {
		return d_licence;
	}
	public void setD_licence(String d_licence) {
		this.d_licence = d_licence;
	}
	

	public String getD_photo() {
		return d_photo;
	}
	public void setD_photo(String d_photo) {
		this.d_photo = d_photo;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getD_regdate() {
		return d_regdate;
	}
	public void setD_regdate(String d_regdate) {
		this.d_regdate = d_regdate;
	}
	public String getD_zipcode() {
		return d_zipcode;
	}
	public void setD_zipcode(String d_zipcode) {
		this.d_zipcode = d_zipcode;
	}
	public String getD_address1() {
		return d_address1;
	}
	public void setD_address1(String d_address1) {
		this.d_address1 = d_address1;
	}
	public String getD_address2() {
		return d_address2;
	}
	public void setD_address2(String d_address2) {
		this.d_address2 = d_address2;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
	public String getD_field() {
		return d_field;
	}
	public void setD_field(String d_field) {
		this.d_field = d_field;
	}
	
	
	
}
