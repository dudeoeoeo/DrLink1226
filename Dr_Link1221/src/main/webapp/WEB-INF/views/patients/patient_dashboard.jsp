<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmtt" uri="http://java.sun.com/jstl/fmt_rt" %>  
<jsp:useBean id="now" class="java.util.Date"/>
<fmtt:formatDate value="${now}" pattern="yyyy-MM-dd" var="sysdate"/>
<fmtt:formatDate value="${now}" pattern="HHmm" var="sysdateTime"/>
<!DOCTYPE html>
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

			<!-- Profile Sidebar -->
			<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
				<div class="profile-sidebar">
					<div class="widget-profile pro-widget-content">
						<div class="profile-info-widget">
							<a class="booking-doc-img"> <img
								src="${path}/resources/patient/profileImg/${patient_profile.p_photo}"
								class="img-fluid" alt="User Image">
							</a>
							<div class="profile-det-info">
								<h3>${patient_profilep_name }</h3>
								<div class="patient-details">
									<h5>
										<i class="fas fa-birthday-cake"></i> ${patient_profile.birth}
									</h5>
									<h5 class="mb-0">
										<i class="fas fa-map-marker-alt"></i>
										${patient_profile.profileAddress}
									</h5>
								</div>
							</div>
						</div>
					</div>
					<div class="dashboard-widget">
						<nav class="dashboard-menu">
							<ul>
								<li class="active"><a href="patient_dashboard"> <i
										class="fas fa-columns"></i> <span>진료확인</span>
								</a></li>
								<li><a href="#"> <i class="fas fa-bookmark"></i> <span>즐겨찾는
											의사(준비중)</span>
								</a></li>
								<li><a href="profile_settings"> <i
										class="fas fa-user-cog"></i> <span>개인정보 수정</span>
								</a></li>
								<li><a href="patient_change_password"> <i
										class="fas fa-key"></i> <span>비밀번호 수정</span>
								</a></li>
								<li><a href="patient_delete_account"> <i
										class="fas fa-ban"></i> <span>회원탈퇴</span>
								</a></li>
								<li><a href="${path}/logout"> <i
										class="fas fa-sign-out-alt"></i> <span>로그아웃</span>
								</a></li>
							</ul>
						</nav>
					</div>

				</div>
			</div>
			<!-- / Profile Sidebar -->

			<div class="col-md-7 col-lg-8 col-xl-9">
				<div class="card">
					<div class="card-body pt-0">

						<!-- Tab Menu -->
						<nav class="user-tabs mb-4">
							<ul class="nav nav-tabs nav-tabs-bottom nav-justified">
								<li class="nav-item"><a class="nav-link active"
									href="#pat_appointments" data-toggle="tab">예약내역</a></li>
								<li class="nav-item"><a class="nav-link"
									href="#pat_prescriptions" data-toggle="tab">처방내역</a></li>
								<li class="nav-item"><a class="nav-link"
									href="#pat_billing" data-toggle="tab">결제내역</a></li>
							</ul>
						</nav>
						<!-- /Tab Menu -->

						<!-- Tab Content -->
						<div class="tab-content pt-0">

							<!-- Appointment Tab -->
							<div id="pat_appointments" class="tab-pane fade show active">
								<div class="card card-table mb-0">
									<div class="card-body">
										<c:choose>
											<c:when test="${empty bookingList}">
												<p style="margin: 10px; padding: 10px;">아직 정보가 입력되지
													않았습니다.</p>
											</c:when>
											<c:otherwise>
												<div class="table-responsive">
													<table
														class="table table-hover table-center mb-0 text-center">
														<thead>
															<tr class="text-center">
																<th>담당의</th>
																<th>진료일시</th>
																<th>예약일자</th>
																<th>상태</th>
																<th>진료실 입장</th>
															</tr>
														</thead>
														<tbody>
															<!-- start for -->
															<c:forEach var="bookingList" items="${bookingList}" varStatus="status">
															
																<c:set var="recordTimetrim" value="${fn:trim(bookingList.appointment_time)}" />
																<c:set var="recordTimecol" value="${fn:replace(recordTimetrim,':','')}" />
																<c:set var="recordTimeampm" value="${fn:replace(recordTimecol,'AM','')}" />
																<c:set var="recordTime" value="${fn:replace(recordTimeampm,'PM','')}" />
																
																<c:set var="booking_datetrim" value="${fn:trim(bookingList.reg_date)}" />
																<c:set var="bookingDate" value="${fn:substring(booking_datetrim,0,10)}" />
																
																<tr class="text-center">
																	<td>
																		<h2 class="table-avatar">
																			<a
																				href="doctor_profile?doctor_num=${bookingList.doctorDTO.doctor_num }"
																				class="avatar avatar-sm mr-2"> <img
																				class="avatar-img rounded-circle"
																				src="${path}/resources/doctor/doctorImg/${bookingList.doctorDTO.d_photo}"
																				alt="User Image">
																			</a> <a
																				href="doctor_profile?doctor_num=${bookingList.doctorDTO.doctor_num}">Dr.
																				${bookingList.doctorDTO.d_name } <span>${bookingList.departmentDTO.dep_name }</span>
																			</a>
																		</h2>
																	</td>
																	<td>${bookingList.appointment_date}<span
																		class="d-block text-info">${bookingList.appointment_time}</span></td>
																	<td>${bookingDate}</td>
																	<td><span class="badge-pill bg-info-light">예약정상</span>
																		<a class="badge-pill bg-danger-light cancel_booking" href="cancelbooking?appointment_num=${bookingList.appointment_num}">예약취소</a>
																	</td>										
																	<c:choose>
																	<c:when test="${sysdate == bookingList.appointment_date && sysdateTime <= recordTime}">  
																	<%-- <c:when test="${sysdate == '2021-01-08' && sysdateTime <= '1600'}"> --%>
																		<td><a href="https://192.168.0.44:3100/dr_linkVideo">
																			<span class="badge-pill bg-info-light">진료실 입장하기</span>
																		</a></td> 
																	</c:when> 
																	<c:otherwise>																		
																		<td>예약시간이 다가오면 진료실이 열립니다😊</td> 
																	</c:otherwise>
																	</c:choose>
																</tr>
																<!-- / end for -->
															</c:forEach>
														</tbody>
													</table>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<!-- /Appointment Tab -->

							<!-- Prescription Tab -->
							<div class="tab-pane fade" id="pat_prescriptions">
								<div class="card card-table mb-0">
									<div class="card-body">
										<c:choose>
											<c:when test="${empty prescriptionRecord}">
												<p style="margin: 10px; padding: 10px;">아직 정보가 입력되지
													않았습니다.</p>
											</c:when>
											<c:otherwise>
												<div class="table-responsive">
													<table
														class="table table-hover table-center mb-0 text-center">
														<thead>
															<tr class="text-center">
																<th>처방일자</th>
																<th>처방의사</th>
																<th>진료과목</th>
																<th>진료시간</th>
																<th>상세보기</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="prescriptionRecord"
																items="${prescriptionRecord}" varStatus="status">
																
																	<c:set var="prescription_datetrim" value="${fn:trim(prescriptionRecord.prescription_date)}" />
																	<c:set var="precol" value="${fn:substring(prescription_datetrim,0,10)}" />
																<tr>
																	<td>${precol}</td>
																	<td>
																		<h2 class="table-avatar">
																			<a
																				href="doctor_profile?doctor_num=${prescriptionRecord.doctorDTO.doctor_num}"
																				class="avatar avatar-sm mr-2"> <img
																				class="avatar-img rounded-circle"
																				src="${path}/resources/doctor/doctorImg/${prescriptionRecord.doctorDTO.d_photo}"
																				alt="User Image">
																			</a> <a
																				href="doctor_profile?doctor_num=${prescriptionRecord.doctorDTO.doctor_num}">${prescriptionRecord.doctorDTO.d_name}</a>
																		</h2>
																	</td>
																	<td>${prescriptionRecord.doctorDTO.departmentDTO.dep_name}</td>
																	<td>${prescriptionRecord.treatmentRecordDTO.monitoring_time}
																		분</td>
																	<td class="">
																		<div class="table-action">
																			<a
																				href="detail_prescription?prescription_num=${prescriptionRecord.prescription_num}"
																				class="btn btn-sm bg-info-light"> <i
																				class="far fa-eye"></i> View
																			</a>
																		</div>
																	</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<!-- /Prescription Tab -->


							<!-- Billing Tab -->
							<div id="pat_billing" class="tab-pane fade">
								<div class="card card-table mb-0">
									<div class="card-body">
										<c:choose>
											<c:when test="${empty payment_record}">
												<p style="margin: 10px; padding: 10px;">아직 정보가 입력되지
													않았습니다.</p>
											</c:when>
											<c:otherwise>
												<div class="table-responsive">
													<table
														class="table table-hover table-center mb-0 text-center">
														<thead>
															<tr>
																<th>결제번호</th>
																<th>담당의사</th>
																<th>금액</th>
																<th>결제날짜</th>
																<th>상세보기</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="payment_record" items="${payment_record}"
																varStatus="status">
																<tr>
																	<td><a href="invoices">${payment_record.pay_num}</a>
																	</td>
																	<td>
																		<h2 class="table-avatar">
																			<a
																				href="doctor_profile?doctor_num=${payment_record.doctorDTO.doctor_num}"
																				class="avatar avatar-sm mr-2"> <img
																				class="avatar-img rounded-circle"
																				src="${path}/resources/doctor/doctorImg/${payment_record.doctorDTO.d_photo}"
																				alt="User Image">
																			</a> <a
																				href="doctor_profile?doctor_num=${payment_record.doctorDTO.doctor_num}">${payment_record.doctorDTO.d_name}<span>${payment_record.departmentDTO.dep_name}</span></a>
																		</h2>
																	</td>
																	<fmt:parseNumber var="down_price"
																		value="${payment_record.price}" integerOnly="true" />
																	<fmt:formatNumber type="number" maxFractionDigits="3"
																		value="${down_price}" var="down_price" />
																	<td>${down_price}</td>
																	<td>${payment_record.paydate}</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a
																				href="invoices?prescription_num=${payment_record.prescription_num}"
																				class="btn btn-sm bg-info-light"> <i
																				class="far fa-eye"></i> View
																			</a>
																		</div>
																	</td>
																</tr>
															</c:forEach>
															<!--  end for -->
														</tbody>
													</table>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<!-- /Billing Tab -->

						</div>
						<!-- Tab Content -->

					</div>
				</div>
			</div>
		</div>

	</div>

</div>
<!-- /Page Content -->

<script>

$(function(){
	$('a.cancel_booking').click(function (e){
		if(confirm("정말로 예약을 취소하시겠습니까?")){
			
		} else {
			e.preventDefault();
		}
	});
});


/* 
$.ajax({
	url : "/patients/cancelbooking",
	type : "POST",
	data : {
		p_id : $("#p_id").val(),
		p_email : $("#p_email").val()
	},
	success : function(result) {
		alert(result);
	},
}) */




/*location.href='patients/cancelbooking?appointment_num='+appointment_num;


function del(seq) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='delete?seq='+seq;
	}
}	 */
</script>