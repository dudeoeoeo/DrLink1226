package dr_Link.review;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dr_Link.dto.PatientDTO;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
		
	@RequestMapping("addReview.do")
	public String addReview(Doc_ReviewDTO vo, HttpSession session) {
		vo.setPatient_num(((PatientDTO)session.getAttribute("user")).getPatient_num());
		reviewService.addReview(vo);
		
		return "redirect:/doctor_profile?doctor_num="+vo.getDoctor_num();
	}
	
	@RequestMapping(value = "delete_review", method = RequestMethod.POST)
	@ResponseBody
	public Object delete_review(@RequestBody Doc_ReviewDTO review, HttpSession session, HttpServletRequest rq) {

		int result = 0;
		int doctor_num = review.getDoctor_num();
		System.out.println(review.getReview_handling());
		try {
			String handle_repl = review.getReview_handling();
			if (handle_repl.equals("수정")) {
				result = reviewService.updateReview(review);
			} else {
				result = reviewService.deleteReview(review);
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

		HashMap<String, String> map = new HashMap<String, String>();
		if (result > 0) {
			map.put("success", "작업이 완료되었습니다.");
			map.put("url", "http://localhost:8080/Dr_Link1221/doctor_profile?doctor_num=" + doctor_num);
		} else
			map.put("err", "작업이 서버에 오류가 있어 수행되지 않았습니다.");
		System.out.println("map: " + map.get("url"));
		return map;
	}
}

