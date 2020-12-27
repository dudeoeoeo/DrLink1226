package dr_Link.dto;

import java.util.List;

import dr_Link.doctorProfile.DoctorDTO;

public class NewsReplDTO {

	private int news_board_num, news_reply_num, patient_num, doctor_num;
	private String news_repl_comment;
	private String n_repl_date, repl_handling;
	private int n_comments_num;
	
	private List<PatientDTO> patients;
	private List<DoctorDTO> doctors;
	
	public List<PatientDTO> getPatients() {
		return patients;
	}
	public void setPatients(List<PatientDTO> patients) {
		this.patients = patients;
	}
	public List<DoctorDTO> getDoctors() {
		return doctors;
	}
	public void setDoctors(List<DoctorDTO> doctors) {
		this.doctors = doctors;
	}
	
	public String getRepl_handling() {
		return repl_handling;
	}
	public void setRepl_handling(String repl_handling) {
		this.repl_handling = repl_handling;
	}
	public int getN_comments_num() {
		return n_comments_num;
	}
	public void setN_comments_num(int n_comments_num) {
		this.n_comments_num = n_comments_num;
	}
	public int getNews_board_num() {
		return news_board_num;
	}
	public void setNews_board_num(int news_board_num) {
		this.news_board_num = news_board_num;
	}
	public int getNews_reply_num() {
		return news_reply_num;
	}
	public void setNews_reply_num(int news_reply_num) {
		this.news_reply_num = news_reply_num;
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
	public String getNews_repl_comment() {
		return news_repl_comment;
	}
	public void setNews_repl_comment(String news_repl_comment) {
		this.news_repl_comment = news_repl_comment;
	}
	public String getN_repl_date() {
		return n_repl_date;
	}
	public void setN_repl_date(String n_repl_date) {
		this.n_repl_date = n_repl_date;
	}
    
}
