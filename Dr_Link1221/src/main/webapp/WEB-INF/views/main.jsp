<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
		$(".btn.btn-primary.search-btn").click(function() {
			$(".main").attr("action", "AI_medical_" + $("#oemail2").val());
			$(".main").submit();
		});
	});
</script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>Dr.Link에 오신 것을 환영합니다</title>
<!-- Favicons -->
<link type="image/x-icon"
	href="${path}/resources/assets/img/favicon.png" rel="icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${path}/resources/assets/css/bootstrap.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet"
	href="${path}/resources/assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet"
	href="${path}/resources/assets/plugins/fontawesome/css/all.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="${path}/resources/assets/css/style.css">


<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&display=swap"
	rel="stylesheet">

<style>
.main-wrapper h1 h2 h3 {
	font-family: "Nanum Gothic", sans-serif !important;
}

#header-wrapper {
	background-image:
		url("${pageContext.request.contextPath}/resorces/img/banner.jpg");
	background-size: cover;
}

@media all and (min-width: 992px) {
	.navbar .nav-item .dropdown-menu {
		display: none;
	}
	.navbar .nav-item:hover .nav-link {
		color: black;
	}
	.navbar .nav-item:hover .dropdown-menu {
		display: block;
	}
	.navbar .nav-item .dropdown-menu {
		margin-top: 0;
	}
}

#drlink {
	font-family: 'Major Mono Display', monospace;
	margin-right: 20px;
}

ul .bxslider {
	width: auto !important;
}

#bxslider {
	width: auto !important;
}

.footer-menu {
	color: #fff;
}
</style>

</head>
<body>

	<!-- Main Wrapper -->
	<div class="main-wrapper">


		<!-- Home Banner -->

		<section class="section section-search">
			<div class="container-fluid">
				<div class="banner-wrapper">
					<div class="banner-header text-center">
						<h1>진료과에 맞는</h1>
						<h1>전문의를 찾고 예약 해보세요!</h1>
						<p>AI로 진단하고 환자에게 맞는 최적 의료 서비스를 제공합니다.</p>
					</div>



					<!-- Search -->
					<div class="search-box">
						<form class="main">
							<div class="form-group search-location"
								style="margin-left: 30% !important;">
								<select id="oemail2" class="form-control">
									<option value="" selected="selected">- 증상 선택 -</option>
									<option value="eye">눈 질병</option>
									<option value="skin">피부 질병</option>
									<option value="hair">탈모</option>
								</select> <span class="form-text">AI 진단을 받을 항목을 선택해주세요.</span>
							</div>

							<button class="btn btn-primary search-btn">
								<i class="fas fa-search"></i> <span>Search</span>
							</button>
						</form>
					</div>
					<!-- /Search -->

				</div>
			</div>
		</section>


		<section class="section home-tile-section">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-9 m-auto">
						<div class="section-header text-center">
							<h1>AI 진단을 받아보세요!</h1>
						</div>
						<div class="row">
							<div class="col-lg-4 mb-3">
								<div class="card text-center doctor-book-card">
									<img src="${path}/resources/assets/img/main_skin2.jpg" alt=""
										class="img-fluid">
									<div class="doctor-book-card-content tile-card-content-1">
										<div>
											<a href="AI_medical_skin">
												<h3 class="card-title mb-0">피부과</h3>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 mb-3">
								<div class="card text-center doctor-book-card">
									<img src="${path}/resources/assets/img/main_eye.jpg" alt=""
										class="img-fluid">
									<div class="doctor-book-card-content tile-card-content-1">
										<div>
											<a href="AI_medical_eye">
												<h3 class="card-title mb-0">안과</h3>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 mb-3">
								<div class="card text-center doctor-book-card">
									<img src="${path}/resources/assets/img/main_hairloss.jpg"
										alt="" class="img-fluid">
									<div class="doctor-book-card-content tile-card-content-1">
										<div>
											<a href="AI_medical_hair" tabindex="0">
												<h3 class="card-title mb-0">탈모</h3>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


		<!-- Popular Section -->
		<section class="section section-doctor">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-4">
						<div class="section-header ">
							<h2>온라인 예약</h2>
							<p>저희 닥터링크는 빠르고 편리한 온라인진료예약이 가능합니다.</p>
						</div>
						<div class="about-content">
							<p>Notre lien Doctoral permet de réserver rapidement et
								facilement des soins en ligne.</p>
							<p>We have a quick and convenient online appointment for Dr.
								Link.</p>
							<p>当社のドクターリンクは、迅速かつ便利なオンライン診療予約を承っております。</p>
							<p>本院可以预约即快速又方便的在线诊疗。</p>
							<a href="search">더보기</a>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="doctor-slider slider">
							<!-- Doctor Widget -->
							<c:forEach var="list" items="${list}" varStatus="listStatus">
								<div class="profile-widget">
									<div class="doc-img" style="height: 55%;">
										<a href="doctor_profile?doctor_num=${list.doctor_num }"> <img
											src="${path}/resources/doctor/doctorImg/${list.d_photo}"
											class="img-fluid" alt="User Image">
										</a>
									</div>
									<div class="pro-content">
										<h3 class="title">
											<a href="doctor_profile">${list.d_name}</a> <i
												class="fas fa-check-circle verified"></i>
										</h3>
										<p class="speciality">${list.departmentDTO.dep_name}</p>
										<div class="rating">
											<c:forEach begin="0" end="4" step="1" varStatus="i">
												<c:choose>
													<c:when
														test="${list.doc_ReviewDTO.review_rating > i.index}">
														<i class="fas fa-star filled"></i>
													</c:when>
													<c:otherwise>
														<i class="fas fa-star"></i>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<span class="d-inline-block average-rating"> <strong>
													${list.doc_ReviewDTO.review_rating}</strong>
											</span>
										</div>
										<div class="row row-sm">
											<div class="col-6">
												<a href="doctor_profile?doctor_num=${list.doctor_num}"
													class="btn view-btn">상세보기</a>
											</div>
											<div class="col-6">
												<a href="patients/booking?doctor_num=${list.doctor_num}"
													class="btn book-btn">예약하기</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- /Doctor Widget -->
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /Popular Section -->



		<!-- Blog Section -->
		<section class="section section-blogs">
			<div class="container-fluid">

				<!-- Section Header -->
				<div class="section-header text-center">
					<h2>우리 병원 소식</h2>
					<p class="sub-title">병원에서 제공하는 다양한 정보를 통해 건강한 삶을 누리세요.</p>
				</div>
				<!-- /Section Header -->

				<div class="row blog-grid-row">

					<c:forEach var="news" items="${newsList}" end="3">
						<div class="col-md-6 col-lg-3 col-sm-12">

							<!-- Blog Post -->
							<div class="blog grid-blog">
								<div class="blog-image">
									<div class="video-wrap">
										<iframe width="100%" height="315" src="${news.news_url}"
											frameborder="0"
											allow="accelerometer; autoplay; clipboard-write; 
							encrypted-media; gyroscope; picture-in-picture"
											allowfullscreen></iframe>
									</div>
								</div>
								<div class="blog-content">
									<c:forEach var="c" items="${news.news_title}">
										<p class="mb-0">
											<a href="health-blog-detail?b_num=${news.news_board_num}">${c}</a>
										</p>
									</c:forEach>
								</div>
							</div>
							<!-- /Blog Post -->

						</div>
					</c:forEach>
				</div>
				<div class="view-all text-center">
					<a href="health-blog" class="btn btn-primary">더보기</a>
				</div>
			</div>
		</section>
		<!-- /Blog Section -->

		<!-- Blog Section -->
		<section class="section section-blogs">
			<div class="container-fluid">

				<!-- Section Header -->
				<div class="section-header text-center">
					<h2>공지사항</h2>
					<p class="sub-title">Dr.Link의 공지사항을 알려드립니다.</p>
				</div>
				<!-- /Section Header -->

				<div class="table-responsive">
					<table class="table table-hover mb-0">
						<thead>
							<tr>
								<th style="text-align: left">No.</th>
								<th style="text-align: left">제목</th>
								<th style="text-align: left">등록일자</th>
								<th style="text-align: left">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" end="4" items="${h_boardList}">
								<tr>
									<td>공지</td>
									<td style="text-align: left"><a
										href="notice_detail?b_num=${board.hospital_board_num}">${board.hospital_title}</a></td>
									<td style="text-align: center">${board.hospital_regdate}</td>
									<td style="text-align: center">${board.h_watched}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="view-all text-center">
				<a href="notice" class="btn btn-primary">더보기</a>
			</div>
		</section>
		<!-- /Blog Section -->



	</div>
	<!-- /Main Wrapper -->

	<!-- jQuery -->
	<script src="${path}/resources/assets/js/jquery.min.js"></script>

	<!-- Bootstrap Core JS -->
	<script src="${path}/resources/assets/js/popper.min.js"></script>
	<script src="${path}/resources/assets/js/bootstrap.min.js"></script>

	<!-- Slick JS -->
	<script src="${path}/resources/assets/js/slick.js"></script>

	<!-- Custom JS -->
	<script src="${path}/resources/assets/js/script.js"></script>
	<script type="text/javascript">
		$(function() {

			var uid = '${sessionScope.user.p_name}';

			$('.book-btn').click(function() {
				if (uid == '' || uid == null) {
					if (confirm("로그인이 필요한 서비스 입니다. \n 지금 로그인 하시겠습니까 ?")) {
						$(this).attr('href', 'login')
					} else {
						$(this).attr('href', '')
					}
				} else if (uid != '' || uid != null) {
				}
			}) // click

			window.onload = function() {
				if (window.Notification) {
					Notification.requestPermission();
				}
			}

			function calculate() {
				setTimeout(function() {
					notify();
				}, 5000);
			}

			function notify() {
				if (Notification.permission !== 'granted') {
					alert('notification is disabled');
				} else {
					var notification = new Notification('💕진료 예약 알림💕', {
						icon : '${path}/resources/assets/img/favicon.png',
						body : '곧 진료가 시작됩니다. 진료실에 입장해주세요',
						requireInteraction : true
					//timestamp: dts
					});

					notification.onclick = function() {
						window.open('#');
					};

					/*  notification.onclose = function () {
					     window.open('#');
					 }; */
				}
			}
		});
	</script>
</body>
</html>