<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>Dr.Link에 오신 것을 환영합니다</title>

<!-- login CSS -->
<link rel="stylesheet" href="${path}/resources/assets/css/login.css">
<link rel="stylesheet" href="${path}/resources/assets/css/nicepage.css">

<!-- Favicons -->
<link type="image/x-icon" href="${path}/resources/assets/img/favicon.png" rel="icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/all.min.css">
		
<!-- Daterangepikcer CSS -->
<link rel="stylesheet" href="${path}/resources/assets/plugins/daterangepicker/daterangepicker.css">

<!-- Main CSS -->
<link rel="stylesheet" href="${path}/resources/assets/css/style.css">


<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&display=swap" rel="stylesheet">

<style>
body {
    font-family: "Nanum Gothic", sans-serif;
}

#header-wrapper{
	background-image: url("${path}/resorces/img/banner.jpg");
	background-size : cover;
}

@media all and (min-width: 992px) {
	.navbar .nav-item .dropdown-menu{ display: none; }
	.navbar .nav-item:hover .nav-link{ color: black;  }
	.navbar .nav-item:hover .dropdown-menu{ display: block; }
	.navbar .nav-item .dropdown-menu{ margin-top:0; }
}	

#drlink{
font-family: 'Major Mono Display', monospace; 
margin-right: 20px;
}

ul .bxslider{
width:auto !important;
}

#bxslider{
width:auto !important;
}

.footer-menu{
	color:#fff;
}

</style>

</head>
<body>

	<!-- Main Wrapper -->
	
	<tiles:insertAttribute name="header"/>
	
	<!-- Home Banner -->
	<div class="main-wrapper">
	<tiles:insertAttribute name="body" />	
	</div>
	<!-- Footer -->
	<tiles:insertAttribute name="footer" />
	<!-- /Footer -->
   
  <!-- /Main Wrapper -->
 
<!-- jQuery -->
<script src="${path}/resources/assets/js/jquery.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${path}/resources/assets/js/popper.min.js"></script>
<script src="${path}/resources/assets/js/bootstrap.min.js"></script>

<!-- Slick JS -->
<script src="${path}/resources/assets/js/slick.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://momentjs.com/downloads/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.js" integrity="sha512-z8IfZLl5ZASsWvr1syw5rkpo2HKBexjwzYDaUkIfoWo0aEqL/MgGKniDouh5DmsD9YrisbM+pihyCKIHL9VucQ==" crossorigin="anonymous"></script>
<!-- Custom JS -->
<script src="${path}/resources/assets/js/script.js"></script>
<script type="text/javascript">
$(function() {

	var uid = '${sessionScope.user}';
	var appointment = '${sessionScope.appointment}';
	var todayTime = new Date();
	setInterval(function(){			
		var now = new Date();   //현재시간
		var year = now.getFullYear();   //현재시간 중 4자리 연도
		var month = now.getMonth();   //현재시간 중 달. 달은 0부터 시작하기 때문에 +1 
		if((month+"").length < 2){
		    month="0"+month;   //달의 숫자가 1자리면 앞에 0을 붙임.
		}
		var date = now.getDate();      //현재 시간 중 날짜.
		if((date+"").length < 2){
		    date="0"+date;      
		}
		var hour = now.getHours();   //현재 시간 중 시간.
		if((hour+"").length < 2){
			hour="0"+hour;      
		}
		var min = now.getMinutes();   //현재 시간 중 분.
		if((min+"").length < 2){
			min="0"+min;      
		}
		
		var today = new Date(Number(year),Number(month),Number(date),Number(hour),Number(min))      //오늘 날짜 완성.
		todayTime = moment(today).format('YY-MM-DD H:mm')
		
		if (uid != null && appointment !=null){	
			var appointment_date = '${sessionScope.appointment.appointmentDTO.appointment_date}';
			var appointment_time = '${sessionScope.appointment.appointmentDTO.appointment_time}';
		    var yymmdd = String(appointment_date);
		    var hhmm = String(appointment_time);
		    var ap_date = new Date(Number(yymmdd.substring(0,4)), Number(yymmdd.substring(5,7))-1, 
		    		Number(yymmdd.substring(8,10)),Number(hhmm.substring(0,2)),Number(hhmm.substring(3,6)));
			var m_ap_date=moment(ap_date).format('YY-MM-DD H:mm')
		    var ap_date5 = new Date(Number(yymmdd.substring(0,4)), Number(yymmdd.substring(5,7))-1, 
		    		Number(yymmdd.substring(8,10)),Number(hhmm.substring(0,2)),Number(hhmm.substring(3,6))-5);
			var m_ap_date5=moment(ap_date5).format('YY-MM-DD H:mm')
			/*alert(todayTime >= m_ap_date5 && todayTime <=m_ap_date)
			alert('현재시간 : '+todayTime)
			alert('예약시간 : '+m_ap_date)
			alert('예약시간 5분전 : '+m_ap_date5)
			 var ap_date5 = new Date(Number(yyyyMMdd.substring(0,4)), Number(yyyyMMdd.substring(5,7))-1, 
		    		Number(yyyyMMdd.substring(8,10)), Number(yyyyMMdd.substring(10,12)), Number(yyyyMMdd.substring(13,15))-5);
			var m_ap_date5=moment(ap_date5).format('YY-MM-DD H:mm')
		    
			var ap_date10 = new Date(Number(yyyyMMdd.substring(0,4)), Number(yyyyMMdd.substring(5,7))-1, 
		    		Number(yyyyMMdd.substring(8,10)), Number(yyyyMMdd.substring(10,12)), Number(yyyyMMdd.substring(13,15))-10);
			var m_ap_date10=moment(ap_date10).format('YY-MM-DD H:mm') */
			
		};//uid if문 
		
		if(todayTime >= m_ap_date5 && todayTime <=m_ap_date) {
			notification()
		}
		
	},60*1000);
	
	
		function notification(){
			window.onload = function () {
		        if (window.Notification) {
		            Notification.requestPermission();
		        }
		    }
			
			notify();
			
		    /* function calculate() {
		        setTimeout(function () {
		            notify();
		        }, 3000);
		    } */
		    
			function notify() {
				if (Notification.permission !== 'granted') {
					alert('notification is disabled');
				} else {
					var notification = new Notification('💕진료 예약 알림💕', {
						icon : '${path}/resources/assets/img/favicon.png',
						body : '곧 진료가 시작됩니다. 진료실에 입장해주세요',
						requireInteraction : true
					//timestamp: dts
					});
		
					notification.onclick = function() {
						location.replace('${path}/patients/patient_dashboard?patient_num=${sessionScope.user.patient_num}');
					};
		
					  notification.onclose = function () {
						location.replace('${path}/patients/patient_dashboard?patient_num=${sessionScope.user.patient_num}');
					 };
				}
			}
		}
		

	});
</script>
		
	</body>
</html>