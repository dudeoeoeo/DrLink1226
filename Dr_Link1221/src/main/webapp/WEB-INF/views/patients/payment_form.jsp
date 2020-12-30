<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

		
			<!-- Page Content -->
			<div class="content">
				<div class="container">

					<div class="row">
						<div class="col-md-7 col-lg-8">
							<div class="card">
								<div class="card-body">
									<!-- Checkout Form -->
									
										<input type="hidden" name="prescription_num" id="prescription_num" value="${pre_num}">
										<input type="hidden" name="payment_check" value="1">
										<div class="payment-widget">
											<h4 class="card-title">결제</h4>

											
											<!-- Credit Card Payment -->
											<div class="payment-list">
												<label class="payment-radio credit-card-option">
													<input type="radio" name="radio" checked>
													<span class="checkmark"></span>
													카드결제
												</label>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group card-label">
															<label for="card_name">카드에 명시된 이름</label>
															<input class="form-control" id="card_name" name="card_name"  type="text" value="김다다">
															
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group card-label">
															<label for="card_num">카드 번호</label>
															<input class="form-control" id="card_num" name="card_num"  placeholder="ex) 1234  5678  9876  5432" type="text" value="1234567898765432">
														</div>
													</div>
													
													<div class="col-md-4">
														<div class="form-group card-label">
															<label for="card_month">카드 유효기간</label>
															<input class="form-control" id="card_month" name="card_month"  placeholder="월 ex) 10" type="text" value="10">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group card-label">
															<label for="card_year">카드 유효기간</label>
															<input class="form-control" id="card_year"  name="card_year" placeholder="년 ex) 24" type="text" value="10">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group card-label">
															<label for="card_month">만료일</label>
															<input class="form-control" id="card_month" name="cdata"  placeholder="ex) 2025" type="text" value="2025">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group card-label">
															<label for="card_cvv">CVV</label>
															<input class="form-control" id="card_cvv" name="card_cvv" placeholder="카드 뒷면 참고 ex) 654" type="text" value="654">
														</div>
													</div>
												</div>
											</div>
											<!-- /Credit Card Payment -->
											  
											<!-- Paypal Payment -->
											<!--
											<div class="payment-list">
												<label class="payment-radio paypal-option">
													<input type="radio" name="radio">
													<span class="checkmark"></span>
													Paypal
												</label>
											</div>
											-->
											<!-- /Paypal Payment -->
											
											<!-- Terms Accept -->
											<div class="terms-accept">
												<div class="custom-checkbox">
												   <input type="checkbox" id="terms_accept_1" name="terms_accept_1" >
												   <label for="terms_accept">결제 내용을 확인하였으며 <a href="#">위 내용에 </a><span>동의합니다.</span></label>
												</div>
											</div>
											<!-- /Terms Accept -->
											
											<!-- Submit Section -->
											<form id ="payment_form" method="post">
											<div class="submit-section mt-4">
											<input type="hidden" name="prescription_num" value="${prescription.prescription_num}">
												<button id ="paybtn" class="btn btn-primary submit-btn">결제하기</button>
											</div>
											</form>
											<!-- /Submit Section -->
											
										</div>
									
									<!-- /Checkout Form -->
									
								</div>
							</div>
							
						</div>
						
						<div class="col-md-5 col-lg-4 theiaStickySidebar">
						
							<!-- Booking Summary -->
							<div class="card booking-card">
								<div class="card-header">
									<h4 class="card-title">${prescription.patientDTO.p_name}님의 결제</h4>
								</div>
								<div class="card-body">
								
									<!-- Booking Doctor Info -->
									<div class="booking-doc-info">
										<a href="doctor-profile" class="booking-doc-img">
											<img src="${pageContext.request.contextPath}/resources/img/doctorProfileImage/${prescription.doctorDTO.d_photo}" alt="Doctor Image">
										</a>
										<div class="booking-info">
											<h4><a href="doctor-profile">${prescription.doctorDTO.d_name}</a></h4>
											<div class="clinic-details">
												<p class="doc-location"> ${prescription.doctorDTO.departmentDTO.dep_name} 전문의</p>
											</div>
										</div>
									</div>
									<!-- Booking Doctor Info -->
									
									<div class="booking-summary">
										<div class="booking-item-wrap">
											<ul class="booking-date">
												<li >진료일 <span>${prescription.prescription_date}</span></li>
												<li>진료시작 시간 <span>${prescription.treatmentRecordDTO.monitoring_time}</span></li>
												
											</ul>
											<ul class="booking-fee">
											
												<li>원격 화상 진료비 <span><span>원</span></span></li>
											</ul>
											<div class="booking-total">
												<ul class="booking-total-list">
													<li>
														<span>총 금액</span>
														<span class="total-cost"><span>${prescription.price}원</span></span>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Booking Summary -->
							
						</div>
					</div>

				</div>

			</div>		
			<!-- /Page Content -->

											
<script type="text/javascript">
	$(function(){
		var patient_num = ${sessionScope.user.patient_num};
		var doctor_num = ${prescription.doctorDTO.doctor_num};
		var prescription_num = ${prescription.prescription_num};
		var price = ${prescription.price};
		var dep_num = ${prescription.doctorDTO.departmentDTO.dep_num};
		$('#paybtn').click(function(){
			$('#payment_form').append('<input type="hidden" name="prescription_num" value="'+ prescription_num +'">');
			$('#payment_form').append('<input type="hidden" name="doctor_num" value="'+ doctor_num +'">');
			$('#payment_form').append('<input type="hidden" name="patient_num" value="'+ patient_num +'">');
			$('#payment_form').append('<input type="hidden" name="price" value="'+ price +'">');
			$('#payment_form').append('<input type="hidden" name="payment_way" value="card">');
			$('#payment_form').append('<input type="hidden" name="dep_num" value="'+dep_num+'">');
			
			$('#payment_form').attr('action', 'payment_success')
			$('#payment_form').submit();
		}) // click
		
	}) // ready
	
</script>