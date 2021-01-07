<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${path}/resources/assets/css/button.css">
<!DOCTYPE html> 
<script>
$(document).ready(function(){
	// 시간 선택 - 예약 유효성
	$(".timing").click(function(){
		var bthis = $(this);
		var bindex = $(this).closest('li').index();
		var bdate = $(".day-slot > ul > li:eq(" + bindex + ")").find("span:eq(1)").text();		
		var btime = $(this).find('span').text();
		var bdoctor_num = $(".doctor_num").val();
		
//		alert(bdate + ", " + btime);  
		$.ajax({
            async: true,
            type : 'POST',
            data : { 
            	'appointment_date' : bdate,
            	'appointment_time' : btime,
            	'doctor_num' : bdoctor_num
            },
            url : "bookingCheck.do",
            dataType : "text",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success : function(data) {
//            	alert(data);
            	if(data == 1){
            		alert('이미 예약되었습니다. 마이페이지에서 확인 해 주세요.');
            	}else if(data == 2){
            		alert('예약이 마감되었습니다. 다른 날을 이용 해 주세요.')
            	}else if(data == 3){
            		alert('당일 예약은 한 시간 전부터 가능합니다.')
            	}else{
            		$(".timing").attr("class","timing");
            		bthis.attr("class","timing selected");
            	}
            	
            },
            error : function(error) {              
                alert("error : " + error);
            }
            
        });
		
		
	});
	// 예약하기 버튼
	$(".bookingForm").submit(function(){
		var index = $(".timing.selected").closest("li").index();
		$(".appointment_date").val($(".day-slot > ul > li:eq(" + index + ")").find("span:eq(1)").text());
		$(".appointment_time").val($(".timing.selected").find("span").text());
	});
	
});
</script>	
<script>
function myFunction() {
  var x = document.getElementById("Demo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
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
									<li class="breadcrumb-item active" aria-current="page">예약</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">진료예약</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container">
				
					<div class="row">
						<div class="col-12">
						
							<div class="card">
								<div class="card-body">
									<div class="booking-doc-info">
										<a href="doctor-profile" class="booking-doc-img">
											<img src="${path}/resources/doctor/doctorImg/${doctor_profile.d_photo}" alt="User Image">
										</a>
										<div class="booking-info">
											<h4><a href="doctor-profile">${doctor_profile.d_name } 의사</a></h4>
											<div class="rating">
											<c:forEach begin="0" end="4" step="1" varStatus="i">
											   <c:choose>
											      <c:when test="${reviewList[0].ratingAvg > i.index}">
											         <i class="fas fa-star filled"></i>   
											      </c:when>
											      <c:otherwise>
											         <i class="fas fa-star"></i>
											      </c:otherwise>
											   </c:choose>   
											</c:forEach>
												<span class="d-inline-block average-rating"> ( ${fn:length(reviewList) } )</span>
											<!--  </div>
											<p class="text-muted mb-0"><i class="fas fa-map-marker-alt"></i> Newyork, USA</p>
										</div>-->
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-12 col-sm-4 col-md-6">
									<h4 class="mb-1">${fn:split(week[0][0],"-")[0]}년 ${fn:split(week[0][0],"-")[1]}월 ${fn:split(week[0][0],"-")[2]}일</h4>
									<p class="text-muted">${week[0][1]}</p>
								</div>
								<div class="col-12 col-sm-8 col-md-6 text-sm-right">
									<div class="bookingrange btn btn-white btn-sm">
										  <div class="w3-dropdown-click">
										    <button onclick="myFunction()" class="w3-button">날짜 변경</button>
										    <div id="Demo" class="w3-dropdown-content w3-bar-block w3-card-4 w3-animate-zoom">
										      <a href="booking?doctor_num=${doctor_profile.doctor_num}" class="w3-bar-item w3-button">이번 주</a>
										      <a href="booking?doctor_num=${doctor_profile.doctor_num}&week=1" class="w3-bar-item w3-button">1주 후</a>
										      <a href="booking?doctor_num=${doctor_profile.doctor_num}&week=2" class="w3-bar-item w3-button">2주 후</a>
										      <a href="booking?doctor_num=${doctor_profile.doctor_num}&week=3" class="w3-bar-item w3-button">3주 후</a>
										    </div>
										  </div>
									</div>
								</div>
                            </div>
							<!-- Schedule Widget -->
							<div class="card booking-schedule schedule-widget">
							
								<!-- Schedule Header -->
								<div class="schedule-header">
									<div class="row">
										<div class="col-md-12">
										
											<!-- Day Slot -->
											<div class="day-slot">
												<ul>
												<c:forEach var="week" items="${week}">
													<li>
														<span>${week[1] }</span>
														<span class="slot-date">${week[0]}</span>
													</li>
												</c:forEach>
												</ul>
											</div>
											<!-- /Day Slot -->
											
										</div>
									</div>
								</div>
								<!-- /Schedule Header -->
								
								<!-- Schedule Content -->
								<div class="schedule-cont">
									<div class="row">
										<div class="col-md-12">
										
											<!-- Time Slot -->
											<div class="time-slot">
												<ul class="clearfix">
													<li>
														<a class="timing" href="#">
															<span>9:00</span> 
														</a>
														<a class="timing" href="#">
															<span>10:00</span> 
														</a>
														<a class="timing" href="#">
															<span>11:00</span> 
														</a>
														<a class="timing" href="#">
															<span>12:00</span> 
														</a>
														<a class="timing" href="#">
															<span>14:00</span> 
														</a>
														<a class="timing" href="#">
															<span>15:00</span> 
														</a>
														<a class="timing" href="#">
															<span>16:00</span>
														</a>
													</li>
													<li>
														<a class="timing" href="#">
															<span>9:00</span> 
														</a>
														<a class="timing" href="#">
															<span>10:00</span> 
														</a>
														<a class="timing" href="#">
															<span>11:00</span> 
														</a>
														<a class="timing" href="#">
															<span>12:00</span> 
														</a>
														<a class="timing" href="#">
															<span>14:00</span> 
														</a>
														<a class="timing" href="#">
															<span>15:00</span> 
														</a>
														<a class="timing" href="#">
															<span>16:00</span>
														</a>
													</li>
													<li>
														<a class="timing" href="#">
															<span>9:00</span> 
														</a>
														<a class="timing" href="#">
															<span>10:00</span> 
														</a>
														<a class="timing" href="#">
															<span>11:00</span> 
														</a>
														<a class="timing" href="#">
															<span>12:00</span> 
														</a>
														<a class="timing" href="#">
															<span>14:00</span> 
														</a>
														<a class="timing" href="#">
															<span>15:00</span> 
														</a>
														<a class="timing" href="#">
															<span>16:00</span>
														</a>
													</li>
													<li>
														<a class="timing" href="#">
															<span>9:00</span> 
														</a>
														<a class="timing" href="#">
															<span>10:00</span> 
														</a>
														<a class="timing" href="#">
															<span>11:00</span> 
														</a>
														<a class="timing" href="#">
															<span>12:00</span> 
														</a>
														<a class="timing" href="#">
															<span>14:00</span> 
														</a>
														<a class="timing" href="#">
															<span>15:00</span> 
														</a>
														<a class="timing" href="#">
															<span>16:00</span>
														</a>
													</li>
													<li>
														<a class="timing" href="#">
															<span>9:00</span> 
														</a>
														<a class="timing" href="#">
															<span>10:00</span> 
														</a>
														<a class="timing" href="#">
															<span>11:00</span> 
														</a>
														<a class="timing" href="#">
															<span>12:00</span> 
														</a>
														<a class="timing" href="#">
															<span>14:00</span> 
														</a>
														<a class="timing" href="#">
															<span>15:00</span> 
														</a>
														<a class="timing" href="#">
															<span>16:00</span>
														</a>
													</li>
													<li>
														<a class="timing" href="#">
															<span>9:00</span> 
														</a>
														<a class="timing" href="#">
															<span>10:00</span> 
														</a>
														<a class="timing" href="#">
															<span>11:00</span> 
														</a>
														<a class="timing" href="#">
															<span>12:00</span> 
														</a>
														<a class="timing" href="#">
															<span>14:00</span> 
														</a>
														<a class="timing" href="#">
															<span>15:00</span> 
														</a>
														<a class="timing" href="#">
															<span>16:00</span>
														</a>
													</li>
													<li>
														<a class="timing" href="#">
															<span>9:00</span> 
														</a>
														<a class="timing" href="#">
															<span>10:00</span> 
														</a>
														<a class="timing" href="#">
															<span>11:00</span> 
														</a>
														<a class="timing" href="#">
															<span>12:00</span> 
														</a>
														<a class="timing" href="#">
															<span>14:00</span> 
														</a>
														<a class="timing" href="#">
															<span>15:00</span> 
														</a>
														<a class="timing" href="#">
															<span>16:00</span>
														</a>
													</li>
												</ul>
											</div>
											<!-- /Time Slot -->
											
										</div>
									</div>
								</div>
								<!-- /Schedule Content -->
								
							</div>
							<!-- /Schedule Widget -->
							<div class="container">
       						 <div class="row">
								<h4>변경 및 취소 안내&nbsp;&nbsp;</h4>
								<p>• 예약변경 및 취소는 진료예약일의 1일 전까지 가능합니다.<br>
								• 예약변경 및 취소는 웹사이트를 통해 하실 수 있습니다. (오전 10시~오후 5시까지 가능)<br>
								• 예약이 결정된 후 진료 10분 전에 로그인을 하지 않으실 경우, 사전 공지 없이 예약이 자동으로 취소될 수 있습니다.<br>
								• 당일 진료 시간을 지키지 못하시는 경우 다음 번 이용에 제한이 될 수 있습니다.</p>
								<br>
								<p>&nbsp;</p>
								
                                 </div>
							</div>
						<form action="bookingSave" method="post" class="bookingForm">
							<input type="hidden" name="doctor_num" class="doctor_num" value="${doctor_profile.doctor_num }" />
							<input type="hidden" name="dep_num" value="${doctor_profile.dep_num}" />						
							<input type="hidden" name="appointment_date" class="appointment_date" value="" />
							<input type="hidden" name="appointment_time" class="appointment_time" value="" />
						 <!-- Submit Section -->
							<div class="submit-section proceed-btn text-right">
								<button class="btn btn-primary submit-btn" >예약하기</button>
							</div>
							<!-- /Submit Section -->
						</form>
							
							
						</div>
					</div>
				</div>

			</div>		
			<!-- /Page Content -->
