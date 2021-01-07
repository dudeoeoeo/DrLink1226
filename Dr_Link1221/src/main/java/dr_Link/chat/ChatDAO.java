package dr_Link.chat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dr_Link.doctorProfile.DoctorDTO;

@Repository("chatDAO")
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	List<DoctorDTO> getDoctorChatList(int doctor_num) {		
		return ss.selectList("chat.getDoctorChatList", doctor_num);
	}
	
	List<ChatDTO> getChatHistory(List<Integer> map){		
		return ss.selectList("chat.getChatHistory", map);
	}
	
	DoctorDTO getDoctorInfo(int doctor_num) {
		return ss.selectOne("chat.getDoctorInfo", doctor_num);
	}
	
	ChatDTO getLastChat(ChatDTO vo) {
		return ss.selectOne("chat.lastChat", vo);
	}
	
	void insertChat(ChatDTO vo) {
		ss.insert("chat.insertChat", vo);
	}

}
