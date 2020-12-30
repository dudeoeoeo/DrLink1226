package dr_Link.doctorProfile;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import dr_Link.review.ReviewService;

@Controller
public class DoctorProfileController {

	@Autowired
	private DoctorProfileDAO doctorProfileDAO;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "doctor_profile")
	public String doctor_profile(HttpServletRequest request, DoctorDTO vo, Model model, ModelMap modelMap) {
	    
	  try {
		  Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);  
		  DoctorDTO doctor_profile = new DoctorDTO();  
	 //의사번호를 던져서 가져온 값을 doctor_profile에 저장 후 model 에 담아 jsp 전송
		  if( redirectMap  != null ){
			  doctor_profile = doctorProfileDAO.doctor_info((int)redirectMap.get("doctor_num"));  // 오브젝트 타입이라 캐스팅해줌
		  } else if (request.getParameter("doctor_num") != null) {
			  doctor_profile = doctorProfileDAO.doctor_info(Integer.parseInt(request.getParameter("doctor_num")));
		  }
	  
	  model.addAttribute("doctor_profile",doctor_profile);
	  
	  //db에서 가져온 값이 "a,b,c,"로 되어 있어서 split 후 배열에 담아 model 로 보내는 처리
	  List<String[]> m = new ArrayList<String[]>();
	  String [] d_graduation = doctor_profile.getD_graduation().split(",");
	  String [] d_career = doctor_profile.getD_career().split(",");
	  String [] d_content = null;
	  String [] d_field = null;
	  m.add(d_graduation);
	  m.add(d_career);	  
	  if(doctor_profile.getD_content()!=null) {
		d_content = doctor_profile.getD_content().split(",");
		m.add(d_content);
	  }
	  if(doctor_profile.getD_field()!=null) {
	  	d_field = doctor_profile.getD_field().split(",");
		m.add(d_field);
	  }	 
	  model.addAttribute("m",m);
	  
	  //리뷰리스트에 의사번호를 던져 값을 model에 담아 jsp로 전달
	  model.addAttribute("reviewList", reviewService.getReviewList(Integer.parseInt(request.getParameter("doctor_num"))));
	  
	  System.out.println("의사상세프로필 이동");
	  
	  } catch (NullPointerException e) {
	  
	  } catch (Exception e) {
		  e.printStackTrace();
	  }
		 
		return "doctor_profile.page";
	}
	

	

}
