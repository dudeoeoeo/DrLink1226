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
	<script>

	$(function(){
		$(".noticemessage").append($(".flag").val());
		
	});
	

	
	$(function(){ 
		$('#old_pwd').blur(function(){
			var old_d_pwd = ${doctorinfo.d_pwd};
			var checked_old_pwd = $("#old_pwd").val(); 
			if(old_d_pwd == checked_old_pwd){
				
			}else{
				$("#old_pwd_check").text("기존 비밀번호와 다릅니다.");
				$('#old_pwd_check').css('color', 'red');
	    	    $('#old_pwd').val('');
	         	$('#old_pwd').focus();
			}
		});
	});
	//비밀번호 유효성 및 중복확인
	$(function(){ 
		$('#d_pwd').blur(function(){
			var chg_pwd = $("#d_pwd").val(); 
			var old_pwd = "${doctorinfo.d_pwd}";
			if(old_pwd == chg_pwd){
				$("#old_pwd_check").text("이전과 같은 비밀번호 입니다.");
				$('#old_pwd_check').css('color', 'red');
	    	    $('#d_pwd').val('');
	         	$('#d_pwd').focus();
		      }else{
				$("#old_pwd_check").text("");
		 	  }
		});
	});
	
	$(function(){ 
		$('#d_pwd2').blur(function(){
			var getPwd = RegExp(/^[a-zA-z0-9]{4,12}$/);
			if(!getPwd.test($("#d_pwd2").val())){
				$("#pwd_check").html("영문 대소문자와 숫자 4~12자리로 입력해야합니다.");
				$('#pwd_check').css('color', 'red');
		        $("#d_pwd").val("");
		        $("#d_pwd2").val("");
		        $("#d_pwd").focus();
		      }else if($('#d_pwd').val() != $('#d_pwd2').val()){
				$("#pwd_check").text("비밀번호가 일치하지 않습니다.");
				$('#pwd_check').css('color', 'red');
	    	    $('#d_pwd2').val('');
	         	$('#d_pwd2').focus();
		      }else{
				$("#pwd_check").text("비밀번호가 일치합니다.");
				$('#pwd_check').css('color', 'green');
		 	  }
		});
	});
	
	</script>
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
											<form action="doctorChangePwd" method="post">
												<div class="form-group">
													<label>현재 비밀번호</label>
													<input type="password" name="old_pwd" id="old_pwd" class="form-control" value="" required>
													<div class="check_font" id="old_pwd_check"></div>
												</div>
												<div class="form-group">
													<label>새 비밀번호</label>
													<input type="password" name="d_pwd" id="d_pwd" class="form-control" required>
												</div>
												<div class="form-group">
													<label>비밀번호 확인</label>
													<input type="password" name="d_pwd2" id="d_pwd2" class="form-control" required>
													<div class="check_font" id="pwd_check"></div>
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
