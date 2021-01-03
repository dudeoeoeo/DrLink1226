package dr_Link.aop;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import dr_Link.main.PatientAopInter;
import dr_Link.dto.DrPLoggerDTO;
import dr_Link.dto.PatientDTO;

@Component
@Aspect
public class DrAspect {
	
	@Autowired
	private PatientAopInter patientAopInter;
	
	// 패턴 : kr.co.kosmo.mvc.controller 존재하는 모든 클래스에
	// 메서드 중에 today 이름이 들어간 인자가 하나 이상인 메서드에 before Adivice를 적용
 	// 첫번째 인자가 Model인 경우에만 사용한다.
	//             public     패키지 이름          class  메소드 매개변수
	@Before("execution(* kr.co.kosmo.mvc.controller.*.today*(..))")
	public void mytodayBefore(JoinPoint jp) {
		Object[] fd = jp.getArgs();
		if(fd[0] instanceof Model) {
			Model m = (Model)fd[0];
			m.addAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		}
	}
	
	@Around("execution(* dr_Link.controller.MainController.loginf*(..))")
	public String loginLogger(ProceedingJoinPoint jp) {
								// ProceedingJoinPoint around에서는 생략 불가
		System.out.println("이거 호출");
		// 인자값
		Object[] fd = jp.getArgs();
		String rpath = null;
		// 메서드 이름
		String methodName = jp.getSignature().getName();
		System.out.println("가져온 메서드 이름: "+methodName);
		if(methodName.equals("loginfCheck")) {
			// 세션값이 있다면 로그인 정보 저장
			DrPLoggerDTO vo = new DrPLoggerDTO();
			try {
				rpath = (String) jp.proceed();  // target의 메서드를 호출한다.
				// 첫번째인자와 두번째 인자값이 동일한 인스터스일 경우에만 동작
				if(fd[0] instanceof HttpSession && fd[1] instanceof HttpServletRequest) {
					HttpSession session = (HttpSession) fd[0];
					HttpServletRequest request = (HttpServletRequest) fd[1];
					System.out.println("경로 어디로 ? "+request.getContextPath());
					PatientDTO pvo = (PatientDTO) session.getAttribute("user");
					String uid = pvo.getP_id();
					String uagent = (String) fd[2];
					// 세션의 값을 얻어와서 존재할 경우만 동작
					if(uid != null) {
						// 데이터베이스에 저장할 값을 세팅
						vo.setP_id(uid);
						vo.setReip(request.getRemoteAddr());
						vo.setUagent(uagent);
						vo.setStatus("login");
						patientAopInter.addLoginLogging(vo);
						System.out.println("원래 매핑하는 페이지 : " + rpath);
						System.out.println("원래 요청한 매핑명 : " + request.getServletPath());
					}
				}
			} catch (Throwable e) {
				e.printStackTrace();
			}
		} else if (methodName.equals("loginfoutProcess")) {
			// 세션값이 없다면 로그아웃 정보 저장
			DrPLoggerDTO vo = new DrPLoggerDTO();
			try {
				if(fd[0] instanceof HttpSession && fd[1] instanceof HttpServletRequest) {
					HttpSession session = (HttpSession) fd[0];
					HttpServletRequest request = (HttpServletRequest) fd[1];
					String uid = (String) session.getAttribute("uid");
					String uagent = (String) fd[2];
					// 세션의 값을 얻어와서 존재할 경우만 동작
					if(uid != null) {
						// 데이터베이스에 저장할 값을 세팅
						vo.setP_id(uid);
						vo.setReip(request.getRemoteAddr());
						vo.setUagent("web");
						vo.setStatus("logout");
						patientAopInter.addLoginLogging(vo);
						System.out.println("경로 어디로 ? "+request.getRequestURI());
					}
					// logout 처리 
				}
					rpath = (String) jp.proceed();
								// jp.proceed를 밑에 두는 이유는 logout 메소드를 호출하기 때문에
							    // 호출되면서 세션값이 지워짐. 때문에 밑에 둬야함!! ** * *
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		System.out.println("insert!******************");
		System.out.println("rpath: "+rpath);
		return rpath;
	}
	
}
