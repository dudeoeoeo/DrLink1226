<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${path }">홈</a></li>
									<li class="breadcrumb-item"><a href="doctor_dashboard">마이페이지</a></li>
									<li class="breadcrumb-item active" aria-current="page">나의 후기</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">나의 후기</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
						
							<!-- Profile Sidebar -->
							<div class="profile-sidebar">
                        <div class="widget-profile pro-widget-content">
                           <div class="profile-info-widget">
                              <a href="#" class="booking-doc-img">
                                 <img src="${path}/resources/doctor/doctorImg/${sessionScope.doctor.d_photo}" class="img-fluid" alt="User Image">
                              </a>
                              <div class="profile-det-info">
                                 <h3>${sessionScope.doctor.d_name} 의사</h3>
                                 
                                 <div class="patient-details">
                                    <h5 class="mb-0">${sessionScope.doctor.departmentDTO.dep_name}</h5>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="dashboard-widget">
                           <nav class="dashboard-menu">
                              <ul>
                                <li class="active">
                                    <a href="doctor_dashboard">
                                       <i class="fas fa-columns"></i>
                                       <span>마이페이지</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="appointments">
                                       <i class="fas fa-calendar-check"></i>
                                       <span>진료일정</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="my_patients">
                                       <i class="fas fa-user-injured"></i>
                                       <span>나의 환자</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="reviews">
                                       <i class="fas fa-star"></i>
                                       <span>나의 후기</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="#">
                                       <i class="fas fa-comments"></i>
                                       <span>메세지</span>
                                       <small class="unread-msg">23</small>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="doctor_profile_settings">
                                       <i class="fas fa-user-cog"></i>
                                       <span>프로필 수정</span>
                                    </a>
                                 </li>
								<li>
                               		<a href="doctor_delete_account">
										<i class="fas fa-ban"></i>
										<span>회원탈퇴</span>
									</a>
								</li>
								<li>
                               		<a href="doctor_change_password">
										<i class="fas fa-key"></i>
										<span>비밀번호 수정</span>
									</a>
								</li>
                                 <li>
                                    <a href="${path}/logout">
                                       <i class="fas fa-sign-out-alt"></i>
                                       <span>로그아웃</span>
                                    </a>
                                 </li>
                              </ul>
                           </nav>
                        </div>
                     </div>
							<!-- /Profile Sidebar -->
							
						</div>
						<div class="col-md-7 col-lg-8 col-xl-9">
							<div class="doc-review review-listing">
									<ul class="comments-list">
										<c:if test="${empty reviewList }">
										<div class="card text-center">
										<p style="margin: 10px; padding: 10px;">나에게 남겨진 후기가 없습니다.</p>
										</div>
										</c:if>
										<c:forEach var="review" items="${reviewList}">
										<!-- Comment List -->
										<li>
											<div class="comment">
												<img class="avatar avatar-sm rounded-circle" alt="User Image" src="${path}/resources/patient/profileImg/${review.patientDTO.p_photo}">
												<div class="comment-body" style="width: -webkit-fill-available;">
													<div class="meta-data">
														<span class="comment-author">${review.patientDTO.p_name }</span>
														<span class="comment-date">${review.review_date}</span>
														<div class="review-count rating">
															<c:forEach begin="0" end="4" step="1" varStatus="i">
																<c:choose>
																	<c:when test="${review.review_rating > i.index}">
																		<i class="fas fa-star filled"></i>	
																	</c:when>
																	<c:otherwise>
																		<i class="fas fa-star"></i>(${review.review_rating})
																	</c:otherwise>
																</c:choose>	
															</c:forEach>
														</div>
													</div>
													<p class="comment-content">
														${review.review_content}
													</p>
												</div>
											</div>
										</li>
										<!-- /Comment List -->
										</c:forEach>
									</ul>
									
									<!-- Show All -->
									<!-- <div class="all-feedback text-center">
										<a href="#" class="btn btn-primary btn-sm">
											Show all feedback <strong>(167)</strong>
										</a>
									</div> -->
									<!-- /Show All -->
									
								</div>
								
							</div>
						</div>
					</div>
				</div>
			<!-- /Page Content -->
   
			