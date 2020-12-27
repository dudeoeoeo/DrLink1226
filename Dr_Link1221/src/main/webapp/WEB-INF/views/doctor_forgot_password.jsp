<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<script>
	$(function(){
		$("#findBtn").click(function(){
			if($("#d_id").val()=='' || $("#d_email").val()==''){
				alert('아이디와 이메일을 모두 입력해주세요.')
			}else{
			$.ajax({
				url : "doctor_find_pw.do",
				type : "POST",
				data : {
					d_id : $("#d_id").val(),
					d_email : $("#d_email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
			}
		});
	});
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
                        <div class="login-right">
							<div class="login-right-wrap">
								<h1>비밀번호를 잊으셨나요?</h1>
								<p class="account-subtitle">암호를 재설정하시려면 이메일을 입력해주세요.</p>
								
								<!-- Form -->
								<form action="login">
									<div class="form-group">
										<input type="text" class="form-control" value="" maxlength="20" id="d_id" name="d_id" placeholder="아이디를 입력하세요." required>
									</div>
									<div class="form-group">
										<input class="form-control" type="text" id="d_email" name="d_email" placeholder="가입에 사용한 이메일을 입력하세요." required>
									</div>
									<div class="form-group mb-0">
										<button class="btn btn-primary btn-block" type="button" id="findBtn" >임시비밀번호 발급받기</button>
									</div>
								</form>
								<!-- /Form -->
								
								<div class="text-center dont-have">비밀번호가 기억나셨나요? <a href="doctor_login">로그인</a></div>
							</div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
		<!-- /Main Wrapper -->
