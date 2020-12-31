<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<style>
/* Default height for small devices */
#intro-example {
	height: 400px;
}

/* Height for devices larger than 992px */
@media ( min-width : 992px) {
	#intro-example {
		height: 600px;
	}
}
</style>
<script>
	$(function() {
		$(".login-header").append($(".flag").val());

	});
</script>

<%-- <div id="intro-example" class="p-5 text-center bg-image"
	style="background-image: url('${path}/resources/assets/img/login-banner.png'); background-position:left; background-repeat:no-repeat; background-size:50%;">
	<div class="mask"
		style="background-color: rgba(0, 0, 0, 0.2); width: max-content; margin-left: 50%">
		<div class="d-flex justify-content-center align-items-center h-100">
			<div class="text-dark">
				<a class="btn btn-primary btn-outline-dark btn-lg m-5"
					href="patient_login" role="button" rel="nofollow" target="_blank">일반회원<br>로그인
				</a> <a class="btn btn-primary btn-outline-dark btn-lg m-5"
					href="patient_register" target="_blank" role="button">일반회원<br>회원가입
				</a> <a class="btn btn-primary btn-outline-dark btn-lg m-5"
					href="doctor_login" target="_blank" role="button">의사회원<br>로그인
				</a> <a class="btn btn-primary btn-outline-dark btn-lg m-5"
					href="doctor_verify" target="_blank" role="button">의사회원<br>회원가입
				</a>

			</div>
		</div>
	</div>
</div>
<!-- Background image --> --%>



<div class="content">
	<div class="container-fluid">

		<div class="row">
			<div class="col-md-8 offset-md-2">

				<!-- Login Tab Content -->
				<div class="account-content">
					<div class="row align-items-center justify-content-center">
						<div class="col-md-7 col-lg-6 login-left">
							<img src="${path}/resources/assets/img/login-banner.png"
								class="img-fluid" alt="Doccure Login">
						</div>
						<div class="col-md-7 col-lg-6 mw-100 login-right">
							<div class="login-header">
								<h3>
									Dr.Link <span>로그인</span>
								</h3>
							</div>
							<div class="row align-items-center">
								<div class="col-md-6 h-100 text-center">
									<a class="btn btn-primary btn-outline-dark m-3 "
										href="patient_login" role="button" rel="nofollow"
										>일반회원<br>로그인
									</a>
								</div>
								<div class="col-md-6 h-100 text-center">
									<a class="btn btn-primary btn-outline-dark m-3"
										href="patient_register" role="button">일반회원<br>회원가입
									</a>
								</div>
							</div>
							<div class="row align-items-center">
								<div class="col-md-6 h-100 text-center">
									<a class="btn btn-light btn-outline-dark m-3"
										href="doctor_login" role="button">의사회원<br>로그인
									</a>
								</div>
								<div class="col-md-6 h-100 text-center">
									<a class="btn btn-light btn-outline-dark m-3"
										href="doctor_verify" role="button">의사회원<br>회원가입
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Login Tab Content -->

			</div>
		</div>

	</div>

</div>




<!-- Page Content -->
<%-- <div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8 offset-md-2">
							<!-- Login Tab Content -->
							<div class="account-content">
								<div class="row align-items-center justify-content-center">
								    <section class="u-align-left u-clearfix u-section-1" id="sec-96e5">
								      <div class="p-5 text-center bg-image" style="background: url('${path}/resources/assets/img/login-banner.png');">
								        <!--<img src="${path}/resources/assets/img/login-banner.png" alt="" class="u-image u-image-default u-image-1" data-image-width="1500" data-image-height="1000">
								         <a href="patient_login" class="u-border-2 u-border-custom-color-1 u-border-hover-custom-color-1 u-btn u-btn-round u-button-style u-hover-custom-color-1 u-none u-radius-50 u-btn-1">일반회원<br>로그인
								        </a>
								        <a href="patient_register" class="u-border-2 u-border-custom-color-1 u-border-hover-custom-color-1 u-btn u-btn-round u-button-style u-hover-custom-color-1 u-none u-radius-50 u-btn-2">일반회원<br>회원가입
								        </a>
								        <a href="doctor_login" class="u-border-2 u-border-custom-color-1 u-border-hover-custom-color-1 u-btn u-btn-round u-button-style u-hover-custom-color-1 u-none u-radius-50 u-btn-3">직원회원<br>로그인
								        </a>
								        <a href="doctor_verify" class="u-border-2 u-border-custom-color-1 u-border-hover-custom-color-1 u-btn u-btn-round u-button-style u-hover-custom-color-1 u-none u-radius-50 u-btn-4">직원회원<br>회원가입
								        </a> -->
								        <a href="patient_login" class="btn btn-primary">일반회원<br>로그인
								        </a>
								        <a href="patient_register" class="btn btn-primary">일반회원<br>회원가입
								        </a>
								        <a href="doctor_login" class="btn btn-primary">직원회원<br>로그인
								        </a>
								        <a href="doctor_verify" class="btn btn-primary">직원회원<br>회원가입
								        </a>
								      </div>
								    </section>
								</div>
							</div>
							<!-- /Login Tab Content -->
						</div>
					</div>
				</div>
			</div>	 --%>
<!-- /Page Content -->