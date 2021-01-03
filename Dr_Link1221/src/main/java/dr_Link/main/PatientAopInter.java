package dr_Link.main;

import dr_Link.dto.DrPLoggerDTO;
import dr_Link.dto.PatientDTO;

public interface PatientAopInter {

	public void addMem(PatientDTO vo);
	public int idchk(String id);
	public PatientDTO loginCheck(PatientDTO vo);
	public void addLoginLogging(DrPLoggerDTO vo);
	
}
