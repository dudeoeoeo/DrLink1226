package dr_Link.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
//	@RequestMapping("doctor_profile")
//	public String doctor_profile(HttpServletRequest request, Model model, RedirectAttributes re) {
//		int doctor_num = Integer.parseInt(request.getParameter("doctor_num"));
//		re.addFlashAttribute("doctor_num", doctor_num);
//		System.out.println("PatientController 의사프로필");
//		return "redirect:/doctor_profile";
//	}
	
	@RequestMapping("updatePatient")
	public String updatePatient(PatientDTO vo, HttpSession session, HttpServletRequest request) {
		

//			String r_path = session.getServletContext().getRealPath("/");
//			System.out.println("r_path :" + r_path);
//			String img_path = request.getSession().getServletContext().getRealPath("resources/patient/profileImg")+"/";
//			System.out.println("img_path :" + img_path);
//			StringBuffer path = new StringBuffer();
			/*
			path.append(r_path).append(img_path);
			path.append(oriFn);
			*/
			PatientDTO p_num = (PatientDTO) session.getAttribute("user");
			vo.setPatient_num(p_num.getPatient_num());
			if(vo.getFile() != null) {
				String r_path = session.getServletContext().getRealPath("resources/patient/profileImg")+"\\";
				MultipartFile file = vo.getFile();
				String oriFn = file.getOriginalFilename();
				System.out.println("들어온 oriFn: "+oriFn);
				if(oriFn != null && oriFn != "") {
					vo.setP_photo(oriFn);
					StringBuffer newpath = new StringBuffer();
					newpath.append(r_path);
					newpath.append(oriFn);
					File f = new File(newpath.toString());
					try {
						file.transferTo(f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					vo.setP_photo(vo.getP_photo());
				}
				patientService.updatePatient(vo);
			} 
			
		return "redirect:/patients/profile_settings?patient_num="+vo.getPatient_num();

	}
	
	/* 김다유 : 환자 프로필 수정 페이지 */
	@RequestMapping("profile_settings")
	public String profile_setting(HttpSession session, Model model) {
		int patient_num = ((PatientDTO) session.getAttribute("user")).getPatient_num();
		PatientDTO patient_profile = patientService.getPatientDTO(patient_num);
		model.addAttribute("patient_profile", patient_profile);
		return "/patients/profile_settings.page";
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
			System.out.println("들어온 treatmentList 사이즈 : "+bookingList.size());
			
			// 진료기록
			List<TreatmentRecordDTO> treatmentList = patientDaoInter.treatmentRecordList(patient_num);
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
			url="/patients/payment_form";
		} else {
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
		Pay_recordDTO payrec = pre_dao.pay_record(pre_vo.getPrescription_num());
		DrLinkDTO drlinkinfo = prescriptionService.drLink_info(drlinkVO);
		List<MedicineDTO> medi_detail = pre_dao.medicine_detail_info(prescription.getMedicine_num());
		model.addAttribute("medi_detail",medi_detail);
		model.addAttribute("drlinkinfo",drlinkinfo);
		model.addAttribute("prescription",prescription);
		model.addAttribute("payrec",payrec);
		return "/patients/invoices.page";
	}

	//김성민 : 환자 비밀번호 변경 페이지
	@RequestMapping(value = "/patient_change_password")
	public String patient_change_password(PatientDTO vo, Model model, HttpSession session) {
		int patient_num = ((PatientDTO) session.getAttribute("user")).getPatient_num();
		PatientDTO patient_profile = patientService.getPatientDTO(patient_num);
		model.addAttribute("patient_profile",patient_profile);
		
		return "/patients/patient_change_password.page";
	}


	// 환자 비밀번호 변경 전 비번확인(ajax)
	@RequestMapping(value = "/patient_check_pwd")
	@ResponseBody
	public Map<String, Integer> patient_check_pwd(@RequestParam("old_pwd") int old_pwd, HttpSession session) {
		PatientDTO pt = new PatientDTO();
		int result = 0;
		try {
			PatientDTO pp = (PatientDTO)session.getAttribute("user");
			pt.setP_id(pp.getP_id());
			pt.setP_pwd(Integer.toString(old_pwd));
			result = patientDaoInter.patient_check_pwd(pt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("success", result);
		return map;
	}
	
	//김성민 : 환자 비번 변경
	@RequestMapping(value = "/patientChangePwd", method = RequestMethod.POST)
	public ModelAndView patientChangePwd(PatientDTO dto, String old_pwd, HttpSession session, Model model) {
		ModelAndView mv = new ModelAndView("redirect:patient_dashboard");
		//String patient_pwd = ((PatientDTO) session.getAttribute("user")).getP_pwd();
		String patient_id = ((PatientDTO) session.getAttribute("user")).getP_id();
		dto.setP_id(patient_id);
		patientDaoInter.update_patientpwd(dto);
		System.out.println("비번변경 기능 들어왓는가?");
		System.out.println("id :"+patient_id);
		return mv;
	}

	//김성민 : 환자 회원탈퇴 페이지
	@RequestMapping(value = "/patient_delete_account")
	public String patient_delete_account(Model model, HttpSession session) {
		int patient_num = ((PatientDTO) session.getAttribute("user")).getPatient_num();
		PatientDTO patient_profile = patientService.getPatientDTO(patient_num);
		model.addAttribute("patient_profile",patient_profile);
		
		return "/patients/patient_delete_account.page";
	}
	
	// 김성민 : 환자 회원 탈퇴
	@RequestMapping(value = "/patientDeleteAccount")
	public String patientDeleteAccount(PatientDTO vo, Model model, HttpSession session) {
		int patient_num = ((PatientDTO) session.getAttribute("user")).getPatient_num();
		
		patientDaoInter.deletePatient(patient_num);
		session.removeAttribute("user");
		
		return "main.page";
	}
	
	
	@RequestMapping(value = "/payment_success", method = RequestMethod.POST)
	public ModelAndView payment_success(Pay_recordDTO pay, HttpSession session) {
		ModelAndView mv = new ModelAndView("/patients/payment_success.page");
		PrescriptionDTO prescription = prescriptionService.payment_success(pay);
		mv.addObject("prescription",prescription);
		System.out.println("결제한 처방전"+prescription.getPrescription_num());
		return mv;
	}
	
	//예약취소
	@RequestMapping(value = "/cancelbooking")
	public String cancelbooking(@RequestParam("appointment_num") int appointment_num) {
		System.out.println("예약취소 컨트롤러왓는가?");
		System.out.println("들어온 예약번호 : " + appointment_num);
		patientDaoInter.deleteAppointment(appointment_num);
		return "redirect:/patients/patient_dashboard.page";
	}
}
