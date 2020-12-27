<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<title>Doccure - Dashboard</title>
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/assets/img/favicon.png">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="${path}/resources/assets/css/font-awesome.min.css">
	<!-- Feathericon CSS -->
	<link rel="stylesheet" href="${path}/resources/assets/css/feathericon.min.css">
	<link rel="stylesheet" href="${path}/resources/assets/plugins/morris/morris.css">
	<!-- Main CSS -->
	<link rel="stylesheet" href="${path}/resources/assets/css/style.css">

<!--[if lt IE 9]>
	<script src="${path}/resources/assets/js/html5shiv.min.js"></script>
	<script src="${path}/resources/assets/js/respond.min.js"></script>
<![endif]-->
</head>
<body>

	<!-- Main Wrapper -->
<div class="main-wrapper">
	<tiles:insertAttribute name="header"/>
	<!-- Home Banner -->
	<tiles:insertAttribute name="sidebar" />	
	<!-- Footer -->
	<tiles:insertAttribute name="body" />
	<!-- /Footer -->
	

</div>
<!-- /Main Wrapper -->

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