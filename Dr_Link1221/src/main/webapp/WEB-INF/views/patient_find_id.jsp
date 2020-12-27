<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='../member/login_form.do';
		})
	})
</script>


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
 
		<!-- Main Wrapper -->
        <div class="main-wrapper login-body">
            <div class="login-wrapper">
            	<div class="container">
                	<div class="loginbox">
                    	<div class="login-left">
                        </div>
                        <div class="login-right">
							<div class="login-right-wrap">
								<h1>아이디 찾기</h1>
								<p class="account-subtitle">아이디 찾기 검색결과</p>
								
								<!-- Form -->
									<div class="form-group">
										${ id }
									</div>
								<!-- /Form -->
								
								<div class="text-center dont-have">아이디가 기억나셨나요? <a href="patient_login">로그인</a></div>
								<div class="text-center dont-have"> 비밀번호를 잊으셨습니까? <a href="patient_forgot_password">  비밀번호 찾기</a></div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
