package dr_Link.booking;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.doctorProfile.DoctorProfileDAO;
import dr_Link.dto.PatientDTO;
import dr_Link.review.ReviewService;

@Controller
public class BookingController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private DoctorProfileDAO doctorProfileDAO;

	@Autowired
	private BookingService bookingService;
	
	//테스트용
	@Autowired
	private BookingDAOTest bookingDAOTest;

	public String dayOfWeek(int dayOfWeek) {
		String day = "";
		switch (dayOfWeek) {
		case 1:
			day = "일요일";
			break;
		case 2:
			day = "월요일";
			break;
		case 3:
			day = "화요일";
			break;
		case 4:
			day = "수요일";
			break;
		case 5:
			day = "목요일";
			break;
		case 6:
			day = "금요일";
			break;
		case 7:
			day = "토요일";
			break;
		}

		return day;
	}

	@RequestMapping("patients/booking")
	public String bookingPage(HttpServletRequest request, Model model) {
		// 의사 프로필 
		DoctorDTO doctor_profile = doctorProfileDAO.doctor_info(Integer.parseInt(request.getParameter("doctor_num")));
  		model.addAttribute("doctor_profile",doctor_profile);
  		
  		//리뷰리스트에 의사번호를 던져 값을 model에 담아 jsp로 전달
  		model.addAttribute("reviewList", reviewService.getReviewList(Integer.parseInt(request.getParameter("doctor_num"))));
		  
		// 날짜
		List<List<String>> week = new ArrayList<List<String>>();
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Calendar cal = Calendar.getInstance();
		List<String> temp1 = new ArrayList<String>();

//		[["2020-12-12","월요일"],,,,]
		if (request.getParameter("week") == null) {
			temp1.add(mSimpleDateFormat.format(cal.getTime()));
			temp1.add(dayOfWeek(cal.get(Calendar.DAY_OF_WEEK)));
			week.add(temp1);
			for (int i = 0; i < 6; i++) {
				List<String> temp2 = new ArrayList<String>();
				cal.add(Calendar.DATE, 1);
				temp2.add(mSimpleDateFormat.format(cal.getTime()));
				temp2.add(dayOfWeek(cal.get(Calendar.DAY_OF_WEEK)));
				week.add(temp2);
			}
		} else {
			int num = Integer.parseInt(request.getParameter("week")) * 7;
			cal.add(Calendar.DATE, num-1);
			for (int i = 0; i < 7; i++) {
				List<String> temp2 = new ArrayList<String>();
				cal.add(Calendar.DATE, 1);
				temp2.add(mSimpleDateFormat.format(cal.getTime()));
				temp2.add(dayOfWeek(cal.get(Calendar.DAY_OF_WEEK)));
				week.add(temp2);
			}
		}
		
		model.addAttribute("week", week);

		return "patients/booking.page";
	}

	@RequestMapping("patients/bookingSave")
	public String bookingSave(HttpServletRequest request, HttpSession session, BookingDTO vo, Model model) {
		PatientDTO temp = (PatientDTO) session.getAttribute("user");
		vo.setPatient_num(temp.getPatient_num());

		try {
			bookingService.addBooking(vo);
		} catch (Exception e) {
		}
		// 의사 프로필 
		DoctorDTO doctor_profile = doctorProfileDAO.doctor_info(vo.getDoctor_num());
  		model.addAttribute("doctor_profile",doctor_profile);		
		model.addAttribute("bookingInfo", vo);

		return "patients/booking-success.page";
	}
	
	@RequestMapping("patients/bookingCheck.do")
	@ResponseBody
	public String bookingCheck(BookingDTO vo, HttpSession session, Model model) {	
		vo.setPatient_num(((PatientDTO)session.getAttribute("user")).getPatient_num());
		String data = "0"; // jsp로 보낼 데이타
		
		//--①이미 예약했는지 체크
		try {
			BookingDTO result = bookingDAOTest.alreadyBookingCheck(vo);
			if(result != null) {
				data = "1";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//--②예약시간까지 1시간 이상 남았는지 체크
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Calendar cal = Calendar.getInstance();
		String today = mSimpleDateFormat.format(cal.getTime());
		boolean flag = true; 
		
		if(today.equals(vo.getAppointment_date())) {
			SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm:ss");
			Date date = new Date();
			int current_time = Integer.parseInt(timeFormat.format(date).split(":")[0]); // 9
			int booking_time = Integer.parseInt(vo.getAppointment_time().split(":")[0]); // 10 10-9=1 false;
			if((booking_time-current_time) <= 1)
				flag = false;
		}
		
		if(flag == false) {
			data = "2";
			return data;
		}

		
		//--③예약인원 체크
		try {
			int cnt = bookingDAOTest.bookingCount(vo);
			if(cnt >= 2) {
				data = "3";
				return data;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return data;				
	}

}
