<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html> 
<script type="text/javascript">
	$(document).ready(function(){
		var p_num = '${sessionScope.user.patient_num}'
		$(".custom-file-input").on("change", function() {
			  var fileName = $(this).val().split("\\").pop();
			  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
			  readURL(this);		  
		});
		
		function readURL(input) { 
			if (input.files && input.files[0]) { 
				var reader = new FileReader();
				reader.onload = function (e) {
					$(".upload-images > img").attr("src", e.target.result);
				
				}
				reader.readAsDataURL(input.files[0]);
			}
		}


		$(".view-inv-btn").click(function(e){
			ig = $('#images').val().split('\\').reverse()[0]; //.split("\");
			if($("#images").val() == null || $("#images").val() == "") {
				alert("이미지를 등록해 주세요")
				e.preventDefault()
			} else if(p_num == null || p_num <= 0){
				if(confirm("로그인이 필요한 서비스 입니다. \n 로그인 하시겠습니까 ?")) location.href = 'login';
			} else {
				var form = $("#aiForm")[0];
			    var formData = new FormData(form);
			    
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
   	  	url : "http://192.168.0.7:9000/drLink/jsonAIT?callback&&img=" + img_name+"&&model=3",
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
								<h2>안녕하세요. AI 피부 진단 서비스입니다.</h2>
								<p>"의사 한 명이 진단하는 것보다 2~3명이 보는 게 훨씬 더 정확하죠.<br>의사 한 명이 혹시나 놓칠 수 있는 소견을 우리가 만든 인공지능(AI) 의료 소프트웨어가 잡아주기 때문에 더욱 정밀한 진료가 가능해져요."&nbsp;
							</div>
							<div class="row ">
								<div class="col-lg-4 mb-3">
									<div class="card text-center doctor-book-card">
										<img src="${path}/resources/assets/img/skinRight1.jpg" alt="" class="img-fluid" >
										<div class="doctor-book-card-content tile-card-content-1">
											<div>
												<h3 class="card-title mb-0">올바른 사진</h3>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 mb-3">
									<div class="card text-center doctor-book-card">
										<img src="${path}/resources/assets/img/skinError1.jpg"  alt="" class="img-fluid" >
										<div class="doctor-book-card-content tile-card-content-1">
											<div>
												<h3 class="card-title mb-0">틀린 사진</h3>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 mb-3">
									<div class="card text-center doctor-book-card">
										<img src="${path}/resources/assets/img/skinError2.jpg" alt="" class="img-fluid" >
										<div class="doctor-book-card-content tile-card-content-1">
											<div>
											<h3 class="card-title mb-0">틀린 사진</h3>
											</div>
										</div>
									</div>
								</div>
								
							</div>
							
							<div class="text-center">
								정확한 진단을 위하여 정면에서 촬영한 사진을 업로드 해주세요. <br/>
					           멀리서 촬영, 타투 포함, 사물 또는 눈,코,입 등이 포함된 사진으로는 정확한 AI진단이 어려울수 있습니다.
							</div>
							<hr/>
							
							
							
							<!-- <form>
							  <div class="custom-file">
							    <input type="file" class="custom-file-input" name="images" id="images" multiple="" accept="image/jpeg, image/png, image/gif,"> 
							    <label class="custom-file-label" for="customFile">이미지를 업로드 해주세요</label>
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
							$(".custom-file-input").on("change", function() {
							  var fileName = $(this).val().split("\\").pop();
							  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
							});
							</script>
							<br><br>
							<div class="service-fields mb-3">
								<div class="row">
									<div class="col-lg-12">
										<div id="uploadPreview">
											<ul class="upload-wrap">
												<li>
													<div class=" upload-images">
														<img alt="Blog Image" src="${path}/resources/assets/admin/img/profiles/avatar-17.jpg">
													</div>
												</li>
											</ul>
										</div>
										
									</div>
								</div>
							</div>
									
									
							<hr/>
										<button class="btn btn-primary view-inv-btn">진단결과보기</button>
										<!-- <a href="aiTestSuccess" class="btn btn-primary view-inv-btn">진단결과보기</a>
									 -->
							<hr/>
							
<div class="card">
	<div class="card-header text-center">
	<h3>진단 예측 결과 예시</h3>
	</div><!-- 카드헤더 -->
	
	<div  class="card-body">
		<div class="row">
			<div class="col-lg-7 mb-3" style="margin-right: 30px !important;">
				<h3>●아토피</h3>
				<p class="">
					<a class="active text-info"
						href="https://namu.wiki/w/%ED%94%BC%EB%B6%80%EB%B3%91"
						title="피부병">피부병</a>의 일종. 아토피란 말은 선천적으로 과민한
					<a class="active text-info"
						href="https://namu.wiki/w/%EC%95%8C%EB%A0%88%EB%A5%B4%EA%B8%B0"
						title="알레르기">알레르기</a> 성질을 갖고 있다는 뜻이다. 여기에 '<a
						href="https://namu.wiki/w/%EC%97%BC%EC%A6%9D" title="염증">염증</a>'이
					더해진 만성 피부 질환을 통틀어 아토피성 피부염이라 부른다. 흔히 '아토피 피부염', 더 줄여서는 그냥
					'아토피'라고도 부른다. 쉽게 낫지 않는
					<a class="active text-info"
						href="https://namu.wiki/w/%EB%82%9C%EC%B9%98%EB%B3%91"
						title="난치병">난치병</a>으로 실제로 한 번 이 병에 걸린 사람은 성인이 되어서도 고생하는 경우가
					허다하다. 전염성은 없지만,
					<a class="active text-info"
						href="https://namu.wiki/w/%EB%B9%84%EC%97%BC" title="비염">비염</a>과
					거의 동급으로 고생을 어마어마하게 한다.
				 </p>
			</div><!-- 증상설명 -->
			<div class="col-lg-4 mb-3">
				<div class="text-center" style="width:80% !important; margin-left: 50px;" >
					<div class="card text-center doctor-book-card">
						<img src="${path}/resources/assets/img/skinEx01.jpg" alt="" class="img-fluid" >
						<div class="doctor-book-card-content tile-card-content-1">
							<div>
								<h3 class="card-title mb-0">사진 예시</h3>
							</div>
						</div>
					</div>
				</div>
			</div><!-- 사진예시 -->
		</div><!-- row1 -->
	
		<div class="row">
			<div class="col-lg-7 mb-3" style="margin-right: 30px !important;">
				<h3>●콜린성 두드러기</h3>
				<p class="u-text u-text-8">
					상대적으로 체온이 높아질 때 나는 <a class="active text-info" href="/w/%EB%91%90%EB%93%9C%EB%9F%AC%EA%B8%B0" title="두드러기">두드러기</a>.
					콜린성 <a class="active text-info" href="/w/%EC%95%8C%EB%9F%AC%EC%A7%80" title="알러지">알러지</a>라
					하는 경우도 있으나 항원이 없으니 엄밀히는 틀린 말이다. 땀은 몸의 체온이 올랐을 경우 이를 내려주는 냉각액의
					역할을 하는데, 선천적으로 땀이 잘 나지 않거나 땀으로 배출될 수 있는 수분의 양이 체내에 부족한 경우, 피부
					내 온도가 상승하면서 열이 비만세포를 자극해 따끔거림과 가려움을 동반하는 현상이다. 대부분의 경우 습한
					여름에는 증상이 없다가 건조한 가을~겨울 쯤(추워지는 때)에 나타난다. 발병 원인은 확실치
					않다.
				</p>
			</div><!-- 증상설명 -->
			<div class="col-lg-4 mb-3">
				<div class="text-center" style="width:80% !important; margin-left: 50px;" >
					<div class="card text-center doctor-book-card">
						<img src="${path}/resources/assets/img/skinEx02.jpg" alt="" class="img-fluid" >
						<div class="doctor-book-card-content tile-card-content-1">
							<div>
								<h3 class="card-title mb-0">사진 예시</h3>
							</div>
						</div>
					</div>
				</div>
			</div><!-- 사진예시 -->
		</div><!-- row2 -->
	</div><!-- 카드바디 -->

</div><!-- card -->
							
								
							
						</div>
					</div>
				</div>

			</div>		
			<!-- /Page Content -->
   
