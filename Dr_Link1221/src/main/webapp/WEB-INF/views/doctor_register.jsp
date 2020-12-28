<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html> 
		<!-- 우편번호 API -->
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="http://code.jquery.com/jquery-latest.js"></script>		
		
		
		<!-- jQuery -->
		<script src="${path}/resources/assets/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JS -->
		<script src="${path}/resources/assets/js/popper.min.js"></script>
		<script src="${path}/resources/assets/js/bootstrap.min.js"></script>
		
		<!-- Sticky Sidebar JS -->
        <script src="${path}/resources/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="${path}/resources/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>
		
		<!-- Select2 JS -->
		<script src="${path}/resources/assets/plugins/select2/js/select2.min.js"></script>
		
		<!-- Dropzone JS -->
		<script src="${path}/resources/assets/plugins/dropzone/dropzone.min.js"></script>
		
		<!-- Bootstrap Tagsinput JS -->
		<script src="${path}/resources/assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.js"></script>
		
		<!-- Profile Settings JS -->
		<script src="${path}/resources/assets/js/profile-settings.js"></script>
		
		<!-- Custom JS -->
		<script src="${path}/resources/assets/js/script.js"></script>
		
		
		
		
		<!-- Favicons -->
		<link href="${path}/resources/assets/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/fontawesome.min.css">
		<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/all.min.css">
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/plugins/select2/css/select2.min.css">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css">
		
		<link rel="stylesheet" href="${path}/resources/assets/plugins/dropzone/dropzone.min.css">
		
		<!-- Main CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/css/style.css">
		
		<script>

		function execPostCode() {
			
			 new daum.Postcode({

		           oncomplete: function(data) {

		               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

		               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                   extraRoadAddr += data.bname;
		               }
		               // 건물명이 있고, 공동주택일 경우 추가한다.
		               if(data.buildingName !== '' && data.apartment === 'Y'){
		                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		               }
		               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		               if(extraRoadAddr !== ''){
		                   extraRoadAddr = ' (' + extraRoadAddr + ')';
		               }
		               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		               if(fullRoadAddr !== ''){
		                   fullRoadAddr += extraRoadAddr;
		               }

		               // 우편번호와 주소 정보를 해당 필드에 넣는다.

		               document.getElementById('d_zipcode').value = data.zonecode; //5자리 새우편번호 사용
		               document.getElementById('d_address1').value = fullRoadAddr;
		               document.getElementById('d_address2').focus();

		               console.log(data);

		           }

		       }).open();
			 
		};
		


		

			//아이디 유효성
			$(function(){ 
				$("#d_id").blur(function() {
			      var getCheck= RegExp(/^[A-Za-z0-9_]+[A-Za-z0-9]$/);
			      if(!getCheck.test($("#d_id").val())){
					$("#id_check").html("알파벳과 숫자만 사용해주세요.");
					$('#id_check').css('color', 'red');
					$("#submit-btn").attr("disabled", "disabled");
			        $("#d_id").val("");
			        $("#d_id").focus();
			        return false;
			      }else{					
			    	  $.ajax({
						url : "doctor_check_id.do",
						type : "POST",
						data : {
							d_id : $("#d_id").val()
						},
						success : function(result) {
							if (result == 1) {
								$("#id_check").html("중복된 아이디가 있습니다.");
								$('#id_check').css('color', 'red');
								$("#submit-btn").attr("disabled", "disabled");
							} else {
								$("#id_check").html("");
								$("#submit-btn").removeAttr("disabled");
							}
						},
					})}

				});
			});
			

			//이메일 유효성
			$(function(){ 
				$("#d_email").blur(function() {
					var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[a-z\-]+/);
				    if(!getMail.test($("#d_email").val())){
						$("#email_check").html("이메일형식에 맞게 입력해주세요.");
						$('#email_check').css('color', 'red');
						$("#submit-btn").attr("disabled", "disabled");
				        $("#d_email").val("");
				        $("#d_email").focus();
				        return false;
				      } else {					
				    	  $.ajax({
								url : "doctor_check_email.do",
								type : "POST",
								data : {
									d_email : $("#d_email").val()
								},
								success : function(result) {
									if (result == 1) {
										$("#email_check").html("중복된 이메일이 있습니다.");
										$('#email_check').css('color', 'red');
										$("#submit-btn").attr("disabled", "disabled");
									} else {
										$("#email_check").html("");
										$("#submit-btn").removeAttr("disabled");
									}
								},
							})}
				});
			});
					
					
			
			
			//비밀번호 유효성 및 중복확인
			$(function(){ 
				$('#d_pwd2').blur(function(){
					var getPwd = RegExp(/^[a-zA-z0-9]{4,12}$/);
					if(!getPwd.test($("#d_pwd2").val())){
						$("#pwd_check").html("영문 대소문자와 숫자 4~12자리로 입력해야합니다.");
						$('#pwd_check').css('color', 'red');
						$("#submit-btn").attr("disabled", "disabled");
				        $("#d_pwd").val("");
				        $("#d_pwd2").val("");
				        $("#d_pwd").focus();
				        return false;
				      } else {
				   if($('#d_pwd').val() != $('#d_pwd2').val()){
				    	if($('#d_pwd2').val()!=''){
							$("#pwd_check").text("비밀번호가 일치하지 않습니다.");
							$('#pwd_check').css('color', 'red');
							$("#submit-btn").attr("disabled", true);
				    	    $('#d_pwd2').val('');
				         	$('#d_pwd2').focus();
				      	}
				   }else{
						$("#pwd_check").text("비밀번호가 일치합니다.");
						$('#pwd_check').css('color', 'green');
				   }

					}	
				});

				
				$('#d_pwd').blur(function(){
				   if($('#d_pwd').val() != $('#d_pwd2').val()){
				    	if($('#d_pwd2').val()!=''){
							$("#pwd_check").text("비밀번호가 일치하지 않습니다.");
							$('#pwd_check').css('color', 'red');
							$("#submit-btn").attr("disabled", true);
				    	    $('#d_pwd2').val('');
				         	$('#d_pwd2').focus();
				      	}
				   }else{
						$("#pwd_check").text("비밀번호가 일치합니다.");
						$('#pwd_check').css('color', 'green');
				   }
				});
			}); 	
			


			
			
			//회원가입 버튼 활성화
/* 			$(function(){
				$("#submit-btn").hover(function(){
					if($("#d_name").val()=='' || $("#d_jumin_num").val()=='' || $("#d_id").val()=='' || $("#d_pwd").val()=='' || $("#d_pwd2").val()=='' || $("#d_email").val()=='' || $("#d_zipcode").val()=='' || $("#d_address1").val()=='' || $("#d_address2").val()=='' || $("#d_phone").val()==''){
						$("#submit-btn").attr("disabled", "disabled");
					}else{
						$("#submit-btn").removeAttr("disabled");
					}
				});
			});  */
			
			
			
			//주민번호 유효성
			$(function(){ 
				$('#d_jumin_num').blur(function(){
				    var jumins3 = $("#d_jumin_num").val();
				      //주민등록번호 생년월일 전달
				          
				      var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정
				      var buf = new Array(13);
				      var juminGender = jumins3.substr(6,1);
				 
				      //주민번호 유효성 검사
				      if (!fmt.test(jumins3)) {
						$("#jumin_check").text("주민등록번호 형식에 맞게 입력해주세요.");
						$('#jumin_check').css('color', 'red');
			    	    $('#d_jumin_num').val('');
				        $("#d_jumin_num").focus();
				        
				        //남 여 구분
				      }else if(juminGender == 1 || juminGender == 3) {
				        	document.doctorInsert.d_gender.value="1";
							$("#jumin_check").text("");

					   }else{
				        	document.doctorInsert.d_gender.value="2";
							$("#jumin_check").text("");
						   
					   }
				      				        
				 
				      //주민번호 존재 검사
/* 					    for (var i = 0; i < buf.length; i++){
					      buf[i] = parseInt(jumins3.charAt(i));
					    }
					
					    var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];// 밑에 더해주는 12자리 숫자들 
					    var sum = 0;
					
					    for (var i = 0; i < 12; i++){
					    sum += (buf[i] *= multipliers[i]);// 배열끼리12번 돌면서 
					  }
					
					  if ((11 - (sum % 11)) % 10 != buf[12]) {
						$("#jumin_check").text("잘못된 주민등록번호 입니다.");
						$('#jumin_check').css('color', 'red');
						$("#d_jumin_num").focus();
					  }else{
						$("#jumin_check").text("");
					 } */
				});
				
			}); 
			

			//휴대폰 유효성
			$(function(){ 
				$('#d_phone_num').blur(function(){
					var regPhone = RegExp(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/);
					if(!regPhone.test($("#d_phone_num").val())){
						$("#phone_check").text("휴대폰번호를 정확히 입력해 주세요.");
						$('#phone_check').css('color', 'red');
				        $("#d_phone_num").focus();
					}
					else if ($("#d_phone_num").val() == "" || $("#d_phone_num").val().length != 11 || isNaN($("#d_phone_num").val())) {
						$("#phone_check").text("휴대폰번호를 정확히 입력해 주세요.");
						$('#phone_check').css('color', 'red');
				        $("#d_phone_num").focus();
					     return;
					}
					else if (isNaN($("#d_phone_num").val())) {
						$("#phone_check").text("휴대폰번호를 숫자로만 입력해 주세요.");
						$('#phone_check').css('color', 'red');
				        $("#d_phone_num").focus();
					     return;
					}else{
						$("#phone_check").text("");
					}
					for (var i=0; i<$("#d_phone_num").val().length; i++)  {
					     var chk = $("#d_phone_num").val().substring(i,i+1);
					     if(chk == " "){
							$("#phone_check").text("휴대폰번호를 정확히 입력해주세요.");
							$('#phone_check').css('color', 'red');
					        $("#d_phone_num").focus();
					          return;
					     }
					}
				});

			}); 
			

			//업로드 이미지 미리보기
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function (e) {
						$('#blah').attr('src', e.target.result);
					} 
					reader.readAsDataURL(input.files[0]);
				} 
			} 
			</script>

		<!-- user register -->
		<div class="container"></div>

			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">
					
					<div class="row">
						<!-- /Profile Sidebar -->
						<div class="col-md-7 col-lg-8 col-xl-9" style="margin:auto;">
							<div class="card">
								<div class="card-body">
									
									<!-- Profile Settings Form   onsubmit="return checks()" -->
									<form action="doctorInsert" name="doctorInsert" method="post" enctype="multipart/form-data">
										<div class="row form-row">
											<div class="col-12 col-md-12">
												<div class="form-group">
													<div class="change-avatar">
														<div class="profile-img">
															<img id="blah" src="resources/assets/img/doctors/doctor-thumb-01.jpg" alt="프로필 사진">
														</div>
														<div class="upload-img">
															<div class="change-photo-btn">
																<span><i class="fa fa-upload"></i> 사진 업로드</span>
																<input type="file" class="upload" id="file" name="file" onchange="readURL(this);">
															</div>
															<small class="form-text text-muted">이미지 파일 형식 JPG, GIF, PNG. <br>최대 크기는 2MB</small>
														</div>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>이름<span class="text-danger">*</span></label>
													<input type="text" class="form-control" value="" name="d_name" id="d_name" maxlength="6" required />
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>주민번호<span class="text-danger">*</span></label>
													<input type="text" class="form-control" value="" name="d_jumin_num" id="d_jumin_num"  maxlength="13" placeholder="'-' 없이 번호만 입력해주세요." required />
													<div class="check_font" id="jumin_check"></div>
												</div>
											</div>
											 <input type="hidden" name="d_gender" id="d_gender" value="" required />
											<div class="col-6">
												<div class="form-group">
													<label>아이디<span class="text-danger">*</span></label>
													<input type="text" class="form-control" value="" maxlength="20" name="d_id" id="d_id" required />
													<div class="check_font" id="id_check"></div>
												</div>
											</div>
											<div class="col-6">
												<div class="form-group">
													<label>이메일<span class="text-danger">*</span></label>
													<input id="d_email" name="d_email" class="form-control" size="40" value="" type="text" maxlength="50" required/>
													<div class="check_font" id="email_check"></div>
												</div>
											</div>
											<div class="col-6">
												<div class="form-group">
													<label>비밀번호<span class="text-danger">*</span></label>
													<input type="password" class="form-control" value="" maxlength="20" name="d_pwd" id="d_pwd" placeholder="영문 대소문자와 숫자 4~12자리로 입력해야합니다." required />
												</div>
											</div>
											<div class="col-6">
												<div class="form-group">
													<label>비밀번호 확인<span class="text-danger">*</span></label>
													<input type="password" class="form-control" value="" maxlength="20" name="d_pwd2" id="d_pwd2" required />
													<div class="check_font" id="pwd_check"></div>
												</div>
											</div>
											<div class="col-6">
												<div class="form-group">
												<label class="">휴대전화<span class="text-danger">*</span></label>
												<input id="d_phone_num" name="d_phone_num" class="form-control" maxlength="11" size="40" value="" type="text" placeholder="'-' 없이 번호만 입력해주세요." required />
												<div class="check_font" id="phone_check"></div>
												</div>
											</div>
											<div class="col-6">
												<div class="form-group">
												<label class="">전공과목<span class="text-danger">*</span></label>
												<select id="d_licence" name="d_licence" class="form-control" required>
												    <option value="">전공선택</option>
												    <option value="가정의학과">가정의학과</option>
												    <option value="결핵과">결핵과</option>
												    <option value="내과">내과</option>
												    <option value="방사선종양학과">방사선종양학과</option>
												    <option value="병리과">병리과</option>
												    <option value="비뇨기과">비뇨기과</option>
												    <option value="마취통증의학과">마취통증의학과</option>
												    <option value="산부인과">산부인과</option>
												    <option value="소아청소년외과">소아청소년외과</option>
												    <option value="성형외과">성형외과</option>
												    <option value="신경과">신경과</option>
												    <option value="신경외과">신경외과</option>
												    <option value="안과">안과</option>
												    <option value="영상의학과">영상의학과</option>
												    <option value="예방의학과">예방의학과</option>
												    <option value="외과">외과</option>
												    <option value="응급의학과">응급의학과</option>
												    <option value="이비인후과">이비인후과</option>
												    <option value="작업환경의학과">작업환경의학과</option>
												    <option value="재활의학과">재활의학과</option>
												    <option value="정신건강의학과">정신건강의학과</option>
												    <option value="정형외과">정형외과</option>
												    <option value="진단검사의학과">진단검사의학과</option>
												    <option value="피부과">피부과</option>
												    <option value="핵의학과">핵의학과</option>
												    <option value="흉부외과">흉부외과</option>
												    <option value="일반외과">일반외과</option>
												    <option value="기타">기타</option>
												</select>
												</div>
											</div>
						 
											<!-- Education -->
											<div class="card-body">
												<h4 class="card-title">학력</h4>
												<div class="education-info">
													<div class="row form-row education-cont">
														<div class="col-12 col-md-10 col-lg-11">
															<div class="row form-row">
																<div class="col-12 col-md-6 col-lg-4">
																	<div class="form-group">
																		<label>출신대학</label>
																		<input type="text" class="form-control" name="d_graduation" value="">
																	</div> 
																</div>
																<div class="col-12 col-md-6 col-lg-4">
																	<div class="form-group">
																		<label>학과</label>
																		<input type="text" class="form-control" name="d_graduation" value="">
																	</div> 
																</div>
																<div class="col-12 col-md-6 col-lg-4">
																	<div class="form-group">
																		<label>졸업년도</label>
																		<input type="text" class="form-control" name="d_graduation" value="">
																	</div> 
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /Education -->
						
											<!-- Experience -->
											<div class="card-body">
												<h4 class="card-title">경력</h4>
												<div class="experience-info">
													<div class="row form-row experience-cont">
														<div class="col-12 col-md-10 col-lg-11">
															<div class="row form-row">
																<div class="col-12 col-md-6 col-lg-4">
																	<div class="form-group">
																		<label>병원이름</label>
																		<input type="text" class="form-control" name="d_career"  value="">
																	</div> 
																</div>
																<div class="col-12 col-md-6 col-lg-4">
																	<div class="form-group">
																		<label>직함</label>
																		<input type="text" class="form-control" name="d_career" value="">
																	</div> 
																</div>
																<div class="col-12 col-md-6 col-lg-4">
																	<div class="form-group">
																		<label>활동년도</label>
																		<input type="text" class="form-control" name="d_career" value="">
																	</div> 
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /Experience -->
							
							
											<!-- Registrations -->
											<div class="card-body">
												<h4 class="card-title">면허내역</h4>
												<div class="registrations-info">
													<div class="row form-row reg-cont">
														<div class="col-12 col-md-6 col-lg-4">
															<div class="form-group">
																<label>면허이름</label>
																<input type="text" class="form-control" name="d_licence" value="">
															</div> 
														</div>
														<div class="col-12 col-md-6 col-lg-4">
															<div class="form-group">
																<label>면허번호</label>
																<input type="text" class="form-control" name="d_licence_num" value="">
															</div> 
														</div>
														<div class="col-12 col-md-6 col-lg-4">
															<div class="form-group">
																<label>취득년도</label>
																<input type="text" class="form-control">
															</div> 
														</div>
													</div>
												</div>
											</div>
											<!-- /Registrations -->
											<div class="col-12 ">
												<div class="form-inline">
												<label class="">우편번호<span class="text-danger"></span></label>
													<input type="text" name="d_zipcode" id="d_zipcode" class="zipcode form-control" placeholder="우편번호" readonly>
													<input type="button" onclick="execPostCode()" id="zipcode_btn" class="form-control " value="우편번호 찾기">
												</div>
												<div class="form-group">
												<label>주소<span class="text-danger"></span></label>
													<input type="text" id="d_address1" name="d_address1" class="addr1 form-control" size="40" placeholder="주소">
												</div>
												<div class="form-group">
												<label>상세주소<span class="text-danger"></span></label>
													<input type="text" id="d_address2" name="d_address2" class="addr2 form-control" size="40" placeholder="상세주소">
												</div>
											</div>
											<div class="submit-section" style="margin-top:20px;">
												<button type="submit" class="btn btn-primary submit-btn" id="submit-btn">회원가입</button>
												<button type="reset" class="btn btn-primary submit-btn" >다시입력</button>
											</div>
										</div>
									</form>
									<!-- /Profile Settings Form -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /Page Content -->