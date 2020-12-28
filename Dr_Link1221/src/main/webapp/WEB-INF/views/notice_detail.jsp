<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		
	<div class="content" style="transform: none; min-height: 121px;">
				<div class="container" style="transform: none;">
					<div class="row" style="transform: none;">
						<div class="col-lg-12 col-md-12">
						
							<div class="blog-view">
								<!-- Section Header -->
							<div class="blog blog-single-post text-center">
							<div class="section-header text-center" style="margin: auto !important;">
								<h2>공지사항</h2>
								<p class="sub-title">Dr.Link의 공지사항을 알려드립니다.</p>
							</div>
							<!-- /Section Header -->
								<hr>
								<br>
									<h3 class="blog-title">${h_board.hospital_title}</h3>
								<br>
								<hr>
									<div class="blog-content text-center">
										<c:forEach var="c" items="${h_board.hospital_content}">
										<p> ${c}</p>
										</c:forEach>
									</div>
								</div>
								<div class="submit-section" style="margin-bottom: 5px; float: right;">
									<a href="notice"><button class="btn btn-dark btn-sm">목록</button></a>
									<br>
								</div>
							</div>
						</div>
					
						<!-- Blog Sidebar -->
						<div class="col-lg-4 col-md-12 sidebar-right theiaStickySidebar" style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">

							<!-- Search -->
							
							<!-- /Search -->

							<!-- Latest Posts -->
							
							<!-- /Latest Posts -->

							<!-- Categories -->
							
							<!-- /Categories -->

							<!-- Tags -->
							
							<!-- /Tags -->
							
						</div>
						<!-- /Blog Sidebar -->
						
                </div>
				</div>

			</div>
		
