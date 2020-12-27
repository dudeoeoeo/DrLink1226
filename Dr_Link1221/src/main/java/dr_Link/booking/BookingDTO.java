package dr_Link.booking;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.DepartmentDTO;

public class BookingDTO {
	private String appointment_num      ;
	private String patient_num          ;
	private String doctor_num           ;
	private String dep_num              ;
	private String appointment_date     ;
	private String appointment_time     ;
	private String reg_date             ;
	private DoctorDTO doctorDTO;
	private DepartmentDTO departmentDTO;
		
	public DepartmentDTO getDepartmentDTO() {
		return departmentDTO;
	}
	public void setDepartmentDTO(DepartmentDTO departmentDTO) {
		this.departmentDTO = departmentDTO;
	}
	public DoctorDTO getDoctorDTO() {
		return doctorDTO;
	}
	public void setDoctorDTO(DoctorDTO doctorDTO) {
		this.doctorDTO = doctorDTO;
	}
	public String getAppointment_num() {
		return appointment_num;
	}
	public void setAppointment_num(String appointment_num) {
		this.appointment_num = appointment_num;
	}
	public String getPatient_num() {
		return patient_num;
	}
	public void setPatient_num(String patient_num) {
		this.patient_num = patient_num;
	}
	public String getDoctor_num() {
		return doctor_num;
	}
	public void setDoctor_num(String doctor_num) {
		this.doctor_num = doctor_num;
	}
	public String getDep_num() {
		return dep_num;
	}
	public void setDep_num(String dep_num) {
		this.dep_num = dep_num;
	}
	public String getAppointment_date() {
		return appointment_date;
	}
	public void setAppointment_date(String appointment_date) {
		this.appointment_date = appointment_date.trim().replace(" ", "");
	}
	public String getAppointment_time() {
		return appointment_time;
	}
	public void setAppointment_time(String appointment_time) {
		this.appointment_time = appointment_time;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
