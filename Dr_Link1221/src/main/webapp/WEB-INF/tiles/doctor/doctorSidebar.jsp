<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Profile Sidebar -->
<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
<div class="profile-sidebar">
     <div class="widget-profile pro-widget-content">
        <div class="profile-info-widget">
           <a href="#" class="booking-doc-img">
              <img src="${path}/resources/assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
           </a>
           <div class="profile-det-info">
              <h3>${sessionScope.doctor.d_name} 의사</h3>
              <div class="patient-details">
                 <h5 class="mb-0">진료과 DB 가져오기 </h5>
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
                 <a href="my-patients">
                    <i class="fas fa-user-injured"></i>
                    <span>환자내역</span>
                 </a>
              </li>
              <li>
                 <a href="invoices">
                    <i class="fas fa-file-invoice"></i>
                    <span>Invoices</span>
                 </a>
              </li>
              <li>
                 <a href="reviews">
                    <i class="fas fa-star"></i>
                    <span>리뷰</span>
                 </a>
              </li>
              <li>
                 <a href="chat-doctor">
                    <i class="fas fa-comments"></i>
                    <span>메세지</span>
                    <!-- <small class="unread-msg">23</small> -->
                 </a>
              </li>
              <li>
                 <a href="doctor-profile-settings">
                    <i class="fas fa-user-cog"></i>
                    <span>프로필 수정</span>
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