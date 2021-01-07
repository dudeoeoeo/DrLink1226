package dr_Link.chat;

import java.util.HashMap;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import dr_Link.doctorProfile.DoctorDTO;

/*@Component*/
@RequestMapping("doctor/chat")
public class EchoHandler extends TextWebSocketHandler {
	private HashMap<Integer, WebSocketSession> sessionList = new HashMap<Integer, WebSocketSession>();

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
// [의사번호 : 웹소켓 세션] 저장
		sessionList.put(((DoctorDTO)session.getAttributes().get("doctor")).getDoctor_num(), session);
		logger.info("{} 연결됨", ((DoctorDTO)session.getAttributes().get("doctor")).getD_name());
	}

	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("{}로 부터 {} 받음", ((DoctorDTO)session.getAttributes().get("doctor")).getD_name(), message.getPayload());
		JSONObject obj = new JSONObject(message.getPayload());
		System.out.println(obj);
		sessionList.get(Integer.valueOf((String)obj.get("From"))).sendMessage(new TextMessage(obj.toString()));
		if(sessionList.get(Integer.valueOf((String)obj.get("To"))) != null) {
			sessionList.get(Integer.valueOf((String)obj.get("To"))).sendMessage(new TextMessage(obj.toString()));		
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(((DoctorDTO)session.getAttributes().get("doctor")).getDoctor_num());
		logger.info("{} 연결 끊김.", ((DoctorDTO)session.getAttributes().get("doctor")).getD_name());
		System.out.println(((DoctorDTO)session.getAttributes().get("doctor")).getD_name()+"의 연결이 끊어졌습니다.");
	}
}
