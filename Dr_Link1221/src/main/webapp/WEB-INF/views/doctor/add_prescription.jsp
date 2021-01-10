<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html> 

<%
	Date nowTime = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat time = new SimpleDateFormat("hh:mm a");;
%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>처방전 작성-Dr.Link</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
		<!-- Favicons -->
		<link href="${path}/resources/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/fontawesome.min.css">
		<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/all.min.css">
		
		<!-- Main CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/css/style.css">
		
		<!-- 약품검색 -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />


	<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&display=swap" rel="stylesheet">
<style>
body {
    font-family: "Nanum Gothic", sans-serif;
}

.footer-menu{
	color:#fff;
}
	
</style>
	
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">
					
					<div class="row">
						<div class="col-md-8 offset-md-2">
							<!-- Login Tab Content -->
							<div class="account-content">
								<div class="card" style="margin:1.5rem !important;">
								<div class="card-header text-center" style="border-bottom:0px !important; margin-top:10px !important;">
									<h4>📃처방전📃</h4>
								</div>
								<form id="prescription_form" method="post">
									<div class="card-body">
									<!-- 환자명 진료과목 처방시간 의사명 약품번호 결제여부 -->
									<div class="row">
										<div class="col-sm-6">
											<div class="biller-info">
												<h4 class="d-block">${patientinfo.p_name} 님</h4>
												<span class="d-block text-sm text-muted">${doctorinfo.departmentDTO.dep_name} 진료</span>
											</div>
										</div>
										<div class="col-sm-6 text-sm-right">
											<div class="billing-info">
												<h4 class="d-block"><%= date.format(nowTime) %></h4>
												<h4 class="d-block start_time">진료시간</h4>
												<br/><button class="end_time">진료완료</button>
												<input type="hidden" name="prescription_date" value="<%= date.format(nowTime)%>"/>
												<input type="hidden" name="prescription_date" value="<%= time.format(nowTime)%>"/>
												<input type="hidden" name="patient_num" value="${patientinfo.patient_num}"/>
												<input type="hidden" name="doctor_num" value="${doctorinfo.doctor_num}"/>
												<input type="hidden" name="dep_num" value="${doctorinfo.departmentDTO.dep_num}"/>
											</div>
										</div>
									</div>
										<div class="table-responsive">
														<table class="table table-hover table-center mb-0">
															<thead>
																<tr>
																	<th>교부 일자</th>
																	<th>환자 성명</th>
																	<th>처방 의료인의 성명</th>
																	<th>면허 증빙</th>
																	<th>면허 번호</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td><%= date.format(nowTime) %>
																	<span class="d-block text-info"><%= time.format(nowTime) %></span></td>
																	<td>${patientinfo.p_name}</td>
																	<td class="text-left">
																		<h2 class="table-avatar">
																			<a href="" style="pointer-events: none;">${doctorinfo.d_name}<span>${doctorinfo.departmentDTO.dep_name}</span></a>
																		</h2>
																	</td>
																	<td>${doctorinfo.d_licence}</td>
																	<td>${doctorinfo.d_licence_num}</td>
																</tr>
															</tbody>
														</table>
														<table class="table table-hover table-center mb-0 text-center">
															<thead>
																<tr>
																	<th>병원 이름</th>
																	<th>전화 번호</th>
																	<th>팩스 번호</th>
																	<th>의사 서명</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>${drlinkinfo.dl_name}</td>
																	<td>${drlinkinfo.dl_tel}</td>
																	<td>${drlinkinfo.dl_faxtel}</td>
																	<td><Strong style="text-decoration:underline; color:#003669;">${doctorinfo.d_name}</Strong></td>
																</tr>
															</tbody>
														</table>
													</div>
													
													<!-- Add Item -->
													<div class="add-more text-right">
														<a href="javascript:void(0);" class="add-prescription"><i class="fa fa-plus-circle"></i> 추가하기</a>
													</div>
													
													<!-- /Add Item -->
													
													<!-- Prescription Item -->
									
									<div class="card card-table">
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-hover table-center text-center">
												<thead>
													<tr>
														<th style="width: 200px">약품명</th>
														<th style="width: 100px">투여량</th>
														<th style="width: 100px">횟수</th>
														<th style="width: 100px;">일수</th>
														<th style="width: 80px;"></th>
													</tr>
												</thead>
												<tbody class="prescription-info">
													<tr class="prescription-cont">
														<td>
															<select name="medicines" class="form-control select2 select_medi" id="select2"> 
															<c:forEach var="medi" items="${medicine_info}">
																<option value="${medi.medicine_num}">${medi.medicine_name}</option>
															</c:forEach>
															</select>
														</td>
														<td>
															<input class="form-control" value="" type="text" name="dsg">
														</td>
														<td>
															<input class="form-control" value="" type="text" name="qty">
														</td>
														<td>
															<input class="form-control" value="" type="text" name="tdate">
														</td>
														<td>
														</td>
													</tr>
												</tbody>
												</table>
											</div>
										</div>
									</div>
									<!-- /Prescription Item -->
									
									<!-- 금액입력 -->
									<table class="table table-hover table-center mb-0 text-center">
										<thead>
											<tr>
												<th style="width: 30%;float: right;">금액</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="width: 30%;float: right;" >
												<input class="form-control" value="" type="text" name="price" readonly="readonly" placeholder="금액을 입력해주세요" style="width:70%;float: right;">
												</td>
											</tr>
										</tbody>
									</table>
									
									<!-- /금액입력 -->
													
											<div class="text-center" style="margin:10px !important;">		
												<button type="submit" class="btn btn-info submit-btn send_btn" >입력 완료</button>
												<button type="submit" class="btn btn-info submit-btn" formaction="#">취소</button>
											</div>	
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>		
			<!-- /Page Content -->
	  
<!-- jQuery -->
<script src="${path}/resources/assets/js/jquery.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${path}/resources/assets/js/popper.min.js"></script>
<script src="${path}/resources/assets/js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="${path}/resources/assets/js/script.js"></script>
<!-- Select2 JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.js" ></script>
<!-- Profile Settings JS -->
<script src="${path}/resources/assets/js/profile-settings.js"></script>

<!-- Custom JS -->
<script src="${path}/resources/assets/js/script.js"></script>


<!-- 한글처리 -->
<script src="https://unpkg.com/hangul-js" type="text/javascript"></script>
<script>
$(function(){
	var cnt = 0;
	var flag = true;
	var dep_num = '${sessionScope.doctor.dep_num}'
	var patient_num = '${patientinfo.patient_num}'
	var doctor_num = '${sessionScope.doctor.doctor_num}'
	var appointment_num = '${appointment_num}'
	var today = new Date();
	var start_treatment_time = today.getFullYear() +"-"+ today.getMonth()+1 +"-"+ today.getDate()+ " " +today.getHours() +":"+ today.getMinutes()
	var treat_num = 0;
	setInterval(function(){
		if(flag) {
			cnt += 1;
			$('.start_time').text("진료시간 : " + cnt +" 초");
		}
	}, 1*1000) // set
	
	$('.end_time').click(function(e){
		flag = false;
		alert("진료가 완료되었습니다. 진료시간은 "+cnt+" 초 입니다.");
		$('input[name="price"]').val(3000+(parseInt(cnt/60+1)*700))

		var formData = new FormData();
		formData.append('dep_num', dep_num)
		formData.append('patient_num', patient_num)
		formData.append('appointment_num', appointment_num)
		formData.append('doctor_num', doctor_num)
		formData.append('start_treatment_time', start_treatment_time)
		formData.append('monitoring_time', cnt)
		
	    $.ajax({
	        url : "treatment_record",
	        type: "POST",
	        data: formData,
	        async : true,
	        processData: false,
	        contentType: false,
	        cache: false,
	        success:function(data) {
	        	if(data.result > 0) {
	        		alert("처방전을 입력해주세요.");
	        	}
	        	treat_num = data.result;
	        	e.preventDefault();
	        }
	    });
		
		e.preventDefault();
	}) // click
	
	 $(".prescription-info").on('click','.trash', function () {
			$(this).closest('.prescription-cont').remove();
			 return false; 
	    });
	$(".add-prescription").on('click', function () {

		$(".prescription-info").append('<tr class="prescription-cont">'+
	   			'<td>'+
	   			'<select class="form-control select2 select_medi">'+ 
				'<c:forEach var="medi" items="${medicine_info}">'+
				'<option value="${medi.medicine_num}">${medi.medicine_name}</option>'+	
				'</c:forEach>'+
				'</select>'+
				'</td>'+
				'<td>'+
				'<input class="form-control" value="" type="text" name="dsg">'+
				'</td>'+
				'<td>'+
				'<input class="form-control" value="" type="text" name="qty">'+
				'</td>'+
				'<td>'+
				'<input class="form-control" value="" type="text" name="tdate">'+
				'</td>'+
				'<td>'+					
				'<a href="#" class="btn bg-danger-light trash">'+
				'<i class="far fa-trash-alt">'+'</i>'+
				'</a>'+
				'</td>'+
				'</tr>');
	       		$('select.select2').last().select2();
	       		
			 return false;
		   }); // click
		   
		$(".select2").select2();
	    $('.send_btn').click(function(){
	    	var medi_num = [];
	    	$('select.select_medi').each(function(){
	    		console.log($(this).val());
	    		medi_num.push($(this).val());
	    	}) // each
	    	$('#prescription_form').append('<input type="hidden" name="treatment_num" value="'+treat_num+'">')
	    	$('#prescription_form').append('<input type="hidden" name="monitoring_time" value="'+cnt+'">');
	    	$('#prescription_form').append('<input type="hidden" name="medi_num" value="'+medi_num+'">');
	    	$('#prescription_form').attr('action', 'end_prescription').submit();
	    }) // click
});



		</script>
	</body>
</html>