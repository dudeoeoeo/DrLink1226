package dr_Link.prescription;

import java.util.List;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.DrLinkDTO;
import dr_Link.dto.MedicineDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.dto.Pay_recordDTO;


public interface PrescriptionDaoInter {
	/* public DoctorDTO detail_prescription(DoctorDTO vo); */
	public List<PrescriptionDTO> prescriptionRecord (int patient_num);
	public void add_prescription(PrescriptionDTO vo);
	public PrescriptionDTO detail_prescription(PrescriptionDTO vo) ;
	public PatientDTO patient_info(int patient_num);
	public DoctorDTO doctor_info(int doctor_num);
	public List<MedicineDTO> medicine_info (MedicineDTO vo) ;
	public List<MedicineDTO> medicine_detail_info (String [] medicine_num) ;
	public void updatePayment_check(int prescription_num);
	public void insertPayment_record(Pay_recordDTO pay);
	public DrLinkDTO drLink_info(DrLinkDTO vo);
}
