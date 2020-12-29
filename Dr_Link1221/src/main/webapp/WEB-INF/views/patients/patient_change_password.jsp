<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Doccure</title>
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

			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<h2 class="breadcrumb-title">비밀번호 수정</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						
							<!-- Profile Sidebar -->
						<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
							<div class="profile-sidebar">
								<div class="widget-profile pro-widget-content">
									<div class="profile-info-widget">
										<a href="#" class="booking-doc-img">
											<img src="${path}/resources/patient/profileImg/${patient_profile.p_photo}">
										</a>
										<div class="profile-det-info">
											<h3>${patient_profile.p_name }</h3>
											<div class="patient-details">
												<h5><i class="fas fa-birthday-cake"></i> ${patient_profile.birth}</h5>
												<h5 class="mb-0"><i class="fas fa-map-marker-alt"></i> ${patient_profile.profileAddress}</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="dashboard-widget">
									<nav class="dashboard-menu">
										<ul>
											<li class="active">
												<a href="patient_dashboard">
													<i class="fas fa-columns"></i>
													<span>진료확인</span>
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fas fa-bookmark"></i>
													<span>Favourites</span>
												</a>
											</li>
											<li>
												<a href="profile-settings">
													<i class="fas fa-user-cog"></i>
													<span>개인정보 수정</span>
												</a>
											</li>
											<li>
                                  				<a href="#">
													<i class="fas fa-ban"></i>
													<span>회원탈퇴</span>
												</a>
											</li>
											<li>
                                  				<a href="patient_change_password">
													<i class="fas fa-key"></i>
													<span>비밀번호 수정</span>
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
						</div>
						<!-- / Profile Sidebar -->
							
						<div class="col-md-7 col-lg-8 col-xl-9">
							<div class="card">
								<div class="card-body">
										
											<!-- Change Password Form -->
											<form>
												<div class="form-group">
													<label>현재 비밀번호</label>
													<input type="password" class="form-control">
												</div>
												<div class="form-group">
													<label>새 비밀번호</label>
													<input type="password" class="form-control">
												</div>
												<div class="form-group">
													<label>비밀번호 확인</label>
													<input type="password" class="form-control">
												</div>
												<div class="submit-section">
													<button type="submit" class="btn btn-primary submit-btn">비밀번호 변경</button>
												</div>
											</form>
											<!-- /Change Password Form -->
											
										</div>
									</div>
								</div>
							</div>
				</div>

			</div>		
			<!-- /Page Content -->
