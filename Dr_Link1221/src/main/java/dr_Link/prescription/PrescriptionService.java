package dr_Link.prescription;

import java.util.List;

import org.springframework.stereotype.Service;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.DrLinkDTO;
import dr_Link.dto.MedicineDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.dto.Pay_recordDTO;
import dr_Link.dto.TreatmentRecordDTO;

@Service
public interface PrescriptionService {
	/* public DoctorDTO detail_prescription(DoctorDTO vo); */
	public List<PrescriptionDTO> prescriptionRecord (int patient_num);
	public PatientDTO patient_info(int patient_num);
	public DoctorDTO doctor_info(int doctor_num);
	public List<MedicineDTO> medicine_info();
	
	
	public void add_prescription(PrescriptionDTO vo);
	public PrescriptionDTO detail_prescription(PrescriptionDTO vo) ;
	public List<MedicineDTO> medicine_detail_info (String [] medicine_num) ;
	
	
	public DrLinkDTO drLink_info();
	public PrescriptionDTO payment_success(Pay_recordDTO pay);
	public PrescriptionDTO end_prescription(PrescriptionDTO vo);
	public int insertTreatRecord(TreatmentRecordDTO tr);
}
