<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
		
		<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			if($("#p_id").val()=='' || $("#p_email").val()==''){
				alert('아이디와 이메일을 모두 입력해주세요.')
			}else{
			$.ajax({
				url : "find_pw.do",
				type : "POST",
				data : {
					p_id : $("#p_id").val(),
					p_email : $("#p_email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
			}
		});
	});
</script>
		<!-- Main Wrapper -->
        <div class="main-wrapper login-body">
            <div class="login-wrapper">
            	<div class="container">
                	<div class="loginbox">		
                        <div class="login-right">
							<div class="login-right-wrap">
								<h1>비밀번호를 잊으셨나요?</h1>
								<p class="account-subtitle">암호를 재설정하시려면 이메일을 입력해주세요.</p>
								
								<!-- Form -->
								<form action="login">
									<div class="form-group">
										<input type="text" class="form-control" value="" maxlength="20" id="p_id" name="p_id" placeholder="아이디를 입력하세요." required>
									</div>
									<div class="form-group">
										<input class="form-control" type="text" id="p_email" name="p_email" placeholder="가입에 사용한 이메일을 입력하세요." required>
									</div>
									<div class="form-group mb-0">
										<button class="btn btn-primary btn-block" type="button" id="findBtn" >임시비밀번호 발급받기</button>
									</div>
								</form>
								<!-- /Form -->
								
								<div class="text-center dont-have">비밀번호가 기억나셨나요? <a href="login">로그인</a></div>
							</div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
		<!-- /Main Wrapper -->