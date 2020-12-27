package dr_Link.doctorProfile;

import java.util.List;

import dr_Link.dto.SearchDTO;



public interface DoctorDaoInter {
	public DoctorDTO doctor_info(int doctor_num);
	public void doctor_profile_update(DoctorDTO vo);
	public List<SearchDTO> getSearch();
	//의사 로그인
	public DoctorDTO dr_loginCheck(DoctorDTO dto);
	
	//의사 회원가입
	public void insertDoctor(DoctorDTO dto);
	
	//아이디 중복체크(비번발급용)
	public int idCheck(String d_id) throws Exception;

	//아이디 중복검사(회원가입용)
	public int check_id(String d_id) throws Exception;

	// 아이디 찾기
	public String find_id(String email) throws Exception;

	// 비밀번호 변경
	public int update_pw(DoctorDTO dto) throws Exception;

	// 이메일 검사
	public DoctorDTO emailCheck(String id) throws Exception;
}
	