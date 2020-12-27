package dr_Link.doctor;

import java.util.List;
import java.util.Map;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.PageDTO;

public interface DoctorDaoInter {
	
	void insertDoctor(DoctorDTO vo);
	
	void updateDoctor(DoctorDTO vo);
	
	void deleteDoctor(DoctorDTO vo);
	
	// read
	DoctorDTO doctor_profile(int doctor_num);
	
	List<DoctorDTO> getDoctorList();
	
	// 조건
	List<DoctorDTO> getDoctorList(DoctorDTO vo);
		
	/* public List<SearchDTO> getSearch(); */
	public List<DoctorDTO> getList(PageDTO svo);
	
	public int getTotalCount();
	
	public List<DoctorDTO> getList(Map<String, List<String>> map);
	
	}

	