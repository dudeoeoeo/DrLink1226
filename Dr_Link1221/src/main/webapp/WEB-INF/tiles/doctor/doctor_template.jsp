<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>처방전 상세보기-Dr.Link</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
		<!-- Favicons -->
		<link href="${path}/resources/assets/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/fontawesome.min.css">
		<link rel="stylesheet" href="${path}/resources/assets/plugins/fontawesome/css/all.min.css">
		
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
	

.footer-menu{
	color:#fff;
}
</style>
	
</head>
<body>

	<!-- Main Wrapper -->
<div class="main-wrapper">
	
	<!-- Header -->
	<tiles:insertAttribute name="header"/>
	<!-- /Header -->
	<tiles:insertAttribute name="body" />
	<!-- Footer -->
	<tiles:insertAttribute name="footer" />
	<!-- /Footer -->
	
<!-- /Main Wrapper -->
</div>

<!-- jQuery -->
<script src="${path}/resources/assets/js/jquery-3.2.1.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${path}/resources/assets/js/popper.min.js"></script>
<script src="${path}/resources/assets/js/bootstrap.min.js"></script>

<!-- Slimscroll JS -->
<script src="${path}/resources/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="${path}/resources/assets/plugins/raphael/raphael.min.js"></script>    
<script src="${path}/resources/assets/plugins/morris/morris.min.js"></script>  
<script src="${path}/resources/assets/js/chart.morris.js"></script>

<!-- Custom JS -->
<script  src="${path}/resources/assets/js/script.js"></script>
	
</body>
</html>

</html>