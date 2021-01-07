package dr_Link.patient;

import java.util.List;

import dr_Link.dto.PatientDTO;
import dr_Link.dto.Pay_recordDTO;
import dr_Link.dto.TreatmentRecordDTO;
import dr_Link.prescription.PrescriptionDTO;

public interface PatientDaoInter {

	
	public PatientDTO getPatientDTO(int patient_num);
	
	public void updatePatient(PatientDTO vo);
	
	public void deletePatient(int patient_num);
	
	/* public DoctorDTO detail_prescription(DoctorDTO vo); */
	public List<TreatmentRecordDTO> treatmentRecordList (int patient_num);
	
	public List<PrescriptionDTO> prescriptionRecord (int patient_num);
	
	public List<Pay_recordDTO> payment_record(int patient_num);
	
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
	
	// 비밀번호 변경 (비번 찾기용)
	public int update_pw(PatientDTO dto) throws Exception;
	
	// 비밀번호 변경
	public int update_patientpwd(PatientDTO dto);

	//비밀번호 인증 검사(ajax)
	public int patient_check_pwd(PatientDTO dto);
	
	// 이메일 검사
	public PatientDTO emailCheck(String id) throws Exception;
	
	//예약취소
	public void deleteAppointment(int appointment_num);
	
	
//	public void addTvo(PatientDTO dto);
	
//	// 비밀번호 변경
//	public int updatePw(PatientDTO dto) throws Exception;

}
