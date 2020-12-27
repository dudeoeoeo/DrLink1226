package dr_Link.patient;

import java.util.List;

import dr_Link.dto.PatientDTO;
import dr_Link.dto.TreatmentRecordDTO;
import dr_Link.prescription.PrescriptionDTO;

public interface PatientDaoInter {

	
	public PatientDTO getPatientDTO(int patient_num);
	
	public void updatePatient(PatientDTO vo);
	
	public void deletePatient(int patient_num);
	
	/* public DoctorDTO detail_prescription(DoctorDTO vo); */
	public List<TreatmentRecordDTO> treatmentRecord (int patient_num);
	
	//회원가입
	public void insertPatient(PatientDTO dto);
	
	//로그인
	public PatientDTO loginCheckPatient(PatientDTO dto);
	
	//아이디 중복검사(회원가입)
	public int idCheck(String p_id) throws Exception;
	
	//이메일 중복검사(회원가입)
	public int check_email(String p_email) throws Exception;
	
	//아이디 중복검사(비번찾기용)
	public int check_id(String p_id) throws Exception;
	
	// 아이디 찾기
	public String find_id(String email) throws Exception;
	
	// 비밀번호 변경
	public int update_pw(PatientDTO dto) throws Exception;
	
	// 이메일 검사
	public PatientDTO emailCheck(String id) throws Exception;
	
	
//	public void addTvo(PatientDTO dto);
	
//	// 비밀번호 변경
//	public int updatePw(PatientDTO dto) throws Exception;

}
