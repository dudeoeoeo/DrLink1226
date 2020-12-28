<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html> 			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${path}/">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">예약</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">예약성공</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content success-page-cont">
				<div class="container-fluid">
				
					<div class="row justify-content-center">
						<div class="col-lg-6">
						
							<!-- Success Card -->
							<div class="card success-card">
								<div class="card-body">
									<div class="success-cont">
										<i class="fas fa-check"></i>
										<h3>예약이 완료되었습니다!</h3>
										<p>예약된 의사 : <strong>${doctor_profile.departmentDTO.dep_name}   ${doctor_profile.d_name} 의사</strong><br> 예약 일시 : <strong>${fn:substring(bookingInfo.appointment_date,0,3)}년 ${fn:substring(bookingInfo.appointment_date,5,6)}월 ${fn:substring(bookingInfo.appointment_date,8,9)}일 ${bookingInfo.appointment_time }</strong></p>
										<a href="${path }/" class="btn btn-primary view-inv-btn">메인화면으로</a>
									</div>
								</div>
							</div>
							<!-- /Success Card -->
							
						</div>
					</div>
					
				</div>
			</div>		
			<!-- /Page Content -->
