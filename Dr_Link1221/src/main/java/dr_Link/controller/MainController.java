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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dr_Link.doctor.DoctorDaoImp;
import dr_Link.doctorProfile.DoctorDTO;
import dr_Link.dto.Hospital_boardDTO;
import dr_Link.dto.PageDTO;
import dr_Link.dto.PatientDTO;
import dr_Link.main.MainDaoInter;
import dr_Link.patient.PatientDaoInter;
import dr_Link.patient.PatientServiceImpl;

@Controller
public class MainController {
	
	@Autowired
	private MainDaoInter dao;

	@Autowired
	private PatientDaoInter patientDAO;
	
	@Autowired
	private DoctorDaoImp doctorDaoInter;

	@Autowired
	private PatientServiceImpl service;

	@RequestMapping(value = { "/", "index" })
	public String indexRq() {
		System.out.println("index 요청: ");
		return "main.page";
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

	@RequestMapping(value = "loginCheck")
	public String loginCheck(PatientDTO dto, HttpSession session, Model model) {
		PatientDTO result = patientDAO.loginCheckPatient(dto);
		if (result == null) {
			model.addAttribute("message", "<p style='color:red'> 아이디나 비밀번호가 일치하지 않습니다. </p>");
			return "login.page";
		} else {
			session.setAttribute("user", result);
			session.setMaxInactiveInterval(30*60);
		}
		return "redirect:/";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");

		return "redirect:/";
	}

	// 아이디 찾기
	@RequestMapping(value = "find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md)
			throws Exception {
		md.addAttribute("id", service.find_id(response, email));
		return "find-id";
	}

	// 아이디 중복 검사(AJAX)
	@RequestMapping(value = "check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("p_id") String p_id, HttpServletResponse response) throws Exception {
		System.out.println("===> Mybatis 아이디 중복 검사(AJAX) 실행 성공인가?");
		service.check_id(p_id, response);
	}

	// id 중복 체크 컨트롤러 필요없을 듯 하다
//	@RequestMapping(value = "idCheck.do", method = RequestMethod.GET)
//	@ResponseBody
//	public int idCheck(@RequestParam("p_id") String p_id) {
//		System.out.println("===> Mybatis idCheck() 실행 성공인가?");
//		return PDaoInter.idCheck(p_id);
//	}

	// 비밀번호 찾기
	@RequestMapping(value = "find_pw.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute PatientDTO dto, HttpServletResponse response) throws Exception {
		System.out.println("===> Mybatis 비밀번호 찾기 실행 성공인가?");
		service.find_pw(response, dto);
	}

//	@RequestMapping(value = "userInsert")
//	public String userInsert(PatientDTO dto) {
//		System.out.println("===> dao로 가자!");
//		PDaoInter.insertPatient(dto);
//		System.out.println("===> Mybatis add() 실행 성공인가?");
//		return "login";
//	}

	@RequestMapping(value = "userInsert", method = RequestMethod.POST)
	public ModelAndView userInsert(PatientDTO dto, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:login");

		String r_path = session.getServletContext().getRealPath("/");
		System.out.println("r_path :" + r_path);
		String img_path = "C:\\Users\\koko\\git\\Dr_Link_1222\\Dr_Link1221\\src\\main\\webapp\\resources\\patient\\profileImg\\";
		System.out.println("img_path :" + img_path);
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path);
		MultipartFile p_photo = dto.getFile();
		String oriFn = p_photo.getOriginalFilename();

		path.append(oriFn);
		dto.setP_photo(oriFn);
		System.out.println("path = r_path + img_path:" + path);

		// 위에 3줄 이상해서 내가 추가해본다.

		StringBuffer newpath = new StringBuffer();
		newpath.append(img_path);
		newpath.append(oriFn);

		File f = new File(newpath.toString()); // ���� �̹����� ����� ���

		try {
			p_photo.transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mav.addObject("imgName", oriFn);

//		File f = new File(path.toString()); // ���� �̹����� ����� ���
//		try {
//			p_photo.transferTo(f); // �������� transferTo�� ȣ���ؼ� �̹����� ������ҿ� ���� 
//		} catch (IllegalStateException | IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		mav.addObject("imgName",oriFn);

//		PDaoInter.addTvo(dto);

		System.out.println("===> dao로 가자!");
		patientDAO.insertPatient(dto);
		System.out.println("===> Mybatis add() 실행 성공인가?");
		return mav;

//		return "login";
	}

	@RequestMapping(value = "adminquestion")
	public String aq() {
		return "admin/question";
	}

//	@RequestMapping(value = "/search")
//	public String searchPage() {
//		List<DoctorDTO> list=doctorDaoInter.getDoctorList();
//		
//		return "search";
//	}
	
	@RequestMapping(value = "notice")
	public ModelAndView getH_BoardList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("notice.page");
		List<Hospital_boardDTO> li;
		// dao.getAll(); 나중에 수정해야 할 사항
		int pageAll = dao.getBoardCnt();
		pageAll = (pageAll%10 == 0) ? pageAll%10 : (pageAll/10)+1;
		try {
			if(request.getParameter("d_page") != null) {
				li = dao.getAllHospitalBoards(Integer.parseInt(request.getParameter("d_page")));
			} else {
				li = dao.getAllHospitalBoards();
			}
			mv.addObject("h_boardList",li);
			mv.addObject("page_num", pageAll);
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	// search페이지 부분

		@RequestMapping(value="/search")
		public String listSearch(PageDTO svo, Model model
				, @RequestParam(value="nowPage", required=false , 
				defaultValue="1") String nowPage
				, @RequestParam(value="cntPerPage", required=false , 
				defaultValue="5") String cntPerPage, HttpServletRequest request){
			System.out.println("search 요청");
			List<String> d_genderList=null;
			List<String> dep_numList=null;
			Map<String,List<String>> map = new HashMap<String, List<String>>();
			String [] temp=null;
			
			try {
				System.out.println("try");
				if(request.getParameter("d_gender") != null) {
					temp = request.getParameterValues("d_gender");
					System.out.println("if문 "+ request.getParameterValues("d_gender"));
					
					d_genderList = Arrays.asList(temp);
					map.put("d_genderList", d_genderList);
					for(String i : d_genderList) {
						System.out.println("for문 안: "+i);
					}
				}  
				if (request.getParameter("dep_num") != null ) {
					temp = request.getParameterValues("dep_num");
					dep_numList = Arrays.asList(temp);
					map.put("dep_numList", dep_numList);
					for(String i : dep_numList) {
						System.out.println("else if for: " + i);
					}
				}
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
			
			int total = doctorDaoInter.getTotalCount();
			
			if(svo.getSearchType() == null) {
				svo = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			}else {
				System.out.println("searchValue:"+svo.getSearchValue());
				svo = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),svo.getSearchType(),svo.getSearchValue());
			}
			//System.out.println("Start :"+svo.getStart());
			//System.out.println("End :"+svo.getEnd());
			
			// pagingDTO 를 날려서 받은 값 
			List<DoctorDTO> list = doctorDaoInter.getList(svo);
			
			if(!map.isEmpty()) {
				System.out.println("if문 map");
				List<DoctorDTO> li = doctorDaoInter.getList(map);
				if(li.size() > 0) {
					for(DoctorDTO d : li) {
						System.out.println("for문... "+ d.getD_gender());
					}
				}
			}
			for(DoctorDTO e : list) {
			}

			// 진료분야 출력
//			List<String[]> m = new ArrayList<String[]>();
//			String [] d_field = null;
//			for (int i = 0; i<list.size();i++) {
//				for(int j = 0; j<list.get(i).getD_field().length;j++) {
//					if(list.get(i).getD_field()!=null) {
//					 d_field = list.get(i).getD_field();
//					 m.add(d_field);
//					 }   
//				} 	
//			}
			
			
//			model.addAttribute("m",m);
			model.addAttribute("paging", svo);
			model.addAttribute("list",list );
			return "search.page";
		}
		

}
