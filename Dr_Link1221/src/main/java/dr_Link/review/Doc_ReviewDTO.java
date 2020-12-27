package dr_Link.review;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.PatientDTO;

public class Doc_ReviewDTO {	
	private String review_num; 
	private String doctor_num;
	private String patient_num;
	private String review_content;
	private int review_rating;
	private String review_date;
	private DoctorDTO doctorDTO;
	private PatientDTO patientDTO;
	
	public String getReview_num() {
		return review_num;
	}
	public void setReview_num(String review_num) {
		this.review_num = review_num;
	}
	public String getDoctor_num() {
		return doctor_num;
	}
	public void setDoctor_num(String doctor_num) {
		this.doctor_num = doctor_num;
	}
	public String getPatient_num() {
		return patient_num;
	}
	public void setPatient_num(String patient_num) {
		this.patient_num = patient_num;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public DoctorDTO getDoctorDTO() {
		return doctorDTO;
	}
	public void setDoctorDTO(DoctorDTO doctorDTO) {
		this.doctorDTO = doctorDTO;
	}
	public PatientDTO getPatientDTO() {
		return patientDTO;
	}
	public void setPatientDTO(PatientDTO patientDTO) {
		this.patientDTO = patientDTO;
	}
	
	
	

}
