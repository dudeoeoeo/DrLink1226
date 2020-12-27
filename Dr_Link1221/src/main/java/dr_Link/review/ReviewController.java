package dr_Link.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
		
	@RequestMapping("addReview.do")
	public String addReview(Doc_ReviewDTO vo) {
		reviewService.addReview(vo);
		
		return "redirect:/doctor-profile?doctor_num="+vo.getDoctor_num();
	}
}
