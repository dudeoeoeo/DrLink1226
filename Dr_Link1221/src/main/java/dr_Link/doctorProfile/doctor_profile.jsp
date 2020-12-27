<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html> 
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>의료진 프로필 - Dr.Link</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
		<!-- Favicons -->
		<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome/css/fontawesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome/css/all.min.css">
		
		<!-- Fancybox CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fancybox/jquery.fancybox.min.css">
		
		<!-- Main CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		
	<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&display=swap" rel="stylesheet">

<style>
body {
    font-family: "Nanum Gothic", sans-serif;
}

.footer-menu{
	color:#fff;
}
</style>
	
	</head>
	<body>

		<!-- Main Wrapper -->
		<div class="main-wrapper">
		
			<!-- Header -->
			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Doctor Profile</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">Doctor Profile</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container">

					<!-- Doctor Widget -->
					<div class="card">
						<div class="card-body">
							<div class="doctor-widget">
								<div class="doc-info-left">
									<div class="doctor-img">
										<img src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-02.jpg" class="img-fluid" alt="User Image">
										
										<!-- <div class="doctor-action">
											<a href="javascript:void(0)" class="btn btn-white fav-btn" >
												<i class="far fa-bookmark"></i>
											</a> 
										</div> -->
									</div>
									<div class="doc-info-cont">
										<h4 class="doc-name">${doctor_profile.d_name}</h4>
										<p class="doc-speciality">${doctor_profile.departmentDTO.dep_name}</p>
										<p class="doc-department"><i class="fa fa-stethoscope" aria-hidden="true"></i> ${doctor_profile.d_licence}</p>
										<div class="rating">
											<i class="fas fa-star filled"></i>
											<i class="fas fa-star filled"></i>
											<i class="fas fa-star filled"></i>
											<i class="fas fa-star filled"></i>
											<i class="fas fa-star"></i>
										</div>
										<div class="clinic-services">
										<c:choose>
								        <c:when test="${empty m[3]}">
								            아직 정보가 입력되지 않았습니다.
								        </c:when> 
										<c:otherwise>
										<c:set var="len" value="${fn:length(m[3])}"/> 
										<c:forEach begin="0" end="${len-1}" varStatus="status">
											<span>${m[3][status.index]}</span>
										</c:forEach>
										</c:otherwise>
										</c:choose>
										</div>
										<div class="clini-infos">
										<!-- <ul>
											<li><i class="far fa-thumbs-up"></i> 99%</li>
											<li><i class="far fa-comment"></i> 35 개의 후기</li>
										</ul> -->
									</div>
									</div>
								</div>
								<div class="doc-info-right">
									
									<div class="doctor-action">
										<!--<a href="javascript:void(0)" class="btn btn-white call-btn"data-toggle="modal" data-target="#video_call">
											<i class="far fa-bookmark"></i>
										</a>
										 <a href="chat" class="btn btn-white msg-btn">
											<i class="far fa-comment-alt"></i>
										</a>
										<a href="javascript:void(0)" class="btn btn-white call-btn" data-toggle="modal" data-target="#voice_call">
											<i class="fas fa-phone"></i>
										</a>-->
										<a href="javascript:void(0)" class="btn btn-white fav-btn" >
											<i class="far fa-bookmark"></i>
										</a> 
									</div>
									<div class="clinic-booking">
										<a class="apt-btn" href="booking">예약하기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /Doctor Widget -->
					
					<!-- Doctor Details Tab -->
					<div class="card">
						<div class="card-body pt-0">
						
							<!-- Tab Menu -->
							<nav class="user-tabs mb-4">
								<ul class="nav nav-tabs nav-tabs-bottom nav-justified">
									<li class="nav-item">
										<a class="nav-link active" href="#doc_overview" data-toggle="tab">소개</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#doc_reviews" data-toggle="tab">후기</a>
									</li>
									<!-- <li class="nav-item">
										<a class="nav-link" href="#doc_business_hours" data-toggle="tab">진료시간</a>
									</li> -->
								</ul>
							</nav>
							<!-- /Tab Menu -->
							
							<!-- Tab Content -->
							<div class="tab-content pt-0">
							
								<!-- Overview Content -->
								<div role="tabpanel" id="doc_overview" class="tab-pane fade show active">
									<div class="row">
										<div class="col-md-12 col-lg-9">
										
											<!-- About Details -->
											<div class="widget about-widget">
												<h4 class="widget-title">About Me</h4>
												<c:choose>
										        <c:when test="${empty m[2]}">
										            아직 정보가 입력되지 않았습니다.
										        </c:when> 
												<c:otherwise>
												<p>${m[2][0]}</p>
												<!-- 여기 아직 jstl 처리 안함!!! -->
												</c:otherwise>
												</c:choose>
											</div>
											<!-- /About Details -->
										
											<!-- Education Details -->
											<div class="widget education-widget">
												<h4 class="widget-title">학력</h4>
												<c:choose>
										        <c:when test="${empty m[0]}">
										            아직 정보가 입력되지 않았습니다.
										        </c:when> 
												<c:otherwise>
												<div class="experience-box">
													<ul class="experience-list">
														<li>
															<div class="experience-user">
																<div class="before-circle"></div>
															</div>
													                
															<div class="experience-content">
																<div class="timeline-content">
																<c:set var="len" value="${fn:length(m[0])}"/> 
																<c:forEach begin="0" end="${len-1}" varStatus="status" step="3">
																	<a href="javascript:void(0)" class="name">${m[0][status.index]}</a>
																	<div>${m[0][status.index+1]}</div>
																	<span class="time">${m[0][status.index+2]}</span>
																	<br/>
																</c:forEach>
																</div>
															</div>
														</li>
													</ul>		
												</div>
												</c:otherwise>
											</c:choose>	
											</div>
											<!-- /Education Details -->
									
											<!-- Experience Details -->
											<div class="widget experience-widget">
												<h4 class="widget-title">경력 및 활동</h4>
												 <c:choose>
											        <c:when test="${empty m[1]}">
											            아직 정보가 입력되지 않았습니다.
											        </c:when> 
													<c:otherwise>
												<div class="experience-box">
													<ul class="experience-list">
												          <li>
															<div class="experience-user">
																<div class="before-circle"></div>
															</div>
															<div class="experience-content">
																<div class="timeline-content">
																<c:set var="len" value="${fn:length(m[1])}"/> 
																<c:forEach begin="0" end="${len-1}" varStatus="status" step="2">
																	<a href="javascript:void(0)" class="name">${m[1][status.index]}</a>
																	<div>${m[1][status.index+1]}</div>
																	<br/>
																</c:forEach>
																</div>
															</div>
														</li>												
													</ul>	
												</div>
												</c:otherwise>
												</c:choose>	
											</div>
											<!-- /Experience Details -->
								
											<!-- Services List -->
											<div class="service-list">
												<h4>진료분야</h4>
												<c:choose>
										        <c:when test="${empty m[3]}">
										            아직 정보가 입력되지 않았습니다.
										        </c:when> 
												<c:otherwise>
												<ul class="clearfix">
												<c:set var="len" value="${fn:length(m[3])}"/> 
												<c:forEach begin="0" end="${len-1}" varStatus="status">
												<li>${m[3][status.index]}</li>
												</c:forEach>
												</ul>
												</c:otherwise>
												</c:choose>
												
											</div>
											<!-- /Services List -->

										</div>
									</div>
								</div>
								<!-- /Overview Content -->
								
								<!-- Reviews Content -->
								<div role="tabpanel" id="doc_reviews" class="tab-pane fade">
								
									<!-- Review Listing -->
								<div class="widget review-listing">
									<ul class="comments-list">
										<c:if test="${empty reviewList }">
											댓글이 없습니다.
										</c:if>
										<c:forEach var="review" items="${reviewList}">
										<!-- Comment List -->
										<li>
											<div class="comment">
												<img class="avatar avatar-sm rounded-circle" alt="User Image" src="${path}/resources/assets/img/patients/${review.patientDTO.p_imgfile}">
												<div class="comment-body">
													<div class="meta-data">
														<span class="comment-author">${review.patientDTO.p_name }</span>
														<span class="comment-date">${review.review_date}</span>
														<div class="review-count rating">
															<c:forEach begin="1" end="5" step="1" varStatus="i">
																<c:choose>
																	<c:when test="${review.review_rating ge i}">
																		<i class="fas fa-star filled"></i>	
																	</c:when>
																	<c:otherwise>
																		<i class="fas fa-star"></i>
																	</c:otherwise>
																</c:choose>	
															</c:forEach>
														</div>
													</div>
													<p class="comment-content">
														${review.content}
													</p>
													<div class="comment-reply">
														<p class="recommend-btn">
															<span>Recommend?</span>
															<a href="#" class="like-btn">
																<i class="far fa-thumbs-up"></i> Yes
															</a>
															<a href="#" class="dislike-btn">
																<i class="far fa-thumbs-down"></i> No
															</a>
														</p>
													</div>
												</div>
											</div>
										</li>
										<!-- /Comment List -->
										</c:forEach>
									</ul>
									
									<!-- Show All -->
									<!-- <div class="all-feedback text-center">
										<a href="#" class="btn btn-primary btn-sm">
											Show all feedback <strong>(167)</strong>
										</a>
									</div> -->
									<!-- /Show All -->
									
								</div>
									
									<!-- /Review Listing -->
								
									<!-- Write Review -->
									<div class="write-review">
										<h4>후기를 남겨주세요</h4>
										
										<!-- Write Review Form -->
										<form>
											<div class="form-group">
												<div class="star-rating">
													<input id="star-5" type="radio" name="rating" value="star-5">
													<label for="star-5" title="5 stars">
														<i class="active fa fa-star"></i>
													</label>
													<input id="star-4" type="radio" name="rating" value="star-4">
													<label for="star-4" title="4 stars">
														<i class="active fa fa-star"></i>
													</label>
													<input id="star-3" type="radio" name="rating" value="star-3">
													<label for="star-3" title="3 stars">
														<i class="active fa fa-star"></i>
													</label>
													<input id="star-2" type="radio" name="rating" value="star-2">
													<label for="star-2" title="2 stars">
														<i class="active fa fa-star"></i>
													</label>
													<input id="star-1" type="radio" name="rating" value="star-1">
													<label for="star-1" title="1 star">
														<i class="active fa fa-star"></i>
													</label>
												</div>
											</div>
											<!-- <div class="form-group">
												<label>Title of your review</label>
												<input class="form-control" type="text" placeholder="If you could say it in one sentence, what would you say?">
											</div> -->
											<div class="form-group">
												<label>후기</label>
												<textarea id="review_desc" maxlength="100" class="form-control"></textarea>
											  
											  <div class="d-flex justify-content-between mt-3"><small class="text-muted"><span id="chars">100</span> characters remaining</small></div>
											</div>
											<hr>
											<div class="form-group">
												<div class="terms-accept">
													<div class="custom-checkbox">
													   <input type="checkbox" id="terms_accept">
													   <label for="terms_accept">후기를 남기시겠습니까?</label>
													</div>
												</div>
											</div>
											<div class="submit-section">
												<button type="submit" class="btn btn-primary submit-btn">등록</button>
											</div>
										</form>
										<!-- /Write Review Form -->
										
									</div>
									<!-- /Write Review -->
						
								</div>
								<!-- /Reviews Content -->
							</div>
						</div>
					</div>
					<!-- /Doctor Details Tab -->

				</div>
			</div>		
			<!-- /Page Content -->
   
		   
		</div>
		<!-- /Main Wrapper -->
		
		<!-- Voice Call Modal -->
		<div class="modal fade call-modal" id="voice_call">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<!-- Outgoing Call -->
						<div class="call-box incoming-box">
							<div class="call-wrapper">
								<div class="call-inner">
									<div class="call-user">
										<img alt="User Image" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-02.jpg" class="call-avatar">
										<h4>Dr. Darren Elder</h4>
										<span>Connecting...</span>
									</div>							
									<div class="call-items">
										<a href="javascript:void(0);" class="btn call-item call-end" data-dismiss="modal" aria-label="Close"><i class="material-icons">call_end</i></a>
										<a href="voice-call" class="btn call-item call-start"><i class="material-icons">call</i></a>
									</div>
								</div>
							</div>
						</div>
						<!-- Outgoing Call -->

					</div>
				</div>
			</div>
		</div>
		<!-- /Voice Call Modal -->
		
		<!-- Video Call Modal -->
		<div class="modal fade call-modal" id="video_call">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-body">
					
						<!-- Incoming Call -->
						<div class="call-box incoming-box">
							<div class="call-wrapper">
								<div class="call-inner">
									<div class="call-user">
										<img class="call-avatar" src="${pageContext.request.contextPath}/resources/img/doctors/doctor-thumb-02.jpg" alt="User Image">
										<h4>Dr. Darren Elder</h4>
										<span>Calling ...</span>
									</div>							
									<div class="call-items">
										<a href="javascript:void(0);" class="btn call-item call-end" data-dismiss="modal" aria-label="Close"><i class="material-icons">call_end</i></a>
										<a href="video-call" class="btn call-item call-start"><i class="material-icons">videocam</i></a>
									</div>
								</div>
							</div>
						</div>
						<!-- /Incoming Call -->
						
					</div>
				</div>
			</div>
		</div>
		<!-- Video Call Modal -->
		
		<!-- jQuery -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JS -->
		<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		
		<!-- Fancybox JS -->
		<script src="${pageContext.request.contextPath}/resources/plugins/fancybox/jquery.fancybox.min.js"></script>
		
		<!-- Custom JS -->
		<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
		
	</body>
</html>