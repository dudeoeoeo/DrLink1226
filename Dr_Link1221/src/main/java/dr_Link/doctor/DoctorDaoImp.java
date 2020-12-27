package dr_Link.doctor;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.PageDTO;

@Repository("doctorDaoInter")
public class DoctorDaoImp implements DoctorDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public DoctorDTO doctor_profile(int doctor_num) {
		System.out.println("===> ss doctor_profile() 실행");
		return ss.selectOne("doctor.doctor_profile", doctor_num);
	}

	@Override
	public void insertDoctor(DoctorDTO vo) {
		
	}

	@Override
	public void updateDoctor(DoctorDTO vo) {
		
	}

	@Override
	public void deleteDoctor(DoctorDTO vo) {
		
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
	
	/*@Override
	
	 * public List<SearchDTO> getSearch() {
	 * System.out.println("===> ss getSearch() 실행"); return
	 * ss.selectList("doctor.getSearch"); }
	 */

	

}
