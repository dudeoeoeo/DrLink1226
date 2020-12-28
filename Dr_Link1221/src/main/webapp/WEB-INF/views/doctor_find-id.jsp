<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<style>
body {
    font-family: "Nanum Gothic", sans-serif;
}

.footer-menu{
	color:#fff;
}




.mybtn{
  width:150px;
  height:40px;
  padding:0;
  display:inline; 
  border-radius: 4px; 
  background: #212529;
  color: #fff;
  margin-top: 20px;
  border: solid 2px #212529; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}
</style>

			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="account-content">
								<div class="row align-items-center justify-content-center">
									<div class="col-md-12 col-lg-6 login-right">
										<div class="login-header">
											<h3>Dr.Link <span>아이디 찾기</span></h3>
										</div>
										<div class="form-group" style="text-align: center;">
											<h2><span>아이디 : </span>${ id }</h2>
										</div>
										<div class="text-center dont-have">아이디가 기억나셨나요? <a href="doctor_login">로그인</a></div>
										<div class="text-center dont-have"> 비밀번호를 잊으셨습니까? <a href="doctor_forgot_password">  비밀번호 찾기</a></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>		
			<!-- /Page Content -->
