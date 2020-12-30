<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Favicons -->
<link type="image/x-icon" href="${path}/resources/assets/img/favicon.png" rel="icon">

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


<!-- Select2 JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.js" ></script>

<style>
body {
    font-family: "Nanum Gothic", sans-serif;
}

#header-wrapper{
	background-image: url("${pageContext.request.contextPath}/resorces/img/banner.jpg");
	background-size : cover;
}

@media all and (min-width: 992px) {
	.navbar .nav-item .dropdown-menu{ display: none; }
	.navbar .nav-item:hover .nav-link{ color: black;  }
	.navbar .nav-item:hover .dropdown-menu{ display: block; }
	.navbar .nav-item .dropdown-menu{ margin-top:0; }
}	

#drlink{
font-family: 'Major Mono Display', monospace; 
margin-right: 20px;
}

ul .bxslider{
width:auto !important;
}

#bxslider{
width:auto !important;
}

.footer-menu{
	color:#fff;
}

h2:not(.u-subtitle) {
    font-weight: 30 bold !important;
    font-size: 1.25rem!important;
    line-height: 1.1!important;
    margin-top: 20px!important;
    margin-bottom: 20px!important;
}

</style>
</head>
<body>
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
													<span>즐겨찾는 의사(준비중)</span>
												</a>
											</li>
											<li>
												<a href="profile_settings">
													<i class="fas fa-user-cog"></i>
													<span>개인정보 수정</span>
												</a>
											</li>
											<li>
                                  				<a href="patient_change_password">
													<i class="fas fa-key"></i>
													<span>비밀번호 수정</span>
												</a>
											</li>
											<li>
                                  				<a href="patient_delete_account">
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
						</div>
						<!-- / Profile Sidebar -->
						
					</div>

				</div>

			</div>		
						
						
</body>
</html>