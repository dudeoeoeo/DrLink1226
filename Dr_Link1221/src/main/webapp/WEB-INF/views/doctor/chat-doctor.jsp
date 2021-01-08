<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html> 
<script type="text/javascript">
	$(document).ready(function(){	
		// 의사 클릭시		
		$('.chat-scroll > a').each(function(){
			$(this).click(function(){
				
				var cReceiver = $(this).find('input').val();
				var cSender = $('.myDoctor_num').val();
//				alert(cReceiver + " " +cSender);
				
				ajax(cReceiver, cSender);
				
			});		
			
		});		
		
		function ajax(cReceiver, cSender){
			
			$.ajax({
	            async: true,
	            type : 'POST',
	            cache : false,
	            data : {
	            	'sender' : cSender,
	            	'receiver' : cReceiver
	            },
	            url : "chat.do?rand="+Math.random(),
	            dataType : "html",
	            contentType: "application/x-www-form-urlencoded; charset=utf-8",
	            success : function(data) {
					$(".chat-cont-right").remove();
	            	$('.chat-window').append(data);
	            },
	            error : function(error) {              
	                alert("error : " + error);
	            }
	            
	        });
			
		}
		/*
	      function reload(){
	          $('#chat_box').load(window.location.href + '#chat_box');
	       }
	       setinterval(function(){
	          $('#chat_box').load(window.location.href + '#chat_box');
	       }, 1 * 1000) // setInterval
	       //setTimeout('location.reload()',1000);
		*/
	});

</script>
		<!-- Page Content -->
		<input type="hidden" class="myDoctor_num" value="${sessionScope.doctor.doctor_num}" />
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-12">
						<div class="chat-window">

							<!-- Chat Left -->
							<div class="chat-cont-left">
								<div class="chat-header">
									<span>Chats</span> <a href="javascript:void(0)"
										class="chat-compose"> <i class="material-icons">control_point</i>
									</a>
								</div>
								<form class="chat-search">
									<div class="input-group">
										<div class="input-group-prepend">
											<i class="fas fa-search"></i>
										</div>
										<input type="text" class="form-control" placeholder="Search">
									</div>
								</form>
								<div class="chat-users-list">
									<div class="chat-scroll" id="chat_box">
									<!-- start for -->
										<c:forEach var="doctor" items="${doctor_list}" varStatus="i">										
											<a href="javascript:void(0);" class="media">
												<input type="hidden" name="receiver" value=${doctor.doctor_num } />	
												<div class="media-img-wrap">
													<div class="avatar avatar-away">
														<img
															src="${path}/resources/doctor/doctorImg/${doctor.d_photo}"
															alt="User Image" class="avatar-img rounded-circle">
													</div>
												</div>
												<div class="media-body">
													<div>
														<div class="user-name">${doctor.d_name }</div>
														<div class="user-last-chat">${doctor.chatDTO.msg }</div>
													</div>
													<div>
														<div class="last-chat-time block">${doctor.departmentDTO.dep_name }</div>
													</div>
												</div>
											</a>
										</c:forEach>
										<!-- end for -->
									</div>
									<!-- end chat-scroll -->

								</div>
							</div>
							<!-- /Chat Left -->

						</div>
					</div>
				</div>
				<!-- /Row -->

			</div>

		</div>
		<!-- /Page Content -->


	</div>
	<!-- /Main Wrapper -->

	<!-- Voice Call Modal -->
	<div class="modal fade call-modal" id="voice_call">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body">

					<!-- Outgoing Call -->
					<div class="call-box incoming-box">
						<div class="call-wrapper">
							<div class="call-inner">
								<div class="call-user">
									<img alt="User Image"
										src="${path}/resources/assets/img/patients/patient.jpg"
										class="call-avatar">
									<h4>Richard Wilson</h4>
									<span>Connecting...</span>
								</div>
								<div class="call-items">
									<a href="javascript:void(0);" class="btn call-item call-end"
										data-dismiss="modal" aria-label="Close"><i
										class="material-icons">call_end</i></a> <a href="voice-call.html"
										class="btn call-item call-start"><i class="material-icons">call</i></a>
								</div>
							</div>
						</div>
					</div>
					<!-- Outgoing Call -->

				</div>
			</div>
		</div>
	</div>
	<!-- /Voice Call Modal -->

	<!-- Video Call Modal -->
	<div class="modal fade call-modal" id="video_call">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body">

					<!-- Incoming Call -->
					<div class="call-box incoming-box">
						<div class="call-wrapper">
							<div class="call-inner">
								<div class="call-user">
									<img class="call-avatar"
										src="${path}/resources/assets/img/patients/patient.jpg"
										alt="User Image">
									<h4>Richard Wilson</h4>
									<span>Calling ...</span>
								</div>
								<div class="call-items">
									<a href="javascript:void(0);" class="btn call-item call-end"
										data-dismiss="modal" aria-label="Close"><i
										class="material-icons">call_end</i></a> <a href="video-call.html"
										class="btn call-item call-start"><i class="material-icons">videocam</i></a>
								</div>
							</div>
						</div>
					</div>
					<!-- /Incoming Call -->

				</div>
			</div>
		</div>
	</div>
	<!-- Video Call Modal -->