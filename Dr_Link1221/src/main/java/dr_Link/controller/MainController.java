package dr_Link.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import dr_Link.doctor.DoctorDaoInter;
import dr_Link.doctor.DoctorServiceInter;
import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.doctorProfile.DoctorProfileDAO;
import dr_Link.dto.AiRecordDTO;
import dr_Link.dto.AiResultDTO;
import dr_Link.dto.Hospital_boardDTO;
import dr_Link.dto.NewsDTO;
import dr_Link.dto.NewsReplDTO;
import dr_Link.dto.PageDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.main.MainDaoInter;
import dr_Link.patient.PatientDaoInter;
import dr_Link.patient.PatientServiceInter;
import dr_Link.review.Doc_ReviewDTO;

@Controller
public class MainController {

	@Autowired
	private MainDaoInter main_dao;

	@Autowired
	private PatientServiceInter service;
	@Autowired
	private PatientDaoInter patientDAO;

	@Autowired
	private DoctorDaoInter doctor_dao;
	@Autowired
	private DoctorProfileDAO doctorProfileDAO;
	@Autowired
	private DoctorServiceInter doctor_service;
	

	@RequestMapping(value = { "/", "index" })
	public String indexRq() {
		System.out.println("index 요청: ");
		return "redirect:/main";
	}

	@RequestMapping(value = "{step}")
	public String AI_page(@PathVariable String step) {
		System.out.println("main 컨트롤러 요청: " + step);
		return step + ".page";
	}

	@RequestMapping(value = "AI_medical_{step}")
	public String accessAnyFiles(@PathVariable String step) {
		return "AI_medical_" + step + ".page";
	}

	/* 김다유 : */
	@RequestMapping(value = "main")
	public String main(Model model, HttpServletRequest request, HttpSession session) {
		

		List<NewsDTO> newsList = main_dao.getAllNewsBoards();
		for(NewsDTO n : newsList) {
		}
		model.addAttribute("newsList", newsList);

		Map<String, List<String>> map = new HashMap<String, List<String>>();
		List<DoctorDTO> list = doctorProfileDAO.getList(map);
		model.addAttribute("list", list);

		List<Hospital_boardDTO> h_boardList = main_dao.getAllHospitalBoards();
		for (int i=0;i<h_boardList.size();i++) {
			h_boardList.get(i).setHospital_regdate(h_boardList.get(i).getHospital_regdate().substring(0,11));
		}

		model.addAttribute("h_boardList", h_boardList);
		return "main.page";
	}
	//환자 로그인 체크
		@RequestMapping(value = "loginCheck")
		public String loginfCheck(HttpSession session, HttpServletRequest request, 
				@RequestHeader("User-Agent") String userAgent, PatientDTO dto, Model model) {
			System.out.println("===> loginCheck");
			session.removeAttribute("doctor");
			PatientDTO result = patientDAO.loginCheckPatient(dto);
			PatientDTO appointment_chk = null;
			String p_url = "";
			try {

				appointment_chk = patientDAO.appointment_chk(dto);
				if(appointment_chk != null) {
					session.setAttribute("appointment", appointment_chk);
				}
				
				if(result == null) {
					System.out.println("아이디나 비밀번호가 일치하지 않습니다.");
					model.addAttribute("message", "<p style='color:red'> 아이디나 비밀번호가 일치하지 않습니다. </p>");
					p_url = "patient_login.page";
				} else if(result.getP_retire_date() != null) {
					model.addAttribute("message", "<p style='color:red'> 이미 탈퇴한 계정입니다. </p>");
					p_url = "patient_login.page";
				} else if (result != null) {
					p_url = "main.page";
					Object requestSession = session.getAttribute("requestSession");
					if(requestSession==null) {
						session.setAttribute("user", result);
						return "redirect:/";
					}else if(requestSession.toString().contains("doctor_profile")) {
						session.setAttribute("user", result);
						return "redirect:/search";
					}else {
						session.setAttribute("user", result);
						return "redirect:"+requestSession.toString();
					}
				}
				
			} catch (NullPointerException e) {
				e.printStackTrace();
			} 
			return p_url;
		}
	

	//환자 의사 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {        
		session.invalidate(); // 세션 전체를 날려버림
//		session.removeAttribute("user");
//		session.removeAttribute("doctor");

		return "redirect:/main.page";
	}
	
	//의사 로그인 체크
	@RequestMapping(value = "doctorloginCheck")
	public String drloginCheck(DoctorDTO dto, HttpSession session, Model model) {
		System.out.println("===> dao로 가자!");
		session.removeAttribute("user");
		DoctorDTO result = doctor_dao.dr_loginCheck(dto);
		if(result == null) {
			System.out.println("아이디나 비밀번호가 일치하지 않습니다.");
			model.addAttribute("message", "<p style='color:red'> 아이디나 비밀번호가 일치하지 않습니다. </p>");
			return "doctor_login.page";
		} else if(result.getD_retire_date() != null) {
			model.addAttribute("message", "<p style='color:red'> 이미 탈퇴한 계정입니다. </p>");
			return "doctor_login.page";
		} else {
			Object requestSession = session.getAttribute("requestSession");
			if(requestSession==null) {
			session.setAttribute("doctor", result);
			return "redirect:/";
			}else if(requestSession.toString().contains("doctor_profile")) {
				session.setAttribute("doctor", result);
				return "redirect:/search";
			}else {
				System.out.println(requestSession.toString()+"requestSession.toString()");
				session.setAttribute("doctor", result);
				return "redirect:"+requestSession.toString();
			}
		}
	}
	
	// 환자 아이디 찾기
	@RequestMapping(value = "find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception {
		md.addAttribute("id", service.find_id(response, email));
		return "patient_find_id.page";
	}
	
	// 의사 아이디 찾기
	@RequestMapping(value = "doctor_find_id.do", method = RequestMethod.POST)
	public String doctor_find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
		md.addAttribute("id", doctor_service.doctor_find_id(response, email));
		return "doctor_find-id.page";
	}

	// 의사 인증번호 유효성검사
	@RequestMapping(value = "verifyCheck", method = RequestMethod.POST)
	public String verifyCheck(@RequestParam("d_verifynum") String d_verifynum, HttpServletResponse response, Model model) throws Exception{
		System.out.println("===> Mybatis 의사 인증번호 유효성검사 실행 성공인가?");
		
		int result = doctor_dao.verifyCheck(d_verifynum);
		if (result == 0) {
			System.out.println("인증번호가 일치하지 않습니다.");
			model.addAttribute("message", "<p style='color:red'> 인증번호가 일치하지 않습니다. </p>");
			return "doctor_verify.page";
		}
		return "doctor_register.page";
	}

	// 환자 아이디 중복 검사(AJAX)
	@RequestMapping(value = "check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("p_id") String p_id, HttpServletResponse response) throws Exception {
		System.out.println("===> Mybatis 아이디 중복 검사(AJAX) 실행 성공인가?");
		service.check_id(p_id, response);
	}

	// 환자 이메일 중복 검사(AJAX)
	@RequestMapping(value = "check_email.do", method = RequestMethod.POST)
	public void check_email(@RequestParam("p_email") String p_email, HttpServletResponse response) throws Exception {
		System.out.println("===> Mybatis 이메일 중복 검사(AJAX) 실행 성공인가?");
		service.check_email(p_email, response);
	}

	// 환자 비밀번호 찾기
	@RequestMapping(value = "find_pw.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute PatientDTO dto, HttpServletResponse response) throws Exception {
		System.out.println("===> Mybatis 비밀번호 찾기 실행 성공인가?");
		service.find_pw(response, dto);
	}

	//환자 회원가입
	@RequestMapping(value = "patientInsert", method = RequestMethod.POST)
	public ModelAndView patientInsert(PatientDTO dto, HttpServletRequest request, HttpSession session) {
		System.out.println("회원가입 컨트롤러에 왔는가?");
		ModelAndView mav = new ModelAndView("redirect:login");
		String r_path = session.getServletContext().getRealPath("resources/patient/profileImg")+"\\";
		System.out.println("r_path :" + r_path);
		//String img_path = "\\resources\\patient\\profileImg\\";
		//System.out.println("img_path :" + img_path);
		//StringBuffer path = new StringBuffer();
		//path.append(r_path).append(img_path);
		//System.out.println("실제 path: " + path);
		MultipartFile file = dto.getFile();
		String oriFn = file.getOriginalFilename();

		//path.append(oriFn);
		dto.setP_photo(oriFn);
		System.out.println("이미지 저장되는 경로"+r_path);

		// 위에 3줄 이상해서 내가 추가해본다.

		StringBuffer newpath = new StringBuffer();
		newpath.append(r_path);
		//newpath.append(img_path);
		newpath.append(oriFn);
		System.out.println("newpath"+ newpath);

		File f = new File(newpath.toString()); 

		try {
			file.transferTo(f);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		mav.addObject("imgName", oriFn);
		System.out.println("===> dao로 가자!");
		patientDAO.insertPatient(dto);
		System.out.println("===> Mybatis add() 실행 성공인가?");
		return mav;
	}
	
	//의사 회원가입 
	@RequestMapping(value = "doctorInsert", method = RequestMethod.POST)
	public ModelAndView doctorInsert(DoctorDTO dto, HttpServletRequest request, HttpSession session) {
		System.out.println("doctorInsert 요청");
		ModelAndView mav = new ModelAndView("redirect:login");

		String r_path = session.getServletContext().getRealPath("resources/doctor/doctorImg")+"\\";
		System.out.println("r_path :"+r_path);
		//String img_path ="C:\\springsts3\\DrLink1226\\Dr_Link1221\\src\\main\\webapp\\resources\\doctor\\doctorImg\\";
		//System.out.println("img_path :"+img_path);
		//StringBuffer path = new StringBuffer();
		//path.append(r_path).append(img_path);
		MultipartFile file =dto.getFile();
		String oriFn = file.getOriginalFilename(); // 여기에 회원 아이디와 동일 파일 이름으로 저장하자
		
		//path.append(oriFn);
		dto.setD_photo(oriFn);
		System.out.println("이미지 저장되는 경로"+r_path);
		
		//위에 3줄 이상해서 내가 추가해본다.

		StringBuffer newpath = new StringBuffer();
		newpath.append(r_path);
		//newpath.append(img_path);
		newpath.append(oriFn);
		
		File f = new File(newpath.toString()); 
		try {
			file.transferTo(f); 
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.addObject("imgName",oriFn);

		System.out.println("===> dao로 가자!");
		doctor_dao.insertDoctor(dto);
		System.out.println("===> Mybatis add() 실행 성공인가?");
		return mav;
	}

	// 의사 아이디 중복 검사(AJAX)
	@RequestMapping(value = "doctor_check_id.do", method = RequestMethod.POST)
	public void doctor_check_id(@RequestParam("d_id") String d_id, HttpServletResponse response) throws Exception{
		System.out.println("===> Mybatis 아이디 중복 검사(AJAX) 실행 성공인가?");
		doctor_service.doctor_check_id(d_id, response);
	}

	// 의사 이메일 중복 검사(AJAX) 1228
	@RequestMapping(value = "doctor_check_email.do", method = RequestMethod.POST)
	public void doctor_check_email(@RequestParam("d_email") String d_email, HttpServletResponse response) throws Exception {
		System.out.println("===> Mybatis 이메일 중복 검사(AJAX) 실행 성공인가?");
		doctor_service.doctor_check_email(d_email, response);
	}
	
	// 의사 비밀번호 찾기
	@RequestMapping(value = "doctor_find_pw.do", method = RequestMethod.POST)
	public void doctor_find_pw(@ModelAttribute DoctorDTO dto, HttpServletResponse response) throws Exception{
		System.out.println("===> Mybatis 비밀번호 찾기 실행 성공인가?");
		doctor_service.doctor_find_pw(response, dto);
	}

	@RequestMapping(value = "adminquestion")
	public String aq() {
		return "admin/question";
	}
	
	@RequestMapping(value = "notice")
	public ModelAndView getH_BoardList(HttpServletRequest request, HttpSession session) {

		System.out.println("공지사항 실행");
		ModelAndView mv = new ModelAndView("notice.page");
		List<Hospital_boardDTO> li = new ArrayList<Hospital_boardDTO>();
		// dao.getAll(); 나중에 수정해야 할 사항
		double pageCnt = main_dao.getBoardCnt();
		int pageAll = (int)Math.ceil((pageCnt / 10));
		try {
			if (request.getParameter("d_page") != null) {
				li = main_dao.getAllHospitalBoards(Integer.parseInt(request.getParameter("d_page")));
			} else {
				int b_num = 1;
				li = main_dao.getAllHospitalBoards(b_num);
			}
			for (Hospital_boardDTO l : li) {
				System.out.println("b_num: "+l.getHospital_board_num());
			}
			
			mv.addObject("h_boardList", li);
			mv.addObject("page_num", pageAll);
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		for (int i=0;i<li.size();i++) {
			li.get(i).setHospital_regdate(li.get(i).getHospital_regdate().substring(0,11));
		}
		return mv;
	}

	// search페이지 부분
	@RequestMapping(value = "/search")
	public String listSearch(PageDTO svo, Model model, HttpServletRequest request) {
		System.out.println("search 요청");
		List<String> d_genderList = new ArrayList<String>();
		List<String> dep_numList = new ArrayList<String>();
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		String[] temp = null;

		try {
			System.out.println("try");
			if (request.getParameter("d_gender") != null) {
				temp = request.getParameterValues("d_gender");

				d_genderList = Arrays.asList(temp);
				map.put("d_genderList", d_genderList);
				for (String i : d_genderList) {
					System.out.println("for문 안: " + i);
				}
			}
			if (request.getParameter("dep_num") != null) {
				temp = request.getParameterValues("dep_num");
				dep_numList = Arrays.asList(temp);
				map.put("dep_numList", dep_numList);
				for (String i : dep_numList) {
					System.out.println("else if for: " + i);
				}
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

		List<DoctorDTO> list = doctorProfileDAO.getList(map);
		List<DoctorDTO> dlist = new ArrayList<DoctorDTO>();
		

		if (request.getParameter("d_page") != null && !request.getParameter("d_page").equals("1")) {
			int p_num = Integer.parseInt(request.getParameter("d_page"))-1;
			int start = 0+(5*p_num);
			int end = 5+(5*p_num);
			for(;start<list.size();start++) {
				if(start==end)
					break;
				dlist.add(list.get(start));
			}
			
		} else {
			int cnt= 0;
			for(int i=0;i<list.size();i++,cnt++) {
				dlist.add(list.get(i));
				if(cnt==4)
					break;
			}
		}
		

		int page_num = (int)Math.floor((list.size() / 5))+1;
		System.out.println(list.size());
		System.out.println(list.size() / 5);
		System.out.println("page_num: "+page_num);
		
		model.addAttribute("d_page", request.getParameter("d_page"));
		model.addAttribute("d_genderList", d_genderList);
		model.addAttribute("dep_numList", dep_numList);
		model.addAttribute("p_num", page_num);
		model.addAttribute("list", dlist);

		return "search.page";
	}

	@RequestMapping(value = "notice_detail")
	public ModelAndView getH_BoardDetail(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("notice_detail.page");
		int h_b_num = Integer.parseInt(request.getParameter("b_num"));
		main_dao.plusWatchCnt(h_b_num);
		Hospital_boardDTO dto = main_dao.getDetailHospitalBoard(h_b_num);
		try {
			dto.setHospital_content(dto.getHospital_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
		} catch (NullPointerException e) {
		}

		mv.addObject("h_board", dto);
		return mv;
	}

	@RequestMapping(value = "health-blog")
	public ModelAndView getHealth_Board(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("health-blog.page");
		List<NewsDTO> nt = new ArrayList<NewsDTO>();
		try {
			if (request.getParameter("d_page") != null) {
				int p_num = Integer.parseInt(request.getParameter("d_page"));
				nt = main_dao.getNewsPage(p_num);
			} else {
				nt = main_dao.getAllNewsBoards();
			}
			for (int i = 0; i < nt.size(); i++) {
				String regdate = nt.get(i).getNews_regdate().substring(0, 10).replace("-", ".");
				nt.get(i).setNews_regdate(regdate);
			}
			double pageCnt = (nt.size() > 0) ? nt.get(0).getGetCnt() : 0;
			int page_num = (int)Math.ceil((pageCnt / 10));
			mv.addObject("newsList", nt);
			mv.addObject("p_num", page_num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mv;
	}

	@RequestMapping(value = "health-blog-detail")
	public ModelAndView getHealth_BoardDetail(HttpServletRequest request, NewsReplDTO news) {
		ModelAndView mv = new ModelAndView("health-blog-detail.page");
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		try {
			main_dao.news_plus_cnt(b_num);
			NewsDTO dto = main_dao.getNewsBoardsDetail(b_num);
			List<NewsReplDTO> nr = main_dao.getNewsRepl(b_num);
			dto.setNews_content(dto.getNews_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
			mv.addObject("n_board", dto);
			mv.addObject("n_repl", nr);
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "leave_comment", method = RequestMethod.POST)
	@ResponseBody
	public Object comments_repl(@RequestBody NewsReplDTO nr, HttpSession session, HttpServletRequest rq) {

		int result = 0;
		int b_num = nr.getNews_board_num();
		try {
			String handle_repl = nr.getRepl_handling();
			if (handle_repl.equals("댓글")) {
				result = main_dao.insert_repl(nr);
			} else if (handle_repl.equals("답글")) {
				nr.setN_comments_num(nr.getNews_reply_num());
				result = main_dao.insert_repl(nr);
			} else if (handle_repl.equals("수정")) {
				result = main_dao.update_repl(nr);
			} else {
				result = main_dao.delete_repl(nr);
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

		HashMap<String, String> map = new HashMap<String, String>();
		if (result > 0) {
			map.put("success", "작업이 완료되었습니다.");
			map.put("url", "http://localhost:8080/Dr_Link1221/health-blog-detail?b_num=" + b_num);
		} else
			map.put("err", "작업이 서버에 오류가 있어 수행되지 않았습니다.");
		System.out.println("map: " + map.get("url"));
		return map;
	}
	

	   //ai 진료
	   @ResponseBody
	   @RequestMapping(value = "aiTest")
	   public String aiTest(@RequestParam("images") MultipartFile file, HttpSession session) {
	      String oriFn = "";
	      if(file != null) {
	         String r_path = "\\\\192.168.0.7\\share\\aiTest\\"; //"Z:\\aiTest\\";  \\192.168.0.8\share\aiTest
	         String ai_path = session.getServletContext().getRealPath("resources/aiTest")+"\\";
	         oriFn = file.getOriginalFilename();
	         
	         if(oriFn != null && oriFn != "") {
	        	System.out.println("들어온 사진 이름 : " + oriFn);
	            StringBuffer newpath = new StringBuffer();
	            newpath.append(r_path);
	            newpath.append(oriFn);
	            StringBuffer aipath = new StringBuffer();
	            newpath.append(ai_path);
	            newpath.append(oriFn);
	            File f = new File(newpath.toString());
	            File g = new File(aipath.toString());
	            try {
	               file.transferTo(f);
	               file.transferTo(g);
	            } catch (IllegalStateException e) {
	               e.printStackTrace();
	            } catch (IOException e) {
	               e.printStackTrace();
	            }
	         }
	      }
	      return oriFn;
	   }


	   @RequestMapping(value = "aiSuccess")
	   public ModelAndView aiSuccess(HttpServletRequest rq, RedirectAttributes re, HttpSession session, AiRecordDTO dto) {
	       ModelAndView mv = new ModelAndView("redirect:aiTestSuccess");
	       try {
			   if(session.getAttribute("user") != null) {
				   PatientDTO p_num = (PatientDTO) session.getAttribute("user");
			       dto.setPatient_num(p_num.getPatient_num());
			   } else {
				   DoctorDTO d_num = (DoctorDTO) session.getAttribute("doctor");
			       dto.setDoctor_num(d_num.getDoctor_num());
			   }
			   dto.setDep_num(Integer.parseInt(rq.getParameter("DP")));
		       dto.setAi_symptom(rq.getParameter("disease"));
		       dto.setSymptom_photo(rq.getParameter("IMG"));
		       patientDAO.insertAiRecord(dto);
		       re.addFlashAttribute("predict", rq.getParameter("result"));
		       re.addFlashAttribute("aiDTO", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	      return mv;
	   }
	   
	   @RequestMapping(value = "aiTestSuccess")
	   public ModelAndView aiTestSuccess(HttpServletRequest rq, RedirectAttributes re, HttpSession session) {
	      ModelAndView mv = new ModelAndView("aiTestSuccess.page");
	      Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(rq);
	      try {
	         if(redirectMap.get("predict") != null) {
	        	 AiRecordDTO at = (AiRecordDTO) redirectMap.get("aiDTO");
	        	 AiResultDTO ai_result = patientDAO.getAiResultDTO(at.getAi_symptom());
	        	 mv.addObject("aiDTO", redirectMap.get("aiDTO"));
	        	 mv.addObject("aiResult", ai_result);
	        	 mv.addObject("predict", redirectMap.get("predict"));
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return mv;
	   }
	   
//       re.addFlashAttribute("predict", rq.getParameter("result"));
//       re.addFlashAttribute("disease", rq.getParameter("disease"));
//       re.addFlashAttribute("IMG", rq.getParameter("IMG"));  
//       mv.addObject("predict", redirectMap.get("predict"));
//       mv.addObject("disease", redirectMap.get("disease"));
//       mv.addObject("IMG", redirectMap.get("IMG"));
}
