package dr_Link.favorites;

import dr_Link.doctorProfile.DoctorDTO;

public class FavoritesDTO {
	private int fav_num       ;
	private int patient_num   ;
	private int doctor_num    ;
	private String fav_date      ;
	private DoctorDTO doctorDTO     ;
	
	public int getFav_num() {
		return fav_num;
	}
	public void setFav_num(int fav_num) {
		this.fav_num = fav_num;
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
	public String getFav_date() {
		return fav_date;
	}
	public void setFav_date(String fav_date) {
		this.fav_date = fav_date;
	}
	public DoctorDTO getDoctorDTO() {
		return doctorDTO;
	}
	public void setDoctorDTO(DoctorDTO doctorDTO) {
		this.doctorDTO = doctorDTO;
	}
	
}
