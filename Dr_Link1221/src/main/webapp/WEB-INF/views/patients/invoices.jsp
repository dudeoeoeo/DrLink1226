<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<body>
	<!-- Breadcrumb -->
	<div class="breadcrumb-bar">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-md-12 col-12">
					<h2 class="breadcrumb-title">결제 영수증</h2>
				</div>
			</div>
		</div>
	</div>
	<!-- /Breadcrumb -->

	<!-- Page Content -->
	<div class="content">
		<div class="container-fluid">

			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<div class="invoice-content">
						<div class="invoice-item">
							<div class="row">
								<div class="col-md-6">
									<div class="invoice-logo">
										<h1>
											<a id="drlink" href="#">${drlinkinfo.dl_name}</a>
										</h1>
									</div>
								</div>
								<div class="col-md-6">
									<p class="invoice-details">
										<strong>영수증 번호:</strong> #00${prescription.prescription_num} <br>
										<strong>결제일:</strong> ${prescription.prescription_date}
									</p>
								</div>
							</div>
						</div>

						<!-- Invoice Item -->
						<div class="invoice-item">
							<div class="row">
								<div class="col-md-6">
									<div class="invoice-info">
										<strong class="customer-text">발행 기관</strong>
										<p class="invoice-details invoice-details-two">
											${drlinkinfo.dl_name}<br> 서울 금천구 가산디지털2로 123
											월드메르디앙벤처센터II<br>
										</p>
									</div>
								</div>
								<div class="col-md-6">
									<div class="invoice-info invoice-info2">
										<strong class="customer-text">고객 정보</strong>
										<p class="invoice-details">
											${prescription.patientDTO.p_name}<br>
											${prescription.patientDTO.profileAddress}<br>
										</p>
									</div>
								</div>
							</div>
						</div>
						<!-- /Invoice Item -->


						<!-- Invoice Item -->
						<div class="invoice-item invoice-table-wrap">
							<div class="row">
								<div class="col-md-12" style="width: 70%; margin: 5px;">
									<div class="table-responsive">
										<table class="invoice-table table table-bordered">
											<tbody>
												<tr>
													<td>${prescription.prescription_num}</td>
													<td>원격 화상 진료</td>
													<fmt:parseNumber var="real_price"
														value="${prescription.price/0.9}" integerOnly="true" />
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${real_price}" var="commaPrice" />
													<td class="text-center">${commaPrice}<span>원</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="col-md-6 col-xl-4 ml-auto">
									<div class="table-responsive">
										<table class="invoice-table-two table">
											<tbody>
												<tr>
													<th>합 금액:</th>
													<td><span>${commaPrice}<span>원</span></span></td>
												</tr>
												<tr>
													<th>보험적용:</th>
													<td><span>-10%</span></td>
												</tr>
												<tr>
													<fmt:parseNumber var="down_price"
														value="${prescription.price}" integerOnly="true" />
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${down_price}" var="down_price" />
													<th>최종금액:</th>
													<td><span>${down_price}<span>원</span></span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- /Invoice Item -->

						<!-- Invoice Information -->
						<div class="other-info">
							<h4>사용기간</h4>
							<p class="text-muted mb-0">처방전은 교부일로부터 3일간 내에 약국에 제출하여야 합니다.</p>
						</div>
						<!-- /Invoice Information -->


					</div>
					<div class="text-center" style="margin: 10px !important;">
						<a href="javascript:void(0);" class="print btn btn-info submit-btn">
							<i class="fas fa-print"></i> 출력
						</a>
						<input type="button" class="btn btn-info submit-btn" value="마이페이지"
							onclick="location.href='patient_dashboard'"> 
						<!-- <button type="submit" class="btn btn-info submit-btn" formaction="#">메인으로</button> -->
					</div>
					<div class="text-center"></div>
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

		<!-- Custom JS -->
		<script src="${path}/resources/assets/js/script.js"></script>
		
		<script type="text/javascript">

			$(document).ready(function() {
				$('.print').click(function() {
					const completeParam = makeHtml();
					reportPrint(completeParam);
				});

				function makeHtml() {
					const obj = {
						html : ''
					};
					var html = $('div.invoice-content').html();
					obj.html = html;
					return obj;
				}

				function reportPrint(param) {
					const setting = "width=890, height=841";
					const objWin = window.open('', 'print', setting);
					objWin.document.open();
					objWin.document.write(param.html);
					objWin.document.write('<link rel="stylesheet" href="${path}/resources/assets/css/style.css">'
							+'<link type="image/x-icon" href="${path}/resources/assets/img/favicon.png" rel="icon">'
							+'<link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">'
							+'<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/fontawesome.min.css">'
							+'<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/all.min.css">')
					objWin.focus();
					objWin.document.close();
					setTimeout(function() {
						objWin.print();
						objWin.close();
					}, 1000);
				}
			});
		</script>
</body>
</html>