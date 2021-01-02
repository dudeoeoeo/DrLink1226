<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Breadcrumb -->
<div class="breadcrumb-bar">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-md-12 col-12">
				<nav aria-label="breadcrumb" class="page-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${path }">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">마이페이지</li>
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
							<a class="booking-doc-img"> <img
								src="${path}/resources/doctor/doctorImg/${sessionScope.doctor.d_photo}"
								class="img-fluid" alt="User Image">
							</a>
							<div class="profile-det-info">
								<h3>${sessionScope.doctor.d_name}의사</h3>

								<div class="patient-details">
									<h5 class="mb-0">${sessionScope.doctor.departmentDTO.dep_name}</h5>
								</div>
							</div>
						</div>
					</div>
					<div class="dashboard-widget">
						<nav class="dashboard-menu">
							<ul>
								<li class="active"><a href="doctor_dashboard"> <i
										class="fas fa-columns"></i> <span>Dashboard</span>
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
								<li><a href="#"> <i class="fas fa-comments"></i> <span>메세지</span>
										<small class="unread-msg">23</small>
								</a></li>
								<li><a href="doctor_profile_settings"> <i
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

				<div class="row">
					<div class="col-md-12">
						<div class="card dash-card">
							<div class="card-body">
								<div class="row">
									<div class="col-md-12 col-lg-4">
										<div class="dash-widget dct-border-rht">
											<div class="circle-bar circle-bar1">
												<div class="circle-graph1"
													data-percent="${allCnt.total_cnt}">
													<img src="${path}/resources/assets/img/icon-01.png"
														class="img-fluid" alt="patient">
												</div>
											</div>
											<div class="dash-widget-info">
												<h6>전체 환자 수</h6>
												<h3>${allCnt.total_cnt}</h3>
												<p class="text-muted">오늘까지</p>
											</div>
										</div>
									</div>

									<div class="col-md-12 col-lg-4">
										<div class="dash-widget dct-border-rht">
											<div class="circle-bar circle-bar2">
												<div class="circle-graph2"
													data-percent="${allCnt.today_cnt}">
													<img src="${path}/resources/assets/img/icon-02.png"
														class="img-fluid" alt="Patient">
												</div>
											</div>
											<div class="dash-widget-info">
												<h6>오늘 환자 수</h6>
												<h3>${allCnt.today_cnt}</h3>
												<p class="text-muted today_text"></p>
											</div>
										</div>
									</div>

									<div class="col-md-12 col-lg-4">
										<div class="dash-widget">
											<div class="circle-bar circle-bar3">
												<div class="circle-graph3" data-percent="${allCnt.tomo_cnt}">
													<img src="${path}/resources/assets/img/icon-03.png"
														class="img-fluid" alt="Patient">
												</div>
											</div>
											<div class="dash-widget-info">
												<h6>내일 예약 수</h6>
												<h3>${allCnt.tomo_cnt}</h3>
												<p class="text-muted tomorrow_text"></p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<h4 class="mb-4">환자 예약현황</h4>
						<div class="appointment-tab">

							<!-- Appointment Tab -->
							<ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded">
								<li class="nav-item"><a class="nav-link active"
									href="#upcoming-appointments" data-toggle="tab">다가오는 예약</a></li>
								<li class="nav-item"><a class="nav-link"
									href="#today-appointments" data-toggle="tab">내일의 예약</a></li>
							</ul>
							<!-- /Appointment Tab -->

							<div class="tab-content">
								<!-- Upcoming Appointment Tab -->
								<div class="tab-pane show active" id="upcoming-appointments">
									<div class="card card-table mb-0">
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-hover table-center mb-0  text-center">
													<thead>
														<tr>
															<th>환자</th>
															<th>예약시간</th>
															<th>성별</th>
															<th>구분</th>
															<th>비고</th>
														</tr>
													</thead>
													<tbody>
														<c:set var="index" value="0" />
														<c:forEach var="dash" items="${dashList}"
															varStatus="status">
															<c:if test="${status.index lt cnt }">
																<tr>
																	<td>
																		<h2 class="table-avatar">
																			<a class="avatar avatar-sm mr-2"> <img
																				class="avatar-img rounded-circle"
																				src="${path}/resources/patient/profileImg/${dash.patients[index].p_photo}"
																				alt="User Image"></a>
																			${dash.patients[index].p_name }
																		</h2>
																	</td>
																	<td>${dash.appointment_date}<span
																		class="d-block text-info">${dash.appointment_time}</span></td>
																	<c:choose>
																		<c:when test="${dash.patients[index].p_gender eq '1'}">
																			<td><i class="fas fa-mars" style="color: blue;"></i></td>
																		</c:when>
																		<c:when test="${dash.patients[index].p_gender eq '2'}">
																			<td><i class="fas fa-mars" style="color: pink;"></i></td>
																		</c:when>
																	</c:choose>
																	<td><c:choose>
																			<c:when test="${!empty afterTreat }">
																				<c:forEach var="at" items="${afterTreat}">
																					<c:if
																						test="${at.appointment_num eq dash.appointment_num}">
                                                                  재방문 환자
                                                               </c:if>
																				</c:forEach>
																			</c:when>
																			<c:when
																				test="${at.appointment_num ne dash.appointment_num}">
                                                            새로 온 환자
                                                         </c:when>
																		</c:choose></td>
																	<td class="text-right">
																		<%-- <div class="appointment-action">
																			<a href="#"
																				class="btn btn-sm bg-info-light btn_today"
																				data-toggle="modal"
																				data-target="#appt_details_today${status.count }">
																				<input type="hidden" name="detail_num"
																				value="${status.count}"> <i
																				class="far fa-eye"></i> 상세보기
																			</a>
																		</div> --%>알러지여부:<c:choose>
																			<c:when test='${dash.patients[index].allergy eq "1"}'>
																				<mark>있음</mark>
																			</c:when>
																			<c:otherwise>
																				<mark>없음</mark>
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>

								<!-- Blog Pagination -->
								<div class="row">
									<div class="col-md-12">
										<div class="blog-pagination">
											<nav>
												<ul class="pagination justify-content-center">
													<li class="page-item disabled"><a class="page-link"
														href="#" tabindex="-1"><i
															class="fas fa-angle-double-left"></i></a></li>
													<li class="page-item"><a class="#" href="#"></a></li>
													<li class="page-item"><a class="page-link" href="#"><i
															class="fas fa-angle-double-right"></i></a></li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
								<!-- /Blog Pagination -->
								<!-- /Upcoming Appointment Tab -->
								<%-- <c:when test="${fn:length(addresses) gt 0}"> --%>

								<!-- Today Appointment Tab -->
								<div class="tab-pane" id="today-appointments">
									<div class="card card-table mb-0">
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-hover table-center mb-0 text-center">
													<thead>
														<tr>
															<th>환자</th>
															<th>예약시간</th>
															<th>성별</th>
															<th>구분</th>
															<th>비고</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="dash" items="${dashList}"
															varStatus="status">
															<c:if test="${status.index ge cnt }">
																<tr>
																	<td>
																		<h2 class="table-avatar">
																			<a class="avatar avatar-sm mr-2"><img
																				class="avatar-img rounded-circle"
																				src="${path}/resources/patient/profileImg/${dash.patients[index].p_photo}"
																				alt="User Image"></a>
																			${dash.patients[index].p_name }
																		</h2>
																	</td>
																	<td>${dash.appointment_date}<span
																		class="d-block text-info">${dash.appointment_time}</span></td>
																	<c:choose>
																		<c:when test="${dash.patients[index].p_gender eq '1'}">
																			<td><i class="fas fa-mars" style="color: blue;"></i></td>
																		</c:when>
																		<c:when test="${dash.patients[index].p_gender eq '2'}">
																			<td><i class="fas fa-mars" style="color: pink;"></i></td>
																		</c:when>
																	</c:choose>
																	<td><c:choose>
																			<c:when test="${!empty afterTreat }">
																				<c:forEach var="at" items="${afterTreat}">
																					<c:if
																						test="${at.appointment_num eq dash.appointment_num}">
                                                                     재방문 환자
                                                                  </c:if>
																				</c:forEach>
																			</c:when>
																			<c:when
																				test="${at.appointment_num ne dash.appointment_num}">
                                                               새로 온 환자
                                                            </c:when>
																		</c:choose></td>
																	<td>알러지여부:
																		<c:choose>
																			<c:when test='${dash.patients[index].allergy eq "1"}'>
																				<mark>있음</mark>
																			</c:when>
																			<c:otherwise>
																				<mark>없음</mark>
																			</c:otherwise>
																		</c:choose></td>
																</tr>

															</c:if>
														</c:forEach>
													</tbody>

												</table>
											</div>
										</div>
									</div>
								</div>
								<!-- Blog Pagination -->
								<div class="row">
									<div class="col-md-12">
										<div class="blog-pagination">
											<nav>

												<ul class="pagination justify-content-center">
													<li class="page-item disabled"><a class="page-link"
														href="#" tabindex="-1"><i
															class="fas fa-angle-double-left"></i></a></li>

													<c:forEach begin="1" end="${p_num}" var="p">
														<li class="page-item"><a class="page-link"
															href="health-blog?d_page=${p}">${p}</a></li>
													</c:forEach>

													<li class="page-item"><a class="page-link" href="#"><i
															class="fas fa-angle-double-right"></i></a></li>
												</ul>

											</nav>
										</div>
									</div>
								</div>
								<!-- /Blog Pagination -->

								<!-- /Today Appointment Tab -->

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>

</div>


<!-- /Page Content -->


<!-- Appointment Details Modal today -->
<c:forEach varStatus="status" items="${dashList}" var="dash">
	<c:if test="${status.index lt cnt }">
		<div class="modal fade custom-modal"
			id="appt_details_today${status.count }">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">예약 상세내역</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<ul class="info-details">
							<li>
								<div class="details-header">
									<div class="row">
										<div class="col-md-6">
											<span class="title">진료일정</span> <span class="text">${dash.appointment_time }</span>
										</div>
										<!-- <div class="col-md-6">
                                 <div class="text-right">
                                    <button type="button" class="btn bg-success-light btn-sm" id="topup_status">Completed</button>
                                 </div>
                              </div> -->
									</div>
								</div>
							</li>
							<li><span class="title">환자이름:</span> <span class="text">${dash.patients[index].p_name}</span>
							</li>
							<li><span class="title">환자성별:</span> <span class="text">${dash.patients[index].p_gender}</span>
							</li>
							<li><span class="title">알러지여부:</span> <c:choose>
									<c:when test='${dash.patients[index].allergy eq "1"}'>
										<span class="text">있음</span>
									</c:when>
									<c:otherwise>
										<span class="text">없음</span>
									</c:otherwise>
								</c:choose></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</c:forEach>
<!-- /Appointment Details Modal -->



<!-- Appointment Details Modal tomorrow -->
<c:forEach varStatus="status" items="${dashList}" var="dash">
	<c:if test="${status.index ge cnt }">
		<div class="modal fade custom-modal" id="appt_details${status.count }">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">예약 상세내역</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<ul class="info-details">
							<li>
								<div class="details-header">
									<div class="row">
										<div class="col-md-6">
											<span class="title">진료일정</span> <span class="text">${dash.appointment_time }</span>
										</div>
										<!-- <div class="col-md-6">
                                 <div class="text-right">
                                    <button type="button" class="btn bg-success-light btn-sm" id="topup_status">Completed</button>
                                 </div>
                              </div> -->
									</div>
								</div>
							</li>
							<li><span class="title">환자이름:</span> <span class="text">${dash.patients[index].p_name}</span>
							</li>
							<li><span class="title">환자성별:</span> <span class="text">${dash.patients[index].p_gender}</span>
							</li>
							<li><span class="title">알러지여부:</span> <c:choose>
									<c:when test='${dash.patients[index].allergy eq "1"}'>
										<span class="text">있음</span>
									</c:when>
									<c:otherwise>
										<span class="text">없음</span>
									</c:otherwise>
								</c:choose></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</c:forEach>
<!-- /Appointment Details Modal -->



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

<!-- Circle Progress JS -->
<script src="${path}/resources/assets/js/circle-progress.min.js"></script>

<!-- Custom JS -->
<script src="${path}/resources/assets/js/script.js"></script>


<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript">
	$(function() {
		// 날짜 출력
		var today = new Date();
		var tomorrow = new Date();
		tomorrow.setDate(tomorrow.getDate() + 1)

		$('.blog-pagination').eq(1).css({
			'display' : 'none'
		});

		$('.nav-link').eq(1).click(function() {
			$('.blog-pagination').eq(0).css({
				'display' : 'block'
			});
			$('.blog-pagination').eq(1).css({
				'display' : 'none'
			});
		}) // click

		$('.nav-link').eq(2).click(function() {
			$('.blog-pagination').eq(0).css({
				'display' : 'none'
			});
			$('.blog-pagination').eq(1).css({
				'display' : 'block'
			});
		}) // click

		$('p.today_text').text(moment(today).format('YYYY-MM-DD'));
		$('p.tomorrow_text').text(moment(tomorrow).format('YYYY-MM-DD'));

		$('.btn_today').click(function() {
			var idx = $(this).find('input[name="detail_num"]').val();
			//$("#appt_details_today"+idx).modal();
			$(this).attr('data-target', '#appt_details_today' + idx)
		}) // click

		$('.btn_tomorrow').click(function() {
			var idx = $(this).find('input[name="detail_num"]').val();
			$(this).attr('data-target', '#appt_details' + idx)
		}) // click
	}) // ready
</script>

</body>
</html>