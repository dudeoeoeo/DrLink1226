<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>의사마이페이지 - Dr.Link</title>
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

<!-- Select2 CSS -->
<link rel="stylesheet"
	href="${path}/resources/assets/plugins/select2/css/select2.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${path}/resources/assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css">

<link rel="stylesheet"
	href="${path}/resources/assets/plugins/dropzone/dropzone.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="${path}/resources/assets/css/style.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
			<script src="${path}/resources/assets/js/html5shiv.min.js"></script>
			<script src="${path}/resources/assets/js/respond.min.js"></script>
		<![endif]-->

<script>
	//업로드 이미지 미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
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
								<li class="breadcrumb-item active" aria-current="page">내 정보
									수정</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">내 정보 수정</h2>
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
										<li><a href="my_patients"> <i
												class="fas fa-user-injured"></i> <span>나의 환자</span>
										</a></li>
										<li><a href="reviews"> <i class="fas fa-star"></i> <span>나의
													후기</span>
										</a></li>
										<li><a href="chat"> <i class="fas fa-comments"></i> <span>메세지</span>
												<small class="unread-msg">23</small>
										</a></li>
										<li class="active"><a href="doctor_profile_settings"> <i
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
						<!-- Basic Information -->
						<form action="setting_ok" method="post" enctype="multipart/form-data">
							<input type="hidden" value="${doctorinfo.doctor_num}" name="doctor_num">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">기본 정보</h4>
									<div class="row form-row">
										<div class="col-md-12">
											<div class="form-group">
												<div class="change-avatar">
													<div class="profile-img">
														<img id="blah"src="${path}/resources/doctor/doctorImg/${doctorinfo.d_photo}" alt="프로필 사진">
														<input type="hidden" name="d_photo" value="${doctorinfo.d_photo}">
													</div>
													<div class="upload-img">
														<div class="change-photo-btn">
															<span><i class="fa fa-upload"></i> 사진 첨부</span> <input
																type="file" class="upload" id="file" name="file"
																onchange="readURL(this);">
														</div>
														<small class="form-text text-muted">JPG, GIF, PNG만
															허용됩니다. 최대 사이즈 2MB</small>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>아이디</label> <input type="text" class="form-control"
													name="d_id" readonly value="${doctorinfo.d_id}"> <input
													type="hidden" class="form-control" name="doctor_num"
													value="${doctorinfo.doctor_num}">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>이메일<span class="text-danger">*</span></label> <input
													type="email" class="form-control" name="d_email" maxlength="50"
													value="${doctorinfo.d_email}" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>이름</label> <input
													type="text" class="form-control" name="d_name"
													value="${doctorinfo.d_name}" readonly>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>휴대전화<span class="text-danger">*</span></label> <input
													type="text" class="form-control" name="d_phone_num" maxlength="11"
													value="${doctorinfo.d_phone_num}" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>성별</label>
												<c:choose>
													<c:when test="${doctorinfo.d_gender eq '1'}">
														<input type="text" class="form-control" readonly
															value="남성">
														<input type="hidden" class="form-control" name="d_gender"
															readonly value="${doctorinfo.d_gender}">
													</c:when>
													<c:when test="${doctorinfo.d_gender eq '2'}">
														<input type="text" class="form-control" readonly
															value="여성">
														<input type="hidden" class="form-control" name="d_gender"
															readonly value="${doctorinfo.d_gender}">
													</c:when>
												</c:choose>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group mb-0">
												<label>생년월일</label> <input type="text" class="form-control"
													name="d_jumin_num" readonly
													value="${doctorinfo.d_jumin_num}">
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Basic Information -->

							<!-- About Me -->
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">자기소개</h4>
									<div class="form-group mb-0">
										<textarea class="form-control" rows="5" name="d_content">${doctorinfo.d_content}</textarea>
									</div>
								</div>
							</div>
							<!-- /About Me -->

							<!-- Services and Specialization -->
							<div class="card services-card">
								<div class="card-body">
									<h4 class="card-title">진료과목<span class="text-danger">*</span></h4>
									<div class="form-group mb-0">
										<label>전문진료분야</label> <input class="input-tags form-control"
											type="text" data-role="tagsinput" placeholder="진료분야를 입력하세요."
											name="d_field" value="${doctorinfo.d_field}" id="specialist">
										<small class="form-text text-muted">알림 : 새로운 진료과목을
											추가하시려면 엔터를 누르세요.</small>
									</div>
								</div>
							</div>
							<!-- /Services and Specialization -->

							<!-- Education -->
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">
										학력<span class="text-danger">*</span>
									</h4>
									<div class="education-info">
										<div class="row form-row education-cont">
											<div class="col-12 col-md-10 col-lg-11">
												<div class="row form-row">
													<c:set var="len" value="${fn:length(m[0])}" />
													<c:if test="${len gt 0 }">
														<c:forEach begin="0" end="${len-1}" varStatus="status"
															step="3">
															<div class="col-12 col-md-6 col-lg-4">
																<div class="form-group">
																	<label>출신대학</label> <input type="text"
																		class="form-control" name="d_graduation"
																		value="${m[0][status.index]}" required>
																</div>
															</div>
															<div class="col-12 col-md-6 col-lg-4">
																<div class="form-group">
																	<label>학과</label> <input type="text"
																		class="form-control" name="d_graduation"
																		value="${m[0][status.index+1]}" required>
																</div>
															</div>
															<div class="col-12 col-md-6 col-lg-4">
																<div class="form-group">
																	<label>졸업년도</label> <input type="text"
																		class="form-control" name="d_graduation"
																		value="${m[0][status.index+2]}" required>
																</div>
															</div>
														</c:forEach>
													</c:if>
												</div>
											</div>
										</div>
									</div>
									<div class="add-more">
										<a href="javascript:void(0);" class="add-education"><i
											class="fa fa-plus-circle"></i> 추가하기</a>
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

													<c:set var="len" value="${fn:length(m[1])}" />
													<c:if test="${len gt 0 }">
														<c:forEach begin="0" end="${len-1}" varStatus="status"
															step="3">
															<div class="col-12 col-md-6 col-lg-4">
																<div class="form-group">
																	<label>병원이름</label> <input type="text"
																		class="form-control" name="d_career"
																		value="${m[1][status.index]}">
																</div>
															</div>
															<div class="col-12 col-md-6 col-lg-4">
																<div class="form-group">
																	<label>직함</label> <input type="text"
																		class="form-control" name="d_career"
																		value="${m[1][status.index+1]}">
																</div>
															</div>
															<div class="col-12 col-md-6 col-lg-4">
																<div class="form-group">
																	<label>활동년도</label> <input type="text"
																		class="form-control" name="d_career"
																		value="${m[1][status.index+2]}">
																</div>
															</div>
														</c:forEach>
													</c:if>
												</div>
											</div>
										</div>
									</div>
									<div class="add-more">
										<a href="javascript:void(0);" class="add-experience"><i
											class="fa fa-plus-circle"></i>추가하기</a>
									</div>
								</div>
							</div>
							<!-- /Experience -->


							<!-- Registrations -->



							<div class="card">
								<div class="card-body">
									<h4 class="card-title">
										면허정보<span class="text-danger">*</span>
									</h4>
									<div class="registrations-info">
										<div class="row form-row reg-cont">
											<div class="col-12 col-md-10 col-lg-11">
												<div class="row form-row">

													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label class="">진료과</label> <select id="dep_num"
																name="dep_num" class="form-control" required>
																<c:choose>
																	<c:when test="${doctorinfo.dep_num eq '10'}">
																		<option value="${doctorinfo.dep_num}"
																			selected="selected">안과</option>
																		<option value="20">피부과</option>
																		<option value="30">정신건강의학과</option>
																	</c:when>
																	<c:when test="${doctorinfo.dep_num eq '20'}">
																		<option value="${doctorinfo.dep_num}"
																			selected="selected">피부과</option>
																		<option value="10">안과</option>
																		<option value="30">정신건강의학과</option>
																	</c:when>
																	<c:otherwise>
																		<option value="${doctorinfo.dep_num}"
																			selected="selected">정신건강의학과</option>
																		<option value="10">안과</option>
																		<option value="20">피부과</option>
																	</c:otherwise>
																</c:choose>
															</select>
														</div>
													</div>

													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label class="">전공과목</label> <select id="d_licence"
																name="d_licence" class="form-control" required>
																<option value="${doctorinfo.d_licence}"
																	selected="selected">${doctorinfo.d_licence}</option>
																<option value="가정의학과">가정의학과</option>
																<option value="결핵과">결핵과</option>
																<option value="내과">내과</option>
																<option value="방사선종양학과">방사선종양학과</option>
																<option value="병리과">병리과</option>
																<option value="비뇨기과">비뇨기과</option>
																<option value="마취통증의학과">마취통증의학과</option>
																<option value="산부인과">산부인과</option>
																<option value="소아청소년외과">소아청소년외과</option>
																<option value="성형외과">성형외과</option>
																<option value="신경과">신경과</option>
																<option value="신경외과">신경외과</option>
																<option value="안과">안과</option>
																<option value="영상의학과">영상의학과</option>
																<option value="예방의학과">예방의학과</option>
																<option value="외과">외과</option>
																<option value="응급의학과">응급의학과</option>
																<option value="이비인후과">이비인후과</option>
																<option value="작업환경의학과">작업환경의학과</option>
																<option value="재활의학과">재활의학과</option>
																<option value="정신건강의학과">정신건강의학과</option>
																<option value="정형외과">정형외과</option>
																<option value="진단검사의학과">진단검사의학과</option>
																<option value="피부과">피부과</option>
																<option value="핵의학과">핵의학과</option>
																<option value="흉부외과">흉부외과</option>
																<option value="일반외과">일반외과</option>
																<option value="기타">기타</option>
															</select>
														</div>
													</div>
													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label class="">면허번호</label> <input id="d_licence_num"
																name="d_licence_num" class="form-control" maxlength="30"
																value="548732155485" type="text"
																placeholder="면허번호를 입력해주세요." required />
															<div class="check_font" id="d_licence_num"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Registrations -->
							<div class="submit-section submit-btn-bottom">
								<button type="submit" class="btn btn-primary submit-btn"
									value="전송">변경 저장하기</button>
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
	<script
		src="${path}/resources/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
	<script
		src="${path}/resources/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

	<!-- Select2 JS -->
	<script
		src="${path}/resources/assets/plugins/select2/js/select2.min.js"></script>

	<!-- Dropzone JS -->
	<script src="${path}/resources/assets/plugins/dropzone/dropzone.min.js"></script>

	<!-- Bootstrap Tagsinput JS -->
	<script
		src="${path}/resources/assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.js"></script>

	<!-- Profile Settings JS -->
	<script src="${path}/resources/assets/js/profile-settings.js"></script>

	<!-- Custom JS -->
	<script src="${path}/resources/assets/js/script.js"></script>



</body>
</html>