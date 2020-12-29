package dr_Link.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class PatientDTO {
    
    private int patient_num;
	private String p_id, p_pwd, p_name;
	private String p_jumin_num, p_phone_num, p_zipcode, p_address1, p_address2, p_email;
	private String bloodtype, p_gender;
	private int height, weight;
	private String allergy;
	private String p_photo, p_regdate;
	private MultipartFile file;
	private String birth;
	private String profileAddress;
	private String p_retire_date;

	
	public String getP_retire_date() {
		return p_retire_date;
	}
	public void setP_retire_date(String p_retire_date) {
		this.p_retire_date = p_retire_date;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getProfileAddress() {
		String[] address = this.p_address1.split(" ");
		String result = address[0]+", "+address[1];
		return result;
	}
	public void setProfileAddress(String profileAddress) {
		this.profileAddress = profileAddress;
	}
	public String getBirth() {
		String birth="";
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy");
		int this_year=Integer.parseInt(format1.format(time.getTime()));
		if(this.p_jumin_num.substring(6, 7).equals("1") || this.p_jumin_num.substring(6, 7).equals("2")) {
			int my_year=Integer.parseInt("19"+this.p_jumin_num.substring(0, 2));
			int my_age=this_year - my_year;
			birth=my_year+"년 "+this.p_jumin_num.substring(2,4)+"월 "+this.p_jumin_num.substring(4,6)+"일, 만"+my_age+"세"; 
		}else {
			int my_year=Integer.parseInt("20"+this.p_jumin_num.substring(0, 2));
			int my_age=this_year - my_year;
			birth=my_year+"년 "+this.p_jumin_num.substring(2,4)+"월 "+this.p_jumin_num.substring(4,6)+"일, 만"+my_age+"세";
		}
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}	
	public String getP_gender() {
		return p_gender;
	}
	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	public int getPatient_num() {
		return patient_num;
	}
	public void setPatient_num(int patient_num) {
		this.patient_num = patient_num;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getP_pwd() {
		return p_pwd;
	}
	public void setP_pwd(String p_pwd) {
		this.p_pwd = p_pwd;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_jumin_num() {
		return p_jumin_num;
	}
	public void setP_jumin_num(String p_jumin_num) {
		this.p_jumin_num = p_jumin_num;
	}
	public String getP_phone_num() {
		return p_phone_num;
	}
	public void setP_phone_num(String p_phone_num) {
		this.p_phone_num = p_phone_num;
	}
	
	public String getP_zipcode() {
		return p_zipcode;
	}
	public void setP_zipcode(String p_zipcode) {
		this.p_zipcode = p_zipcode;
	}
	public String getP_address2() {
		return p_address2;
	}
	public void setP_address2(String p_address2) {
		this.p_address2 = p_address2;
	}
	public String getP_address1() {
		return p_address1;
	}
	public void setP_address1(String p_address1) {
		this.p_address1 = p_address1;
	}
	public String getP_email() {
		return p_email;
	}
	public void setP_email(String p_email) {
		this.p_email = p_email;
	}
	public String getBloodtype() {
		return bloodtype;
	}
	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}

	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public String getP_photo() {
		return p_photo;
	}
	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}
	public String getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(String p_regdate) {
		this.p_regdate = p_regdate;
	}
	
	
}
