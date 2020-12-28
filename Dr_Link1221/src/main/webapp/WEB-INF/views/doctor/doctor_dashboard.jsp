<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>의료진 마이페이지 - Dr.Link</title>
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
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="${path}/resources/assets/js/html5shiv.min.js"></script>
			<script src="${path}/resources/assets/js/respond.min.js"></script>
		<![endif]-->
	
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
									<li class="breadcrumb-item"><a href="index">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Dashboard</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">마이페이지</h2>
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
											<h3>김성민 의사</h3>
											
											<div class="patient-details">
												<h5 class="mb-0">정신건강의학과</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="dashboard-widget">
									<nav class="dashboard-menu">
										<ul>
											<li class="active">
												<a href="doctor-dashboard">
													<i class="fas fa-columns"></i>
													<span>Dashboard</span>
												</a>
											</li>
											<li>
												<a href="appointments">
													<i class="fas fa-calendar-check"></i>
													<span>진료일정</span>
												</a>
											</li>
											<li>
												<a href="my-patients">
													<i class="fas fa-user-injured"></i>
													<span>환자내역</span>
												</a>
											</li>
											<li>
												<a href="invoices">
													<i class="fas fa-file-invoice"></i>
													<span>Invoices</span>
												</a>
											</li>
											<li>
												<a href="reviews">
													<i class="fas fa-star"></i>
													<span>리뷰</span>
												</a>
											</li>
											<li>
												<a href="chat-doctor">
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
												<a href="index">
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

							<div class="row">
								<div class="col-md-12">
									<div class="card dash-card">
										<div class="card-body">
											<div class="row">
												<div class="col-md-12 col-lg-4">
													<div class="dash-widget dct-border-rht">
														<div class="circle-bar circle-bar1">
															<div class="circle-graph1" data-percent="75">
																<img src="${path}/resources/assets/img/icon-01.png" class="img-fluid" alt="patient">
															</div>
														</div>
														<div class="dash-widget-info">
															<h6>전체 환자 수</h6>
															<h3>1500</h3>
															<p class="text-muted">오늘까지</p>
														</div>
													</div>
												</div>
												
												<div class="col-md-12 col-lg-4">
													<div class="dash-widget dct-border-rht">
														<div class="circle-bar circle-bar2">
															<div class="circle-graph2" data-percent="65">
																<img src="${path}/resources/assets/img/icon-02.png" class="img-fluid" alt="Patient">
															</div>
														</div>
														<div class="dash-widget-info">
															<h6>오늘 환자 수</h6>
															<h3>36</h3>
															<p class="text-muted">2020-12-04</p>
														</div>
													</div>
												</div>
												
												<div class="col-md-12 col-lg-4">
													<div class="dash-widget">
														<div class="circle-bar circle-bar3">
															<div class="circle-graph3" data-percent="50">
																<img src="${path}/resources/assets/img/icon-03.png" class="img-fluid" alt="Patient">
															</div>
														</div>
														<div class="dash-widget-info">
															<h6>내일 예약 수</h6>
															<h3>51</h3>
															<p class="text-muted">2020-12-05</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<h4 class="mb-4">환자 예약현황</h4>
									<div class="appointment-tab">
									
										<!-- Appointment Tab -->
										<ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded">
											<li class="nav-item">
												<a class="nav-link active" href="#upcoming-appointments" data-toggle="tab">다가오는 예약</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#today-appointments" data-toggle="tab">내일의 예약</a>
											</li> 
										</ul>
										<!-- /Appointment Tab -->
										
										<div class="tab-content">
										
											<!-- Upcoming Appointment Tab -->
											<div class="tab-pane show active" id="upcoming-appointments">
												<div class="card card-table mb-0">
													<div class="card-body">
														<div class="table-responsive">
															<table class="table table-hover table-center mb-0">
																<thead>
																	<tr>
																		<th>환자</th>
																		<th>예약시간</th>
																		<th>증상</th>
																		<th>구분</th>
																		<th class="text-center">금액</th>
																		<th></th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient.jpg" alt="User Image"></a>
																				<a href="patient-profile.jsp">고현영 <span>#12345</span></a>
																			</h2>
																		</td>
																		<td>2020-12-04 <span class="d-block text-info">10:00 AM</span></td>
																		<td>불면증</td>
																		<td>신환</td>
																		<td class="text-center">25,000원</td>
																		<td class="text-right">
																			<div class="appointment-action">
																			<a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#appt_details">
																				<i class="far fa-eye"></i> 상세보기
																			</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient1.jpg" alt="User Image"></a>
																				<a href="patient-profile">신주섭 <span>#12345</span></a>
																			</h2>
																		</td>
																		<td>2020-12-04 <span class="d-block text-info">11:00 AM</span></td>
																		<td>수면장애</td>
																		<td>구환</td>
																		<td class="text-center">20,000원</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient2.jpg" alt="User Image"></a>
																				<a href="patient-profile">Travis Trimble  <span>#PT0002</span></a>
																			</h2>
																		</td>
																		<td>1 Nov 2019 <span class="d-block text-info">1.00 PM</span></td>
																		<td>General</td>
																		<td>New Patient</td>
																		<td class="text-center">$75</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient3.jpg" alt="User Image"></a>
																				<a href="patient-profile">Carl Kelly <span>#PT0003</span></a>
																			</h2>
																		</td>
																		<td>30 Oct 2019 <span class="d-block text-info">9.00 AM</span></td>
																		<td>General</td>
																		<td>Old Patient</td>
																		<td class="text-center">$100</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient4.jpg" alt="User Image"></a>
																				<a href="patient-profile">Michelle Fairfax <span>#PT0004</span></a>
																			</h2>
																		</td>
																		<td>28 Oct 2019 <span class="d-block text-info">6.00 PM</span></td>
																		<td>General</td>
																		<td>New Patient</td>
																		<td class="text-center">$350</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient5.jpg" alt="User Image"></a>
																				<a href="patient-profile">Gina Moore <span>#PT0005</span></a>
																			</h2>
																		</td>
																		<td>27 Oct 2019 <span class="d-block text-info">8.00 AM</span></td>
																		<td>General</td>
																		<td>Old Patient</td>
																		<td class="text-center">$250</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																</tbody>
															</table>		
														</div>
													</div>
												</div>
											</div>
											<!-- /Upcoming Appointment Tab -->
									   
											<!-- Today Appointment Tab -->
											<div class="tab-pane" id="today-appointments">
												<div class="card card-table mb-0">
													<div class="card-body">
														<div class="table-responsive">
															<table class="table table-hover table-center mb-0">
																<thead>
																	<tr>
																		<th>환자</th>
																		<th>예약시간</th>
																		<th>증상</th>
																		<th>구분</th>
																		<th class="text-center">금액</th>
																		<th></th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient6.jpg" alt="User Image"></a>
																				<a href="patient-profile">홍송은 <span>#33333</span></a>
																			</h2>
																		</td>
																		<td>2020-12-05 <span class="d-block text-info">9:00 AM</span></td>
																		<td>불면증</td>
																		<td>신환</td>
																		<td class="text-center">30,000원</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient7.jpg" alt="User Image"></a>
																				<a href="patient-profile">Joan Gardner <span>#PT0006</span></a>
																			</h2>
																		</td>
																		<td>14 Nov 2019 <span class="d-block text-info">5.00 PM</span></td>
																		<td>General</td>
																		<td>Old Patient</td>
																		<td class="text-center">$100</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient8.jpg" alt="User Image"></a>
																				<a href="patient-profile">Daniel Griffing <span>#PT0007</span></a>
																			</h2>
																		</td>
																		<td>14 Nov 2019 <span class="d-block text-info">3.00 PM</span></td>
																		<td>General</td>
																		<td>New Patient</td>
																		<td class="text-center">$75</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient9.jpg" alt="User Image"></a>
																				<a href="patient-profile">Walter Roberson <span>#PT0008</span></a>
																			</h2>
																		</td>
																		<td>14 Nov 2019 <span class="d-block text-info">1.00 PM</span></td>
																		<td>General</td>
																		<td>Old Patient</td>
																		<td class="text-center">$350</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient10.jpg" alt="User Image"></a>
																				<a href="patient-profile">Robert Rhodes <span>#PT0010</span></a>
																			</h2>
																		</td>
																		<td>14 Nov 2019 <span class="d-block text-info">10.00 AM</span></td>
																		<td>General</td>
																		<td>New Patient</td>
																		<td class="text-center">$175</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<h2 class="table-avatar">
																				<a href="patient-profile" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${path}/resources/assets/img/patients/patient11.jpg" alt="User Image"></a>
																				<a href="patient-profile">Harry Williams <span>#PT0011</span></a>
																			</h2>
																		</td>
																		<td>14 Nov 2019 <span class="d-block text-info">11.00 AM</span></td>
																		<td>General</td>
																		<td>New Patient</td>
																		<td class="text-center">$450</td>
																		<td class="text-right">
																			<div class="table-action">
																				<a href="javascript:void(0);" class="btn btn-sm bg-info-light">
																					<i class="far fa-eye"></i> 상세보기
																				</a>
																				
																				<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
																					<i class="fas fa-check"></i> 수락하기
																				</a>
																				<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
																					<i class="fas fa-times"></i> 취소하기
																				</a>
																			</div>
																		</td>
																	</tr>
																</tbody>
															</table>		
														</div>	
													</div>	
												</div>	
											</div>
											<!-- /Today Appointment Tab -->
											
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>

			</div>		
			<!-- /Page Content -->
		   
		</div>
		<!-- /Main Wrapper -->
	  <!-- Appointment Details Modal -->
		<div class="modal fade custom-modal" id="appt_details">
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
											<span class="text">2020-11-30 10:00 AM</span>
										</div>
										<div class="col-md-6">
											<div class="text-right">
												<button type="button" class="btn bg-success-light btn-sm" id="topup_status">Completed</button>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<span class="title">상태:</span>
								<span class="text">진료완료</span>
							</li>
							<li>
								<span class="title">진료날짜:</span>
								<span class="text">2020-11-30</span>
							</li>
							<li>
								<span class="title">금액</span>
								<span class="text">25,000원</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- /Appointment Details Modal -->
		<!-- jQuery -->
		<script src="${path}/resources/assets/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JS -->
		<script src="${path}/resources/assets/js/popper.min.js"></script>
		<script src="${path}/resources/assets/js/bootstrap.min.js"></script>
		
		<!-- Sticky Sidebar JS -->
        <script src="${path}/resources/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="${path}/resources/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>
		
		<!-- Circle Progress JS -->
		<script src="${path}/resources/assets/js/circle-progress.min.js"></script>
		
		<!-- Custom JS -->
		<script src="${path}/resources/assets/js/script.js"></script>
		
	</body>
</html>