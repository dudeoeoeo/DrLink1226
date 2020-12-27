package dr_Link.dto;

public class TreatmentRecordDTO {
	/*
	treatment_num number(5) CONSTRAINT treatment_num_pk primary key,
    patient_num number,
    doctor_num number,
    dep_num number,
    start_treatment_time date default sysdate,
    monitoring_time
	*/
	private int treatment_num,patient_num,doctor_num, dep_num;
	private String monitoring_time, start_treatment_time;
	
	
	public String getStart_treatment_time() {
		return start_treatment_time;
	}
	public void setStart_treatment_time(String start_treatment_time) {
		this.start_treatment_time = start_treatment_time;
	}
	public int getTreatment_num() {
		return treatment_num;
	}
	public void setTreatment_num(int treatment_num) {
		this.treatment_num = treatment_num;
	}
	public int getPatient_num() {
		return patient_num;
	}
	public void setPatient_num(int patient_num) {
		this.patient_num = patient_num;
	}
	public int getDoctor_num() {
		return doctor_num;
	}
	public void setDoctor_num(int doctor_num) {
		this.doctor_num = doctor_num;
	}
	public int getDep_num() {
		return dep_num;
	}
	public void setDep_num(int dep_num) {
		this.dep_num = dep_num;
	}
	public String getMonitoring_time() {
		return monitoring_time;
	}
	public void setMonitoring_time(String monitoring_time) {
		this.monitoring_time = monitoring_time;
	}
	
	
	
	

}
