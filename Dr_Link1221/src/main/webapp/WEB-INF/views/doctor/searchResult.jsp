<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<c:forEach var="doctor" items="${doctor_list}">
		<div class="card">
			<div class="card-body">
				<div class="doctor-widget">
					<div class="doc-info-left">
						<div class="doctor-img">
							<a href="doctor-profile.html"> <img
								src="${path}/resources/assets/doctor_img/${doctor.doctor_photo}"
								class="img-fluid" alt="User Image">
							</a>
						</div>
						<div class="doc-info-cont">
							<h4 class="doc-name">
								<a href="doctor-profile.do?doctor_no=${doctor.doctor_no}">Dr.
									${doctor.doctor_name}</a>
							</h4>
							<p class="doc-speciality">${doctor.dept.dept_name}</p>
							<h5 class="doc-department">Dr.Link</h5>
							<div class="rating">
								<i class="fas fa-star filled"></i> <i class="fas fa-star filled"></i>
								<i class="fas fa-star filled"></i> <i class="fas fa-star filled"></i>
								<i class="fas fa-star"></i> <span
									class="d-inline-block average-rating">(17)</span>
							</div>
						</div>
					</div>
					<div class="doc-info-right">
						<div class="clini-infos">
							<ul>
								<li><i class="far fa-thumbs-up"></i> 98%</li>
								<li><i class="far fa-comment"></i> 17 Feedback</li>
							</ul>
						</div>
						<div class="clinic-booking">
							<a class="view-pro-btn"
								href="doctor-profile.do?doctor_no=${doctor.doctor_no}">View
								Profile</a> <a class="apt-btn" href="booking.html">Book
								Appointment</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Doctor Widget -->
	</c:forEach>