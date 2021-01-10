<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<script type="text/javascript">
	$(document).ready(function() {
			var p_num = '${sessionScope.user.patient_num}'
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
							$(".upload-images > img").attr("src", e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
			    $(".view-inv-btn").click(function(e){
					ig = $('#images').val().split('\\').reverse()[0]; //.split("\");
					alert("ig : " + ig)
					if($("#images").val() == null || $("#images").val() == "") {
						alert("이미지를 등록해 주세요")
						e.preventDefault()
					} else if(p_num == null || p_num <= 0){
						if(confirm("로그인이 필요한 서비스 입니다. \n 로그인 하시겠습니까 ?")) location.href = 'login';
					} else {
						var form = $("#aiForm")[0];
					    var formData = new FormData(form);
					    alert(" formData : " + formData)
					    $.ajax({
					        url : "aiTest",
					        type: "POST",
					        data: new FormData($("#aiForm")[0]),
					        enctype: 'multipart/form-data',
					        processData: false,
					        contentType: false,
					        cache: false,
					        success:function(result) {
					        	alert("성공");
					        	alert("result: " + result);
					        	jsonpAjax(ig);
					        }
					    });
				} // else
			}) // click
		}) // ready
</script>


<script type="text/javascript">
/*
$.ajax({ 
	type: "GET", 
	enctype: 'multipart/form-data', // 필수 
	url: 'patients/aiTest', 
	data: formData, // 필수 
	processData: false, // 필수 
	contentType: false, // 필수 
	cache: false, 
	success: function (result) { 
		alert("성공")
	}, 
	error: function (e) { 
		alert("에러")
	} 
});
*/
function promise_function(formData){
    return new Promise(function(resolve, reject, formData){
	      $.ajax({
	    	    url : "aiTest",
		        type: "POST",
		        data: formData, //new FormData($("#aiForm")[0]),
		        enctype: 'multipart/form-data',
		        processData: false,
		        contentType: false,
		        cache: false,
		        success:function(result) {
		        	alert("성공")
		        },
	      		/*
	    	    type: "GET", 
	    		enctype: 'multipart/form-data', // 필수 
	    		url: 'aiTest', 
	    		data: formData, // 필수
	    		processData: false, // 필수 
	    		contentType: false, // 필수 
	    		cache: false, 
	    		success: function (result) { 
	    			alert("성공")
	    		}, */
	    		error: function (e) { 
	    			alert("에러")
	    		} 
	      }); // ajax
    });
  }
  
function jsonpAjax(img_name){
    	alert("img_name: "+ img_name);
    	$.ajax({
       	  	url : "http://192.168.0.7:9000/survey/jsonAIT?callback&&img=" + img_name+"&&model=2",
    		dataType : 'jsonp',
    		type : 'GET',
    		jsonp : 'callback',
            success : function(result){
            	alert("성공 ??");
            	alert( "성공: " + result.predict+ " 병명 : "+result.disease);
            	var url = "aiSuccess?result="+result.predict+"&&disease="+result.disease+"&&IMG="+img_name+"&&DP=20"
            	location.href = url 
                 },
            error : function(e) {
            	alert("서버의 문제가 있어 요청한 작업이 수행되지 않았습니다.");
            }
          });  // ajax
  }  
  
function firstAjax(img_name){
	alert("img first: "+img_name)
	var ig = img_name
    return new Promise(function(resolve, reject, ){
    	alert("img_name: "+ ig);
    	$.ajax({
       	  	url : "http://192.168.0.87:9000/survey/jsonAIT?callback",
    		dataType : 'jsonp',
    		type : 'GET',
    		jsonp : 'callback',
            success : function(result){
            	alert("re2: "+ result.data2);
                    resolve(result.data2);
                 },
            error : function(e) {
            	alert("서버의 문제가 있어 요청한 작업이 수행되지 않았습니다.");
            }
          });  // ajax
    });
  }
  
  
function successFunction(){
  alert('성공');
  return false;
}
function errorFunction(){
    alert('에러');
    return false;
  }

</script>


<!-- Page Content -->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-9 m-auto">
				<div class="section-header text-center">
					<h2>안녕하세요. AI 탈모 진단 서비스입니다.</h2>
					<p>
						"의사 한 명이 진단하는 것보다 2~3명이 보는 게 훨씬 더 정확하죠.<br>의사 한 명이 혹시나 놓칠 수
						있는 소견을 우리가 만든 인공지능(AI) 의료 소프트웨어가 잡아주기 때문에 더욱 정밀한 진료가 가능해져요."&nbsp;
					
				</div>
				<div class="row ">
					<div class="col-lg-4 mb-3">
						<div class="card text-center doctor-book-card">
							<img src="${path}/resources/assets/img/hairRight1.jpg" alt=""
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
							<img src="${path}/resources/assets/img/hairError1.jpg" alt=""
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
							<img src="${path}/resources/assets/img/hairError2.jpg" alt=""
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
					정확한 진단을 위하여 정면에서 촬영한 사진을 업로드 해주세요. <br /> 멀리서 촬영, 사물 또는 눈,코,입 등이
					포함된 사진으로는 정확한 AI진단이 어려울수 있습니다.
				</div>
				<hr />



				<!-- <form>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="images"
							id="images" multiple=""
							accept="image/jpeg, image/png, image/gif,"> <label
							class="custom-file-label" for="customFile">이미지를 업로드 해주세요</label>
					</div>
				</form> -->
				<form class="file-input-frm" id="aiForm" enctype="multipart/form-data">
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="images"
							id="images"> <label class="custom-file-label"
							for="customFile">이미지를 업로드 해주세요</label>
					</div>
				</form>
				<script>
					// Add the following code if you want the name of the file appear on select
					$(".custom-file-input").on(
							"change",
							function() {
								var fileName = $(this).val().split("\\").pop();
								$(this).siblings(".custom-file-label")
										.addClass("selected").html(fileName);
							});
				</script>
				<br>
				<br>
				<div class="service-fields mb-3">
					<div class="row">
						<div class="col-lg-12">
							<div id="uploadPreview">
								<ul class="upload-wrap">
									<li>
										<div class=" upload-images">
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
				<button class="btn btn-primary view-inv-btn">진단결과보기</button>

				<hr />

				<div class="card">
					<div class="card-header text-center">
						<h3>진단 예측 결과 예시</h3>
					</div>
					<!-- 카드헤더 -->

					<div class="card-body">
						<div class="row">
							<div class="col-lg-7 mb-3" style="margin-right: 30px !important;">
								<h3>●M자 탈모</h3>
								<p class="">
									<a class="wiki-link-internal" href="/w/%ED%83%88%EB%AA%A8"
										title="탈모">탈모</a>의 일종으로, 이마 부분의 머리 라인이 M자가 되는 탈모를 일컫는다. <a
										class="wiki-link-internal"
										href="/w/%EC%82%BC%EC%A7%80%EC%B0%BD%EB%A8%B8%EB%A6%AC"
										title="삼지창머리">삼지창머리</a> 와는 다른 개념이나, 머리 라인이 M자가 된다는 공통점은 있다.
								</p>
							</div>
							<!-- 증상설명 -->
							<div class="col-lg-4 mb-3">
								<div class="text-center"
									style="width: 80% !important; margin-left: 50px;">
									<div class="card text-center doctor-book-card">
										<img src="${path}/resources/assets/img/hairEx01.jpg" alt=""
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
								<h3>●원형탈모</h3>
								<p class="u-text u-text-8">
									<b>원형 탈모증</b>은 몸의 일부 또는 모든 부위에 털이 빠지는 질환이다. 흔히 두피에 몇 개의 대머리 반점이
									생기는데, 각각 동전 크기 정도 된다. 심리적 스트레스에 의해 발생할 수 있으며 두피에 있는 털이나 전신 털이
									모두 없어져 영구적으로 탈모가 되는 경우도 있다. 원형 탈모증은 모낭에 균열이 생긴 자가면역질환으로 여겨진다.
									위험인자에는 가족력이 포함된다. 일란성 쌍둥이가 영향을 받으면 다른 쌍둥이도 영향을 받을 확률이 약 50%이다.
									기초적인 메커니즘은 모낭의 면역 매개 파괴로 몸이 자신의 세포를 인식하지 못하는 것을 포함한다. 아직 뚜렷하게
									밝혀진 치료법은 없으며 코티손 주입과 같은 모발 재생을 가속화하는 방법은 사용할 수 있다. 또한 선스크린, 추위와
									햇빛로부터 보호하기 위한 헤드커버, 속눈썹이 빠진 경우 안경 등이 추천된다. 심한 경우 머리카락이 퇴보하여
									재발하지 않는 경우도 있다. 체모가 모두 빠진 사람 중 회복되는 사람은 10% 미만이다.
								</p>

							</div>
							<!-- 증상설명 -->
							<div class="col-lg-4 mb-3">
								<div class="text-center"
									style="width: 80% !important; margin-left: 50px;">
									<div class="card text-center doctor-book-card">
										<img src="${path}/resources/assets/img/hairEx02.jpg" alt=""
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
