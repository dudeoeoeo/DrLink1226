<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<script>
	$(function(){
		$(".login-header").append($(".flag").val());
		
	});
</script>		
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">
					
					<div class="row">
						<div class="col-md-8 offset-md-2">
							
							<!-- Login Tab Content -->
							<div class="account-content">
								<div class="row align-items-center justify-content-center">
									<div class="col-md-7 col-lg-6 login-left">
										<img src="${path}resources/assets/img/login-banner.png" class="img-fluid" alt="Doccure Login">	
									</div>
									<div class="col-md-12 col-lg-6 login-right">
										<div class="login-header">
											<h3>Dr.Link <span>로그인</span></h3>
											<input type="hidden" class="flag" value="${message }">
										</div>
										<form action="loginCheck" name="loginCheck" method="post">
											<div class="form-group form-focus">
												<input type="text" class="form-control floating" name="p_id" >
												<label class="focus-label">아이디를 입력해주세요.</label>
											</div>
											<div class="form-group form-focus">
												<input type="password" class="form-control floating" name="p_pwd">
												<label class="focus-label">비밀번호를 입력해주세요.</label>
											</div>
											<button class="btn btn-primary btn-block btn-lg login-btn" type="submit">로그인</button>
											<div class="login-or">
												<span class="or-line"></span>
												<span class="span-or">or</span>
											</div>
											<div class="row form-row social-login">
												<div class="col-6">
													<a href="#" class="btn btn-naver btn-block"><i class="fab fa-facebook-f mr-1"></i>네이버 아이디로 로그인</a>
												</div>
												<div class="col-6">
													<a href="#" class="btn btn-facebook btn-block"><i class="fab fa-facebook-f mr-1"></i>페이스북 아이디로 로그인</a>
												</div>
											</div>
											<div class="text-center dont-have"> 잊으셨습니까? <a href="forgot-id">  아이디 찾기</a> <a href="forgot-password">  비밀번호 찾기</a></div>
											<div class="text-center dont-have"> 회원이 아니십니까?  <a href="register">  회원가입</a></div>
										</form>
									</div>
								</div>
							</div>
							<!-- /Login Tab Content -->
								
						</div>
					</div>

				</div>

			</div>		
			<!-- /Page Content -->
			<br><br>
   