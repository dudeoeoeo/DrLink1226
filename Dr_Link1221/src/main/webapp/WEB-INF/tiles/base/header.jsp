<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

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


		
<!-- Sticky Sidebar JS -->
<script src="${path}/resources/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
<script src="${path}/resources/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

<!-- Circle Progress JS -->
<script src="${path}/resources/assets/js/circle-progress.min.js"></script>

<!-- jQuery -->
<script src="${path}/resources/assets/js/jquery.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${path}/resources/assets/js/popper.min.js"></script>
<script src="${path}/resources/assets/js/bootstrap.min.js"></script>

<!-- Slick JS -->
<script src="${path}/resources/assets/js/slick.js"></script>


<!-- Daterangepikcer JS 
<script src="${path}/resources/assets/js/moment.min.js"></script>
<script src="${path}/resources/assets/plugins/daterangepicker/daterangepicker.js"></script>
-->

<!-- Custom JS -->
<script src="${path}/resources/assets/js/script.js"></script>
		

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

</style>

<script type="text/javascript">  
	$(function(){
		$("#path").val(location.pathname + location.search);
		
	});

</script>
	<!-- Header -->
	<header class="header">
		<nav class="navbar navbar-expand-lg header-nav">
			<div class="navbar-header">
				<a id="mobile_btn" href="javascript:void(0);">
					<span class="bar-icon">
						<span></span>
						<span></span>
						<span></span>
					</span>
				</a>
				<!-- <h1><a id="drlink" href="#" >Dr.Link</a></h1> -->
				<a href="${path }" class="menu-logo">
						<img src="${path}/resources/assets/img/logo.jpg" class="img-fluid" alt="Logo">
					</a>
					
			</div>
			<div class="main-menu-wrapper">
				
				<ul class="main-nav" >
					<li class="has-submenu">
						<a href="${path}/search">의료진 소개</a>
					</li>
					<li class="has-submenu">
						<a href="${path}/notice">공지사항<!-- <i class="fas fa-chevron-down"></i> --></a>
						<!-- <ul class="submenu">
							<li><a href="doctor-dashboard">Doctor Dashboard</a></li>
							<li class="has-submenu">
								<a href="doctor-blog">Blog</a>
								<ul class="submenu">
									<li><a href="doctor-blog">Blog</a></li>
									<li><a href="blog-details">Blog view</a></li>
									<li><a href="doctor-add-blog">Add Blog</a></li>
								</ul>
							</li>
						</ul> -->
					</li>	
					<li class="has-submenu">
						<a href="${path}/health-blog">건강정보</a>
					</li>
					<li class="has-submenu">
						<a href="${path}/question">FAQ</a>
					</li>
					<li class="has-submenu">
						<a href="${path}/search">화상진료예약</a>
					</li>
					<li class="has-submenu">
						<a>AI 진단<i class="fas fa-chevron-down"></i></a>
						<ul class="submenu">
							<li><a href="${path}/AI_medical_eye">눈질병</a></li>
							<li><a href="${path}/AI_medical_skin">피부질병</a></li>
							<li><a href="${path}/AI_medical_hair">탈모</a></li>
							<!--  <li><a href="pharmacy-index">AI진단</a></li> -->
						</ul>
				<c:if test="${sessionScope.user != null}">
						<li class="has-submenu">
							<a href="${path}/patients/patient_dashboard?patient_num=${sessionScope.user.patient_num}">마이페이지</a>
						</li>
								</ul>
						</li>
				</c:if>	
				<c:if test="${sessionScope.doctor != null}">
						<li class="has-submenu">
							<a href="${path}/doctor/doctor_dashboard?doctor_num=${sessionScope.doctor.doctor_num}">마이페이지</a>
						</li>
								</ul>
						</li>
				</c:if>										 
					</div>
				<c:choose>
					<c:when test="${sessionScope.user == null and sessionScope.doctor == null}">	
						<ul class="nav header-navbar-rht">
							<li class="nav-item">
								<a class="nav-link header-login" href="${path}/login">로그인 / 회원가입</a>
							</li>
						</ul> 
					</c:when>
					<c:otherwise>					
						<ul class="nav header-navbar-rht">
							<c:if test="${sessionScope.doctor != null}">
								<li> ${ sessionScope.doctor.d_name } 의사 선생님, 반갑습니다. </li><br>
							</c:if>	
							<c:if test="${sessionScope.user != null}">
								<li> ${ sessionScope.user.p_name }님, 반갑습니다. </li><br>
							</c:if>
							<li class="nav-item">
								<a class="nav-link header-login" href="${path}/logout">로그아웃</a>
							</li>
					    </ul>
					</c:otherwise>
				</c:choose>
							
							
			
			
		
			
		</nav>
	</header>
	<!-- /Header -->

