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
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${path }">홈</a></li>
									<li class="breadcrumb-item"><a href="doctor_dashboard">마이페이지</a></li>
									<li class="breadcrumb-item active" aria-current="page">회원탈퇴</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">회원탈퇴</h2>
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
                                 <img src="${path}/resources/doctor/doctorImg/${sessionScope.doctor.d_photo}" class="img-fluid" alt="User Image">
                              </a>
                              <div class="profile-det-info">
                                 <h3>${sessionScope.doctor.d_name} 의사</h3>
                                 
                                 <div class="patient-details">
                                    <h5 class="mb-0">${sessionScope.doctor.departmentDTO.dep_name}</h5>
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
                               		<a href="doctor_delete_account">
										<i class="fas fa-ban"></i>
										<span>회원탈퇴</span>
									</a>
								</li>
								<li>
                               		<a href="doctor_change_password">
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
							<!-- /Profile Sidebar -->
							
						</div>
							
						<div class="col-md-7 col-lg-8 col-xl-9">
							<div class="card">
								<div class="card-body">
											<!-- Change Password Form -->
											<form action="doctorDeleteAccount" method="post">
												<h3>정말 탈퇴하시겠습니까?</h3>
												<div class="form-group">
													<label>비밀번호</label>
													<input type="password" name="d_pwd" id="d_pwd" class="form-control">
												</div>
												<div class="terms-accept">
													<div class="custom-checkbox">
													   <input type="checkbox" id="terms_accept_1" name="terms_accept_1" >
													   <label for="terms_accept"><a href="#">위 내용을 </a><span>모두 확인했으며, 회원탈퇴에 동의합니다.</span></label>
													</div>
												</div>
												<div class="submit-section">
													<button type="submit" class="btn btn-primary submit-btn" id="submit-btn">탈퇴하기</button>
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
<script>
$(function(){
	$("#submit-btn").hover(function(){
		if($('input:checkbox[name=terms_accept_1]').is(':checked')){
			$("#submit-btn").removeAttr("disabled");
		}else{
			$("#submit-btn").attr("disabled", "disabled");
		}
	});
});
</script>