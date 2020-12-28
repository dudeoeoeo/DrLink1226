package dr_Link.dto;

import java.util.List;

import dr_Link.dto.DepartmentDTO;
import dr_Link.dto.PatientDTO;

public class AppointmentDTO {
	private String appointment_num       ;
	private String patient_num           ;
	private String doctor_num            ;
	private String dep_num               ;
	private String appointment_date        ;
	private String appointment_time        ;
	private String reg_date              ;
	private int today_cnt, tomo_cnt, total_cnt;
	
	private List<PatientDTO> patients;
	private List<DepartmentDTO> departments;
	
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
	public int getToday_cnt() {
		return today_cnt;
	}
	public void setToday_cnt(int today_cnt) {
		this.today_cnt = today_cnt;
	}
	public int getTomo_cnt() {
		return tomo_cnt;
	}
	public void setTomo_cnt(int tomo_cnt) {
		this.tomo_cnt = tomo_cnt;
	}
	public int getTotal_cnt() {
		return total_cnt;
	}
	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}
	public List<PatientDTO> getPatients() {
		return patients;
	}
	public void setPatients(List<PatientDTO> patients) {
		this.patients = patients;
	}
	public List<DepartmentDTO> getDepartments() {
		return departments;
	}
	public void setDepartments(List<DepartmentDTO> departments) {
		this.departments = departments;
	}
	public String getAppointment_date() {
		return appointment_date;
	}
	public void setAppointment_date(String appointment_date) {
		this.appointment_date = appointment_date;
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
