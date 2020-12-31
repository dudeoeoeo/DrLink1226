package dr_Link.patient;

import javax.servlet.http.HttpServletResponse;

import dr_Link.dto.PatientDTO;

public interface PatientServiceInter {
	
	public PatientDTO getPatientDTO(int patient_num);
	
	public void updatePatient(PatientDTO vo);
	
	/* 김성민 */
	// 아이디 중복검사(회원가입)
	public void check_id(String p_id, HttpServletResponse response) throws Exception;
	
	// 이메일 중복검사(회원가입)
	public void check_email(String p_email, HttpServletResponse response) throws Exception;
	
	// 아이디 찾기
	public String find_id(HttpServletResponse response, String email) throws Exception;
	
	// 이메일 발송
	public void send_mail(PatientDTO dto, String div) throws Exception;
	
	// 비밀번호 찾기
	public void find_pw(HttpServletResponse response, PatientDTO dto) throws Exception;
	
	//회원탈퇴
	public void deletePatient(int patient_num);

}
