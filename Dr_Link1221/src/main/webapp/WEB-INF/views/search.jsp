<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script>
	
</script>
<!-- Breadcrumb -->
<div class="breadcrumb-bar">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-md-8 col-12">
				<h2 class="breadcrumb-title">의료진 소개</h2>
			</div>
		</div>
	</div>
</div>
<!-- /Breadcrumb -->

<!-- Page Content -->
<div class="content">
	<div class="container-fluid">

		<div class="row">
			<div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">

				<form method="post" action="search" class="searchFrm">

					<!-- Search Filter -->
					<div class="card search-filter">
						<div class="card-header">
							<h4 class="card-title mb-0">검색 필터</h4>
						</div>
						<div class="card-body">
							<div class="filter-widget"></div>
							<div class="filter-widget">
								<h4>성별</h4>
								<div>
									<label class="custom_check"> <input type="checkbox"
										name="d_gender" value="1"
										<c:forEach var="gender" items="${d_genderList}">
													<c:if test="${fn:trim(gender) eq '1' }">checked</c:if>
												</c:forEach>
										selected> <span class="checkmark"></span> 남자 의사
									</label>
								</div>
								<div>
									<label class="custom_check"> <input type="checkbox"
										name="d_gender" value="2"
										<c:forEach var="gender" items="${d_genderList}">
													<c:if test="${fn:trim(gender) eq '2' }">checked</c:if>
												</c:forEach>>
										<span class="checkmark"></span> 여자 의사
									</label>
								</div>
							</div>
							<div class="filter-widget">
								<h4>전공별</h4>
								<div>
									<label class="custom_check"> <input type="checkbox"
										name="dep_num" value="20"
										<c:forEach var="dep_num" items="${dep_numList}">
													<c:if test="${fn:trim(dep_num) eq '20' }">checked</c:if>
												</c:forEach>>
										<span class="checkmark"></span> 피부과
									</label>
								</div>
								<div>
									<label class="custom_check"> <input type="checkbox"
										name="dep_num" value="30"
										<c:forEach var="dep_num" items="${dep_numList}">
													<c:if test="${fn:trim(dep_num) eq '30' }">checked</c:if>
												</c:forEach>>
										<span class="checkmark"></span> 정신건강의학과
									</label>
								</div>
								<div>
									<label class="custom_check"> <input type="checkbox"
										name="dep_num" value="10"
										<c:forEach var="dep_num" items="${dep_numList}">
													<c:if test="${fn:trim(dep_num) eq '10' }">checked</c:if>
												</c:forEach>>
										<span class="checkmark"></span> 안과
									</label>
								</div>
							</div>
							<input type="hidden" class="page_num" name="d_page" value="1" />					
							<div class="btn-search">
								<button type="submit" class="btn btn-block">검색</button>
							</div>
						</div>
					</div>
					<!-- /Search Filter -->
				</form>
			</div>


			<div class="col-md-12 col-lg-8 col-xl-9">
				<div class="card">
					<c:choose>
						<c:when test="${empty list}">
							<p style="margin: 10px; padding: 10px;">결과를 찾을 수 없습니다.</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${list}" varStatus="listStatus">
								<!-- Doctor Widget -->
								<div class="card-body">
									<div class="doctor-widget" style="margin: 0px 50px 0px 30px;">
										<div class="doc-info-left">
											<div class="doctor-img w-40" style="margin: 14px 60px 5px 34px;">
												<a href="doctor_profile?doctor_num=${list.doctor_num }">
													<img
													src="${path}/resources/doctor/doctorImg/${list.d_photo}"
													class="img-fluid" alt="User Image">
												</a>
											</div>
											<div class="doc-info-cont" style="margin: 14px 60px 0px 0px; width:200px;">
												<h4 class="doc-name">
													<a href="doctor_profile?doctor_num=${list.doctor_num }">${list.d_name }</a>
												</h4>
												<p class="doc-speciality" style="padding-right: 15px;">${list.departmentDTO.dep_name }<br>
												</p>
												<h5 class="doc-department">
													<i class="fa fa-stethoscope" aria-hidden="true"></i>
													${list.d_licence }
												</h5>
												<div class="rating">
													<c:forEach begin="0" end="4" step="1" varStatus="i">
														<c:choose>
															<c:when
																test="${list.doc_ReviewDTO.review_rating > i.index}">
																<i class="fas fa-star filled"></i>
															</c:when>
															<c:otherwise>
																<i class="fas fa-star"></i>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<span class="d-inline-block average-rating">${list.doc_ReviewDTO.review_rating }</span>
												</div>
											</div>
											
											<div class="row align-items-center" style="margin-right: auto;">
											<ul class="" style="list-style:none; line-height: 2em;">
											<li class="">
											진료시간 평일 09:00~18:00
											</li>
											<li class="clinic-services">
											<c:choose>
													<c:when test="${empty list.d_fields}">
			                                   <span> 아직 정보가 입력되지 않았습니다.</span>
			                                </c:when>

													<c:otherwise>
														<c:forEach var="d_field" items="${list.d_fields }">
															<c:if test="${not empty d_field and d_field != ''}">
																<span>${d_field}</span>
															</c:if>
														</c:forEach>
													</c:otherwise>

												</c:choose></li>
												</ul>
											</div>
										</div>
										<div class="doc-info-right" >
											<div class="clini-infos">
												<!-- <ul>
													<li><i class="far fa-thumbs-up"></i> 98%</li>
													<li><i class="far fa-money-bill-alt"></i> 21,400<span>원</span> <i class="fas fa-info-circle" data-toggle="tooltip" title="시간당 원격화상진료비를 나타냅니다."></i> </li>
												</ul> -->
											</div>
											<div class="clinic-booking">
												<a class="view-pro-btn"
													href="doctor_profile?doctor_num=${list.doctor_num }">프로필보기</a>
												<c:if test="${not empty sessionScope.user }">
													<a class="apt-btn"
														href='${path}/patients/booking?doctor_num=${list.doctor_num}'>예약하기</a>
												</c:if>
											</div>
										</div>
									</div>
								</div>
								<!-- /Doctor Widget -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
			<!-- 페이징	-->	
				<div class="row mx-auto">
					<div class="col-md-12">
						<div class="blog-pagination">
							<nav>
								<ul class="pagination justify-content-center">
									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1"><i class="fas fa-angle-double-left"></i></a>
									</li>
									<c:forEach begin="1" end="${p_num}" var="p">
										<li class="page-item">
											<input type="hidden" class="p_num" value=${p } />
											<a class="page-link" href="#" onclick="submit()">${p}</a></li>
									</c:forEach>
									<li class="page-item"><a class="page-link" href="#"><i
											class="fas fa-angle-double-right"></i></a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			  <!-- /페이징 -->
			  
			  <script type="text/javascript">
			  	$(document).ready(function(){
			  		$('.page-item').click(function(){
			  			var index = $(this).closest('.page-item').index()-1;
//			  			alert(index);
			  			$('.page_num').val($(".p_num:eq("+index+")").val());
			  			$(".searchFrm").submit();
			  		});
			  	});
			  </script>
				</div>
			</div>

		</div>
	</div>
</div>

<!-- /Page Content -->

<script>
	$(function() {
		var uid = '${sessionScope.user.p_name}';

		$('.apt-btn').click(function() {
			if (uid == '' || uid == null) {
				if (confirm("로그인이 필요한 서비스 입니다. \n 지금 로그인 하시겠습니까 ?")) {
					$(this).attr('href', 'patient_login')
				} else {
					$(this).attr('href', '')
				}
			} else if (uid != '' || uid != null) {
			}
		}) // click
	});
</script>