<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(".custom-file-input").on(
						"change",
						function() {
							var fileName = $(this).val().split("\\").pop();
							$(this).siblings(".custom-file-label").addClass(
									"selected").html(fileName);
							readURL(this);
						});

				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$(".upload-images > img").attr("src",
									e.target.result);

						}
						reader.readAsDataURL(input.files[0]);
					}
				}

			});
</script>
<!-- Page Content -->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-9 m-auto">
				<div class="section-header text-center">
					<h2>안녕하세요. AI 눈 진단 서비스입니다.</h2>
					<p>
						"의사 한 명이 진단하는 것보다 2~3명이 보는 게 훨씬 더 정확하죠.<br>의사 한 명이 혹시나 놓칠 수
						있는 소견을 우리가 만든 인공지능(AI) 의료 소프트웨어가 잡아주기 때문에 더욱 정밀한 진료가 가능해져요."&nbsp;
					
				</div>
				<div class="row ">
					<div class="col-lg-4 mb-3">
						<div class="card text-center doctor-book-card">
							<img src="${path}/resources/assets/img/eyeRight1.jpg" alt=""
								class="img-fluid">
							<div class="doctor-book-card-content tile-card-content-1">
								<div>
									<h3 class="card-title mb-0">올바른 사진</h3>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-3">
						<div class="card text-center doctor-book-card">
							<img src="${path}/resources/assets/img/eyeError1.jpg" alt=""
								class="img-fluid">
							<div class="doctor-book-card-content tile-card-content-1">
								<div>
									<h3 class="card-title mb-0">틀린 사진</h3>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-3">
						<div class="card text-center doctor-book-card">
							<img src="${path}/resources/assets/img/eyeError2.jpg" alt=""
								class="img-fluid">
							<div class="doctor-book-card-content tile-card-content-1">
								<div>
									<h3 class="card-title mb-0">틀린 사진</h3>
								</div>
							</div>
						</div>
					</div>

				</div>

				<div class="text-center">
					정확한 진단을 위하여 정면에서 촬영한 사진을 업로드 해주세요. <br /> 지나친 메이크업, 얼굴 전체모습,&nbsp;
					측면 모습 등은 정확한 AI진단이 어려울수 있습니다.
				</div>

				<hr />
				<a href="aiTestSuccess" class="btn btn-primary view-inv-btn">진단결과보기</a>

				<hr />

				<form class="file-input-frm" action="aiTest" method="post"
					enctype="multipart/form-data">
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="images"
							id="images"> <label class="custom-file-label"
							for="customFile">이미지를 업로드 해주세요</label>
					</div>
				</form>
				<br>
				<br>
				<div class="service-fields mb-3">
					<div class="row">
						<div class="col-lg-12">
							<div id="uploadPreview">
								<ul class="upload-wrap">
									<li>
										<div class="upload-images">
											<img alt="Blog Image"
												src="${path}/resources/assets/admin/img/profiles/avatar-17.jpg">
										</div>
									</li>
								</ul>
							</div>

						</div>
					</div>
				</div>


				<hr />

				<div class="card">
					<div class="card-header text-center">
						<h3>진단 예측 결과 예시</h3>
					</div>
					<!-- 카드헤더 -->

					<div class="card-body">
						<div class="row">
							<div class="col-lg-7 mb-3" style="margin-right: 30px !important;">
								<h3>●다래끼</h3>
								<p class="">
									눈꺼풀에 생기는 화농성 염증의 통칭이다. <br />눈꺼풀에는 여러 종류의 분비샘이 있는데 이 분비샘에 발생한
									급성 염증을 다래끼라고 한다.<br /> 심한 경우 고름집이 잡히기도 한다. 안과에 내원하는 환자들의 대부분은
									이렇게 고름샘이 잡혀있는 상태로 온다. <br />눈꺼풀과 그 주위가 붓는 것은 물론이고 정말로 극심한 경우 얼굴
									전체가 부어 오르기도 한다.
								</p>
							</div>
							<!-- 증상설명 -->
							<div class="col-lg-4 mb-3">
								<div class="text-center"
									style="width: 80% !important; margin-left: 50px;">
									<div class="card text-center doctor-book-card">
										<img src="${path}/resources/assets/img/eyeExample1.jpg" alt=""
											class="img-fluid">
										<div class="doctor-book-card-content tile-card-content-1">
											<div>
												<h3 class="card-title mb-0">사진 예시</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 사진예시 -->
						</div>
						<!-- row1 -->

						<div class="row">
							<div class="col-lg-7 mb-3" style="margin-right: 30px !important;">
								<h3>●결막염</h3>
								<p class="">
									세균성 결막염은 씻지 않은 손이나 더러운 표면에 있는 세균이 눈에 닿아서 주로 발생한다. <br /> 세균성
									결막염에 의해 염증이 생길 경우 심한 통증을 유발할 수 있으며, 눈에서 고름(황색 분비물)이 나올 수 있다. <br />눈이
									세균에 감염되면 <strong style="color: red !important;">즉시 치료를
										받아야 한다.</strong>
								</p>
							</div>
							<!-- 증상설명 -->
							<div class="col-lg-4 mb-3">
								<div class="text-center"
									style="width: 80% !important; margin-left: 50px;">
									<div class="card text-center doctor-book-card">
										<img src="${path}/resources/assets/img/eyeExample2.jpg" alt=""
											class="img-fluid">
										<div class="doctor-book-card-content tile-card-content-1">
											<div>
												<h3 class="card-title mb-0">사진 예시</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 사진예시 -->
						</div>
						<!-- row2 -->
					</div>
					<!-- 카드바디 -->

				</div>
				<!-- card -->



			</div>
		</div>
	</div>

</div>
<!-- /Page Content -->
