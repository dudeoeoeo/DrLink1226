package dr_Link.doctor;

import java.util.List;
import java.util.Map;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.PageDTO;

public interface DoctorDaoInter {
	
	void insertDoctor(DoctorDTO vo);
	
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
	
	//김성민 : 의사 로그인
	public DoctorDTO dr_loginCheck(DoctorDTO dto);
	
	//김성민 : 아이디 중복체크(비번발급용)
	public int idCheck(String d_id) throws Exception;

	//김성민 : 아이디 중복검사(회원가입용)
	public int check_id(String d_id) throws Exception;

	//김성민 : 아이디 찾기
	public String find_id(String email) throws Exception;

	//김성민 : 비밀번호 변경
	public int update_pw(DoctorDTO dto) throws Exception;

	//김성민 : 이메일 검사
	public DoctorDTO emailCheck(String id) throws Exception;
	
	}

	