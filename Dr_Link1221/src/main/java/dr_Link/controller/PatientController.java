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
import org.springframework.web.multipart.MultipartFile;

import dr_Link.booking.BookingDTO;
import dr_Link.booking.BookingService;
import dr_Link.doctorProfile.DoctorProfileDAO;
import dr_Link.dto.DrLinkDTO;
import dr_Link.dto.MedicineDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.patient.PatientDaoInter;
import dr_Link.patient.PatientServiceInter;
import dr_Link.prescription.PrescriptionDTO;
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
	private DoctorProfileDAO doctorProfileDAO;
	
	@Autowired
	private PatientDaoInter patientDaoInter;
	
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
			File f = new File(newpath.toString()); // ���� �̹����� ����� ���
			
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
	
	@RequestMapping("profile-settings")
	public String profile_setting(HttpSession session, Model model) {
		PatientDTO result = (PatientDTO) session.getAttribute("user");
		//result = patientService.getPatientDTO(Integer.parseInt(result.getPatient_num()));
		result = patientService.getPatientDTO(result.getPatient_num());
		model.addAttribute("patient", result);
		return "/patients/profile-settings.page";
	}
	
	/* 김다유 : patient_dashboard 페이지로 이동 - 처방기록리스트 */
	/* patient_dashboard에서 진료기록, 결제기록, 예약기록 담당하시는 분들 여기서 값 세팅해주세요 */
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
			
			// 처방전
			
			// 결제내역
			
			
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return "/patients/patient_dashboard.page";
	}
	
	/* 김다유 : 처방기록 상세 페이지로 이동 */
	@RequestMapping(value = "/detail_prescription") 
	public String end_prescription(PrescriptionDTO pre_vo,Model model, MedicineDTO medi_vo,HttpSession session, DrLinkDTO drlinkVo) {
		PatientDTO pt = (PatientDTO)session.getAttribute("user");
		PrescriptionDTO prescription = prescriptionService.detail_prescription(pre_vo);
		DrLinkDTO drlinkinfo = prescriptionService.drLink_info(drlinkVo); 
		List<MedicineDTO> medi_detail = prescriptionService.medicine_detail_info(prescription.getMedicine_num());
		
		model.addAttribute("prescription",prescription);
		model.addAttribute("medi_detail",medi_detail);
		model.addAttribute("drlinkinfo",drlinkinfo);
		
//		int chk_num = 0;
//		String url ="";
//		
//		if(chk_num == 0) {
//			int pre_num = prescription.getPrescription_num();
//			model.addAttribute("pre_num",pre_num);
//			url="/patients/payment";
//		}else {
//			model.addAttribute("prescription",prescription);
//			model.addAttribute("medi_detail",medi_detail);
//			url="/patients/detail_prescription";
//		}
		System.out.println("controller detail_prescription 실행 완료");
		    
		return "/patients/detail_prescription";
	}

}
