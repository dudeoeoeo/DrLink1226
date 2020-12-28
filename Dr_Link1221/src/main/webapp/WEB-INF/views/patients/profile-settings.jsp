<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>		
<!-- 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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

              document.getElementById('p_zipcode').value = data.zonecode; //5자리 새우편번호 사용
              document.getElementById('p_address1').value = fullRoadAddr;
              document.getElementById('p_address2').focus();

              console.log(data);

          }

      }).open();
	 
};

	$(document).ready(function(){
		$(".form-control.select").val($(".pre_bloodtype").val()).prop("selected",true);
		//업로드 이미지 미리보기
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
						$('.blah').attr('src', e.target.result);
					} 
				reader.readAsDataURL(input.files[0]);
			} 
		} 
	});
		
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
<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">마이페이지</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">개인정보 수정</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
					
						<!-- Profile Sidebar -->
						<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
							<div class="profile-sidebar">
								<div class="widget-profile pro-widget-content">
									<div class="profile-info-widget">
										<a href="#" class="booking-doc-img">
											<img src="${path }/resources/patient/profileImg/${patient.p_photo}" alt="User Image">
										</a>
										<div class="profile-det-info">
											<h3>${patient.p_name }</h3>
											<div class="patient-details">
												<h5><i class="fas fa-birthday-cake"></i> ${patient.birth }</h5>
												<h5 class="mb-0"><i class="fas fa-map-marker-alt"></i> ${patient.profileAddress }</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="dashboard-widget">
									<nav class="dashboard-menu">
										<ul>
											<li>
												<a href="patient_dashboard">
													<i class="fas fa-columns"></i>
													<span>진료확인</span>
												</a>
											</li>
											<li>
												<a href="#">
													<i class="fas fa-bookmark"></i>
													<span>Favourites</span>
												</a>
											</li>
											<li class="active">
												<a href="profile-settings">
													<i class="fas fa-user-cog"></i>
													<span>개인정보 수정</span>
												</a>
											</li>
											<li>
												<a href="index">
													<i class="fas fa-sign-out-alt"></i>
													<span>로그아웃</span>
												</a>
											</li>
										</ul>
									</nav>
								</div>

							</div>
						</div>
						<!-- /Profile Sidebar -->
						
						<div class="col-md-7 col-lg-8 col-xl-9">
							<div class="card">
								<div class="card-body">
									
									<!-- Profile Settings Form -->
									<form action="updatePatient" method="post" enctype="multipart/form-data" >
										<div class="row form-row">
											<div class="col-12 col-md-12">
												<div class="form-group">
													<div class="change-avatar">
														<div class="profile-img">
															<img id="blah" src="${path }/resources/patient/profileImg/${patient.p_photo}" alt="User Image">
														</div>
														<div class="upload-img">
															<div class="change-photo-btn">
																<span><i class="fa fa-upload"></i> 사진 첨부</span>
																<input type="file" class="upload" name="file" onchange="readURL(this);">
															</div>
															<small class="form-text text-muted">JPG, GIF, PNG만 허용됩니다. 최대 사이즈 2MB</small>
														</div>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>성</label>
													<input type="text" class="form-control" value="${fn:substring(patient.p_name,0,1)}" readonly >
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>이름</label>
													<input type="text" class="form-control" value="${fn:substring(patient.p_name,1,3)}" readonly >
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>생년월일</label>
													<div class="cal-icon">
														<input type="text" class="form-control datetimepicker" value="${fn:substring(patient.birth,0,13)}" readonly >
													</div>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<input type="hidden" class="pre_bloodtype" value="${fn:trim(patient.bloodtype) }">
													<label>혈액형</label>
													<select class="form-control select" name="bloodtype">
														<option value="" selected="selected">- 혈액형 선택 -</option>
														<option value="A-">A-</option>
														<option value="A+">A+</option>
														<option value="B-">B-</option>
														<option value="B+">B+</option>
														<option value="AB-">AB-</option>
														<option value="AB+">AB+</option>
														<option value="O-">O-</option>
														<option value="O+">O+</option>
													</select>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>Email</label>
													<input type="email" class="form-control" value="${patient.p_email }" name="p_email">
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>핸드폰</label>
													<input type="text" value="${patient.p_phone_num }" name="p_phone_num" class="form-control">
												</div>
											</div>
											<div class="col-12 ">
												<div class="form-group">
													<label>주소</label>
													<div class="form-inline">
														<input type="text" name="p_zipcode" id="p_zipcode" class="zipcode form-control" placeholder="우편번호"  value="${patient.p_zipcode }">
														<input type="button" onclick="execPostCode()" id="zipcode_btn" class="form-control " value="우편번호 찾기">
													</div>
												</div>
												<div class="form-group">
													<input type="text" id="p_address1" name="p_address1" class="addr1 form-control" size="40" placeholder="주소" value="${patient.p_address1 }">
												</div>
												<div class="form-group">
													<input type="text" id="p_address2" name="p_address2" class="addr2 form-control" size="40" placeholder="상세주소" value="${patient.p_address2 }">
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>현재 비밀번호</label>
													<input type="password" class="form-control">
												</div>
												<br>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>변경할 비밀번호</label>
													<input type="password" class="form-control">
												</div>
											</div>
										</div>
										<div class="submit-section">
											<button type="submit" class="btn btn-primary submit-btn">변경 저장하기</button>
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
   
