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
										<img src="resources/assets/img/login-banner.png" class="img-fluid" alt="Doccure Login">	
									</div>
									<div class="col-md-12 col-lg-6 login-right">
										<div class="login-header">
											<h3>Dr.Link <span>인증</span></h3>
											<input type="hidden" class="flag" value="${message }">
										</div>
										<form action="verifyCheck" name="verifyCheck" id="verifyCheck" class="verifyCheck" method="post">
											<div class="form-group form-focus">
												<input type="text" class="form-control floating" name="d_verifynum" value="drlink12">
												<label class="focus-label">직원용 인증번호를 입력해주세요.</label>
											</div>
											<div class="check_font" id="verify_check"></div>
											<input type="submit" class="btn btn-primary btn-block btn-lg login-btn" value="인증번호 확인">
											<div class="noticemessage">
												<input type="hidden" class="flag" value="${message }">
											</div>
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
