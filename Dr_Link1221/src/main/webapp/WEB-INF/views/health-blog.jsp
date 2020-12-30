<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			
<!-- Breadcrumb -->
		<div class="breadcrumb-bar">
			<div class="container-fluid">
				<div class="row align-items-center">
					<div class="col-md-12 col-12">
						<h2 class="breadcrumb-title">건강정보</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- /Breadcrumb -->			
				<div class="container">
				
					<div class="row">
						<div class="col-lg-12 col-md-12">
						
							<div class="row blog-grid-row">
							
							<c:forEach var="n" items="${newsList}">
								<div class="col-md-6 col-sm-12">
									<!-- Blog Post -->
									<div class="blog grid-blog">
									<c:choose>
									<c:when test="${n.news_url != null }">
										<div class="blog-image">
											<div class="video-wrap">
											<iframe width="100%" height="315" src="${n.news_url }" frameborder="0" 
											allow="accelerometer; autoplay; clipboard-write; 
											encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
											</div>
										</div>
									</c:when>
									<c:otherwise>
									<div class="blog-image">
										<a href="health-blog-detail?n_num=${n.news_board_num}"><img class="img-fluid" 
										src="${path}/resources/assets/img/blog/blog-02.jpg" alt="Post Image"></a>
									</div>
									</c:otherwise>
									</c:choose>
										<div class="blog-content">
											<ul class="entry-meta meta-item">
												<li><i class="far fa-clock"></i> ${n.news_regdate}</li>
												<li><i class="fa fa-eye" aria-hidden="true"></i>조회수 ${n.watched }</li>
											</ul>
											<h3 class="blog-title"><a href="health-blog-detail?b_num=${n.news_board_num}">${n.news_title }</a></h3>
											<c:forEach var="c" items="${n.news_content}">
											<p class="mb-0">${c}</p>
											</c:forEach>
										</div>
									</div>
									<!-- /Blog Post -->
								</div>
							</c:forEach>
							<!-- Blog Pagination -->
							<div class="row mx-auto">
								<div class="col-md-12">
									<div class="blog-pagination">
										<nav>
											<ul class="pagination justify-content-center">
												<li class="page-item disabled">
													<a class="page-link" href="#" tabindex="-1"><i class="fas fa-angle-double-left"></i></a>
												</li>
												<c:forEach begin="1" end="${p_num }" var="p">
												<li class="page-item">
													<a class="page-link" href="health-blog?d_page=${p}">${p}</a>
												</li>
												</c:forEach>
												<li class="page-item">
													<a class="page-link" href="#" ><i class="fas fa-angle-double-right"></i></a>
												</li>
											</ul> 
										</nav>
									</div>
								</div>
							</div>
							<!-- /Blog Pagination -->
							
						</div>
						
						<!-- Blog Sidebar -->
						<div class="col-lg-4 col-md-12 sidebar-right theiaStickySidebar">

							<!-- Search -->
							<!-- <div class="card search-widget">
								<div class="card-body">
									<form class="search-form">
										<div class="input-group">
											<input type="text" placeholder="제목으로 검색하세요." class="form-control">
											<div class="input-group-append">
												<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
											</div>
										</div>
									</form>
								</div>
							</div> -->
							<!-- /Search -->
						</div>
						<!-- /Blog Sidebar -->
						
					</div>
				</div>
			</div>	
			<!-- /Page Content -->
   
   
   