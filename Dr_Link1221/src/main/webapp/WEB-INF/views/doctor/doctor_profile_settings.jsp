<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html> 
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>의사마이페이지 - Dr.Link</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
		<!-- Favicons -->
		<link href="${path}/resources/assets/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/fontawesome.min.css">
		<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/all.min.css">
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/plugins/select2/css/select2.min.css">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css">
		
		<link rel="stylesheet" href="${path}/resources/assets/plugins/dropzone/dropzone.min.css">
		
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
									<li class="breadcrumb-item active" aria-current="page">프로필 수정</li>
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
											<img src="${path}/resources/assets/assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
										</a>
										<div class="profile-det-info">
											<h3>${doctorinfo.d_name} 의사</h3>
											
											<div class="patient-details">
												<h5 class="mb-0">${doctorinfo.departmentDTO.dep_name}</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="dashboard-widget">
									<nav class="dashboard-menu">
										<ul>
											<li>
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
												<a href="schedule-timings">
													<i class="fas fa-hourglass-start"></i>
													<span>근무시간</span>
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
											<li class="active">
												<a href="doctor-profile-settings">
													<i class="fas fa-user-cog"></i>
													<span>프로필수정</span>
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
						
							<!-- Basic Information -->
							<form id="doctor-profile-settings" action="setting_ok"  method="post" enctype="multipart/for-data">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">기본 정보</h4>
									<div class="row form-row">
										<div class="col-md-12">
											<div class="form-group">
												<div class="change-avatar">
													<div class="profile-img">
														<img src="${path}/resources/assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
													</div>
													<div class="upload-img">
														<div class="change-photo-btn">
															<span><i class="fa fa-upload"></i> 사진 첨부</span>
															<input type="file" class="upload" name="p_imgfile">
														</div>
														<small class="form-text text-muted">JPG, GIF, PNG만 허용됩니다. 최대 사이즈 2MB</small>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>아이디 <span class="text-danger">*</span></label>
												<input type="text" class="form-control" name="d_id" readonly value="${doctorinfo.d_id}">
												<input type="hidden" class="form-control" name="doctor_num" readonly value="${doctorinfo.doctor_num}">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Email <span class="text-danger">*</span></label>
												<input type="email" class="form-control" name="d_email" value="${doctorinfo.d_email}">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>이름<span class="text-danger">*</span></label>
												<input type="text" class="form-control" name="d_name"  value="${doctorinfo.d_name}">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>휴대폰</label>
												<input type="text" class="form-control"  name="d_phone_num" value="${doctorinfo.d_phone_num}">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>성별</label>
												<select class="form-control select"  name="d_gender" >
												<c:choose>
												<c:when test="${doctorinfo.d_gender eq '남'}">
											        <option value="${doctorinfo.d_gender}" selected="selected">${doctorinfo.d_gender}</option>
											        <option value="여" >여</option>
												</c:when>
												<c:otherwise>
											        <option value="${doctorinfo.d_gender}" selected="selected">${doctorinfo.d_gender}</option>
											        <option value="남" >남</option>
												</c:otherwise>
												</c:choose>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group mb-0">
												<label>생년월일</label>
												<input type="text" class="form-control"  name="d_jumin_num" readonly value="${doctorinfo.d_jumin_num}">
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Basic Information -->
							
							<!-- About Me -->
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">경력사항</h4>
									<div class="form-group mb-0">
										<label>자기소개</label>
										<textarea class="form-control" rows="5" name="d_content">${doctorinfo.d_content}</textarea>
									</div>
								</div>
							</div>
							<!-- /About Me -->
							
							<!-- Services and Specialization -->
							<div class="card services-card">
								<div class="card-body">
									<h4 class="card-title">진료과목</h4>
									<div class="form-group">
										<label>진료과</label>
										<input type="text" data-role="tagsinput" class="input-tags form-control" placeholder="진료과를 입력하세요." name="dep_name" value="${doctorinfo.departmentDTO.dep_name}" id="services">
										<small class="form-text text-muted">알림 : 새로운 진료과목을 추가하시려면 엔터를 누르세요.</small>
									</div> 
									<div class="form-group mb-0">
										<label>전문진료분야 </label>
										<input class="input-tags form-control" type="text" data-role="tagsinput" placeholder="진료분야를 입력하세요." name="d_field" value="${doctorinfo.d_field}" id="specialist">
										<small class="form-text text-muted">알림 : 새로운 진료과목을 추가하시려면 엔터를 누르세요.</small>
									</div> 
								</div>              
							</div>
							<!-- /Services and Specialization -->
						 
							<!-- Education -->
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">학력</h4>
									<div class="education-info">
										<div class="row form-row education-cont">
											<div class="col-12 col-md-10 col-lg-11">
												<div class="row form-row">
												<c:set var="len" value="${fn:length(m[0])}"/> 
												<c:forEach begin="0" end="${len-1}" varStatus="status" step="3">
													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>출신대학</label>
															<input type="text" class="form-control" name="d_graduation" value="${m[0][status.index]}">
														</div> 
													</div>
													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>학과</label>
															<input type="text" class="form-control" name="d_graduation" value="${m[0][status.index+1]}">
														</div> 
													</div>
													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>졸업년도</label>
															<input type="text" class="form-control" name="d_graduation" value="${m[0][status.index+2]}">
														</div> 
													</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
									<div class="add-more">
										<a href="javascript:void(0);" class="add-education"><i class="fa fa-plus-circle"></i> 추가하기</a>
									</div>
								</div>
							</div>
							<!-- /Education -->
						
							<!-- Experience -->
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">경력</h4>
									<div class="experience-info">
										<div class="row form-row experience-cont">
											<div class="col-12 col-md-10 col-lg-11">
												<div class="row form-row">
												<c:set var="len" value="${fn:length(m[1])}"/> 
												<c:forEach begin="0" end="${len-1}" varStatus="status" step="3">
													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>병원이름</label>
															<input type="text" class="form-control" name="d_career"  value="${m[1][status.index]}">
														</div> 
													</div>
													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>직함</label>
															<input type="text" class="form-control" name="d_career" value="${m[1][status.index+1]}">
														</div> 
													</div>
													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>활동년도</label>
															<input type="text" class="form-control" name="d_career" value="${m[1][status.index+2]}">
														</div> 
													</div>
												</c:forEach>
												</div>
											</div>
										</div>
									</div>
									<div class="add-more">
										<a href="javascript:void(0);" class="add-experience"><i class="fa fa-plus-circle"></i>추가하기</a>
									</div>
								</div>
							</div>
							<!-- /Experience -->
							
							
							<!-- Registrations -->
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">면허내역</h4>
									<div class="registrations-info">
										<div class="row form-row reg-cont">
											<div class="col-12 col-md-6 col-lg-4">
												<div class="form-group">
													<label>면허이름</label>
													<input type="text" class="form-control" name="d_licence" value="${doctorinfo.d_licence}">
												</div> 
											</div>
											<div class="col-12 col-md-6 col-lg-4">
												<div class="form-group">
													<label>면허번호</label>
													<input type="text" class="form-control" name="d_licence_num" value="${doctorinfo.d_licence_num}">
												</div> 
											</div>
											<div class="col-12 col-md-6 col-lg-4">
												<div class="form-group">
													<label>취득년도</label>
													<input type="text" class="form-control">
												</div> 
											</div>
										</div>
									</div>
									<div class="add-more">
										<a href="javascript:void(0);" class="add-reg"><i class="fa fa-plus-circle"></i> Add More</a>
									</div>
								</div>
							</div>
							<!-- /Registrations -->
							
							<!-- password -->
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">비밀번호 변경</h4>
									<div class="registrations-info">
										<div class="row form-row reg-cont">
											<div class="col-12 col-md-5">
												<div class="form-group">
													<label>현재비밀번호</label>
													<input type="password" name="old_pwd" class="form-control">
												</div> 
											</div>
											<div class="col-12 col-md-5">
												<div class="form-group">
													<label>변경비밀번호</label>
													<input type="password" name="chg_pwd" class="form-control">
												</div> 
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<!-- /password -->
							
							<div class="submit-section submit-btn-bottom">
								<button type="submit" class="btn btn-primary submit-btn" value="전송" >변경 저장하기</button>
							</div>
							</form>
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
        <script src="${path}/resources/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="${path}/resources/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>
		
		<!-- Select2 JS -->
		<script src="${path}/resources/assets/plugins/select2/js/select2.min.js"></script>
		
		<!-- Dropzone JS -->
		<script src="${path}/resources/assets/plugins/dropzone/dropzone.min.js"></script>
		
		<!-- Bootstrap Tagsinput JS -->
		<script src="${path}/resources/assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.js"></script>
		
		<!-- Profile Settings JS -->
		<script src="${path}/resources/assets/js/profile-settings.js"></script>
		
		<!-- Custom JS -->
		<script src="${path}/resources/assets/js/script.js"></script>
		
		
		<script>
		var chg_pwd = $("#chg_pwd").val(); 
		var old_pwd = $("#old_pwd").val(); 
		
		$(function(){
			$(".submit-btn").click(function(){
				if(chg_pwd!="" && old_pwd===chg_pwd){
					alert("이전과 같은 비밀번호 입니다.")
					return false
				}else if(old_pwd==""){
					alert("현재 비밀번호를 입력해주세요")
					return false
				}else if(chg_pwd==""){
					alert("수정할 비밀번호를 입력해주세요")
					return false
				}
				$('#doctor-profile-settings').attr("action","setting_ok");
				$("#doctor-profile-settings").attr("enctype", "application/x-www-form-urlencoded");
				$('#doctor-profile-settings').submit();
			})
			
		})
		</script>
		
	</body>
</html>