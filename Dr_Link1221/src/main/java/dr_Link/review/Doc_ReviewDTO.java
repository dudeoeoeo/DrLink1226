package dr_Link.review;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.PatientDTO;

public class Doc_ReviewDTO {	
	private int review_num; 
	private int doctor_num;
	private int patient_num;
	private String review_content;
	private int review_rating;
	private String review_date;
	private String review_handling;
	private DoctorDTO doctorDTO;
	private PatientDTO patientDTO;
	private int ratingAvg;
	
	
	public String getReview_handling() {
		return review_handling;
	}
	public void setReview_handling(String review_handling) {
		this.review_handling = review_handling;
	}
	public int getRatingAvg() {
		return ratingAvg;
	}
	public void setRatingAvg(int ratingAvg) {
		this.ratingAvg = ratingAvg;
	}

	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getDoctor_num() {
		return doctor_num;
	}
	public void setDoctor_num(int doctor_num) {
		this.doctor_num = doctor_num;
	}
	public int getPatient_num() {
		return patient_num;
	}
	public void setPatient_num(int patient_num) {
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
