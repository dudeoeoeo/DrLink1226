<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
	
	<!-- Header -->
	<tiles:insertAttribute name="header"/>
	<!-- /Header -->
	
	    
	<!-- Breadcrumb -->
	<div class="breadcrumb-bar">
	   <div class="container-fluid">
	      <div class="row align-items-center">
	         <div class="col-md-12 col-12">
	            <h2 class="breadcrumb-title">마이페이지</h2>
	         </div>
	      </div>
	   </div>
	</div>
	 <!-- /Breadcrumb -->
	
	<div class="content">
	    <div class="container-fluid">
		    <div class="row">
			    <tiles:insertAttribute name="menu" />
                <div class="col-md-7 col-lg-8 col-xl-9">
				<tiles:insertAttribute name="body" />
		    	</div> 
		    </div> 
	    </div> 
    </div>   
	<!-- Footer -->
	<%-- <tiles:insertAttribute name="footer" /> --%>
	<!-- /Footer -->
	
<!-- /Main Wrapper -->

<!-- Sticky Sidebar JS -->
<script src="${path}/resources/assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
<script src="${path}/resources/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

<!-- Circle Progress JS -->
<script src="${path}/resources/assets/js/circle-progress.min.js"></script>

<!-- jQuery -->
<script src="${path}/resources/assets/js/jquery.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${path}/resources/assets/js/popper.min.js"></script>
<script src="${path}/resources/assets/js/bootstrap.min.js"></script>

<!-- Slick JS -->
<script src="${path}/resources/assets/js/slick.js"></script>

<!-- Custom JS -->
<script src="${path}/resources/assets/js/script.js"></script>
</body>
</html>

</html>