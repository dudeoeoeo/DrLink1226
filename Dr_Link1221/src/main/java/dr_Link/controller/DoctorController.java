package dr_Link.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
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

import dr_Link.doctor.DoctorDaoInter;
import dr_Link.doctor.DoctorServiceInter;
import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.AiRecordDTO;
import dr_Link.dto.AppointmentDTO;
import dr_Link.dto.DrLinkDTO;
import dr_Link.dto.MedicineDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.dto.TreatmentRecordDTO;
import dr_Link.prescription.PrescriptionDTO;
import dr_Link.prescription.PrescriptionService;
import dr_Link.review.Doc_ReviewDTO;

@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {

	@Autowired
	private PrescriptionService pre_service;

	@Autowired
	private DoctorDaoInter doc_dao;
	
	@Autowired
	private DoctorServiceInter doc_service;

	@RequestMapping(value = "/main")
	public String indexRq() {
		System.out.println("index 요청: ");
		return "redirect:/main";
	}

	@RequestMapping(value = "{step}")
	public String accessAnyFiles(@PathVariable String step) {
		System.out.println("doctor 컨트롤러 step 실행");
		return "/doctor/" + step + ".page";
	}

	/* 김다유 : 배열 붙이는 메소드 */
	public static String arrayJoin(String glue, String array[]) {
		String result = "";

		for (int i = 0; i < array.length; i++) {
			result += array[i];
			if (i < array.length - 1)
				result += glue;
		}
		return result;
	}

	@RequestMapping(value = "/login")
	public String login() {
		System.out.println("로그인");
		return "login";
	}

	@RequestMapping(value = "/doctor_profile")
	public String doctor_profile() {
		System.out.println("doctorController 의사페이지");
		return "redirect:/doctor_profile";
	}

	/* 김다유 : add_prescription 페이지로 이동 */
	@RequestMapping(value = "/add_prescription")
	public String add_prescription(HttpServletRequest request, PatientDTO patientVo, DoctorDTO doctorVo,
			DrLinkDTO drlinkVo, MedicineDTO mediVo, Model model, HttpSession session) {
		System.out.println("처방입력 페이지로 이동");

		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		/* 현재 환자와 진료를 해서 번호를 받아 올 수 있는 상황이 아니라 임의로 값을 넣어 테스트 하는 중 */
		int patient_num = 2;
		PatientDTO patientinfo = pre_service.patient_info(patient_num);
		DoctorDTO doctorinfo = pre_service.doctor_info(doctor_num);
		DrLinkDTO drlinkinfo = pre_service.drLink_info(drlinkVo);
		List<MedicineDTO> medicine_info = pre_service.medicine_info(mediVo);

		model.addAttribute("patientinfo", patientinfo);
		model.addAttribute("doctorinfo", doctorinfo);
		model.addAttribute("medicine_info", medicine_info);
		model.addAttribute("drlinkinfo", drlinkinfo);
		System.out.println("controller add_prescription 실행 완료");
		return "/doctor/add_prescription";
	}

	/* 김다유 : end_prescription 페이지로 이동 */
	@RequestMapping(value = "/end_prescription", method = RequestMethod.POST)
	public String end_prescription(HttpServletRequest request, PrescriptionDTO pre_vo, MedicineDTO medi_vo,
			DrLinkDTO drlinkVo, Model model) {
		/* 배열로 받은 값 , 구분자를 붙여 String으로 만든 후 insert */
		String pre_date = arrayJoin(",", request.getParameterValues("prescription_date"));
		pre_vo.setPre_date(pre_date);
		pre_vo.setPrice((int) (pre_vo.getPrice() * 0.9));
		/* 트랜잭션 처리 한 serviece 메소드 호출, insert, select 동시 작업 */
		PrescriptionDTO prescription = pre_service.end_prescription(pre_vo);

		// 약품 이름을 띄우기 위해 들어온 약품번호를 배열에 담아 한개씩 select
		List<MedicineDTO> medi_detail = pre_service.medicine_detail_info(prescription.getMedicine_num());
		DrLinkDTO drlinkinfo = pre_service.drLink_info(drlinkVo);
		model.addAttribute("prescription", prescription);
		model.addAttribute("medi_detail", medi_detail);
		model.addAttribute("drlinkinfo", drlinkinfo);
		System.out.println("end_prescription 페이지 이동");

		return "/doctor/end_prescription.page";

	}

	/* 김다유 : 의사 프로필 수정 페이지 */
	@RequestMapping(value = "/doctor_profile_settings")
	public String profile_settings(Model model, HttpSession session, HttpServletRequest request) {
//		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		DoctorDTO doctorinfo = new DoctorDTO();
		// 의사번호를 던져서 가져온 값을 doctor_profile에 저장 후 model 에 담아 jsp 전송
//		if (redirectMap != null) {
//			doctorinfo = pre_service.doctor_info((int) redirectMap.get("doctor_num")); // 오브젝트 타입이라 캐스팅해줌
//		} else 
//			if (request.getParameter("doctor_num") != null) {
//				int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
//				doctorinfo = doc_service.getDoctorDTO(doctor_num);
//				
//				System.out.println(doctorinfo.getD_photo()+"사진이름이 업뎃되엇나????");
//		
//			doctorinfo = pre_service.doctor_info(Integer.parseInt(request.getParameter("doctor_num")));
//		
//		} else {
//			System.out.println("else라면?????");
//			doctorinfo = pre_service.doctor_info(((DoctorDTO) session.getAttribute("doctor")).getDoctor_num());
//		}
			

		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		doctorinfo = doc_service.getDoctorDTO(doctor_num);

		List<String[]> m = new ArrayList<String[]>();
		String[] d_graduation = doctorinfo.getD_graduation().split(",");
		String[] d_career = doctorinfo.getD_career().split(",");
		//String[] d_content = doctorinfo.getD_content().split(",");
		String[] d_field = null;
		m.add(d_graduation);
		m.add(d_career);
//		if (doctorinfo.getD_content() != null) {
//			d_content = doctorinfo.getD_content().split(".");
//			m.add(d_content);
//		}
		if (doctorinfo.getD_field() != null) {
			d_career = doctorinfo.getD_field().split(",");
			m.add(d_career);
		}
		if (doctorinfo.getD_career() != null) {
			d_graduation = doctorinfo.getD_career().split(",");
			m.add(d_graduation);
		}
		if (doctorinfo.getD_graduation() != null) {
			d_field = doctorinfo.getD_graduation().split(",");
			m.add(d_field);
		}
		System.out.println(doctorinfo.getD_photo()+"사진이름이 정말로 업뎃되엇나????");
		model.addAttribute("m", m);
		model.addAttribute("doctorinfo", doctorinfo);
		return "/doctor/doctor_profile_settings.page";
	}

	/* 김다유 : 의사 프로필세팅 완료 후 페이지 이동 */
	@RequestMapping(value = "/setting_ok")
	public String setting_ok(DoctorDTO vo, HttpSession session, HttpServletRequest request) {
//		int doctor_num = Integer.parseInt(request.getParameter("doctor_num"));
		System.out.println("setting_ok 실행");
//		re.addFlashAttribute("doctor_num", doctor_num);
		DoctorDTO doctor_num = (DoctorDTO) session.getAttribute("doctor");
		vo.setDoctor_num(doctor_num.getDoctor_num());
		if(vo.getFile() != null) {
			String r_path = session.getServletContext().getRealPath("resources/doctor/doctorImg")+"\\";
			MultipartFile file = vo.getFile();
			String oriFn = file.getOriginalFilename();
			System.out.println("들어온 oriFn: "+oriFn);
			if(oriFn != null && oriFn != "") {
				vo.setD_photo(oriFn);
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
				vo.setD_photo(vo.getD_photo());
			}
			System.out.println(vo.getD_photo()+"사진 업로드되엇나?????");
			doc_dao.doctor_profile_update(vo);
		} 
		return "redirect:/doctor/doctor_profile_settings?doctor_num="+vo.getDoctor_num();
	}

	/* 김다유 : 의사대시보드 나의 환자 */
	@RequestMapping(value = "/my_patients")
	public String my_patients(DoctorDTO vo, Model model, HttpSession session) {
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		List<TreatmentRecordDTO> my_patients_list = doc_dao.my_patients_list(doctor_num);
		model.addAttribute("my_patients_list", my_patients_list);
		
		DoctorDTO doctorinfo = new DoctorDTO();
//		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		doctorinfo = doc_service.getDoctorDTO(doctor_num);
		model.addAttribute("doctorinfo", doctorinfo);
		
		return "/doctor/my_patients.page";
	}

	/* 김다유 : 의사대시보드 나의 리뷰 */
	@RequestMapping(value = "/reviews")
	public String reviews(DoctorDTO vo, Model model, HttpSession session) {
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		List<Doc_ReviewDTO> reviewList = doc_dao.reviewList(doctor_num);
		
		DoctorDTO doctorinfo = new DoctorDTO();
//		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		doctorinfo = doc_service.getDoctorDTO(doctor_num);
		model.addAttribute("doctorinfo", doctorinfo);
		
		model.addAttribute("reviewList", reviewList);
		return "/doctor/reviews.page";
	}

	// 김성민 : 의사 비밀번호 변경 페이지
	@RequestMapping(value = "/doctor_change_password")
	public String doctor_change_password(DoctorDTO vo, Model model, HttpSession session) {
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		DoctorDTO doctorinfo = pre_service.doctor_info(doctor_num);
		model.addAttribute("doctorinfo", doctorinfo);

		return "/doctor/doctor_change_password.page";
	}

	// 의사 비밀번호 변경 전 비번확인(ajax)
	@RequestMapping(value = "/doctor_check_pwd")
	@ResponseBody
	public Map<String, Integer> doctor_check_pwd(@RequestParam("old_pwd") int old_pwd, HttpSession session) {
		DoctorDTO pt = new DoctorDTO();
		int result = 0;
		try {
			DoctorDTO pp = (DoctorDTO) session.getAttribute("doctor");
			System.out.println("pp: " + pp.getD_id());
			pt.setD_id(pp.getD_id());
			pt.setD_pwd(Integer.toString(old_pwd));
			result = doc_dao.doctor_check_pwd(pt);
			System.out.println("가져온 result: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("success", result);
		System.out.println("+++++++++++++++++++++++++++++++++++++");
		return map;
	}

	// 김성민 : 의사 비번 변경
	@RequestMapping(value = "/doctorChangePwd", method = RequestMethod.POST)
	public ModelAndView doctorChangePwd(DoctorDTO dto, String old_pwd, HttpSession session, Model model) {
		ModelAndView mv = new ModelAndView("redirect:doctor_dashboard");
		// String doctor_pwd = ((DoctorDTO) session.getAttribute("doctor")).getD_pwd();
		String doctor_id = ((DoctorDTO) session.getAttribute("doctor")).getD_id();
		dto.setD_id(doctor_id);
		doc_dao.update_doctorpwd(dto);
		System.out.println("비번변경 기능 들어왓는가?");
		System.out.println("id :" + doctor_id);

		return mv;
	}

	//김성민 : 의사 회원탈퇴 페이지
	@RequestMapping(value = "/doctor_delete_account")
	public String doctor_delete_account(Model model, HttpSession session) {
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		DoctorDTO doctorinfo = pre_service.doctor_info(doctor_num);
		model.addAttribute("doctorinfo", doctorinfo);
		
		return "/doctor/doctor_delete_account.page";
	}

	// 김성민 : 의사 회원 탈퇴
	@RequestMapping(value = "/doctorDeleteAccount")
	public String doctorDeleteAccount(DoctorDTO dto, Model model, HttpSession session) {
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		
		doc_dao.deleteDoctor(doctor_num);
		session.removeAttribute("doctor");
		
		return "main.page";
	}

	// 예약현황
	@RequestMapping(value = "/appointments")
	public ModelAndView goAPPage(Model model, HttpSession session, HttpServletRequest rq) {
		// 페이징 처리를 위해 들어오는 넘버
		String page_num = rq.getParameter("p_num");
		int p_num = page_num == null ? 1 : Integer.parseInt(page_num);
		DoctorDTO doctor = (DoctorDTO) session.getAttribute("doctor");

		// 최근 ai기록
//		List<AiRecordDTO> ar = doc_dao.getAiList(doctor.getDoctor_num());
//		System.out.println("들어온 ar size: " + ar.size());
//		List<AiRecordDTO> aiList = new ArrayList<AiRecordDTO>();
//		List<Integer> p_numList = new ArrayList<Integer>();
//		for (int i=0; i<ar.size(); i++) {
//			int cnt = 0;
//			if(p_numList.size() > 0) {
//				for(int j=0; j<p_numList.size(); j++) {
//					if(ar.get(i).getPatient_num() == p_numList.get(j)) {
//						cnt++;
//					}
//				}
//				if(cnt == 0) {
//					aiList.add(ar.get(i));
//				}
//			}else {
//				aiList.add(ar.get(i));
//			}
//		}
//		System.out.println("aiList : "+aiList.size());
//		mv.addObject("aiList", ar);
		
		
		
		
		List<AppointmentDTO> ap = doc_dao.getApList(doctor.getDoctor_num(), p_num);
		ModelAndView mv = new ModelAndView("/doctor/appointments.page");
		mv.addObject("apList", ap);
		try {
			if (ap.get(0).getTotal_cnt() > 0) {
				p_num = (ap.get(0).getTotal_cnt() % 10 == 0) ? p_num % 10 : (p_num / 10) + 1;
				mv.addObject("p_num", p_num);
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
		}
		
		DoctorDTO doctorinfo = new DoctorDTO();
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		doctorinfo = doc_service.getDoctorDTO(doctor_num);
		model.addAttribute("doctorinfo", doctorinfo);
		/*
		 * try { Date today = new Date(); SimpleDateFormat format6, format7; format6 =
		 * new SimpleDateFormat("오늘은 yyyy년의 w주차이며 D번째 날입니다."); format7 = new
		 * SimpleDateFormat("오늘은 M월의 w번째 주, d번째 날이며, F번째 E요일입니다.");
		 * System.out.println(format6.format(today));
		 * System.out.println(format7.format(today)); } catch (Exception e) {
		 * e.printStackTrace(); }
		 */

		return mv;
	}

	/* 김다유 & 고현영 : 의사대시보드 */
	@RequestMapping(value = "/doctor_dashboard")
	public ModelAndView doctor_dashboard(Model model, HttpSession session, HttpServletRequest rq) {
		// 의사가 대시보드로 이동할 때 세션에 있는 의사의 pk 번호를 가져온다.
		DoctorDTO doctor = (DoctorDTO) session.getAttribute("doctor");
		System.out.println(doctor.getDepartmentDTO().getDep_name());
		ModelAndView mv = new ModelAndView("/doctor/doctor_dashboard.page");
		AppointmentDTO ap_dto = doc_dao.get_total_cnt(doctor.getDoctor_num());
		List<TreatmentRecordDTO> tr_dto = doc_dao.getAP_num();
		List<AppointmentDTO> apList = doc_dao.get_D_board(doctor.getDoctor_num());
		int cnt = 0;
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String day = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date today = format.parse(day);
			for (int i = 0; i < apList.size(); i++) {
				Date apDay = format.parse(apList.get(i).getAppointment_date());
				// if에 들어간 i의 값은 오늘 보다 큰 날짜의 데이터를 담고있는 List의 index 번호
				if (today.compareTo(apDay) < 0) {
					cnt = i;
					break;
				}
				cnt++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		DoctorDTO doctorinfo = new DoctorDTO();
		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
		doctorinfo = doc_service.getDoctorDTO(doctor_num);
		model.addAttribute("doctorinfo", doctorinfo);

		mv.addObject("allCnt", ap_dto);
		mv.addObject("afterTreat", tr_dto);
		mv.addObject("dashList", apList);
		mv.addObject("cnt", cnt);
		return mv;
	}
}