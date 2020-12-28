package dr_Link.dto;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.prescription.PrescriptionDTO;

public class Pay_recordDTO {
   
   private int pay_num, patient_num, doctor_num, prescription_num, dep_num;
   private String paydate, payment_way;
   private int price;
   private PatientDTO patientDTO;
   private DoctorDTO doctorDTO;
   private DepartmentDTO departmentDTO;
   private PrescriptionDTO prescriptionDTO;
   
   
   
   public PatientDTO getPatientDTO() {
	return patientDTO;
}
public void setPatientDTO(PatientDTO patientDTO) {
	this.patientDTO = patientDTO;
}
public DoctorDTO getDoctorDTO() {
	return doctorDTO;
}
public void setDoctorDTO(DoctorDTO doctorDTO) {
	this.doctorDTO = doctorDTO;
}
public DepartmentDTO getDepartmentDTO() {
	return departmentDTO;
}
public void setDepartmentDTO(DepartmentDTO departmentDTO) {
	this.departmentDTO = departmentDTO;
}
public PrescriptionDTO getPrescriptionDTO() {
	return prescriptionDTO;
}
public void setPrescriptionDTO(PrescriptionDTO prescriptionDTO) {
	this.prescriptionDTO = prescriptionDTO;
}
public int getDep_num() {
      return dep_num;
   }
   public void setDep_num(int dep_num) {
      this.dep_num = dep_num;
   }
   public int getPay_num() {
      return pay_num;
   }
   public void setPay_num(int pay_num) {
      this.pay_num = pay_num;
   }
   public int getPatient_num() {
      return patient_num;
   }
   public void setPatient_num(int patient_num) {
      this.patient_num = patient_num;
   }
   public int getDoctor_num() {
      return doctor_num;
   }
   public void setDoctor_num(int doctor_num) {
      this.doctor_num = doctor_num;
   }
   public int getPrescription_num() {
      return prescription_num;
   }
   public void setPrescription_num(int prescription_num) {
      this.prescription_num = prescription_num;
   }
   public String getPaydate() {
      return paydate;
   }
   public void setPaydate(String paydate) {
      this.paydate = paydate;
   }
   public String getPayment_way() {
      return payment_way;
   }
   public void setPayment_way(String payment_way) {
      this.payment_way = payment_way;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   
}