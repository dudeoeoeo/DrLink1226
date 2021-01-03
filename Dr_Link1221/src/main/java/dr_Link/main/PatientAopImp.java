package dr_Link.main;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dr_Link.dto.DrPLoggerDTO;
import dr_Link.dto.PatientDTO;

@Repository
public class PatientAopImp implements PatientAopInter {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addMem(PatientDTO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public int idchk(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PatientDTO loginCheck(PatientDTO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addLoginLogging(DrPLoggerDTO vo) {
		System.out.println("여기까지" + vo.getP_id());
		System.out.println("여기까지" + vo.getReip());
		System.out.println("여기까지" + vo.getUagent());
		System.out.println("여기까지" + vo.getStatus());
		ss.insert("patient_log.logger_in",vo);
	}

}
