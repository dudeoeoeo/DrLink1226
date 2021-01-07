package dr_Link.dto;

import org.springframework.web.multipart.MultipartFile;

public class AiRecordDTO {

	private int patient_num;
	private int doctor_num;
	private int dep_num;
	private String ai_symptom;
	private String use_time;
	private String symptom_photo;
	private MultipartFile file;
	
	
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
	public String getAi_symptom() {
		return ai_symptom;
	}
	public void setAi_symptom(String ai_symptom) {
		this.ai_symptom = ai_symptom;
	}
	public String getUse_time() {
		return use_time;
	}
	public void setUse_time(String use_time) {
		this.use_time = use_time;
	}
	public String getSymptom_photo() {
		return symptom_photo;
	}
	public void setSymptom_photo(String symptom_photo) {
		this.symptom_photo = symptom_photo;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	

	
}
