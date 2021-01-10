package dr_Link.doctor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dr_Link.doctorProfile.DoctorDTO;

@Service("doctorServiceInter")
public class DoctorServiceImpl implements DoctorServiceInter{
	
	/* 김성민 */
	@Autowired private DoctorDaoImp doctorDaoImpl;
	
	/* 김성민 */
	// 아이디 중복 검사(AJAX)
	@Override
	public void doctor_check_id(String d_id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(doctorDaoImpl.check_id(d_id));
		out.close();
	}
	
	// 이메일 중복 검사
	@Override
	public void doctor_check_email(String d_email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(doctorDaoImpl.check_email(d_email));
		out.close();
	}
	
	
	// 아이디 찾기
	@Override
	public String doctor_find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = doctorDaoImpl.find_id(email);
		System.out.println("find_id 서비스 임플까지옴");
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	
	
	
	// 이메일 발송
	@Override
	public void doctor_send_mail(DoctorDTO dto, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "ksungmin10@gmail.com";
		String hostSMTPpwd = "kosmoTEST1234";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "ksungmin10@gmail.com";
		String fromName = "닥터링크";
		String subject = "";
		String msg = "";
		System.out.println("send_mail 서비스 임플까지옴");
		
		if(div.equals("find_pw")) {
			subject = "DrLink 온라인 병원 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3>";
			msg += dto.getD_id() + "님의 임시 비밀번호 입니다. 비밀번호를 <span style='color: red;'>변경</span>하여 사용하세요.</h3>";
			msg += "<h1>임시 비밀번호 : ";
			msg += dto.getD_pwd() + "</h1></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = dto.getD_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	
	// 비밀번호 찾기
	@Override
	public void doctor_find_pw(HttpServletResponse response, DoctorDTO dto) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("find_pw 서비스 임플까지옴 1/4");
		// 아이디가 없으면
		if(doctorDaoImpl.idCheck(dto.getD_id()) == 0) {
			out.print("아이디를 다시 확인하여주세요.");
			out.close();
			System.out.println("find_pw 서비스 임플까지옴 2/4");
		}
		// 가입에 사용한 이메일이 아니면
		else if(!dto.getD_email().equals(doctorDaoImpl.emailCheck(dto.getD_id()).getD_email())) {
			out.print("이메일을 다시 확인하여주세요.");
			out.close();
			System.out.println("find_pw 서비스 임플까지옴 3/4");
		}else {
		//if(true) {
			System.out.println("find_pw 서비스 임플까지옴 4/4");
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			dto.setD_pwd(pw);;
			// 비밀번호 변경
			doctorDaoImpl.update_pw(dto);
			// 비밀번호 변경 메일 발송
			doctor_send_mail(dto, "find_pw");

			System.out.println("임시 비밀번호 까지옴 4/4"+pw);
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	
	// 의사 정보 다시 가져오기
	@Override
	public DoctorDTO getDoctorDTO(int doctor_num) {
		// TODO Auto-generated method stub
		return doctorDaoImpl.getDoctorDTO(doctor_num);
	}
}
