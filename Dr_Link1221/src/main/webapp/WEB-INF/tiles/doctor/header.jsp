<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
	<!-- Header -->
	<header class="header">
		<nav class="navbar navbar-expand-lg header-nav">
			<div class="navbar-header">
				<a id="mobile_btn" href="javascript:void(0);">
					<span class="bar-icon">
						<span></span>
						<span></span>
						<span></span>
					</span>
				</a>
				<!-- <h1><a id="drlink" href="#" >Dr.Link</a></h1> -->
				<a href="main" class="menu-logo">
						<img src="${path}/resources/assets/img/logo.jpg" class="img-fluid" alt="Logo">
					</a>
					
			</div>
			<div class="main-menu-wrapper">
				
				<ul class="main-nav" >
					<li class="has-submenu">
						<a href="search">의료진 소개</a>
					</li>
					<li class="has-submenu">
						<a href="notice">공지사항
					</li>	
					<li class="has-submenu">
						<a href="health-blog">건강정보</a>
					</li>
					<li class="has-submenu">
						<a href="question">FAQ</a>
					</li>
					<li class="has-submenu">
						<a href="login">온라인예약</a>
					</li>
					<li class="has-submenu">
						<a>온라인 간편 진단<i class="fas fa-chevron-down"></i></a>
						<ul class="submenu">
							<li><a href="login">안과진단</a></li>
							<li><a href="login">피부과진단</a></li>
							<!--  <li><a href="pharmacy-index">AI진단</a></li> -->
					
					<c:choose>
						<c:when test="${sessionScope.user_name == null}">
							<li class="has-submenu">
								<a href="login">마이페이지</a>
							</li>
									</ul>
							</li>
							
						</ul>		 
					</div>		
					<ul class="nav header-navbar-rht">
				
						<li class="nav-item">
							<a class="nav-link header-login" href="login">로그인 / 회원가입</a>
						</li>
					</ul> 
						</c:when>
						<c:otherwise>
							
							<li class="has-submenu">
								<a href="patients/patient_dashboard">마이페이지</a>
							</li>
									</ul>
							</li>
						</ul>		 
					</div>	
						
						<ul class="nav header-navbar-rht">
				<li> ${ sessionScope.user_name }님, 반갑습니다. </li><br>
				<li class="nav-item">
					<a class="nav-link header-login" href="${path}/logout">로그아웃</a>
				</li>
			</ul>
						</c:otherwise>
					</c:choose>
		</nav>
	</header>
	<!-- /Header -->

