<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>결제 완료 - Dr.Link</title>
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
			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<h2 class="breadcrumb-title">결제완료</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content success-page-cont">
				<div class="container-fluid">
				
					<div class="row justify-content-center">
						<div class="col-lg-6">
						
							<!-- Success Card -->
							<div class="card success-card">
								<div class="card-body">
									<div class="success-cont">
										<i class="fas fa-check"></i>
										<h3>결제가 완료되었습니다.!</h3>
									</div>
								</div>
							</div>
							<!-- /Success Card -->
							
						<form id ="payment_success" method="post">
						<div class="text-center" style="margin:10px !important;">		
						<button type="submit" class="btn btn-info submit-btn" formaction="detail_prescription">처방전 상세페이지</button>
						<button type="submit" class="btn btn-info submit-btn" formaction="patient_dashboard">메인으로</button>
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
		
		<!-- Custom JS -->
		<script src="${path}/resources/assets/js/script.js"></script>
		
	</body>
</html>