<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>의사진료일정 - Dr.Link</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">

<!-- Favicons -->
<link href="${path}/resources/assets/img/favicon.png" rel="icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${path}/resources/assets/css/bootstrap.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet"
	href="${path}/resources/assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet"
	href="${path}/resources/assets/plugins/fontawesome/css/all.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="${path}/resources/assets/css/style.css">

<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&display=swap"
	rel="stylesheet">

<style>
body {
	font-family: "Nanum Gothic", sans-serif;
}

.footer-menu {
	color: #fff;
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
						<nav aria-label="breadcrumb" class="page-breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${path }">홈</a></li>
								<li class="breadcrumb-item"><a href="doctor_dashboard">마이페이지</a></li>
								<li class="breadcrumb-item active" aria-current="page">진료일정</li>
							</ol>
						</nav>
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
									<a href="#" class="booking-doc-img"> <img
										src="${path}/resources/doctor/doctorImg/${doctorinfo.d_photo}"
										class="img-fluid" alt="User Image">
									</a>
									<div class="profile-det-info">

										<div class="patient-details">
											<h5 class="mb-0">${sessionScope.doctor.departmentDTO.dep_name}</h5>
											<h3>${doctorinfo.d_name}의사</h3>
											<h5>
												<i class="fas fa-birthday-cake"></i> ${doctorinfo.birth}
											</h5>
											<h5 class="mb-0">
												<i class="fas fa-map-marker-alt"></i>
												${doctorinfo.profileAddress}
											</h5>
										</div>
									</div>
								</div>
							</div>
							<div class="dashboard-widget">
								<nav class="dashboard-menu">
									<ul>
										<li><a href="doctor_dashboard"> <i
												class="fas fa-columns"></i> <span>마이페이지</span>
										</a></li>
										<li class="active"><a href="appointments"> <i
												class="fas fa-calendar-check"></i> <span>진료일정</span>
										</a></li>
										<li><a href="my_patients"> <i
												class="fas fa-user-injured"></i> <span>나의 환자</span>
										</a></li>
										<li><a href="reviews"> <i class="fas fa-star"></i> <span>나의
													후기</span>
										</a></li>
										<li><a href="chat"> <i class="fas fa-comments"></i> <span>메세지</span>
												<small class="unread-msg">23</small>
										</a></li>
										<li><a href="doctor_profile_settings"> <i
												class="fas fa-user-cog"></i> <span>프로필 수정</span>
										</a></li>
										<li><a href="doctor_delete_account"> <i
												class="fas fa-ban"></i> <span>회원탈퇴</span>
										</a></li>
										<li><a href="doctor_change_password"> <i
												class="fas fa-key"></i> <span>비밀번호 수정</span>
										</a></li>
										<li><a href="${path}/logout"> <i
												class="fas fa-sign-out-alt"></i> <span>로그아웃</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
						<!-- /Profile Sidebar -->

					</div>

					<div class="col-md-7 col-lg-8 col-xl-9">
						<c:if test="${empty apList }">
							<div class="card text-center">
								<p style="margin: 10px; padding: 10px;">진료 일정이 없습니다.</p>
							</div>
						</c:if>
						<div class="appointments">
							<c:forEach var="ap" items="${apList}" varStatus="status">
								<!-- Appointment List -->
								<div class="appointment-list" >
									<div class="profile-info-widget" style="margin: 0px 0px 0px 34px;">
										<a class="booking-doc-img"> <img
											class="avatar-img rounded-circle"
											src="${path}/resources/patient/profileImg/${ap.patients[0].p_photo}"
											alt="User Image"></a>
										<div class="profile-det-info" style="margin: 0px 0px 0px 34px;">
											<h3>
												${ap.patients[0].p_name}
												<c:choose>
													<c:when test="${ap.patients[0].p_gender eq '1'}">
														&nbsp;<i class="fas fa-mars" style="color: blue;"></i>
													</c:when>
													<c:when test="${ap.patients[0].p_gender eq '2'}">
														&nbsp;<i class="fas fa-venus" style="color: pink;"></i>
													</c:when>
												</c:choose>

											</h3>

											<div class="patient-details" style="float: left; padding:10px; width: auto; margin-right: 50px">
												<h5>
													<i class="far fa-clock"></i> <span>예약날짜 : </span>${ap.appointment_date }
												</h5>
												<h5>
													<i class="far fa-clock"></i> <span>예약시간 : </span>${ap.appointment_time }
												</h5>
												<h5 class="mb-0">
													<i class="fas fa-info-circle"></i> <span>알러지여부 : </span>
														<c:choose>
															<c:when test='${ap.patients[index].allergy eq "1"}'>
																있음
															</c:when>
															<c:otherwise>
																없음
															</c:otherwise>
														</c:choose>
												</h5>
											
											</div>
											<div class="patient-details" style="float: left; padding:10px; width: auto; margin-right: 50px">
											
												<h5>
													<i class="fas fa-map-marker-alt"></i> <span>AI 진단 여부 : </span>
														<c:choose>
															<c:when test='${ap.airecords[0].patient_num eq ap.patients[0].patient_num}'>
																있음<%-- ${ap.airecords[0].patient_num}환자번호${ap.patients[0].patient_num} --%>
															</c:when>
															<c:otherwise>
																없음<%-- ${ap.airecords[0].patient_num}환자번호${ap.patients[0].patient_num} --%>
															</c:otherwise>
														</c:choose>
												</h5>
												<h5>
													<i class="fas fa-envelope"></i> <span>AI 진단 항목 : </span>${ap.airecords[0].dep_num}
												</h5>
												<h5 class="mb-0">
													<i class="fas fa-phone"></i> <span>AI 진단 결과 : </span>${ap.airecords[0].ai_symptom}
												</h5>
											</div>
											
											<div class="patient-details" style="float: left; padding:10px; width: auto;">
											
												<h5>
													<i class="fas fa-map-marker-alt"></i> <span>주 소 : </span>${ap.patients[0].p_address1}
												</h5>
												<h5>
													<i class="fas fa-envelope"></i> <span>이메일 : </span>${ap.patients[0].p_email}
												</h5>
												<h5 class="mb-0">
													<i class="fas fa-phone"></i> <span>연락처 : </span>${ap.patients[0].p_phone_num}
												</h5>
											</div>
											
											<jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" /> 
											<fmt:formatDate value="${now}" pattern="HH:mm" var="nowTime" />
											
											<fmt:parseDate value="${ap.appointment_date}" pattern="yyyy-MM-dd" var="ap_date" />  
											<fmt:formatDate value="${ap_date}" pattern="yyyy-MM-dd" var="ap_date2" />
										    <c:set var = "length" value = "${fn:length(ap.appointment_time)}"/>
											<fmt:parseDate value="${ap.appointment_time}" pattern="HH:mm" var="ap_time" />  
											<fmt:formatDate value="${ap_time}" pattern="HH:mm" var="ap_time2" />

											<c:set var="ap_timeFormat" value="${fn:replace(ap_time2, ':', '')}" />
											<c:set var="now_timeFormat" value="${fn:replace(nowTime, ':', '')}" />
											<!-- nowTime <= ap_time2 -->
											${nowDate == ap_date2 }
											${(ap_timeFormat - now_timeFormat) <= 5 } = ${ap_timeFormat - now_timeFormat }
											${(now_timeFormat - ap_timeFormat) < 5 }
											
											<c:choose>
											<c:when test="${nowDate == ap_date2 && (ap_timeFormat - now_timeFormat) <= 5 && (now_timeFormat - ap_timeFormat) < 5 }">
												<div class="patient-details" style="float: right; padding:10px; width: auto;">
													<a href="" class="dr_link">
													<!-- add_prescription?appointment_num=${ap.appointment_num}&patient_num=${ap.patients[0].patient_num} -->
													<input type="hidden" name="ap_num" value="${ap.appointment_num}">
													<input type="hidden" name="p_num" value="${ap.patients[0].patient_num}">
														<span class="badge-pill bg-info-light">진료실 입장하기</span>
													</a>
													<!-- <a href="#" class="dr_link"></a> -->
												</div>
											</c:when>
											<c:when test="${nowDate >= ap_date2 && (now_timeFormat - ap_timeFormat) >= 6}">
												<span>진료시간이 지났습니다.</span>
											</c:when>
											<c:when test="${nowDate < ap_date2}">
												<span>예약시간이 다가오면 진료실이 열립니다😊</span>
											</c:when>
											</c:choose>
										</div>
									</div>
<%-- 									<div class="appointment-action" style="margin: 0px 0px 0px 750px;">
										<!-- data-target="#appt_details" -->
										<a href="#" class="btn btn-md bg-info-light"
											data-toggle="modal"
											data-target="#appt_details${status.count}"> <input
											type="hidden" name="detail_num" value="${status.count}">
											<i class="far fa-eye"></i> 상세보기
										</a>
									</div> --%>
									
								</div>
								<!-- /Appointment List -->
							</c:forEach>



						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /Page Content -->


	</div>
	<!-- /Main Wrapper -->
	
	
	
<!-- Modal -->
<c:set value="0" var="index"></c:set>
	<c:forEach var="ap" items="${apList}" varStatus="status">
		<div class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" tabindex="-1" aria-hidden="true" id="appt_details${status.count}" >
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		          <h4 class="modal-title" id="gridSystemModalLabel">예약 상세내역</h4>
		        </div>
		        <div class="modal-body">
					<ul class="info-details">
						<li>
							<div class="details-header">
								<div class="row">
									<div class="col-md-6">
										<span class="title">진료일정</span> <span class="text">${ap.appointment_time }</span>
									</div>
								</div>
							</div>
						</li>
						<li><span class="title">환자이름:</span> <span class="text">${ap.patients[index].p_name}</span>
						</li>
						<li><span class="title">환자성별:</span> <span class="text">${ap.patients[index].p_gender}</span>
						</li>
						<li><span class="title">알러지여부:</span> <c:choose>
								<c:when test='${ap.patients[index].allergy eq "1"}'>
									있음
								</c:when>
								<c:otherwise>
									없음
								</c:otherwise>
							</c:choose></li>
					</ul>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div><!-- /.modal -->
	</c:forEach>

<form id="addForm" method="post">
<input type="hidden" name="appointment_num" value="">
<input type="hidden" name="patient_num" value="">
</form>	

<%-- 
	<c:forEach var="ap" items="${apList}" varStatus="status">
		<!-- Appointment Details Modal -->
		<div class="modal fade custom-modal" id="appt_details${status.count}">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">예약 상세내역</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>


					<div class="modal-body">
						<ul class="info-details">
							<li>
								<div class="details-header">
									<div class="row">
										<div class="col-md-6">
											<span class="title">진료일정</span> <span class="text">${ap.appointment_time }</span>
										</div>
									</div>
								</div>
							</li>
							<li><span class="title">환자이름:</span> <span class="text">${ap.patients[index].p_name}</span>
							</li>
							<li><span class="title">환자성별:</span> <span class="text">${ap.patients[index].p_gender}</span>
							</li>
							<li><span class="title">알러지여부:</span> <c:choose>
									<c:when test='${ap.patients[index].allergy eq "1"}'>
										있음
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose></li>
						</ul>
					</div>


				</div>
			</div>
		</div>
		<!-- /Appointment Details Modal -->
	</c:forEach> --%>
	<!-- jQuery -->
	<script src="${path}/resources/assets/js/jquery.min.js"></script>

	<!-- Bootstrap Core JS -->
	<script src="${path}/resources/assets/js/popper.min.js"></script>
	<script src="${path}/resources/assets/js/bootstrap.min.js"></script>

	<!-- Sticky Sidebar JS -->
	<script
		src="${path}/resources/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
	<script
		src="${path}/resources/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

	<!-- Custom JS -->
	<script src="${path}/resources/assets/js/script.js"></script>

	<script type="text/javascript">
	
 		$(function() {
 			$('.dr_link').click(function(e){
 				if(confirm("얼굴을 볼 수 있는 캠과 마이크를 준비해주세요.")) {
 					
 					ap_num = $(this).find('input[name="ap_num"]').val();
	 				p_num = $(this).find('input[name="p_num"]').val();
				    $('#addForm').find('input[name="appointment_num"]').val(ap_num);
	 				$('#addForm').find('input[name="patient_num"]').val(p_num);
	 				
	 				$('#addForm').attr("action", "add_prescription");
	 				$('#addForm').submit(); 
				    window.open("https://192.168.0.44:3100/dr_linkVideo");
				    e.preventDefault();
 				} else {
 					e.preventDefault();
 				}
 			}) // click
 			/*
 			$('.bg-info-light').click(function() {
				var idx = $(this).find('input[name="detail_num"]').val();
				alert("idx: "+idx)
				//$("#appt_details"+idx).modal()
				$(this).attr('data-target', '#appt_details' + idx)
			}) // click*/
		}) // ready 
		
	</script>
</body>
</html>