package dr_Link.doctor;

import javax.servlet.http.HttpServletResponse;

import dr_Link.doctorProfile.DoctorDTO;

public interface DoctorServiceInter {
	
	/* 김성민 */
	// 아이디 중복 검사(AJAX)
	public void doctor_check_id(String d_id, HttpServletResponse response) throws Exception;
	
	// 아이디 찾기
	public String doctor_find_id(HttpServletResponse response, String email) throws Exception;
	
	// 이메일 발송
	public void doctor_send_mail(DoctorDTO dto, String div) throws Exception;
	
	// 비밀번호 찾기
	public void doctor_find_pw(HttpServletResponse response, DoctorDTO dto) throws Exception;
	
	// 이메일 중복 검사
	public void doctor_check_email(String d_email, HttpServletResponse response) throws Exception;

	// 의사 정보 다시 가져오기
	public DoctorDTO getDoctorDTO(int doctor_num);
}
