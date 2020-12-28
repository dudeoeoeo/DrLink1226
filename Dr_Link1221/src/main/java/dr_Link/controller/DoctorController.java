package dr_Link.controller;

import java.util.ArrayList;
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

import dr_Link.doctor.DoctorDaoInter;
import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.DrLinkDTO;
import dr_Link.dto.MedicineDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.prescription.PrescriptionDTO;
import dr_Link.prescription.PrescriptionDaoInter;
import dr_Link.prescription.PrescriptionService;


@Controller
@RequestMapping(value = "/doctor")
public class DoctorController {

	@Autowired	
	private PrescriptionService pre_service;

	@Autowired	
	private DoctorDaoInter doc_dao;
	
	@RequestMapping(value = "{step}")
	public String accessAnyFiles(@PathVariable String step) {
		System.out.println("doctor 컨트롤러 step 실행");
		return "/doctor/"+step;
	}
	
	@RequestMapping(value = "main")
	public String main() {
		System.out.println("doctor 컨트롤러 step 실행");
		return "redirect:main";
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
		
		/* 로그인해서 session에 값이 있다고 가정하고 테스트 */

		int doctor_num = ((DoctorDTO) session.getAttribute("doctor")).getDoctor_num();
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
		System.out.println(pre_vo.getDsg()+pre_vo.getQty()+pre_vo.getTdate());
		/*트랜잭션 처리 한 serviece 메소드 호출, insert, select 동시 작업*/
		PrescriptionDTO prescription = pre_service.end_prescription(pre_vo);

		//약품 이름을 띄우기 위해 들어온 약품번호를 배열에 담아 한개씩 select
		List<MedicineDTO> medi_detail = pre_service.medicine_detail_info(prescription.getMedicine_num());
		DrLinkDTO drlinkinfo = pre_service.drLink_info(drlinkVo); 
		model.addAttribute("prescription",prescription);
		model.addAttribute("medi_detail",medi_detail);
		model.addAttribute("drlinkinfo",drlinkinfo);
		
		return "/doctor/end_prescription";
		
	}

	
	/*김다유 : 의사 프로필 수정 페이지*/
	@RequestMapping(value = "/doctor_profile_settings")
	public String profile_settings(DoctorDTO vo, Model model) {
		DoctorDTO doctorinfo = pre_service.doctor_info(2);
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
		return "/doctor/doctor_profile_settings";
	}
	
	
	/* 김다유 : 의사 프로필세팅 완료 후 페이지 이동 */
	@RequestMapping(value = "/setting_ok" )
	public String setting_ok(DoctorDTO vo, HttpServletRequest req, HttpServletResponse resp,Model model){
		vo.setD_pwd(req.getParameter("chg_pwd"));
		doc_dao.doctor_profile_update(vo);
		return "/doctor/doctor-dashboard";
		}
	
	
}
