package dr_Link.patient;

import java.util.List;

import dr_Link.dto.PatientDTO;
import dr_Link.dto.TreatmentRecordDTO;

public interface PatientDaoInter {
	public PatientDTO getPatientDTO(int patient_num);
	
	public void updatePatient(PatientDTO vo);
	
	public void deletePatient(int patient_num);
	
	/* public DoctorDTO detail_prescription(DoctorDTO vo); */
	public List<TreatmentRecordDTO> treatmentRecord (int patient_num);
	
	/* 김성민 */
	public void insertPatient(PatientDTO dto);
	
	public PatientDTO loginCheckPatient(PatientDTO dto);
	
	public int idCheck(String p_id) throws Exception;
	
	public int check_id(String p_id) throws Exception;
	
	public String find_id(String email) throws Exception;
	
	public int update_pw(PatientDTO dto) throws Exception;
	
	public PatientDTO emailCheck(String id) throws Exception;
	
//	public void addTvo(PatientDTO dto);
	
//	// 비밀번호 변경
//	public int updatePw(PatientDTO dto) throws Exception;

}
