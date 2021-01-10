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
import dr_Link.dto.TreatmentRecordDTO;

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
	public List<MedicineDTO> medicine_info() {
		return pre_dao.medicine_info();
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
	public DrLinkDTO drLink_info() {
		return pre_dao.drLink_info();
	}
	
	@Override
	public PrescriptionDTO payment_success(Pay_recordDTO pay_dto) {
		System.out.println("service payment_success-insertPay_record요청");
		pre_dao.insertPayment_record(pay_dto);
		System.out.println("service payment_success-updatePayment_check요청");
		pre_dao.updatePayment_check(pay_dto.getPrescription_num());
		System.out.println("service payment_success-patient_detail_prescription요청");
		return pre_dao.patient_detail_prescription(pay_dto.getPrescription_num());
	}
	
	@Override
	@Transactional
	public PrescriptionDTO end_prescription(PrescriptionDTO vo) {
		pre_dao.add_prescription(vo); //insert 
		return pre_dao.detail_prescription(vo); //select
		
	}

	public int insertTreatRecord(TreatmentRecordDTO tr) {
		pre_dao.insertTreatRecord(tr);
		return pre_dao.selectTreat_num();
	}
}
