<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>환자리스트-Dr.Link</title>
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
								<li class="breadcrumb-item active" aria-current="page">나의
									환자</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">나의 환자</h2>
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
										<li><a href="appointments"> <i
												class="fas fa-calendar-check"></i> <span>진료일정</span>
										</a></li>
										<li class="active"><a href="my_patients"> <i
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
						<c:if test="${empty my_patients_list }">
							<div class="card text-center">
								<p style="margin: 10px; padding: 10px;">나의 환자가 없습니다.</p>
							</div>
						</c:if>
						<div class="row row-grid">

							<!-- 환자리스트 반복 시작 -->
							<c:forEach var="patient" items="${my_patients_list}"
								varStatus="status">
								<div class="col-md-6 col-lg-4 col-xl-3">
									<div class="card widget-profile pat-widget-profile">
										<div class="card-body">
											<div class="pro-widget-content">
												<div class="profile-info-widget">
													<a class="booking-doc-img"> 
													<img class="avatar-img rounded-circle"
														src="${path}/resources/patient/profileImg/${patient.patientDTO.p_photo}"
														alt="User Image"></a>
													<div class="profile-det-info">
														<h3>
															${patient.patientDTO.p_name}
														</h3>

														<div class="patient-details">
															<h5>
																<b>Patient ID :</b> ${patient.patientDTO.patient_num}
															</h5>
															<h5 class="mb-0">
																<i class="fas fa-map-marker-alt"></i>${patient.patientDTO.profileAddress}</h5>
														</div>
													</div>
												</div>
											</div>
											<div class="patient-info" style="text-align: center;">
												<c:choose>
													<c:when test="${patient.patientDTO.p_gender eq '1'}">
														<h6>${patient.patientDTO.birth},
															<i class="fas fa-mars" style="color: blue;"></i>
														</h6>
													</c:when>
													<c:when test="${patient.patientDTO.p_gender eq '2'}">
														<h6>${patient.patientDTO.birth},
															<i class="fas fa-venus" style="color: pink;"></i>
														</h6>
													</c:when>
												</c:choose>
												<b>혈액형 :</b> ${patient.patientDTO.bloodtype}
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- 환자리스트 반복 끝 -->

						</div>

					</div>
				</div>

			</div>

		</div>
		<!-- /Page Content -->

	</div>
	<!-- /Main Wrapper -->

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

</body>
</html>