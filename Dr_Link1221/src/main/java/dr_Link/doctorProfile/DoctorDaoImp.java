package dr_Link.doctorProfile;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dr_Link.dto.PageDTO;
import dr_Link.dto.SearchDTO;


@Repository("doctorDao")
public class DoctorDaoImp implements DoctorDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public DoctorDTO doctor_info(int doctor_num) {
		System.out.println("===> Mybatis prescription_info(의사정보) 실행");
		return ss.selectOne("prescription.doctor_info",doctor_num);
	}


	@Override
	public void doctor_profile_update(DoctorDTO vo) {
		System.out.println("===> Mybatis addPrescription() 실행");
		ss.insert("prescription.addPrescription",vo);
	}
	
	@Override
	public List<SearchDTO> getSearch() {
		System.out.println("===> ss getSearch() 실행");
		return ss.selectList("doctor.getSearch");
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
	
	// 아이디 찾기
	public String find_id(String email) throws Exception{
		System.out.println("find_id 다오 임플까지옴");
		return ss.selectOne("doctor.find_id", email);
	}
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(DoctorDTO dto) throws Exception{
		System.out.println("update_pw 다오 임플까지옴");
		return ss.update("doctor.update_pw", dto);
	}
	
	// 이메일 검사
	public DoctorDTO emailCheck(String id) throws Exception{
		System.out.println("emailCheck 다오 임플까지옴");
		return ss.selectOne("doctor.emailCheck", id);
	}

	@Override
	public List<DoctorDTO> getList(PageDTO svo){ //nowPage등으로 연산된 start,end
		System.out.println("getList요청");
		List<DoctorDTO> list = ss.selectList("doctor.list", svo);
		return list; 
	}
	
	@Override
	public int getTotalCount() { //전체 데이터를 기준으로 페이지를 나눌것이기 때문
		return ss.selectOne("doctor.totalCount");
	}
	


	//Foreach문 필터링
	
	public List<DoctorDTO> getList(Map<String, List<String>> map){
	List<DoctorDTO> list = ss.selectList("doctor.searchList",map);
	return list;

	}

}
