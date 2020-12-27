package dr_Link.patient;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dr_Link.dto.PatientDTO;
import dr_Link.dto.TreatmentRecordDTO;

@Repository("patientDAO")
public class PatientDaoImp implements PatientDaoInter{
	
	@Autowired
	private SqlSessionTemplate ss;
	
	
	
	/* 김성민 */
	@Override
	public void insertPatient(PatientDTO dto) {
		System.out.println("===> imple에서 Mybatis mapper add()로 실행");
		System.out.println(dto.getPatient_num()+","+dto.getP_name());
		ss.insert("patient.add",dto);
	}
	
	@Override
	public PatientDTO loginCheckPatient(PatientDTO dto) {
		System.out.println("===> imple에서 Mybatis mapper loginchk()로 실행");
		return ss.selectOne("patient.loginchk", dto);
	}

	//아이디 중복검사(비번발급용)
	@Override
	public int idCheck(String p_id) throws Exception{
		return ss.selectOne("patient.idCheck",p_id);
	}

	//아이디 중복검사(회원가입용)
	@Override
	public int check_id(String p_id) throws Exception{
		return ss.selectOne("patient.idCheck",p_id);
	}
	
	// 아이디 찾기
	public String find_id(String email) throws Exception{
		System.out.println("find_id 다오 임플까지옴");
		return ss.selectOne("patient.find_id", email);
	}
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(PatientDTO dto) throws Exception{
		System.out.println("update_pw 다오 임플까지옴");
		return ss.update("patient.update_pw", dto);
	}
	
	// 이메일 검사
	public PatientDTO emailCheck(String id) throws Exception{
		System.out.println("emailCheck 다오 임플까지옴");
		return ss.selectOne("patient.emailCheck", id);
	}

	@Override
	public List<TreatmentRecordDTO> treatmentRecord(int patient_num) {
		System.out.println("===> Mybatis treatmentRecord() 실행");
		return ss.selectList("patient.treatmentRecord", patient_num);
	}

	@Override
	public PatientDTO getPatientDTO(int patient_num) {
		// TODO Auto-generated method stub
		return ss.selectOne("patient.getPatient", patient_num);
	}

	@Override
	public void updatePatient(PatientDTO vo) {
		// TODO Auto-generated method stub
		ss.update("patient.updatePatient", vo);
	}

	@Override
	public void deletePatient(int patient_num) {
		// TODO Auto-generated method stub
		
	}
	
	//이미지업로드 및 회원가입
//	public void addTvo(PatientDTO dto) {
//		System.out.println("addTvo요청");
//		ss.insert("patient.adds", dto);
//	}

}
