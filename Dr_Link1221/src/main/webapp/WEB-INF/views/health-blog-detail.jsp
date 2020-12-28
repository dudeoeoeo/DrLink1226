<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Blog</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">Blog Details</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container">
				
					<div class="row">
						<div class="col-lg-8 col-md-12">
							<div class="blog-view">
								<div class="blog blog-single-post">
									<c:choose>
									<c:when test="${empty n_board.news_photo }">
									<div class="blog-image">
											<div class="video-wrap">
											<a href="javascript:void(0);">
											<iframe width="100%" height="315" src="${n_board.news_url }" frameborder="0" 
											allow="accelerometer; autoplay; clipboard-write; 
											encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
											</a>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="blog-image">
										<a href="javascript:void(0);"><img alt="" src="${path}/resources/img/blog/${n_board.news_photo}.png" class="img-fluid"></a>
									</div>
									</c:otherwise>
									</c:choose>
									<h3 class="blog-title">${n_board.news_title }'삐끗' 반복된다면 발목 불안정성 주의, 발목 염좌 </h3>
									<div class="blog-info clearfix">
										<div class="post-left">
											<ul>
												<li><i class="far fa-calendar"></i>${n_board.news_regdate } </li>
												<li><i class="far fa-comments"></i>${n_board.getCnt } Comments</li>
											</ul>
										</div>
									</div>
									<div class="blog-content">
										<c:forEach var="n" items="${n_board.news_content}">
											${n}
										</c:forEach>
										<p>30대 초반 직장인 정씨는 지난여름 출근길, 비온 뒤 주차장 바닥에 남아있던 물기에 미끄러지며 심하게 발목을 삐끗했다. 순간 찌릿하고 약간 붓기는 했지만 파스를 붙이고 냉찜질을 하고 나니 조금씩 나아지는 듯 해 심각하게 여기지는 않았다. 하지만 그 후로 멀쩡히 길을 걷다가도 반복적으로 같은 발목을 삐끗하는 상황이 반복되자 병원을 찾았고, 검사 결과 발목 인대가 손상된 만성 발목 불안정성을 진단받고 현재 재활치료를 정기적으로 받고 있는 중이다.</p>
										<li style="margin-left:20px;"><h5>관절 지지해주는 발목 외측 인대가 손상되어 발생되는 발목염좌</h5></li>
										<p>발목 염좌는 흔히 우리가 '발목을 삔다' 혹은 '발목을 접지른다'고 하는 상황에서 발생하는 급성 인대 손상입니다. 
										스포츠 손상 중에서 가장 흔하다고 알려져 있으며, 미국의 경우에는 매년 1,000명당 2-7명의 발목 염좌 환자가 발생하며 연간 200만 건에 이른다고 보고되고 있습니다. 
										건강보험심사평가원 통계에 따르면, 우리나라 역시 발목 염좌 및 긴장으로 병원을 찾는 환자는 2015년 129만 3,379명, 2017년 131만 1,296명, 2019년 142만 4,361명으로 꾸준히 증가하는 추세입니다. 지난 한 해 기준으로는 전체 환자 중 약 45%가 10~20대 환자인 것으로 나타나, 특히 젊은 층에서 많이 발생하고 있습니다.
발목을 접지를 때에는 일반적으로 발이 몸의 안쪽으로 꺾이면서 발목의 외측 인대가 당겨지는 힘을 받으며 손상되는데, 발목 외측을 이루는 세 가지 인대(전거비인대, 종비인대, 후거비인대) 중에서 전거비인대와 종비인대가 비교적 흔하게 손상을 받습니다.</p>
										<li style="margin-left:20px;"><h5>부종과 통증 줄인 후 기능적 회복 돕는 재활치료 시행</h5></li>
										<p>발목을 접지른 이후 외측 인대 부위가 붓고 통증이 있다면 병원을 방문하여 검사를 받아보아야 합니다. 혹시 있을지 모르는 골절을 감별하기 위해 X-ray 촬영을 기본적으로 시행하고, 뼈에 이상이 없다면 발목 염좌로 생각하고 치료를 하게 됩니다. 인대를 직접적으로 관찰할 수 있는 초음파 검사나 자기공명영상(MRI) 검사를 추가적으로 시행하기도 하는데, 이러한 검사들에서 인대 손상 이외의 다른 동반되는 손상이 없다면 치료 방침이 바뀌지는 않습니다.
급성 인대 손상인 발목 염좌의 치료는 비수술적인 치료가 원칙입니다. 초기에는 부종과 통증을 줄이기 위해서 발목을 고정하고, 심장보다 20-30cm 높게 다리 올리기, 압박드레싱, 냉찜질 등을 시행합니다. 고정 방법(보호대, 반기브스, 부츠, 통기브스 등)과 고정 기간은 손상 정도에 따라 짧게는 2-3주 이내에서 길게는 4-6주까지도 시행하게 되며, 통증과 붓기가 줄어들면 점차 체중부하 및 보행 연습을 하게 됩니다. 발목의 기능적인 회복을 돕기 위해 발목 외측 근육인 비골근 강화운동과 고유감각 훈련을 함께 병행합니다. 고유감각이란 자세, 위치, 움직임 등에 대한 감각을 말하는데, 발에 대한 위치 감각이 감소하게 되면 발을 지면에 바로 놓지 못하고 잘못된 위치로 발을 디디면서 발을 접지르는 빈도가 증가하게 됩니다. 따라서 발목 염좌에서의 고유감각 훈련은 발의 위치에 대한 감각을 강화하기 위한 운동으로서 주로 균형을 잡는 훈련으로 구성됩니다.</p>
									</div>
									
								</div>
								
								<!-- 댓글 남기는 곳 -->
								<div class="card new-comment clearfix">
									<div class="card-header">
										<button class="write_comment">
										<h4 class="card-title">
										<i class="fa fa-commenting-o" aria-hidden="true"></i>댓글 남기기</h4></button>
									</div>
									<div class="card-body" id="leave_comment">
										<form id="comments_form" method="post">
										
											<div class="form-group">
												<label>작성자 <span class="text-danger">*</span></label>
												<c:choose>
													<c:when test="${!empty sessionScope.user}">
														<input type="text" class="form-control" id="writer" value="${sessionScope.user.p_name}" readonly/>
													</c:when>
													<c:otherwise>
														<input type="text" class="form-control" id="writer" value="${sessionScope.doctor.d_name}" readonly/>
													</c:otherwise>
												</c:choose>
											</div>
											<!-- <div class="form-group">
												<label>이메일<span class="text-danger">*</span></label>
												<input type="email" class="form-control">
											</div> -->
											<div class="form-group">
												<label>댓글</label>
												<textarea rows="4" class="form-control" id="comments_box" name="news_repl_comment"></textarea>
											</div>
											<div class="submit-section">
												<button class="btn btn-primary submit-btn" id="submit_id">등록</button>
											</div>
											
										</form>
									</div>
								</div>
								
								
								<!-- 여기는 댓글 란 -->
								
								<div class="card blog-comments clearfix">
									<div class="card-header">
										<h4 class="card-title">댓글</h4>
									</div>
									<div class="card-body pb-0">
									
									<c:forEach var="nr" items="${n_repl}">
									<ul class="comments-list">
									<c:set var="p_num" value="0"/>
									<c:set var="d_num" value="0"/>
										<li>
											<div class="comment">
												<div class="comment-block">
													<span class="comment-by">
												<c:if test="${nr.n_comments_num eq '0'}">
												<c:choose>
													<c:when test="${!empty nr.patients[0].p_name }">
														<span class="blog-author-name">${nr.patients[0].p_name }</span>
														<!-- 댓글 남긴 사람의 pk 번호 -->
														<c:set var="p_num" value="${nr.patients[0].patient_num}"/>
													</c:when>
													<c:otherwise>
														<span class="blog-author-name">${nr.doctors[0].d_name }</span>
														<c:set var="d_num" value="${nr.doctors[0].doctor_num}"/>
													</c:otherwise>
												</c:choose> 
													
												
													</span>
													<p class="blog_repl_comment"> ${nr.news_repl_comment }</p>
													<p class="blog-date">${nr.n_repl_date }</p>
													<div class="comment_play">
													
													<input type="hidden" name="repl_num" value="${nr.news_reply_num }">
													<a class="comment-btn">
														<i class="fas fa-reply"></i><span>답글</span>
													</a>
													</c:if>	
													
													<c:choose>
														<c:when test="${sessionScope.user.patient_num eq p_num}">
															<a class="comment-btn">
																<i class="fas fa-pen-fancy"></i><span>수정</span>
															</a>
															<a class="comment-btn"> 
																<i class="fa fa-trash" aria-hidden="true"></i><span>삭제</span>
															</a>
														</c:when>
														<c:when test="${sessionScope.doctor.doctor_num eq d_num}">
															<a class="comment-btn">
																<i class="fas fa-pen-fancy"></i><span>수정</span>
															</a>
															<a class="comment-btn"> 
																<i class="fa fa-trash" aria-hidden="true"></i><span>삭제</span>
															</a>
														</c:when>
													</c:choose>
													</div>
												</div>
											</div>
											
											
											<!-- 뉴스 대댓글 -->
											<c:forEach var="rrepl" items="${n_repl}">
											<c:if test="${nr.news_reply_num == rrepl.n_comments_num }">
											<ul class="comments-list reply">
												<li>
													<div class="comment">
														<div class="comment-block">
															<span class="comment-by">
																<c:choose>
																	<c:when test="${!empty rrepl.patients[0].p_name}">
																		<span class="blog-author-name">${rrepl.patients[0].p_name }</span>
																		<c:set var="p_num" value="${rrepl.patients[0].patient_num}"/>
																	</c:when>
																	<c:otherwise>
																		<span class="blog-author-name">${rrepl.doctors[0].d_name }</span>
																		<c:set var="d_num" value="${rrepl.doctors[0].doctor_num}"/>
																	</c:otherwise>
																</c:choose> 
															</span>
															<p class="blog_repl_comment"> ${rrepl.news_repl_comment }</p>
															<p class="blog-date">${rrepl.n_repl_date} </p>
													<div class="comment_play">
													
													<!-- 오류 구간 -->
													<input type="hidden" name="repl_num" value="${rrepl.news_reply_num }">
													
													<a class="comment-btn">
														<input type="hidden" name="repl_num" value="${nr.news_reply_num }">
														<i class="fas fa-reply"></i><span>답글</span>
													</a>
													
													<c:choose>
														<c:when test="${sessionScope.user.patient_num eq p_num}">
															<a class="comment-btn">
																<i class="fas fa-pen-fancy"></i><span>수정</span>
															</a>
															<a class="comment-btn"> 
																<i class="fa fa-trash" aria-hidden="true"></i><span>삭제</span>
															</a>
														</c:when>
														<c:when test="${sessionScope.doctor.doctor_num eq d_num}">
															<a class="comment-btn">
																<i class="fas fa-pen-fancy"></i><span>수정</span>
															</a>
															<a class="comment-btn"> 
																<i class="fa fa-trash" aria-hidden="true"></i><span>삭제</span>
															</a>
														</c:when>
													</c:choose>
													
													</div>
													
														</div>
													</div>
												</li>
											</ul>
											</c:if>
											</c:forEach>
										</li>
									</ul>
									</c:forEach>
								</div>
								</div>
								
								<!-- 원래 이 밑이 뉴스 댓글 남기는 칸 -->
								
							</div>
						</div>
					
						<!-- Blog Sidebar -->
						<div class="col-lg-4 col-md-12 sidebar-right theiaStickySidebar">

							<!-- Search -->
							<div class="card search-widget">
								<div class="card-body">
									<form class="search-form">
										<div class="input-group">
											<input type="text" placeholder="Search..." class="form-control">
											<div class="input-group-append">
												<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- /Search -->

							
						</div>
						<!-- /Blog Sidebar -->
						
                </div>
				</div>

			</div>		
			<!-- /Page Content -->
   
		
		   
		</div>
		<!-- /Main Wrapper -->

		
	<script type="text/javascript">
		$(function(){
			var b_num = "${n_board.news_board_num}"; 
			var repl_num;
			var do_text;
			$('a.comment-btn').css('cursor', 'pointer');
			$('div#leave_comment').css('display','none');
			
			$('.write_comment').click(function(){
				if(checkLogin()) {
					$('div#leave_comment').toggle();
					do_text = "댓글";
				}
			}) // click
			
			$('.comment-btn').click(function(){
				
				// 어떤 요청인지 체크
				do_text = $(this).find('span').text();
				// 수정일 시 textarea에 채울 내용
				var comment_text = $(this).parents('div.comment-block').find('p.blog_repl_comment').text();
				// 현재 댓글 번호
				repl_num = $(this).parent('div').find('input[name="repl_num"]').val();
				alert("a태그 눌렀을떄 repl_num: " + repl_num);
				if( do_text == '수정') {
					$('div#leave_comment').toggle();
					$('#comments_box').text(comment_text);
				} else if ( do_text == '삭제' ) {
					if(confirm("정말 삭제하시겠습니까 ?")) {
						delete_repl(repl_num, do_text, b_num);
					}
				} else {
					$('div#leave_comment').toggle();
					if($(this).find('input[name="repl_num"]').val() != null) {
						repl_num = $(this).find('input[name="repl_num"]').val(); 						
					}
					$('#comments_box').text("");
				}
				//alert("리플: "+ repl_num);
			}); // click
			
			$('.submit-btn').click(function(){
				var form = {
					    news_repl_comment: $('#comments_box').val(),
					    news_reply_num: repl_num,
					    //n_comments_num : repl_num,
					    news_board_num : b_num,
					    repl_handling : do_text,
					    patient_num : "${sessionScope.user.patient_num}",
					    doctor_num : "${sessionScope.doctor.doctor_num}"
					};
				alert("리플번호"+repl_num + "현재 요청: " + do_text);
				$.ajax({
		            url: "leave_comment",
		            type: "POST",
		            contentType: "application/json; charset=utf-8;",
		            async: false, 
		            dataType: "json",
		            data: JSON.stringify(form),
		            success: function(data){
		            	if(data != null) {
			                alert(do_text+data.success);
			                location.href(data.url);
		            	}
		            },
		            error: function(err){
		                alert(do_text+err);
		            }
		        }); //ajax
			}) // click
			
		}); // ready
		
	function checkLogin() {
			var uid = '${sessionScope.user}';
			var did = '${sessionScope.doctor}';
			var flag = false;
			if (uid == null || did == null) {
				if(confirm("로그인이 필요한 서비스입니다. \n로그인 페이지로 이동하시겠습니까 ?")) {
					document.location.href="login";
				}
			} else {
				flag = true;
			}	
			return flag
	}
		
	function delete_repl(repl_num, do_text, b_num) {
		var form = {
			    news_reply_num: repl_num,
			    news_board_num : b_num,
			    repl_handling : do_text
			};
		$.ajax({
            url: "leave_comment",
            type: "POST",
            data: JSON.stringify(form),
            async: false,
            contentType: "application/json; charset=utf-8;",
            dataType: "json",
            success: function(data){
            	if(data != null) {
	                alert(do_text+data.success);
	                location.href = data.url;
            	}
            },
            error: function(err){
                alert(do_text+err);
            }
        }); //ajax
	} 	
	</script>
	</body>
</html>