package dr_Link.prescription;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.DrLinkDTO;
import dr_Link.dto.MedicineDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.dto.Pay_recordDTO;
import dr_Link.dto.TreatmentRecordDTO;

@Repository("PrescriptionDaoInter")
public class PrescriptionDaoImp implements PrescriptionDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	/* 김다유 처방기록 select */
	@Override
	public List<PrescriptionDTO> prescriptionRecord(int patient_num) {
		System.out.println("===> Mybatis prescriptionRecord() 실행");
		return ss.selectList("prescription.prescriptionRecord", patient_num);
	}
	
	/* 리스트 처리 해야 함 ... */
	@Override
	public void add_prescription(PrescriptionDTO vo) {
		System.out.println("===> Mybatis add_prescription() 실행");
		ss.insert("prescription.add_prescription",vo);
	}

	@Override
	public PrescriptionDTO detail_prescription(PrescriptionDTO vo) {
		System.out.println("===> Mybatis detail_prescription() 실행");
		return ss.selectOne("prescription.detail_prescription",vo);
	}
	@Override
	public PrescriptionDTO patient_detail_prescription(int prescription_num) {
		System.out.println("===> Mybatis patient_detail_prescription() 실행");
		return ss.selectOne("prescription.patient_detail_prescription",prescription_num);
	}

	@Override
	public PatientDTO patient_info(int patient_num) {
		System.out.println("===> Mybatis prescription_info(환자정보) 실행");
		return ss.selectOne("prescription.patient_info",patient_num);
	}

	@Override
	public DoctorDTO doctor_info(int doctor_num) {
		System.out.println("===> Mybatis prescription_info(의사정보) 실행");
		return ss.selectOne("prescription.doctor_info",doctor_num);
	}


	@Override
	public List<MedicineDTO> medicine_info() {
		System.out.println("===> Mybatis medicine_info() 실행");
		return ss.selectList("prescription.medicine_info");
	}

	@Override
	public List<MedicineDTO> medicine_detail_info(String [] medicine_num) {
		System.out.println("===> Mybatis medicine_detail_info() 실행");
		ArrayList<MedicineDTO> medi_num = new ArrayList<MedicineDTO>();
		for(String medicine : medicine_num) {
			medi_num.add((MedicineDTO)ss.selectOne("prescription.medicine_detail_info",medicine));
		}
		return medi_num;
	}

	@Override
	public void updatePayment_check(int prescription_num) {
		System.out.println("DAO updatePayment_check요청");
		ss.update("prescription.updatePay_chk", prescription_num);
	}

	@Override
	public void insertPayment_record(Pay_recordDTO pay) {
		System.out.println("DAO payment_record요청");
		System.out.println("dao 에서 환자번호: "+pay.getPatient_num());
		ss.insert("prescription.insertPay_record", pay);
	}
	
	@Override
    public DrLinkDTO drLink_info() {
       return ss.selectOne("prescription.drLink_info");
    }

	@Override
	public Pay_recordDTO pay_record(int prescription_num) {
		return ss.selectOne("prescription.patient_detail_payment",prescription_num);
	}
	
	public int insertTreatRecord(TreatmentRecordDTO tr) {
		return ss.insert("prescription.insertTreatRecord", tr);
	}
	
	public int selectTreat_num() {
		return ss.selectOne("prescription.selectTreat_num");
	}
}
