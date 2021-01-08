<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>        
         <!-- Breadcrumb -->
         <div class="breadcrumb-bar">
            <div class="container-fluid">
               <div class="row align-items-center">
                  <div class="col-md-12 col-12">
                     <nav aria-label="breadcrumb" class="page-breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="index">Home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">Favourites</li>
                        </ol>
                     </nav>
                     <h2 class="breadcrumb-title">Favourites</h2>
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
                     <div class="profile-sidebar">
                        <div class="widget-profile pro-widget-content">
                           <div class="profile-info-widget">
                              <a href="#" class="booking-doc-img">
                                 <img src="${pageContext.request.contextPath}/resources/img/patients/patient.jpg" alt="User Image">
                              </a>
                              <div class="profile-det-info">
                                 <h3>Richard Wilson</h3>
                                 <div class="patient-details">
                                    <h5><i class="fas fa-birthday-cake"></i> 24 Jul 1983, 38 years</h5>
                                    <h5 class="mb-0"><i class="fas fa-map-marker-alt"></i> Newyork, USA</h5>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="dashboard-widget">
                           <nav class="dashboard-menu">
                              <ul>
                                 <li>
                                    <a href="patient-dashboard">
                                       <i class="fas fa-columns"></i>
                                       <span>Dashboard</span>
                                    </a>
                                 </li>
                                 <li class="active">
                                    <a href="favourites">
                                       <i class="fas fa-bookmark"></i>
                                       <span>즐겨찾는 의사</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="chat">
                                       <i class="fas fa-comments"></i>
                                       <span>Message</span>
                                       <small class="unread-msg">23</small>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="profile-settings">
                                       <i class="fas fa-user-cog"></i>
                                       <span>Profile Settings</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="change-password">
                                       <i class="fas fa-lock"></i>
                                       <span>Change Password</span>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="index">
                                       <i class="fas fa-sign-out-alt"></i>
                                       <span>Logout</span>
                                    </a>
                                 </li>
                              </ul>
                           </nav>
                        </div>

                     </div>
                  </div>
                  <div class="col-md-7 col-lg-8 col-xl-9">
                     <div class="row row-grid">
                     <!-- start for -->
                     <c:forEach var="favorite" items="${favorites}" varStatus="i" >
                     	<div class="col-md-6 col-lg-4 col-xl-3">
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
											<p class="speciality">MDS - Periodontology and Oral Implantology, BDS</p>
											<div class="rating">
												<c:forEach begin="0" end="4" step="1" varStatus="i">
													<c:choose>
														<c:when
															test="${favorite.doctorDTO.doc_ReviewDTO.review_rating > i.index}">
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
													<i class="fas fa-map-marker-alt"></i> Florida, USA
												</li>
												<li>
													<i class="far fa-clock"></i> Available on Fri, 22 Mar
												</li>
												<li>
													<i class="far fa-money-bill-alt"></i> $300 - $1000 <i class="fas fa-info-circle" data-toggle="tooltip" title="" data-original-title="Lorem Ipsum"></i>
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