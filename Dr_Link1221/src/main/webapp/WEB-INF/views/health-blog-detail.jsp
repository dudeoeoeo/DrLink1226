<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Breadcrumb -->
<div class="breadcrumb-bar">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-md-12 col-12">
				<h2 class="breadcrumb-title">${n_board.news_title }</h2>
			</div>
		</div>
	</div>
</div>
<!-- /Breadcrumb -->

<!-- Page Content -->
<div class="content">
	<div class="container">

		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="blog-view">
					<div class="blog blog-single-post">
						<c:choose>
								<c:when test="${n_board.news_url != null }">
									<div class="blog-image">
										<div class="video-wrap">
											<iframe width="100%" height="315" src="${n_board.news_url}"
												frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; 
											encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe>
										</div>
									</div>
								</c:when>
								<c:when test="${n_board.news_photo != null }">
									<div class="blog-image">
										<a href="health-blog-detail?n_num=${n_board.news_board_num}"><img
											class="img-fluid"
											src="${path}/resources/assets/img/blog/${n_board.news_photo}"
											alt="Post Image" style="height:500px"></a>
									</div>
								</c:when>
							</c:choose>
						<h3 class="blog-title">${n_board.news_title }</h3>
						<div class="blog-info clearfix">
							<div class="post-left">
								<ul>
									<li><i class="far fa-calendar"></i>${n_board.news_regdate }
									</li>
									<li><i class="far fa-comments"></i>${n_board.getCnt }
										Comments</li>
								</ul>
							</div>
						</div>
						<div class="blog-content">
								<p>${n_board.news_content}</p>
						</div>

					</div>

					<!-- 댓글 남기는 곳 -->
					<div class="card new-comment clearfix">
						<div class="card-header">
							<button class="write_comment btn btn-light">
								<h4 class="card-title">✉댓글 남기기</h4>
							</button>
						</div>
						<div class="card-body" id="leave_comment">
							<form id="comments_form" method="post">

								<div class="form-group">
									<label>작성자 <span class="text-danger">*</span></label>
									<c:choose>
										<c:when test="${!empty sessionScope.user}">
											<input type="text" class="form-control" id="writer"
												value="${sessionScope.user.p_name}" readonly />
										</c:when>
										<c:otherwise>
											<input type="text" class="form-control" id="writer"
												value="${sessionScope.doctor.d_name}" readonly />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="form-group">
									<label>댓글</label>
									<textarea rows="4" class="form-control" id="comments_box"
										name="news_repl_comment"></textarea>
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

							<ul class="comments-list">
								<c:forEach var="nr" items="${n_repl}">
									<c:set var="p_num" value="0" />
									<c:set var="d_num" value="0" />
									<li>
										<div class="comment">
											<div class="comment-block">
												<c:if test="${nr.n_comments_num eq '0'}">
													<span class="comment-by"> <c:choose>
															<c:when test="${!empty nr.patients[0].p_name }">
																<span class="blog-author-name">${nr.patients[0].p_name }</span>
																<!-- 댓글 남긴 사람의 pk 번호 -->
																<c:set var="p_num" value="${nr.patients[0].patient_num}" />
															</c:when>
															<c:otherwise>
																<span class="blog-author-name">${nr.doctors[0].d_name }</span>
																<c:set var="d_num" value="${nr.doctors[0].doctor_num}" />
															</c:otherwise>
														</c:choose>


													</span>
													<p class="blog_repl_comment">${nr.news_repl_comment }</p>
													<p class="blog-date">${nr.n_repl_date }</p>
													<div class="comment_play">

														<input type="hidden" name="repl_num"
															value="${nr.news_reply_num }"> <a
															class="comment-btn"> <i class="fas fa-reply"></i><span>답글</span>
														</a>
												</c:if>

												<c:choose>
													<c:when test="${sessionScope.user.patient_num eq p_num}">
														<a class="comment-btn"> <i class="fas fa-pen-fancy"></i><span>수정</span>
														</a>
														<a class="comment-btn"> <i class="fa fa-trash"
															aria-hidden="true"></i><span>삭제</span>
														</a>
													</c:when>
													<c:when test="${sessionScope.doctor.doctor_num eq d_num}">
														<a class="comment-btn"> <i class="fas fa-pen-fancy"></i><span>수정</span>
														</a>
														<a class="comment-btn"> <i class="fa fa-trash"
															aria-hidden="true"></i><span>삭제</span>
														</a>
													</c:when>
												</c:choose>
											</div>
										</div>
						</div>


						<!-- 뉴스 대댓글 -->
						<ul class="comments-list reply">
							<c:forEach var="rrepl" items="${n_repl}">
								<c:if test="${nr.news_reply_num == rrepl.n_comments_num }">
									<li>
										<div class="comment">
											<div class="comment-block">
												<span class="comment-by"> <c:choose>
														<c:when test="${!empty rrepl.patients[0].p_name}">
															<span class="blog-author-name">${rrepl.patients[0].p_name }</span>
															<c:set var="p_num"
																value="${rrepl.patients[0].patient_num}" />
														</c:when>
														<c:otherwise>
															<span class="blog-author-name">${rrepl.doctors[0].d_name }</span>
															<c:set var="d_num" value="${rrepl.doctors[0].doctor_num}" />
														</c:otherwise>
													</c:choose>
												</span>
												<p class="blog_repl_comment">${rrepl.news_repl_comment }</p>
												<p class="blog-date">${rrepl.n_repl_date}</p>
												<div class="comment_play">

													<!-- 오류 구간 -->
													<input type="hidden" name="repl_num"
														value="${rrepl.news_reply_num }"> <a
														class="comment-btn"> <input type="hidden"
														name="repl_num" value="${nr.news_reply_num }"> <i
														class="fas fa-reply"></i><span>답글</span>
													</a>

													<c:choose>
														<c:when test="${sessionScope.user.patient_num eq p_num}">
															<a class="comment-btn"> <i class="fas fa-pen-fancy"></i><span>수정</span>
															</a>
															<a class="comment-btn"> <i class="fa fa-trash"
																aria-hidden="true"></i><span>삭제</span>
															</a>
														</c:when>
														<c:when test="${sessionScope.doctor.doctor_num eq d_num}">
															<a class="comment-btn"> <i class="fas fa-pen-fancy"></i><span>수정</span>
															</a>
															<a class="comment-btn"> <i class="fa fa-trash"
																aria-hidden="true"></i><span>삭제</span>
															</a>
														</c:when>
													</c:choose>

												</div>

											</div>
										</div>
									</li>
								</c:if>
							</c:forEach>
						</ul>
						</li>
						</c:forEach>
						</ul>
					</div>
				</div>

				<!-- 원래 이 밑이 뉴스 댓글 남기는 칸 -->

			</div>
		</div>

	</div>
</div>

</div>
<!-- /Page Content -->


<!-- /Main Wrapper -->


<script type="text/javascript">
	$(function() {
		var b_num = "${n_board.news_board_num}";
		var repl_num;
		var do_text;
		$('a.comment-btn').css('cursor', 'pointer');
		$('div#leave_comment').css('display', 'none');

		$('.write_comment').click(function() {
			//alert(checkLogin());
			if (checkLogin()) {
				$('div#leave_comment').toggle();
				do_text = "댓글";
			}
		}) // click

		$('.comment-btn').click(function() {
			alert(checkLogin())
			if (checkLogin()) {
				// 어떤 요청인지 체크
				do_text = $(this).find('span').text();
				// 수정일 시 textarea에 채울 내용
				var comment_text = $(this).parents('div.comment-block').find('p.blog_repl_comment').text();
				// 현재 댓글 번호
				repl_num = $(this).parent('div').find(
						'input[name="repl_num"]').val();
				//alert("a태그 눌렀을떄 repl_num: " + repl_num);
				if (do_text == '수정') {
					$('div#leave_comment').css('display','block');
					$('#comments_box').text(comment_text);
				} else if (do_text == '삭제') {
					if (confirm("정말 삭제하시겠습니까 ?")) {
						delete_repl(repl_num, do_text, b_num);
					}
				} else {
					$('div#leave_comment').css('display', 'block');
					if ($(this).find('input[name="repl_num"]')
							.val() != null) {
						repl_num = $(this).find(
								'input[name="repl_num"]').val();
					}
					$('#comments_box').text("");
				}
			}
			//alert("리플: "+ repl_num);
		}); // click

		$('.submit-btn').click(function() {
			if($('#comments_box').val()=="" || $('#comments_box').val()==null){
				alert("댓글을 입력해주세요");
				return;
			}else{
			var form = {
				news_repl_comment : $('#comments_box').val(),
				news_reply_num : repl_num,
				//n_comments_num : repl_num,
				news_board_num : b_num,
				repl_handling : do_text,
				patient_num : "${sessionScope.user.patient_num}",
				doctor_num : "${sessionScope.doctor.doctor_num}"
			};
			alert("리플번호" + repl_num + "현재 요청: " + do_text);
			$.ajax({
				url : "leave_comment",
				type : "POST",
				contentType : "application/json; charset=utf-8;",
				async : false,
				dataType : "json",
				data : JSON.stringify(form),
				success : function(data) {
					if (data != null) {
						alert(do_text + data.success);
						location.href(data.url);
					}
				},
				error : function(err) {
					alert(do_text + err);
				}
			}); //ajax
			};//else
		}) // click

	}); // ready

	function checkLogin() {
		var uid = '${sessionScope.user.p_name}';
		var did = '${sessionScope.doctor.d_name}';
		var flag = false;

		if (uid == "" && did == "") {
			if (confirm("로그인이 필요한 서비스입니다. \n로그인 페이지로 이동하시겠습니까 ?")) {
				document.location.href = "login";
			}
		} else {
			flag = true;
		}
		return flag
	}

	function delete_repl(repl_num, do_text, b_num) {
		var form = {
			news_reply_num : repl_num,
			news_board_num : b_num,
			repl_handling : do_text
		};
		$.ajax({
			url : "leave_comment",
			type : "POST",
			data : JSON.stringify(form),
			async : false,
			contentType : "application/json; charset=utf-8;",
			dataType : "json",
			success : function(data) {
				if (data != null) {
					//alert(do_text + data.success);
					location.href = data.url;
				}
			},
			error : function(err) {
				//alert(do_text + err);
			}
		}); //ajax
	}
</script>
</body>
</html>