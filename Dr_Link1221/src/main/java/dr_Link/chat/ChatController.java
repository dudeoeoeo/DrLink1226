package dr_Link.chat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dr_Link.doctorProfile.DoctorDTO;

@Controller
public class ChatController {
	
	@Autowired
	private ChatDAO chatDAO;
	
	@RequestMapping("doctor/chat")
	public String chatPage(HttpServletRequest requset, HttpSession session, Model model) {
		List<DoctorDTO> doctor_list = chatDAO.getDoctorChatList(((DoctorDTO)session.getAttribute("doctor")).getDoctor_num());
		model.addAttribute("doctor_list", doctor_list);
		
		ChatDTO vo = new ChatDTO();
		vo.setSender(((DoctorDTO)session.getAttribute("doctor")).getDoctor_num());
		// 마지막 채팅 이력
		for(int i=0; i<doctor_list.size();i++) {
			vo.setReceiver(doctor_list.get(i).getDoctor_num());
			doctor_list.get(i).setChatDTO(chatDAO.getLastChat(vo));
		}
		
		
		
		return "doctor/chat-doctor.page";
	}
	
	@RequestMapping("doctor/chat.do")
	public String chatRightPage(ChatDTO vo, Model model) {
		List<Integer> list = new ArrayList<Integer>();
		list.add(vo.getSender());
		list.add(vo.getReceiver());
		// 채팅 이력
		List<ChatDTO> result = chatDAO.getChatHistory(list);
		model.addAttribute("result", result);
		
		// 의사 정보
		DoctorDTO doctor = chatDAO.getDoctorInfo(vo.getReceiver());
		model.addAttribute("doctor", doctor);
		
		
		return "doctor/chat-doctor-right";
	}
	
	@ResponseBody
	@RequestMapping("doctor/insertChat.do")
	public String insertChat(ChatDTO vo) {
		try {
			chatDAO.insertChat(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
}
