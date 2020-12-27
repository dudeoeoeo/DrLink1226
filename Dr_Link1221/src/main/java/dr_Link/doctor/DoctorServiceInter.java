package dr_Link.doctor;

import javax.servlet.http.HttpServletResponse;

import dr_Link.doctorProfile.DoctorDTO;

public interface DoctorServiceInter {
	
	/* 김성민 */
	public void doctor_check_id(String d_id, HttpServletResponse response) throws Exception;
	
	public String doctor_find_id(HttpServletResponse response, String email) throws Exception;
	
	public void doctor_send_mail(DoctorDTO dto, String div) throws Exception;
	
	public void doctor_find_pw(HttpServletResponse response, DoctorDTO dto) throws Exception;

}
