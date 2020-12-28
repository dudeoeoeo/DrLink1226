package dr_Link.prescription;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.DrLinkDTO;
import dr_Link.dto.MedicineDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.dto.Pay_recordDTO;

@Repository("PrescriptionService")
public class PrescriptionServiceImpl implements PrescriptionService{
	

	@Autowired
	private PrescriptionDaoInter pre_dao;

	@Override
	public List<PrescriptionDTO> prescriptionRecord(int patient_num) {
		return pre_dao.prescriptionRecord(patient_num);
	}

	@Override
	public PatientDTO patient_info(int patient_num) {
		return pre_dao.patient_info(patient_num);
	}

	@Override
	public DoctorDTO doctor_info(int doctor_num) {
		return pre_dao.doctor_info(doctor_num);
	}

	@Override
	public List<MedicineDTO> medicine_info(MedicineDTO vo) {
		return pre_dao.medicine_info(vo);
	}

	@Override
	public void add_prescription(PrescriptionDTO vo) {
		pre_dao.add_prescription(vo);
	}

	@Override
	public PrescriptionDTO detail_prescription(PrescriptionDTO vo) {
		return pre_dao.detail_prescription(vo);
	}

	@Override
	public List<MedicineDTO> medicine_detail_info(String[] medicine_num) {
		return pre_dao.medicine_detail_info(medicine_num);
	}

	@Override
	public DrLinkDTO drLink_info(DrLinkDTO vo) {
		return pre_dao.drLink_info(vo);
	}
	
	@Override
	public void payment_success(Pay_recordDTO pay_dto) {
		System.out.println("service insertPay_record요청");
		pre_dao.insertPayment_record(pay_dto);
		System.out.println("service payment_success요청");
		pre_dao.updatePayment_check(pay_dto.getPrescription_num());
	}
	
	@Override
	@Transactional
	public PrescriptionDTO end_prescription(PrescriptionDTO vo) {
		pre_dao.add_prescription(vo); //insert 
		return pre_dao.detail_prescription(vo); //select
		
	}

}
