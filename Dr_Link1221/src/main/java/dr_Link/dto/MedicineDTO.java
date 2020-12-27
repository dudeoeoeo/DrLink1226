package dr_Link.dto;

/*
 medicine_num number(4) constraint prescription_num_pk primary key,
    medicine_name varchar2(100) not null,
    medicine_detail varchar2(300) not null,
    medicine_taking varchar2(300) not null,
    medicine_warning varchar2(300) not null,
*/
public class MedicineDTO {
	private int medicine_num ;
	private String medicine_name, medicine_detail, medicine_taking, medicine_warning;
	
	public int getMedicine_num() {
		return medicine_num;
	}
	public void setMedicine_num(int medicine_num) {
		this.medicine_num = medicine_num;
	}
	public String getMedicine_name() {
		return medicine_name;
	}
	public void setMedicine_name(String medicine_name) {
		this.medicine_name = medicine_name;
	}
	public String getMedicine_detail() {
		return medicine_detail;
	}
	public void setMedicine_detail(String medicine_detail) {
		this.medicine_detail = medicine_detail;
	}
	public String getMedicine_taking() {
		return medicine_taking;
	}
	public void setMedicine_taking(String medicine_taking) {
		this.medicine_taking = medicine_taking;
	}
	public String getMedicine_warning() {
		return medicine_warning;
	}
	public void setMedicine_warning(String medicine_warning) {
		this.medicine_warning = medicine_warning;
	}
	

}
