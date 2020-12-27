<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='../member/login_form.do';
		})
	})
</script>
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
								
								<div class="text-center dont-have">아이디가 기억나셨나요? <a href="login">로그인</a></div>
								<div class="text-center dont-have"> 비밀번호를 잊으셨습니까? <a href="forgot-password">  비밀번호 찾기</a></div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- /Main Wrapper -->
