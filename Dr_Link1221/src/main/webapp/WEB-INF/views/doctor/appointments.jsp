<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>의사진료일정 - Dr.Link</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
		<!-- Favicons -->
		<link href="${path}/resources/assets/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/fontawesome.min.css">
		<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/all.min.css">
		
		<!-- Main CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/css/style.css">
		
		<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&display=swap" rel="stylesheet">

<style>
body {
    font-family: "Nanum Gothic", sans-serif;
}


.footer-menu{
	color:#fff;
}
</style>
	
	</head>
	<body>

		<!-- Main Wrapper -->
		<div class="main-wrapper">
		
			
			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<h2 class="breadcrumb-title">진료일정</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
						
							<!-- Profile Sidebar -->
							<div class="profile-sidebar">
                        <div class="widget-profile pro-widget-content">
                           <div class="profile-info-widget">
                              <a href="#" class="booking-doc-img">
                                 <img src="${path}/resources/assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
                              </a>
                              <div class="profile-det-info">
                                 <h3>${sessionScope.doctor.d_name} 의사</h3>
                                 
                                 <div class="patient-details">
                                    <h5 class="mb-0">진료과 DB 가져오기 </h5>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="dashboard-widget">
                           <nav class="dashboard-menu">
                              <ul>
                                 <li class="active">
                                    <a href="doctor_dashboard">
                                       <i class="fas fa-columns"></i>
                                       <span>마이페이지</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="appointments">
                                       <i class="fas fa-calendar-check"></i>
                                       <span>진료일정</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="my_patients">
                                       <i class="fas fa-user-injured"></i>
                                       <span>나의 환자</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="reviews">
                                       <i class="fas fa-star"></i>
                                       <span>나의 후기</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="#">
                                       <i class="fas fa-comments"></i>
                                       <span>메세지</span>
                                       <small class="unread-msg">23</small>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="doctor_profile_settings">
                                       <i class="fas fa-user-cog"></i>
                                       <span>프로필 수정</span>
                                    </a>
                                 </li>
								<li>
                               				<a href="#">
										<i class="fas fa-ban"></i>
										<span>회원탈퇴</span>
									</a>
								</li>
                                 <li>
                                    <a href="${path}/logout">
                                       <i class="fas fa-sign-out-alt"></i>
                                       <span>로그아웃</span>
                                    </a>
                                 </li>
                              </ul>
                           </nav>
                        </div>
                     </div>
							<!-- /Profile Sidebar -->
							
						</div>
						
						<div class="col-md-7 col-lg-8 col-xl-9">
							<div class="appointments">
							<c:forEach var="ap" items="${apList}" varStatus="status">
								<!-- Appointment List -->
								<div class="appointment-list">
									<div class="profile-info-widget">
										<a href="patient-profile" class="booking-doc-img">
											<img src="${path}/resources/assets/img/patients/patient.jpg" alt="User Image">
										</a>
										<div class="profile-det-info">
											<h3><a href="patient-profile"> ${ap.patients[0].p_name}</a></h3>
											<div class="patient-details">
												<h5><i class="far fa-clock"></i> ${ap.appointment_date } </h5>
												<h5><i class="far fa-clock"></i> ${ap.appointment_time } </h5>
												<h5><i class="fas fa-map-marker-alt"></i> ${ap.patients[0].p_address1} </h5>
												<h5><i class="fas fa-envelope"></i> ${ap.patients[0].p_email}</h5>
												<h5 class="mb-0"><i class="fas fa-phone"></i> ${ap.patients[0].p_phone_num} </h5>
											</div>
										</div>
									</div>
									<div class="appointment-action"> <!-- data-target="#appt_details" -->
										<a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" >
										<input type="hidden" name="detail_num" value="${status.count}">
											<i class="far fa-eye"></i> 상세보기
										</a>
									</div>
								</div>
								<!-- /Appointment List -->
							</c:forEach>
							
								
								
							</div>
						</div>
					</div>

				</div>

			</div>		
			<!-- /Page Content -->
   
			<!-- Footer -->
	<footer class="footer">
		
		<!-- Footer Top -->
		<div class="footer-top">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-3 col-md-6">
					
						<!-- Footer Widget -->
						<div class="footer-widget footer-about">
							<div class="footer-logo">
								<h1 id="drlink" style="color:#fff;">Dr.Link</h1>
							</div>
							<div class="footer-about-content">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
								<div class="social-icon">
									<ul>
										<li>
											<a href="#" target="_blank"><i class="fab fa-facebook-f"></i> </a>
										</li>
										<li>
											<a href="#" target="_blank"><i class="fab fa-twitter"></i> </a>
										</li>
										<li>
											<a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
										</li>
										<li>
											<a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
										</li>
										<li>
											<a href="#" target="_blank"><i class="fab fa-dribbble"></i> </a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- /Footer Widget -->
						
					</div>
					
					<div class="col-lg-3 col-md-6">
					
						<!-- Footer Widget -->
						<div class="footer-widget footer-menu">
							<h2 class="footer-title"><a href="notice" class="footer-menu">공지사항</a></h2>
							<h2 class="footer-title"><a href="booking" class="footer-menu">온라인 예약</a></h2>
							<h2 class="footer-title"><a href="health-care" class="footer-menu">건강정보</a></h2>
						</div>
						<!-- /Footer Widget -->
						
					</div>
					
					<div class="col-lg-3 col-md-6">
					
						<!-- Footer Widget -->
						<div class="footer-widget footer-menu">
							<h2 class="footer-title"><a href="" class="footer-menu">온라인 간편 진단</a></h2>
							<ul>
								<li><a href="AI_medical_eye">안과 진단</a></li>
								<li><a href="AI_medical_skin">피부과 진단</a></li>
							</ul>
						</div>
						<!-- /Footer Widget -->
						
					</div>
					
					<div class="col-lg-3 col-md-6">
					
						<!-- Footer Widget -->
						<div class="footer-widget footer-contact">
								<h2 class="footer-title">Contact Us</h2>
								<div class="footer-contact-info">
									<div class="footer-address">
										<span><i class="fas fa-map-marker-alt"></i></span>
										<p> 서울 금천구 가산디지털2로 123 월드메르디앙벤처센터II </p>
									</div>
									<p>
										<i class="fas fa-phone-alt"></i>
										02-2025-4119
									</p>
									<p class="mb-0">
										<i class="fas fa-envelope"></i>
										drlink@naver.com
									</p>
								</div>
								</div>
							</div>
						</div>
						<!-- /Footer Widget -->
						
					</div>
					
				</div>
			</div>
		</div>
		<!-- /Footer Top -->
		
		<!-- Footer Bottom -->
              <div class="footer-bottom" style="margin:5px !important; padding:10px !important;">
			<div class="container-fluid">
			
				<!-- Copyright -->
				<div class="copyright">
					<div class="row">
						<div class="col-md-7 col-lg-7">
							<div class="copyright-text">
								<p>
									Copyright &copy; by Dr.Link All Rights Reserved.
								</p>
							</div>
						</div>
						
							<!-- /Copyright Menu -->
							
						</div>
					</div>
				</div>
				<!-- /Copyright -->
				
			</div>
		</div>
		<!-- /Footer Bottom -->
		
	</footer>
	<!-- /Footer -->
		   
		</div>
		<!-- /Main Wrapper -->
		
		
		<c:forEach var="ap" items="${apList}" varStatus="status">
		<!-- Appointment Details Modal -->
		<div class="modal fade custom-modal" id="appt_details${status.count }">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">예약 상세내역</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
				
					<div class="modal-body">
						<ul class="info-details">
							<li>
								<div class="details-header">
									<div class="row">
										<div class="col-md-6">
											<span class="title">진료일정</span>
											<span class="text">${ap.appointment_time }</span>
										</div>
										<!-- <div class="col-md-6">
											<div class="text-right">
												<button type="button" class="btn bg-success-light btn-sm" id="topup_status">Completed</button>
											</div>
										</div> -->
									</div>
								</div>
							</li>
							<li>
								<span class="title">환자이름:</span>
								<span class="text">${ap.patients[index].p_name}</span>
							</li>
							<li>
								<span class="title">환자성별:</span>
								<span class="text">${ap.patients[index].p_gender}</span>
							</li>
							<li>
								<span class="title">알러지여부:</span>
								<c:choose>
									<c:when test='${ap.patients[index].allergy eq "1"}'>
										<span class="text">있음</span>
									</c:when>
									<c:otherwise>
										<span class="text">없음</span>
									</c:otherwise>
								</c:choose>
							</li>
						</ul>
					</div>
				
				
				</div>
			</div>
		</div>
		<!-- /Appointment Details Modal -->
	  </c:forEach>
	  
		<!-- jQuery -->
		<script src="${path}/resources/assets/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JS -->
		<script src="${path}/resources/assets/js/popper.min.js"></script>
		<script src="${path}/resources/assets/js/bootstrap.min.js"></script>
		
		<!-- Sticky Sidebar JS -->
        <script src="${path}/resources/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="${path}/resources/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>
		
		<!-- Custom JS -->
		<script src="${path}/resources/assets/js/script.js"></script>

	<script type="text/javascript">
		$(function(){
			$('.bg-info-light').click(function(){
				var idx = $(this).find('input[name="detail_num"]').val();
				//$("#appt_details"+idx).modal()
				$(this).attr('data-target', '#appt_details'+idx)
			}) // click
		}) // ready
	</script>
	</body>
</html>