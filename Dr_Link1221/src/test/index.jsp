<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>Dr.Link에 오신 것을 환영합니다</title>

<!-- Favicons -->
<link type="image/x-icon" href="${path}/resources/assets/img/favicon.png" rel="icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/all.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="${path}/resources/assets/css/style.css">


<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&display=swap" rel="stylesheet">

<style>
body {
    font-family: "Nanum Gothic", sans-serif;
}

#header-wrapper{
	background-image: url("${pageContext.request.contextPath}/resorces/img/banner.jpg");
	background-size : cover;
}

@media all and (min-width: 992px) {
	.navbar .nav-item .dropdown-menu{ display: none; }
	.navbar .nav-item:hover .nav-link{ color: black;  }
	.navbar .nav-item:hover .dropdown-menu{ display: block; }
	.navbar .nav-item .dropdown-menu{ margin-top:0; }
}	

#drlink{
font-family: 'Major Mono Display', monospace; 
margin-right: 20px;
}

ul .bxslider{
width:auto !important;
}

#bxslider{
width:auto !important;
}

.footer-menu{
	color:#fff;
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
							<h1>진료과에 맞는 전문의를 찾고 예약 해보세요!</h1>
							<p>AI로 진단하고 환자에게 맞는 최적 의료 서비스를 제공합니다.</p>
						</div>
						
						
                         
						<!-- Search -->
						<div class="search-box">
							<form action="search">
								<div class="form-group search-location" style="margin-left: 30% !important;">
									<select id="oemail2" class="form-control">
															<option value="" selected="selected">- 진료과 선택 -</option>
															<option value="korea.com">안과</option>
															<option value="dreamwiz.com">피부과</option>
															<option value="gmail.com">정신건강과</option>
													</select>
									<span class="form-text">진료과목을 선택하세요.</span>
								</div>
								
								<button type="submit" class="btn btn-primary search-btn"><i class="fas fa-search"></i> <span>Search</span></button>
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
								<h2>AI 진단을 받아보세요!</h2>
							</div>
							<div class="row">
								<div class="col-lg-4 mb-3">
									<div class="card text-center doctor-book-card">
										<img src="${path}/resources/assets/img/main_skin2.jpg" alt="" class="img-fluid">
										<div class="doctor-book-card-content tile-card-content-1">
											<div>
												<a href="AI_medical_skin" >
													<h3 class="card-title mb-0">피부과</h3></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 mb-3">
									<div class="card text-center doctor-book-card">
										<img src="${path}/resources/assets/img/main_eye.jpg" alt="" class="img-fluid">
										<div class="doctor-book-card-content tile-card-content-1">
											<div>
												<a href="AI_medical_eye" >
													<h3 class="card-title mb-0">안과</h3></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 mb-3">
									<div class="card text-center doctor-book-card">
										<img src="${path}/resources/assets/img/main_hairloss.jpg" alt="" class="img-fluid">
										<div class="doctor-book-card-content tile-card-content-1">
											<div>
												<a href="AI_medical_hair" tabindex="0">
													<h3 class="card-title mb-0">탈모</h3></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
	
	<!-- Clinic and Specialities -->
	<%-- <section class="section section-specialities">
		<div class="container-fluid">
			<div class="section-header text-center">
				<h2>진료과목</h2>
				<p class="sub-title">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-9">
					<!-- Slider -->
					<div class="specialities-slider slider">
							
						<!-- Slider Item -->
					<!-- 	<div class="speicality-item text-center">
							<div class="speicality-img">
								<img src="${path}/resources/assets/img/specialities/specialities-01.png" class="img-fluid" alt="Speciality">
								<span><i class="fa fa-circle" aria-hidden="true"></i></span>
							</div>
							<p>피부과</p>
						</div>	 -->
						<!-- /Slider Item -->
						
						<!-- Slider Item -->
						<div class="speicality-item text-center">
							<div class="speicality-img">
							
								<!-- <img src="${path}/resources/assets/img/specialities/specialities-02.png" class="img-fluid" alt="Speciality"> -->
								<img src="${path}/resources/assets/img/eye.png" class="img-fluid" alt="Speciality">
								<span><i class="fa fa-circle" aria-hidden="true"></i></span>
							</div>
							<p>안과</p>	
						</div>							
						<!-- /Slider Item -->
						
						<!-- Slider Item -->
						<div class="speicality-item text-center">
							<div class="speicality-img">
								<!-- <img src="${path}/resources/assets/img/specialities/specialities-03.png" class="img-fluid" alt="Speciality"> -->
								<img src="${path}/resources/assets/img/skin.png" class="img-fluid" alt="Speciality">
								<span><i class="fa fa-circle" aria-hidden="true"></i></span>
							</div>	
							<p>피부과</p>	
						</div>							
						<!-- /Slider Item -->
						
						<!-- Slider Item -->
						<div class="speicality-item text-center">
							<div class="speicality-img">
								<img src="${path}/resources/assets/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">
								<span><i class="fa fa-circle" aria-hidden="true"></i></span>
							</div>	
							<p>Dentist</p>
						</div>							
						<!-- /Slider Item -->
						
					</div>
					<!-- /Slider -->
					
				</div>
			</div>
		</div>   
	</section>	  --%>
	<!-- Clinic and Specialities -->
  
	<!-- Popular Section -->
	<section class="section section-doctor">
		<div class="container-fluid">
		   <div class="row">
				<div class="col-lg-4">
					<div class="section-header ">
						<h2>온라인 예약</h2>
						<p>분당서울대학교병원은 빠르고 편리한 온라인진료예약이 가능합니다.</p>
					</div>
					<div class="about-content">
						<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</p>
						<p>web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes</p>					
						<a href="search">더보기</a>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="doctor-slider slider">
							<!-- Doctor Widget -->
							<div class="profile-widget">
								<div class="doc-img">
									<a href="doctor-profile">
										<img class="img-fluid" alt="User Image" src="${path}/resources/assets/img/doctors/doctor-01.jpg">
									</a>
									<a href="javascript:void(0)" class="fav-btn">
										<i class="far fa-bookmark"></i>
									</a>
								</div>
								<div class="pro-content">
									<h3 class="title">
										<a href="doctor-profile">Ruby Perrin</a> 
										<i class="fas fa-check-circle verified"></i>
									</h3>
									<p class="speciality">MDS - Periodontology and Oral Implantology, BDS</p>
									<div class="rating">
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<span class="d-inline-block average-rating">(17)</span>
									</div>
									<div class="row row-sm">
										<div class="col-6">
											<a href="doctor-profile" class="btn view-btn">상세보기</a>
										</div>
										<div class="col-6">
											<a href="booking" class="btn book-btn">예약하기</a>
										</div>
									</div>
								</div>
							</div>
							<!-- /Doctor Widget -->
					
							<!-- Doctor Widget -->
							<div class="profile-widget">
								<div class="doc-img">
									<a href="doctor-profile">
										<img class="img-fluid" alt="User Image" src="${path}/resources/assets/img/doctors/doctor-02.jpg">
									</a>
									<a href="javascript:void(0)" class="fav-btn">
										<i class="far fa-bookmark"></i>
									</a>
								</div>
								<div class="pro-content">
									<h3 class="title">
										<a href="doctor-profile">Darren Elder</a> 
										<i class="fas fa-check-circle verified"></i>
									</h3>
									<p class="speciality">BDS, MDS - Oral & Maxillofacial Surgery</p>
									<div class="rating">
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star"></i>
										<span class="d-inline-block average-rating">(35)</span>
									</div>
									<div class="row row-sm">
										<div class="col-6">
											<a href="doctor-profile" class="btn view-btn">상세보기</a>
										</div>
										<div class="col-6">
											<a href="booking" class="btn book-btn">예약하기</a>
										</div>
									</div>
								</div>
							</div>
							<!-- /Doctor Widget -->
					
							<!-- Doctor Widget -->
							<div class="profile-widget">
								<div class="doc-img">
									<a href="doctor-profile">
										<img class="img-fluid" alt="User Image" src="${path}/resources/assets/img/doctors/doctor-03.jpg">
									</a>
									<a href="javascript:void(0)" class="fav-btn">
										<i class="far fa-bookmark"></i>
									</a>
								</div>
								<div class="pro-content">
									<h3 class="title">
										<a href="doctor-profile">Deborah Angel</a> 
										<i class="fas fa-check-circle verified"></i>
									</h3>
									<p class="speciality">MBBS, MD - General Medicine, DNB - Cardiology</p>
									<div class="rating">
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star"></i>
										<span class="d-inline-block average-rating">(27)</span>
									</div>
									<div class="row row-sm">
										<div class="col-6">
											<a href="doctor-profile" class="btn view-btn">상세보기</a>
										</div>
										<div class="col-6">
											<a href="booking" class="btn book-btn">예약하기</a>
										</div>
									</div>
								</div>
							</div>
							<!-- /Doctor Widget -->
					
							<!-- Doctor Widget -->
							<div class="profile-widget">
								<div class="doc-img">
									<a href="doctor-profile">
										<img class="img-fluid" alt="User Image" src="${path}/resources/assets/img/doctors/doctor-04.jpg">
									</a>
									<a href="javascript:void(0)" class="fav-btn">
										<i class="far fa-bookmark"></i>
									</a>
								</div>
								<div class="pro-content">
									<h3 class="title">
										<a href="doctor-profile">Sofia Brient</a> 
										<i class="fas fa-check-circle verified"></i>
									</h3>
									<p class="speciality">MBBS, MS - General Surgery, MCh - Urology</p>
									<div class="rating">
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star"></i>
										<span class="d-inline-block average-rating">(4)</span>
									</div>
									<div class="row row-sm">
										<div class="col-6">
											<a href="doctor-profile" class="btn view-btn">상세보기</a>
										</div>
										<div class="col-6">
											<a href="booking" class="btn book-btn">예약하기</a>
										</div>
									</div>
								</div>
							</div>
							<!-- /Doctor Widget -->
							
							<!-- Doctor Widget -->
							<div class="profile-widget">
								<div class="doc-img">
									<a href="doctor-profile">
										<img class="img-fluid" alt="User Image" src="${path}/resources/assets/img/doctors/doctor-05.jpg">
									</a>
									<a href="javascript:void(0)" class="fav-btn">
										<i class="far fa-bookmark"></i>
									</a>
								</div>
								<div class="pro-content">
									<h3 class="title">
										<a href="doctor-profile">Marvin Campbell</a> 
										<i class="fas fa-check-circle verified"></i>
									</h3>
									<p class="speciality">MBBS, MD - Ophthalmology, DNB - Ophthalmology</p>
									<div class="rating">
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star"></i>
										<span class="d-inline-block average-rating">(66)</span>
									</div>
									<div class="row row-sm">
										<div class="col-6">
											<a href="doctor-profile" class="btn view-btn">상세보기</a>
										</div>
										<div class="col-6">
											<a href="booking" class="btn book-btn">예약하기</a>
										</div>
									</div>
								</div>
							</div>
							<!-- /Doctor Widget -->
							
							<!-- Doctor Widget -->
							<div class="profile-widget">
								<div class="doc-img">
									<a href="doctor-profile">
										<img class="img-fluid" alt="User Image" src="${path}/resources/assets/img/doctors/doctor-06.jpg">
									</a>
									<a href="javascript:void(0)" class="fav-btn">
										<i class="far fa-bookmark"></i>
									</a>
								</div>
								<div class="pro-content">
									<h3 class="title">
										<a href="doctor-profile">Katharine Berthold</a> 
										<i class="fas fa-check-circle verified"></i>
									</h3>
									<p class="speciality">MS - Orthopaedics, MBBS, M.Ch - Orthopaedics</p>
									<div class="rating">
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star"></i>
										<span class="d-inline-block average-rating">(52)</span>
									</div>
									<div class="row row-sm">
										<div class="col-6">
											<a href="doctor-profile" class="btn view-btn">상세보기</a>
										</div>
										<div class="col-6">
											<a href="booking" class="btn book-btn">예약하기</a>
										</div>
									</div>
								</div>
							</div>
							<!-- /Doctor Widget -->
							
							<!-- Doctor Widget -->
							<div class="profile-widget">
								<div class="doc-img">
									<a href="doctor-profile">
										<img class="img-fluid" alt="User Image" src="${path}/resources/assets/img/doctors/doctor-07.jpg">
									</a>
									<a href="javascript:void(0)" class="fav-btn">
										<i class="far fa-bookmark"></i>
									</a>
								</div>
								<div class="pro-content">
									<h3 class="title">
										<a href="doctor-profile">Linda Tobin</a> 
										<i class="fas fa-check-circle verified"></i>
									</h3>
									<p class="speciality">MBBS, MD - General Medicine, DM - Neurology</p>
									<div class="rating">
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star"></i>
										<span class="d-inline-block average-rating">(43)</span>
									</div>
									<div class="row row-sm">
										<div class="col-6">
											<a href="doctor-profile" class="btn view-btn">상세보기</a>
										</div>
										<div class="col-6">
											<a href="booking" class="btn book-btn">예약하기</a>
										</div>
									</div>
								</div>
							</div>
							<!-- /Doctor Widget -->
							
							<!-- Doctor Widget -->
							<div class="profile-widget">
								<div class="doc-img">
									<a href="doctor-profile">
										<img class="img-fluid" alt="User Image" src="${path}/resources/assets/img/doctors/doctor-08.jpg">
									</a>
									<a href="javascript:void(0)" class="fav-btn">
										<i class="far fa-bookmark"></i>
									</a>
								</div>
								<div class="pro-content">
									<h3 class="title">
										<a href="doctor-profile">Paul Richard</a> 
										<i class="fas fa-check-circle verified"></i>
									</h3>
									<p class="speciality">MBBS, MD - Dermatology , Venereology & Lepros</p>
									<div class="rating">
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star filled"></i>
										<i class="fas fa-star"></i>
										<span class="d-inline-block average-rating">(49)</span>
									</div>
									<div class="row row-sm">
										<div class="col-6">
											<a href="doctor-profile" class="btn view-btn">상세보기</a>
										</div>
										<div class="col-6">
											<a href="booking" class="btn book-btn">예약하기</a>
										</div>
									</div>
								</div>
							</div>
							<!-- Doctor Widget -->
							
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
				<div class="col-md-6 col-lg-3 col-sm-12">
				
					<!-- Blog Post -->
					<div class="blog grid-blog">
						<div class="blog-image">
							<a href="blog-details"><img class="img-fluid" src="${path}/resources/assets/img/blog/blog-02.jpg" alt="Post Image"></a>
						</div>
						<div class="blog-content">
							건강소식 컨텐츠 들어갈 예정
						</div>
					</div>
					<!-- /Blog Post -->
					
				</div>
				<div class="col-md-6 col-lg-3 col-sm-12">
				
					<!-- Blog Post -->
					<div class="blog grid-blog">
						<div class="blog-image">
							<a href="blog-details"><img class="img-fluid" src="${path}/resources/assets/img/blog/blog-02.jpg" alt="Post Image"></a>
						</div>
						<div class="blog-content">
							건강소식 컨텐츠 들어갈 예정
						</div>
					</div>
					<!-- /Blog Post -->
					
				</div>
				<div class="col-md-6 col-lg-3 col-sm-12">
				
					<!-- Blog Post -->
					<div class="blog grid-blog">
						<div class="blog-image">
							<a href="blog-details"><img class="img-fluid" src="${path}/resources/assets/img/blog/blog-03.jpg" alt="Post Image"></a>
						</div>
						<div class="blog-content">
							건강소식 컨텐츠 들어갈 예정
						</div>
					</div>
					<!-- /Blog Post -->
					
				</div>
				<div class="col-md-6 col-lg-3 col-sm-12">
				
					<!-- Blog Post -->
					<div class="blog grid-blog">
						<div class="blog-image">
							<a href="blog-details"><img class="img-fluid" src="${path}/resources/assets/img/blog/blog-02.jpg" alt="Post Image"></a>
						</div>
						<div class="blog-content">
							건강소식 컨텐츠 들어갈 예정
						</div>
					</div>
					<!-- /Blog Post -->
					
				</div>
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
									<th>No.</th>
									<th>제목</th>
									<th>등록일자</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>공지</td>
									<td>공지 	입원환자 입원 전 코로나19 검사 시행 안내 </td>
									<td>2020-11-05</td>
									<td>8729</td>
								</tr>
								<tr>
									<td>공지</td>
									<td>개원기념일(10월15일) 외래 휴진 안내 </td>
									<td>2020-10-07</td>
									<td>320</td>
								</tr>
								<tr>
									<td>공지</td>
									<td>2020년 분당서울대병원 추석 연휴 및 개천절 휴진 안내  </td>
									<td>2020-09-28</td>
									<td>876</td>
								</tr>
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
		
	</body>
</html>