<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>        
<script>
	$(document).ready(function(){
		$('.fav-btn').click(function(){
//			alert('');
			var index = $(this).closest('.col-md-6.col-lg-4.col-xl-3').index();
			var doctor_num = $(".doctor_num:eq("+index+")").val();
//			alert(doctor_num);
			deleteFavorite(doctor_num);
			
		});
		
		function deleteFavorite(doctor_num){
			$.ajax({
	            async: true,
	            type : 'POST',
	            data : { 
	            	'doctor_num' : doctor_num
	            },
	            url : "deleteFavorite.do",
	            dataType : "text",
	            contentType: "application/x-www-form-urlencoded; charset=utf-8",
	            success : function(data) {
	            	location.reload();
	            },
	            error : function(error) {              
	                alert("error : " + error);
	            }
	            
	        });
		}
		
	});
</script>
         <!-- Breadcrumb -->
         <div class="breadcrumb-bar">
            <div class="container-fluid">
               <div class="row align-items-center">
                  <div class="col-md-12 col-12">
					<nav aria-label="breadcrumb" class="page-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${path }">홈</a></li>
							<li class="breadcrumb-item"><a href="patient_dashboard">마이페이지</a></li>
							<li class="breadcrumb-item active" aria-current="page">즐겨찾는 의사</li>
						</ol>
					</nav>
					<h2 class="breadcrumb-title">마이페이지</h2>
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
							<a class="booking-doc-img"> <img
								src="${path}/resources/patient/profileImg/${patient_profile.p_photo}"
								class="img-fluid" alt="User Image">
							</a>
							<div class="profile-det-info">
								<h3>${patient_profilep_name }</h3>
								<div class="patient-details">
									<h5>
										<i class="fas fa-birthday-cake"></i> ${patient_profile.birth}
									</h5>
									<h5 class="mb-0">
										<i class="fas fa-map-marker-alt"></i>
										${patient_profile.profileAddress}
									</h5>
								</div>
							</div>
						</div>
					</div>
					<div class="dashboard-widget">
						<nav class="dashboard-menu">
							<ul>
								<li><a href="patient_dashboard"> <i
										class="fas fa-columns"></i> <span>진료확인</span>
								</a></li>
								<li class="active"><a href="favorites"> <i class="fas fa-bookmark"></i> <span>즐겨찾는
											의사</span>
								</a></li>
								<li><a href="profile_settings"> <i
										class="fas fa-user-cog"></i> <span>개인정보 수정</span>
								</a></li>
								<li><a href="patient_change_password"> <i
										class="fas fa-key"></i> <span>비밀번호 수정</span>
								</a></li>
								<li><a href="patient_delete_account"> <i
										class="fas fa-ban"></i> <span>회원탈퇴</span>
								</a></li>
								<li><a href="${path}/logout"> <i
										class="fas fa-sign-out-alt"></i> <span>로그아웃</span>
								</a></li>
							</ul>
						</nav>
					</div>

				</div>
			</div>
			<!-- / Profile Sidebar -->
                  <div class="col-md-7 col-lg-8 col-xl-9">
                     
                     <c:if test="${empty favorites }">
							<div class="card text-center">
								<p style="margin: 10px; padding: 10px;">즐겨찾는 의사가 없습니다.</p>
							</div>
						</c:if>
                     <!-- start for -->
                     <div class="row row-grid">
                     <c:forEach var="favorite" items="${favorites}" varStatus="i" >
                     	<div class="col-md-6 col-lg-4 col-xl-3">
                     		<input type="hidden" class="doctor_num" value="${favorite.doctor_num }">
									<div class="profile-widget">
										<div class="doc-img">
											<a href="doctor_profile?doctor_num=${favorite.doctor_num }">
												<img class="img-fluid" alt="User Image" src="${path }/resources/doctor/doctorImg/${favorite.doctorDTO.d_photo}">
											</a>
											<a href="javascript:void(0)" class="fav-btn">
												<i class="far fa-bookmark"></i>
											</a>
										</div>
										<div class="pro-content">
											<h3 class="title">
												<a href="doctor_profile?doctor_num=${favorite.doctor_num }">Dr. ${favorite.doctorDTO.d_name }</a> 
											</h3>
											<p class="speciality">${favorite.doctorDTO.departmentDTO.dep_name }</p>
											<div class="rating">
												<c:forEach begin="0" end="4" step="1" varStatus="i">
													<c:choose>
														<c:when test="${favorite.doctorDTO.doc_ReviewDTO.review_rating > i.index}">
															<i class="fas fa-star filled"></i>
														</c:when>
														<c:otherwise>
															<i class="fas fa-star"></i>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<span class="d-inline-block average-rating">(17)</span>
											</div>
											<ul class="available-info">
												<li>
												<c:if test="${empty favorite.doctorDTO.d_content }">입력된 자기소개가 없습니다.</c:if>
												<c:if test="${not empty favorite.doctorDTO.d_content }">${favorite.doctorDTO.d_content }</c:if>
												</li>
											</ul>
											<div class="row row-sm">
												<div class="col-6">
													<a href="doctor_profile?doctor_num=${favorite.doctor_num }" class="btn view-btn">프로필보기</a>
												</div>
												<div class="col-6">
													<a href="booking?doctor_num=${favorite.doctor_num }" class="btn book-btn">예약하기</a>
												</div>
											</div>
										</div>
									</div>
								</div>
				     </c:forEach>
                        <!-- end for -->
                     </div>
                  </div>
               </div>
            </div>

         </div>      
         <!-- /Page Content -->