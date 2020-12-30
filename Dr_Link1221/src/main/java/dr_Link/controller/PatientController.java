package dr_Link.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dr_Link.booking.BookingDTO;
import dr_Link.booking.BookingService;
import dr_Link.dto.DrLinkDTO;
import dr_Link.dto.MedicineDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.dto.Pay_recordDTO;
import dr_Link.dto.TreatmentRecordDTO;
import dr_Link.patient.PatientDaoInter;
import dr_Link.patient.PatientServiceInter;
import dr_Link.prescription.PrescriptionDTO;
import dr_Link.prescription.PrescriptionDaoInter;
import dr_Link.prescription.PrescriptionService;



@Controller
@RequestMapping(value = "/patients")
public class PatientController {

	@Autowired	
	private PrescriptionService prescriptionService;
	@Autowired
	private PatientServiceInter patientService;
	
	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private PatientDaoInter patientDaoInter;
	
	@Autowired
	private PrescriptionDaoInter pre_dao;
	
	
	@RequestMapping(value = "{step}")
	public String accessAnyFiles(@PathVariable String step) {
		System.out.println("patients 컨트롤러");
		return "/patients/"+step+".page";
	}
	
	@RequestMapping("updatePatient")
	public String updatePatient(PatientDTO vo, HttpSession session, HttpServletRequest request) {
		
		try {
//			String r_path = session.getServletContext().getRealPath("/");
//			System.out.println("r_path :" + r_path);
			String img_path = request.getSession().getServletContext().getRealPath("resources/patient/profileImg")+"/";
			System.out.println("img_path :" + img_path);
//			StringBuffer path = new StringBuffer();
			/*
			path.append(r_path).append(img_path);
			path.append(oriFn);
			*/
			MultipartFile p_photo = vo.getFile();
			String oriFn = p_photo.getOriginalFilename();
			
			StringBuffer newpath = new StringBuffer();
			newpath.append(img_path);
			newpath.append(oriFn);
			vo.setP_photo(oriFn);
			File f = new File(newpath.toString()); 
			
			p_photo.transferTo(f);
			PatientDTO p_num = (PatientDTO) session.getAttribute("user");
			vo.setPatient_num(p_num.getPatient_num());
			
			patientService.updatePatient(vo);
			
			} catch (NullPointerException e) {
				e.printStackTrace();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		return "redirect:/patients/profile-settings?patient_num="+vo.getPatient_num();
	}
	
	/* 김다유 : 환자 프로필 수정 페이지 */
	@RequestMapping("profile-settings")
	public String profile_setting(HttpSession session, Model model) {
		int patient_num = ((PatientDTO) session.getAttribute("user")).getPatient_num();
		PatientDTO patient_profile = patientService.getPatientDTO(patient_num);
		model.addAttribute("patient_profile", patient_profile);
		return "/patients/profile-settings.page";
	}
	
	/* 김다유 : patient_dashboard 페이지로 이동 - 처방기록리스트 */
	@RequestMapping(value = "patient_dashboard")
	public String treatmentRecord(Model model, HttpSession session) {
		int patient_num = ((PatientDTO) session.getAttribute("user")).getPatient_num();
		try {
			// 환자 프로필
			PatientDTO patient_profile = patientService.getPatientDTO(patient_num);
			model.addAttribute("patient_profile", patient_profile);
			
			// 예약 정보
			List<BookingDTO> bookingList = bookingService.getPatientBookingList(patient_num);
			model.addAttribute("bookingList", bookingList);
			
			// 진료기록
			List<TreatmentRecordDTO> treatmentList = patientDaoInter.treatmentRecordList(patient_num);
			System.out.println(treatmentList.get(0).getDep_num());
			System.out.println(treatmentList.get(0).getDepartmentDTO().getDep_name());
			model.addAttribute("treatmentList", treatmentList);
			
			//처방전
			List<PrescriptionDTO> prescriptionRecord = patientDaoInter.prescriptionRecord(patient_num);
			model.addAttribute("prescriptionRecord", prescriptionRecord);
			
			// 결제내역
			List<Pay_recordDTO> payment_record = patientDaoInter.payment_record(patient_num);
			model.addAttribute("payment_record", payment_record);
			
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return "/patients/patient_dashboard.page";
	}
	
	/* 김다유 & 고현영 : 처방기록 상세 페이지로 이동 */	
	@RequestMapping(value = "/detail_prescription")
	public String end_prescription(PrescriptionDTO pre_vo,Model model, MedicineDTO medi_vo,HttpSession session, DrLinkDTO drlinkVO) {
		PrescriptionDTO prescription = pre_dao.patient_detail_prescription(pre_vo.getPrescription_num());
		String url = "";
		String pay_chk = prescription.getPayment_check().trim();
		if(pay_chk.equals("0")) {
			System.out.println("if문"+pay_chk+"들어온거");
			url="/patients/payment_form";
		} else {
			System.out.println("else문"+pay_chk);
			DrLinkDTO drlinkinfo = prescriptionService.drLink_info(drlinkVO);
			List<MedicineDTO> medi_detail = pre_dao.medicine_detail_info(prescription.getMedicine_num());
			model.addAttribute("medi_detail",medi_detail);
			model.addAttribute("drlinkinfo",drlinkinfo);
			url="/patients/detail_prescription";
		}
		model.addAttribute("prescription",prescription);
		System.out.println("controller detail_prescription 실행 완료");
		    
		return url+".page";
	}
	
	/* 김다유 : 결제 상세 페이지 이동*/	
	@RequestMapping("invoices")
	public String invoices(PrescriptionDTO pre_vo,Model model, MedicineDTO medi_vo,HttpSession session, DrLinkDTO drlinkVO) {
		PrescriptionDTO prescription = pre_dao.patient_detail_prescription(pre_vo.getPrescription_num());
		DrLinkDTO drlinkinfo = prescriptionService.drLink_info(drlinkVO);
		List<MedicineDTO> medi_detail = pre_dao.medicine_detail_info(prescription.getMedicine_num());
		model.addAttribute("medi_detail",medi_detail);
		model.addAttribute("drlinkinfo",drlinkinfo);
		model.addAttribute("prescription",prescription);
		return "/patients/invoices.page";
	}
	
	/* 김다유 : 환자 비밀번호 변경 페이지 이동 성민오빠 여기서 해주세요!!!!*/
	@RequestMapping("patient_change_password")
	public String patient_dashboard_change(HttpSession session, Model model) {
		int patient_num = ((PatientDTO) session.getAttribute("user")).getPatient_num();
		PatientDTO patient_profile = patientService.getPatientDTO(patient_num);
		model.addAttribute("patient_profile", patient_profile);
		return "/patients/patient_change_password.page";
	}
	
	
	@RequestMapping(value = "/payment_success", method = RequestMethod.POST)
	public ModelAndView payment_success(Pay_recordDTO pay, HttpSession session) {
		ModelAndView mv = new ModelAndView("/patients/payment_success.page");
		PrescriptionDTO prescription = prescriptionService.payment_success(pay);
		mv.addObject("prescription",prescription);
		System.out.println("결제한 처방전"+prescription.getPrescription_num());
		return mv;
	}
}
