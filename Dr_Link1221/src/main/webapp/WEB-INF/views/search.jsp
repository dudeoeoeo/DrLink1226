<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html> 
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-8 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Search</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">의료진 소개</h2>
						</div>
						<!-- <div class="col-md-4 col-12 d-md-block d-none">
							<div class="sort-by">
								<span class="sort-title">Sort by</span>
								<span class="sortby-fliter">
									<select class="select">
										<option>Select</option>
										<option class="sorting">Rating</option>
										<option class="sorting">Popular</option>
										<option class="sorting">Latest</option>
										<option class="sorting">Free</option>
									</select>
								</span>
							</div>
						</div> -->
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">
						
							<form method="post" action="search">
							
							<!-- Search Filter -->
							<div class="card search-filter">
								<div class="card-header">
									<h4 class="card-title mb-0">검색 필터</h4>
								</div>
								<div class="card-body">
								<div class="filter-widget">
									<!-- <div class="cal-icon">
										<input type="text" class="form-control datetimepicker" placeholder="Select Date">
									</div>	 -->		
								</div>
								  <div class="filter-widget">
									<h4>성별</h4>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="d_gender" value="남">
											<span class="checkmark"></span> 남자 의사
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="d_gender" value="여">
											<span class="checkmark"></span> 여자 의사
										</label>
									</div>
								</div> 
								<div class="filter-widget">
									<h4>전공별</h4>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="dep_num" value="20">
											<span class="checkmark"></span> 피부과
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="dep_num" value="30">
											<span class="checkmark"></span> 정신건강의학과
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="dep_num" value="10">
											<span class="checkmark"></span> 안과
										</label>
									</div>
								</div>
									<div class="btn-search"> 
										<button type="submit" class="btn btn-block" >검색</button>
									</div>	
								</div>
							</div>
							<!-- /Search Filter -->
							</form>
						</div>
						
						<div class="col-md-12 col-lg-8 col-xl-9">
						<!-- <p>${total}</p>-->
							<c:forEach var="list" items="${list}" varStatus="listStatus">
							<!-- Doctor Widget -->
							<div class="card">
								<div class="card-body">
									<div class="doctor-widget">
										<div class="doc-info-left">
											<div class="doctor-img">
												<a href="doctor-profile">
													<img src="${path}/resources/doctor/doctorImg/${list.d_imgfile}" class="img-fluid" alt="User Image">
												</a>
											</div>
											<div class="doc-info-cont">
												<h4 class="doc-name"><a href="doctor-profile">${list.d_name }</a></h4>
												<p class="doc-speciality" style="padding-right: 15px;">${list.d_content }<br></p>
												<h5 class="doc-department"><img src="resources/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">${list.d_licence }</h5>
												<div class="rating">
												<c:forEach begin="1" end="5" step="1" varStatus="i">
												   <c:choose>
												      <c:when test="${review.review_rating ge i}">
												         <i class="fas fa-star filled"></i>   
												      </c:when>
												      <c:otherwise>
												         <i class="fas fa-star"></i>
												      </c:otherwise>
												   </c:choose>   
												</c:forEach>
													<!-- <i class="fas fa-star filled"></i>
													<i class="fas fa-star filled"></i>
													<i class="fas fa-star filled"></i>
													<i class="fas fa-star filled"></i>
													<i class="fas fa-star"></i> -->
													<span class="d-inline-block average-rating">별점</span>
												</div>
												<div class="clinic-services">
												 <c:choose>
					                                <c:when test="${empty m[0]}">
					                                    아직 정보가 입력되지 않았습니다.
					                                </c:when> 
					                                
					                              <c:otherwise>
					                              <c:set var="len" value="${fn:length(m[listStatus.index])}"/>
					                              <c:forEach begin="0" end="${len-1}" varStatus="mmList">
					                                 <span>${m[listStatus.index][mmList.index]}</span>
					                              </c:forEach>
					                              </c:otherwise>
					                              
					                             </c:choose> 
												</div> 
											</div>
										</div>
										<div class="doc-info-right">
											<div class="clini-infos">
												<!-- <ul>
													<li><i class="far fa-thumbs-up"></i> 98%</li>
													<li><i class="far fa-money-bill-alt"></i> 21,400<span>원</span> <i class="fas fa-info-circle" data-toggle="tooltip" title="시간당 원격화상진료비를 나타냅니다."></i> </li>
												</ul> -->
											</div>
											<div class="clinic-booking">
												<a class="view-pro-btn" href="doctor-profile?doctor_num=${list.doctor_num }">프로필보기</a>
												<a class="apt-btn" href="patients/booking">예약하기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Doctor Widget -->
							</c:forEach>

							<!-- <div class="load-more text-center">
								<a class="btn btn-primary btn-sm" href="javascript:void(0);">더 보기</a>	
							</div>	 -->
						<tfoot>
						<tr>
						<td colspan="4" id="pageTd">
							<%-- page 처리  --%>
							<%@include file="pageProcess.jsp" %>
						</td>
						
						</tfoot>
				</div>

					</div>		
						</div>
					</div>
				
			<!-- /Page Content -->