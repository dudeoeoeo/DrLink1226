package dr_Link.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dr_Link.dto.PatientDTO;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
		
	@RequestMapping("addReview.do")
	public String addReview(Doc_ReviewDTO vo, HttpSession session) {
		vo.setPatient_num(((PatientDTO)session.getAttribute("user")).getPatient_num());
		reviewService.addReview(vo);
		
		return "redirect:/doctor-profile?doctor_num="+vo.getDoctor_num();
	}
}

