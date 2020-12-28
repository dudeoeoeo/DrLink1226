package dr_Link.doctor;

import java.util.List;
import java.util.Map;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.AppointmentDTO;
import dr_Link.dto.PageDTO;
import dr_Link.dto.TreatmentRecordDTO;

public interface DoctorDaoInter {
		
	void updateDoctor(DoctorDTO vo);
	
	void deleteDoctor(DoctorDTO vo);
	
	// read //doctor_info 에서 doctor_profile 로 수정
	DoctorDTO doctor_profile(int doctor_num);
	
	List<DoctorDTO> getDoctorList();
	
	// 조건
	List<DoctorDTO> getDoctorList(DoctorDTO vo);
		
	/* public List<SearchDTO> getSearch(); */
	public List<DoctorDTO> getList(PageDTO svo);
	
	public int getTotalCount();
	
	public List<DoctorDTO> getList(Map<String, List<String>> map);
	
	
	//김다유 : 의사 프로필 수정
	public void doctor_profile_update(DoctorDTO vo);
	
	//의사 로그인
	public DoctorDTO dr_loginCheck(DoctorDTO dto);
	
	//의사 회원가입
	public void insertDoctor(DoctorDTO dto);
	
	//아이디 중복체크(비번발급용)
	public int idCheck(String d_id) throws Exception;

	//아이디 중복검사(회원가입용)
	public int check_id(String d_id) throws Exception;
	
	///인증번호 검사
	public int verifyCheck(String d_verifynum);

	// 아이디 찾기
	public String find_id(String email) throws Exception;

	// 비밀번호 변경
	public int update_pw(DoctorDTO dto) throws Exception;

	// 이메일 검사
	public DoctorDTO emailCheck(String id) throws Exception;
	
	//이메일 중복검사(회원가입용)
	public int check_email(String d_email) throws Exception;
	
	public List<AppointmentDTO> getApList(int doctor_num, int p_num);
	public List<AppointmentDTO> get_D_board(int doctor_num);
	public List<TreatmentRecordDTO> getAP_num();
	public AppointmentDTO get_total_cnt(int doctor_num);
	
}

	