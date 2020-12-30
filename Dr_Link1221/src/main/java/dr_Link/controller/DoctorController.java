package dr_Link.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dr_Link.doctor.DoctorDaoInter;
import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.DrLinkDTO;
import dr_Link.dto.MedicineDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.prescription.PrescriptionDTO;
import dr_Link.prescription.PrescriptionDaoInter;
import dr_Link.prescription.PrescriptionService;
import dr_Link.review.Doc_ReviewDTO;
import dr_Link.dto.AppointmentDTO;
import dr_Link.dto.TreatmentRecordDTO;


@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {

	@Autowired	
	private PrescriptionService pre_service;

	@Autowired	
	private DoctorDaoInter doc_dao;

	@RequestMapping(value = "/main")
	public String indexRq() {
		System.out.println("index 요청: ");
		return "redirect:/main";
	}
	
	
	@RequestMapping(value = "{step}")
	public String accessAnyFiles(@PathVariable String step) {
		System.out.println("doctor 컨트롤러 step 실행");
		return "/doctor/"+step+".page";
	}
	
	
	/* 배열 붙이는 메소드 */
	public static String arrayJoin(String glue, String array[]) {
	    String result = "";

	    for (int i = 0; i < array.length; i++) {
	      result += array[i];
	      if (i < array.length - 1) result += glue;
	    }
	    return result;
	  }

	@RequestMapping(value = "/login")
	public String login() {
		System.out.println("로그인");
		return "login";
	}

	/* 김다유 : add_prescription 페이지로 이동 */
	@RequestMapping(value = "/add_prescription") 
	public String add_prescription( HttpServletRequest request, PatientDTO patientVo,DoctorDTO doctorVo, DrLinkDTO drlinkVo, MedicineDTO mediVo, Model model, HttpSession session) {
		System.out.println("처방입력 페이지로 이동");
		
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		/*현재 환자와 진료를 해서 번호를 받아 올 수 있는 상황이 아니라 임의로 값을 넣어 테스트 하는 중*/
		int patient_num = 2;
		PatientDTO patientinfo = pre_service.patient_info(patient_num);
		DoctorDTO doctorinfo = pre_service.doctor_info(doctor_num);
		DrLinkDTO drlinkinfo = pre_service.drLink_info(drlinkVo); 
		List<MedicineDTO> medicine_info = pre_service.medicine_info(mediVo);
		
		model.addAttribute("patientinfo",patientinfo);
		model.addAttribute("doctorinfo",doctorinfo);
		model.addAttribute("medicine_info",medicine_info);
		model.addAttribute("drlinkinfo",drlinkinfo);
		System.out.println("controller add_prescription 실행 완료");
		return "/doctor/add_prescription";
	}
	
	/* 김다유 : end_prescription 페이지로 이동 */
	@RequestMapping(value = "/end_prescription", method = RequestMethod.POST) 
	public String end_prescription(HttpServletRequest request, PrescriptionDTO pre_vo, MedicineDTO medi_vo, DrLinkDTO drlinkVo, Model model) {
		/*배열로 받은 값 , 구분자를 붙여 String으로 만든 후 insert*/
		String pre_date = arrayJoin(",", request.getParameterValues("prescription_date"));
		pre_vo.setPre_date(pre_date);
		pre_vo.setPrice((int) (pre_vo.getPrice()*0.9));
		System.out.println(pre_vo.getPrice());
		/*트랜잭션 처리 한 serviece 메소드 호출, insert, select 동시 작업*/
		PrescriptionDTO prescription = pre_service.end_prescription(pre_vo);

		//약품 이름을 띄우기 위해 들어온 약품번호를 배열에 담아 한개씩 select
		List<MedicineDTO> medi_detail = pre_service.medicine_detail_info(prescription.getMedicine_num());
		DrLinkDTO drlinkinfo = pre_service.drLink_info(drlinkVo); 
		model.addAttribute("prescription",prescription);
		model.addAttribute("medi_detail",medi_detail);
		model.addAttribute("drlinkinfo",drlinkinfo);
		
		return "/doctor/end_prescription.page";
		
	}

	
	
	
	/*김다유 : 의사 프로필 수정 페이지*/
	@RequestMapping(value = "/doctor_profile_settings")
	public String profile_settings(DoctorDTO vo, Model model, HttpSession session) {
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		DoctorDTO doctorinfo = pre_service.doctor_info(doctor_num);
		 List<String[]> m = new ArrayList<String[]>();
		  String [] d_graduation = doctorinfo.getD_graduation().split(",");
		  String [] d_career = doctorinfo.getD_career().split(",");
		  String [] d_content = null;
		  String [] d_field = null;
		  m.add(d_graduation);
		  m.add(d_career);	  
		  if(doctorinfo.getD_content()!=null) {
			d_content = doctorinfo.getD_content().split(",");
			m.add(d_content);
		  }
		  if(doctorinfo.getD_field()!=null) {
		  	d_field = doctorinfo.getD_field().split(",");
			m.add(d_field);
		  }	 
		  model.addAttribute("m",m);
		model.addAttribute("doctorinfo",doctorinfo);
		return "/doctor/doctor_profile_settings.page";
	}
	
	
	/* 김다유 : 의사 프로필세팅 완료 후 페이지 이동 */
	@RequestMapping(value = "/setting_ok" )
	public String setting_ok(DoctorDTO vo, HttpServletRequest req, HttpServletResponse resp,Model model){
		vo.setD_pwd(req.getParameter("chg_pwd"));
		doc_dao.doctor_profile_update(vo);
		return "/doctor/doctor_dashboard.page";
	}
	
	
	/* 김다유 : 의사대시보드 나의 환자 */
	@RequestMapping(value = "/my_patients" )
	public String my_patients(DoctorDTO vo, Model model, HttpSession session) {
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		List<TreatmentRecordDTO> my_patients_list = doc_dao.my_patients_list(doctor_num);
		model.addAttribute("my_patients_list", my_patients_list);
		System.out.println(my_patients_list.get(0).getPatientDTO().getP_name());
		return "/doctor/my_patients.page";
	}
	
	/* 김다유 : 의사대시보드 나의 환자 */
	@RequestMapping(value = "/reviews" )
	public String reviews(DoctorDTO vo, Model model, HttpSession session) {
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		List<Doc_ReviewDTO> reviewList = doc_dao.reviewList(doctor_num);
		model.addAttribute("reviewList", reviewList);
		System.out.println(reviewList.get(0).getReview_content());
		return "/doctor/reviews.page";
	}
	
	
	/* 김다유 : 의사 비밀번호 변경 성민오빠 여기서 해주세요!!!! */
	@RequestMapping(value = "/doctor_change_password" )
	public String doctor_change_password(DoctorDTO vo, Model model, HttpSession session) {
		return "/doctor/doctor_change_password.page";
	}
	
	
	
	// 예약현황
	@RequestMapping(value = "/appointments")
	public ModelAndView goAPPage(HttpSession session, HttpServletRequest rq) {
		// 페이징 처리를 위해 들어오는 넘버
		String page_num = rq.getParameter("p_num");
		int p_num =  page_num == null ? 1 : Integer.parseInt(page_num);
		DoctorDTO doctor = (DoctorDTO)session.getAttribute("doctor");
		
		List<AppointmentDTO> ap = doc_dao.getApList(doctor.getDoctor_num(), p_num);
		ModelAndView mv = new ModelAndView("/doctor/appointments.page");
		mv.addObject("apList", ap);
		try {
			if(ap.get(0).getTotal_cnt() > 0) {
				p_num = (ap.get(0).getTotal_cnt()%10 == 0) ? p_num%10 : (p_num/10)+1;
				mv.addObject("p_num", p_num);
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
			
		/*
		try {
			Date today = new Date(); 
			SimpleDateFormat format6, format7; 
			format6 = new SimpleDateFormat("오늘은 yyyy년의 w주차이며 D번째 날입니다."); 
			format7 = new SimpleDateFormat("오늘은 M월의 w번째 주, d번째 날이며, F번째 E요일입니다."); 
			System.out.println(format6.format(today)); 
			System.out.println(format7.format(today));
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		return mv;
	}
		

		
	// dash_board
	@RequestMapping(value = "/doctor_dashboard")
	public ModelAndView doctor_dashboard(HttpSession session, HttpServletRequest rq) {
		// 의사가 대시보드로 이동할 때 세션에 있는 의사의 pk 번호를 가져온다.
		DoctorDTO doctor = (DoctorDTO)session.getAttribute("doctor");
		ModelAndView mv = new ModelAndView("/doctor/doctor_dashboard.page");
		AppointmentDTO ap_dto = doc_dao.get_total_cnt(doctor.getDoctor_num());
		List<TreatmentRecordDTO> tr_dto = doc_dao.getAP_num();
		List<AppointmentDTO> apList = doc_dao.get_D_board(doctor.getDoctor_num());
		int cnt=0;
		System.out.println("대시보드 가져온 : "+apList.size());
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String day = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date today = format.parse(day);
			for(int i=0; i<apList.size(); i++) {
				Date apDay = format.parse(apList.get(i).getAppointment_date());
				// if에 들어간 i의 값은 오늘 보다 큰 날짜의 데이터를 담고있는 List의 index 번호
				if (today.compareTo(apDay) < 0) {
					cnt=i; 
					break;
				}
				cnt++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("allCnt", ap_dto);
		mv.addObject("afterTreat", tr_dto);
		mv.addObject("dashList", apList);
		mv.addObject("cnt", cnt);
		return mv;
	}
}