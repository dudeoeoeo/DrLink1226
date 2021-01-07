package dr_Link.doctor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.AppointmentDTO;
import dr_Link.dto.PageDTO;
import dr_Link.dto.TreatmentRecordDTO;
import dr_Link.review.Doc_ReviewDTO;

@Repository("doctorDaoInter")
public class DoctorDaoImp implements DoctorDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;

	// read //doctor_info 에서 doctor_profile 로 수정
	@Override
	public DoctorDTO doctor_profile(int doctor_num) {
		System.out.println("===> ss doctor_profile() 실행");
		return ss.selectOne("doctor.doctor_profile", doctor_num);
	}

	@Override
	public List<TreatmentRecordDTO> my_patients_list(int doctor_num) {
		return ss.selectList("doctor.my_patients_list",doctor_num);
	}

	public List<Doc_ReviewDTO> reviewList(int doctor_num) {
		// TODO Auto-generated method stub
		return ss.selectList("doc_review.reviewList", doctor_num);
	}
	
	@Override
	public void updateDoctor(DoctorDTO vo) {
		
	}

	//의사 회원탈퇴
	@Override
	public void deleteDoctor(int doctor_num) {
		ss.update("doctor.deleteDoctor", doctor_num);
	}

	@Override
	public List<DoctorDTO> getDoctorList() {
		return null;
	}

	@Override
	public List<DoctorDTO> getDoctorList(DoctorDTO vo) {
		return null;
	}

	@Override
	public List<DoctorDTO> getList(PageDTO svo) { //nowPage등으로 연산된 start,end
		System.out.println("getList요청");
		List<DoctorDTO> list = ss.selectList("doctor.list", svo);
		return list; 
	}

	@Override
	public int getTotalCount() { //전체 데이터를 기준으로 페이지를 나눌것이기 때문
		return ss.selectOne("doctor.totalCount");
	}

	@Override
	public List<DoctorDTO> getList(Map<String, List<String>> map) {
		List<DoctorDTO> list = ss.selectList("doctor.searchList",map);
		return list;

	}

	@Override
	public void doctor_profile_update(DoctorDTO vo) {
		System.out.println("===> Mybatis doctor_profile_settings() 실행");
		ss.insert("doctor.doctor_profile_settings",vo);
	}
	
	//의사 로그인
	@Override
	public DoctorDTO dr_loginCheck(DoctorDTO dto) {
		System.out.println("===> imple에서 Mybatis mapper loginchk()로 실행");
		return ss.selectOne("doctor.loginchk",dto);
	}
	
	//의사 회원가입
	@Override
	public void insertDoctor(DoctorDTO dto) {
		System.out.println("===> imple에서 Mybatis mapper add()로 실행");
		System.out.println(dto.getDoctor_num()+","+dto.getD_name());
		ss.insert("doctor.add",dto);
	}

	//아이디 중복검사(비번발급용)
	@Override
	public int idCheck(String d_id) throws Exception{
		return ss.selectOne("doctor.idCheck",d_id);
	}

	//아이디 중복검사(회원가입용)
	@Override
	public int check_id(String d_id) throws Exception{
		return ss.selectOne("doctor.idCheck",d_id);
	}

	//이메일 중복검사(회원가입용)
	@Override
	public int check_email(String d_email) throws Exception{
		return ss.selectOne("doctor.doctoremailCheck",d_email);
	}

	//의사 인증번호 유효성검사
	@Override
	public int verifyCheck(String d_verifynum) {
		return ss.selectOne("doctor.verifyCheck",d_verifynum);
	}
	
	// 아이디 찾기
	public String find_id(String email) throws Exception{
		System.out.println("find_id 다오 임플까지옴");
		return ss.selectOne("doctor.find_id", email);
	}
	
	// 비밀번호 변경(비번찾기용)
	@Transactional
	public int update_pw(DoctorDTO dto) throws Exception{
		System.out.println("update_pw 다오 임플까지옴");
		return ss.update("doctor.update_pw", dto);
	}
	
	// 비밀번호 변경
	public int update_doctorpwd(DoctorDTO dto) {
		return ss.update("doctor.update_doctorpwd", dto);
	}
	
	//비밀번호 인증 검사(ajax)
	public int doctor_check_pwd(DoctorDTO dto) {
		return ss.selectOne("doctor.pwdCheck", dto);
	}
	
	// 이메일 검사
	public DoctorDTO emailCheck(String id) throws Exception{
		System.out.println("emailCheck 다오 임플까지옴");
		return ss.selectOne("doctor.emailCheck", id);
	}
	
	// 의사 정보 다시 가져오기
	@Override
	public DoctorDTO getDoctorDTO(int doctor_num) {
		// TODO Auto-generated method stub
		return ss.selectOne("doctor.getDoctor", doctor_num);
	}
	
	/*@Override
	 * public List<SearchDTO> getSearch() {
	 * System.out.println("===> ss getSearch() 실행"); return
	 * ss.selectList("doctor.getSearch"); }
	 */
	
	// dash_board 갈 때 가져올 예약 목록들
	public List<AppointmentDTO> get_D_board(int doctor_num) {
		System.out.println("get_D_board 요청");
		return ss.selectList("doctor.get_dashList", doctor_num);
	}

	// 오늘자 예약 목록에서 진료가 되었는지 체크
	public List<TreatmentRecordDTO> getAP_num() {
		System.out.println("getAP_num 요청");
		return ss.selectList("doctor.getAP_num");
	}
	
	// 환자 수 가져오기
	public AppointmentDTO get_total_cnt(int doctor_num) {
		System.out.println("get_total_cnt 요청");
		return ss.selectOne("doctor.dash_total_cnt", doctor_num);
	}
	
	// appointment 페이지로 갈 때
	public List<AppointmentDTO> getApList(int doctor_num, int p_num) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		if (p_num == 1) {
			map.put("start", p_num);
		} else {
			map.put("start", p_num*10-9);
		}
		map.put("end", p_num*10);
		map.put("doctor_num", doctor_num);
		System.out.println("getApList 요청: "+ doctor_num + " "+ p_num);
		return ss.selectList("doctor.getApList",map);
	}
	
	
//	public List<AiRecordDTO> getAiList(int doctor_num) {
//		List<String> rr = ss.selectList("doctor.getPatientNum",doctor_num);
//		AiRecordDTO tt = new AiRecordDTO();
//		int cnt = 0;
//		for(int i=0; i<rr.size(); i++) {
//			++cnt;
//			
//			return tt.add(ss.selectOne("doctor.getLastAiRecord",cnt);
//		}
//	}
	
}
