f<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- Page Content -->
<div class="content">
	<div class="container">

		<!-- Doctor Widget -->
		<div class="card">
			<div class="card-body">
				<div class="doctor-widget">
					<div class="doc-info-left">
						<div class="doctor-img">
							<img
								src="${path}/resources/doctor/doctorImg/${doctor_profile.d_photo}"
								class="img-fluid" alt="User Image">

							<!-- <div class="doctor-action">
											<a href="javascript:void(0)" class="btn btn-white fav-btn" >
												<i class="far fa-bookmark"></i>
											</a> 
										</div> -->
						</div>
						<div class="doc-info-cont">
							<h4 class="doc-name">${doctor_profile.d_name}</h4>
							<p class="doc-speciality">${doctor_profile.departmentDTO.dep_name}</p>
							<p class="doc-department">
								<i class="fa fa-stethoscope" aria-hidden="true"></i>
								${doctor_profile.d_licence}
							</p>
							<div class="rating">
								<c:forEach begin="0" end="4" step="1" varStatus="i">
									<c:choose>
										<c:when test="${reviewList[0].ratingAvg > i.index}">
											<i class="fas fa-star filled"></i>
										</c:when>
										<c:otherwise>
											<i class="fas fa-star"></i>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<span class="d-inline-block average-rating">${fn:length(reviewList)}</span>
							</div>
							<div class="clinic-services">
								<c:choose>
									<c:when test="${empty m[3]}">
								            아직 정보가 입력되지 않았습니다.
								        </c:when>
									<c:otherwise>
										<c:set var="len" value="${fn:length(m[3])}" />
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
							<a href="javascript:void(0)" class="btn btn-white fav-btn"
								style="margin-left: 80% !important; margin-bottom: 30% !important;">
								<i class="far fa-bookmark"></i>
							</a>
						</div>
						<div class="clinic-booking">
							<a class="apt-btn"
								href="${path}/patients/booking?doctor_num=${doctor_profile.doctor_num }">예약하기</a>
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
						<li class="nav-item"><a class="nav-link active"
							href="#doc_overview" data-toggle="tab">소개</a></li>
						<li class="nav-item"><a class="nav-link" href="#doc_reviews"
							data-toggle="tab">후기</a></li>
						<!-- <li class="nav-item">
										<a class="nav-link" href="#doc_business_hours" data-toggle="tab">진료시간</a>
									</li> -->
					</ul>
				</nav>
				<!-- /Tab Menu -->

				<!-- Tab Content -->
				<div class="tab-content pt-0">

					<!-- Overview Content -->
					<div role="tabpanel" id="doc_overview"
						class="tab-pane fade show active">
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
																<c:set var="len" value="${fn:length(m[0])}" />
																<c:forEach begin="0" end="${len-1}" varStatus="status"
																	step="3">
																	<a href="javascript:void(0)" class="name">${m[0][status.index]}</a>
																	<div>${m[0][status.index+1]}</div>
																	<span class="time">${m[0][status.index+2]}</span>
																	<br />
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
																<c:set var="len" value="${fn:length(m[1])}" />
																<c:forEach begin="0" end="${len-1}" varStatus="status"
																	step="3">
																	<a href="javascript:void(0)" class="name">${m[1][status.index]}</a>
																	<div>${m[1][status.index+1]}</div>
																	<br />
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
												<c:set var="len" value="${fn:length(m[3])}" />
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
											작성된 리뷰가 없습니다.
										</c:if>
								<c:forEach var="review" items="${reviewList}">
									<!-- Comment List -->
									<li>
										<div class="comment">
											<img class="avatar avatar-sm rounded-circle" alt="User Image"
												src="${path}/resources/patient/profileImg/${review.patientDTO.p_photo}">
											<div class="comment-body"
												style="width: -webkit-fill-available;">
												<div class="meta-data">
												<input type="hidden" name="review_num" value="${review.review_num}">
												<input type="hidden" name="doctor_num" value="${review.doctor_num}">
												<input type="hidden" name="review_rating" value="${review.review_rating}">
													<span class="comment-author">${review.patientDTO.p_name }</span>
													<span class="comment-date">${review.review_date}</span>
													<div class="review-count rating">
														<c:forEach begin="0" end="4" step="1" varStatus="i">
															<c:choose>
																<c:when test="${review.review_rating > i.index}">
																	<i class="fas fa-star filled"></i>
																</c:when>
																<c:otherwise>
																	<i class="fas fa-star"></i>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</div>
												</div>
												<p class="comment-content">${review.review_content}</p>
												<div class="comment-reply">
													<p class="recommend-btn">
														<span>도움이 되는 후기였나요?</span> <a href="#" class="like-btn">
															<i class="far fa-thumbs-up"></i> 추천
														</a> <a href="#" class="dislike-btn"> <i
															class="far fa-thumbs-down"></i> 비추천
														</a>
													</p>
													<c:if test="${sessionScope.user.patient_num eq review.patient_num}">
														<a class="comment-btn"> <i class="fas fa-pen-fancy"></i><span>수정</span>
														</a>
														<button type="button" class="close comment-btn" aria-label="Close">
														  <span aria-hidden="true">&times;</span>
														</button>
													</c:if>
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
							<c:if test="${not empty sessionScope.user }">
								<h4>후기를 남겨주세요</h4>

								<!-- Write Review Form -->
								<form action="addReview.do" method="post">
									<input type="hidden" name="doctor_num"
										value="${doctor_profile.doctor_num}" />
									<div class="form-group">
										<div class="star-rating">
											<input id="star-5" type="radio" name="review_rating"
												value="5"> <label for="star-5" title="5 stars">
												<i class="active fa fa-star"></i>
											</label> <input id="star-4" type="radio" name="review_rating"
												value="4"> <label for="star-4" title="4 stars">
												<i class="active fa fa-star"></i>
											</label> <input id="star-3" type="radio" name="review_rating"
												value="3"> <label for="star-3" title="3 stars">
												<i class="active fa fa-star"></i>
											</label> <input id="star-2" type="radio" name="review_rating"
												value="2"> <label for="star-2" title="2 stars">
												<i class="active fa fa-star"></i>
											</label> <input id="star-1" type="radio" name="review_rating"
												value="1"> <label for="star-1" title="1 star">
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
										<textarea id="review_desc" maxlength="100"
											class="form-control" name="review_content"></textarea>

										<div class="d-flex justify-content-between mt-3">
											<small class="text-muted"><span id="chars">100</span>
												characters remaining</small>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<div class="terms-accept">
											<div class="custom-checkbox">
												<input type="checkbox" id="terms_accept"> <label
													for="terms_accept">후기를 남기시겠습니까?</label>
											</div>
										</div>
									</div>
									<div class="submit-section">
										<button type="submit" class="btn btn-primary submit-btn">등록</button>
									</div>
								</form>
								<!-- /Write Review Form -->
							</c:if>
							<!-- /Write Review -->
						</div>
					</div>
					<!-- /Reviews Content -->
					<div class="submit-section" style="margin-bottom: 5px; float: right;">
						<a href="search"><button class="btn btn-dark btn-sm">목록</button></a>
						<br>
					</div>
				</div>
			</div>
			<!-- /Doctor Details Tab -->
		</div>
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
								<img alt="User Image"
									src="${path}/resources/doctor/doctorImg/${doctor_profile.d_photo}"
									class="call-avatar">
								<h4>Dr. Darren Elder</h4>
								<span>Connecting...</span>
							</div>
							<div class="call-items">
								<a href="javascript:void(0);" class="btn call-item call-end"
									data-dismiss="modal" aria-label="Close"><i
									class="material-icons">call_end</i></a> <a href="voice-call"
									class="btn call-item call-start"><i class="material-icons">call</i></a>
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
								<img class="call-avatar"
									src="${path}/resources/doctor/doctorImg/${doctor_profile.d_photo}"
									alt="User Image">
								<h4>Dr. Darren Elder</h4>
								<span>Calling ...</span>
							</div>
							<div class="call-items">
								<a href="javascript:void(0);" class="btn call-item call-end"
									data-dismiss="modal" aria-label="Close"><i
									class="material-icons">call_end</i></a> <a href="video-call"
									class="btn call-item call-start"><i class="material-icons">videocam</i></a>
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

<script>
$(function() {
	var uid = '${sessionScope.user.p_name}';

	$('.apt-btn').click(function() {
		if (uid == '' || uid == null) {
			if (confirm("로그인이 필요한 서비스 입니다. \n 지금 로그인 하시겠습니까 ?")) {
				$(this).attr('href', 'login')
			} else {
				$(this).attr('href', '')
			}
		} else if (uid != '' || uid != null) {
		}
	}) // click

	var do_text;
	var doctor_num;
	var review_num;
	var review_rating;
	$('.comment-btn').click(function() {
			// 어떤 요청인지 체크
			do_text = $(this).find('span').text();
			// 수정일 시 textarea에 채울 내용
			var comment_text = $(this).parents('div.comment-body').find('p.comment-content').text();
			// 현재 댓글 번호
			review_num = $('input[name="review_num"]').val();
			doctor_num = $('input[name="doctor_num"]').val();
			review_rating = $('input[name="review_rating"]').val();
			if (do_text == '수정') {
				$('#review_desc').text(comment_text);
				$('input[value="'+review_rating+'"]').prop('checked', true);
			} else if (do_text == '×') {
				if (confirm("정말 삭제하시겠습니까 ?")) {
					delete_repl(review_num, do_text, doctor_num);
				}
			} else {
				if ($(this).find('input[name="repl_num"]')
						.val() != null) {
					review_num = $('input[name="review_num"]').val();
				}
				$('#comments_box').text("");
			}
	}); // click
	
	$('.submit-btn').click(function() {
		if($('#review_desc').val()=="" || $('#review_desc').val()==null){
			alert("내용을 입력해주세요");
			return;
		}else{
		var form = {
			review_content : $('#review_desc').val(),
			review_num : review_num,
			review_rating : review_rating,
			review_handling : do_text,
		};
		alert("form 내용 : " + form);
		alert("수정리뷰번호" + review_num + "현재 요청: " + do_text);
		$.ajax({
			url : "delete_review",
			type : "POST",
			contentType : "application/json; charset=utf-8;",
			async : false,
			dataType : "json",
			data : JSON.stringify(form),
			success : function(data) {
				if (data != null) {
					alert(do_text + data.success);
					location.href(data.url);
				}
			},
			error : function(err) {
				alert(do_text + err);
			}
		}); //ajax
		};//else
		
	}) // click

});

function delete_repl(review_num, do_text, doctor_num) {
	var form = {
		review_num : review_num,
		doctor_num : doctor_num,
		review_handling : do_text
	};
	
	$.ajax({
		url : "delete_review",
		type : "POST",
		data : JSON.stringify(form),
		async : false,
		contentType : "application/json; charset=utf-8;",
		dataType : "json",
		success : function(data) {
			if (data != null) {
				//alert(do_text + data.success);
				location.href = data.url;
			}
		},
		error : function(err) {
			//alert(do_text + err);
		}
	}); //ajax
}
</script>
