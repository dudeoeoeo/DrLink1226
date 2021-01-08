<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html> 
<script>
	$(function(){
		$(".noticemessage").append($(".flag").val());
		
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
										<img src="${path}/resources/assets/img/login-banner.png" class="img-fluid" alt="Doccure Login">	
									</div>
									<div class="col-md-12 col-lg-6 login-right">
										<div class="login-header">
											<h3>Dr.Link <span>로그인</span></h3>
										</div>
										<form action="doctorloginCheck" name="doctorloginCheck" id="doctorloginCheck" class="drloginCheck" method="post">
											<div class="form-group form-focus">
												<input type="text" class="form-control floating" name="d_id" value="doctor1">
												<label class="focus-label">아이디를 입력해주세요.</label>
											</div>
											<div class="form-group form-focus">
												<input type="password" class="form-control floating" name="d_pwd" value="1234">
												<label class="focus-label">비밀번호를 입력해주세요.</label>
											</div>
											<input type="submit" class="btn btn-primary btn-block btn-lg login-btn" value="로그인">
											<div class="noticemessage">
												<input type="hidden" class="flag" value="${message}">
											</div>
											<div class="login-or">
												<span class="or-line"></span>
												<span class="span-or">or</span>
											</div>
											<div class="text-center dont-have"> 잊으셨습니까? <a href="doctor_forgot_id">  아이디 찾기</a> <a href="doctor_forgot_password">  비밀번호 찾기</a></div>
											<div class="text-center dont-have"> 아직 회원이 아니십니까?  <a href="doctor_verify">  회원가입</a></div>
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
