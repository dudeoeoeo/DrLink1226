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
									<li class="breadcrumb-item"><a href="patient_dashboard">마이페이지</a></li>
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
											<li >
												<a href="patient_dashboard">
													<i class="fas fa-columns"></i>
													<span>진료확인</span>
												</a>
											</li>
								<li><a href="favorites"> <i class="fas fa-bookmark"></i> <span>즐겨찾는
											의사</span>
								</a></li>
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
											<li class="active">
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
							
						<div class="col-md-7 col-lg-8 col-xl-9">
							<div class="card">
								<div class="card-body">
											<!-- Change Password Form -->
									<form action="patientDeleteAccount" method="post">
										<h3>정말 탈퇴하시겠습니까?</h3>
										<div class="form-group">
											<label>비밀번호</label>
											<input type="password" name="p_pwd" id="p_pwd" class="form-control" required>
											<div class="check_font" id="pwd_check"></div>
										</div>
										<div class="terms-accept">
											<div class="custom-checkbox">
											   <input type="checkbox" id="terms_accept_1" name="terms_accept_1" disabled required>
											   <label for="terms_accept"><a href="#">위 내용을 </a><span>모두 확인했으며, 회원탈퇴에 동의합니다.</span></label>
											</div>
										</div>
										<div class="submit-section">
											<button type="submit" class="btn btn-primary submit-btn" id="submit-btn" disabled>탈퇴하기</button>
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
	$('#p_pwd').blur(function(){
		var old_pwd = "${patient_profile.p_pwd}";
		if($('#p_pwd').val() == old_pwd){
			$("#pwd_check").text("정말 탈퇴하시겠습니까?");
			$('#pwd_check').css('color', 'red');
			$("#terms_accept_1").removeAttr("disabled");
		}else{
			$("#pwd_check").text("비밀번호가 일치하지 않습니다.");
			$('#pwd_check').css('color', 'red');
		    $('#p_pwd').val('');
	     	$('#p_pwd').focus();
		}
	});
	
	$("#submit-btn").hover(function(){
		if($('input:checkbox[name=terms_accept_1]').is(':checked')){
			$("#submit-btn").removeAttr("disabled");
		}else{
			$("#submit-btn").attr("disabled", "disabled");
		}
	});
});
</script>