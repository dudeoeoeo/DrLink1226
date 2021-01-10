<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		$(".btn.msg-send-btn").click(function() {
//			alert('전송 버튼');
			sendMessage();
			insertChat();
			$('.input-msg-send.form-control').val('')
		});
		
		let sock = new SockJS('http://localhost:8080/Dr_Link1221/doctor/chat');
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		sock.onopen = onOpen;
		
		function onOpen(){
//			alert('웹소켓 서버 열림');
		}
		// sendMessage
		function sendMessage() {
//			alert('sendMessage');
			var option = {
				From : $('.myDoctor_num').val(),
				To : $('.receiverNum').val(),
				MSG : $(".input-msg-send.form-control").val()
			};
//			alert('데이터 전송 전');
			sock.send(JSON.stringify(option)) // json -> string
//			alert('데이터 전송 후');
		}
		// onMessage
		function onMessage(msg) {
//			alert('onMessage');
			var data = msg.data;
			if (data != null && data.trim() != '') {
				var d = JSON.parse(data); // string -> json
			}
			var myNum = $('.myDoctor_num').val();		
//			alert($(".list-unstyled > li").length);
//			alert($(".list-unstyled > li").last().attr('class').trim());
//			$(".list-unstyled").append(d.From + ": " + d.MSG + "<br/>");

			if($(".list-unstyled > li").length != 0 ){ // 첫 채팅이 아닐 경우
				if(d.From != myNum){ // 받은 메세지
					if($(".list-unstyled > li").last().attr('class').trim() == 'media received'){
						$(".list-unstyled > li").last().find('.media-body').append('<div class="msg-box">\
								<div>\
									<p>'+d.MSG+'</p>\
								</div>\
							</div>');						
					}else{
						$(".list-unstyled").append('<li class="media received">\
								<div class="avatar">\
								<img src="${path }/resources/doctor/doctorImg/${doctor.d_photo }" alt="User Image" class="avatar-img rounded-circle">\
								</div>\
								<div class="media-body">\
									<div class="msg-box">\
										<div>\
											<p>'+d.MSG+'</p>\
										</div>\
									</div></div></li>');
					}
				}else{ // 보낸 메세지
					if($(".list-unstyled > li").last().attr('class').trim() == 'media sent'){
						$(".list-unstyled > li").last().find('.media-body').append('<div class="msg-box">\
								<div>\
									<p>'+d.MSG+'</p>\
								</div>\
							</div>');						
					}else{
						$(".list-unstyled").append('<li class="media sent">\
								<div class="media-body">\
								<div class="msg-box">\
									<div>\
										<p>'+d.MSG+'</p>\
									</div>\
								</div></div></li>');
					}
										
				}
								
			}else{ // 첫 채팅일 경우	
				if(d.From != myNum){ // 받은 메세지
					$(".list-unstyled").append('<li class="media received">\
							<div class="avatar">\
							<img src="${path }/resources/doctor/doctorImg/${doctor.d_photo }" alt="User Image" class="avatar-img rounded-circle">\
							</div>\
							<div class="media-body">\
								<div class="msg-box">\
									<div>\
										<p>'+d.MSG+'</p>\
									</div>\
								</div></div></li>\
							');
				}else{ // 보낸 메세지
					$(".list-unstyled").append('<li class="media sent">\
					<div class="media-body">\
					<div class="msg-box">\
						<div>\
							<p>'+d.MSG+'</p>\
						</div>\
					</div></div></li>');
				}
				
			}
			

		}
		
		// onClose
		function onClose(evt) {
//			alert('웹소켓 연결 종료');
		}	
		
		
		function insertChat(){

			var option = {
				From : $('.myDoctor_num').val(),
				To : $('.receiverNum').val(),
				MSG : $(".input-msg-send.form-control").val()
			};
			
			$.ajax({
	            async: true,
	            type : 'POST',
	            cache : false,
	            data : {
	            	'sender' : $('.myDoctor_num').val(),
	            	'receiver' : $('.receiverNum').val(),
	            	'msg' : $(".input-msg-send.form-control").val()
	            },
	            url : "insertChat.do?rand="+Math.random(),
	            dataType : "html",
	            contentType: "application/x-www-form-urlencoded; charset=utf-8",
	            success : function(data) {
	            	
	            },
	            error : function(error) {              
	                alert("error : " + error);
	            }
	            
	        });
			
		}
		
	      $('.input-msg-send.form-control').keypress(function(event){
	           if ( event.which == 13 ) {
//	              alert('');
	               $('.btn.msg-send-btn').click();
	               return false;
	           }
	      });
		
		setInterval(function(){
			var divdiv = document.getElementById("chat-scroll");
			divdiv.scrollTop = divdiv.scrollHeight;
	    }, 0.01*1000)
		
	});
</script>

<!-- Chat Right -->
<div class="chat-cont-right">
	<div class="chat-header">
		<a id="back_user_list" href="javascript:void(0)"
			class="back-user-list"> <i class="material-icons">chevron_left</i>
		</a>
		<div class="media">
			<div class="media-img-wrap">
				<div class="avatar avatar-online">
					<img src="${path}/resources/doctor/doctorImg/${doctor.d_photo}"
						alt="User Image" class="avatar-img rounded-circle">
				</div>
			</div>
			<div class="media-body">
				<div class="user-name">${doctor.d_name }</div>
			</div>
		</div>
		<!-- <div class="chat-options">
			<a href="javascript:void(0)" data-toggle="modal"
				data-target="#voice_call"> <i class="material-icons">local_phone</i>
			</a> <a href="javascript:void(0)" data-toggle="modal"
				data-target="#video_call"> <i class="material-icons">videocam</i>
			</a> <a href="javascript:void(0)"> <i class="material-icons">more_vert</i>
			</a>
		</div> -->
	</div>
	<div class="chat-body">
		<input type="hidden" class="receiverNum" value="${doctor.doctor_num }" />
		<div class="chat-scroll" id="chat-scroll" style="overflow: auto !important; height:100% !important;">
			<ul class="list-unstyled">
			<!-- 비교할 이전값 -->
			<c:set var = "preSender" value=""/>
			<!-- start for -->
			<c:forEach var="item" items="${result}" varStatus="i">
				<c:set var="preSender" value="${result[i.index - 1].sender}"/>
				<c:set var="nextSender" value="${result[i.index + 1].sender}"/>
				
				
				<c:choose>
					<c:when test="${i.index eq 0 }"> <!-- 처음 -->
						<c:choose>
							<c:when test="${sessionScope.doctor.doctor_num ne item.sender }"> <!-- 받은 메세지 -->
								<li class="media received">
									<div class="avatar">
										<img src="${path }/resources/doctor/doctorImg/${doctor.d_photo }" alt="User Image" class="avatar-img rounded-circle">
									</div>
									<div class="media-body">
										<div class="msg-box">
											<div>
												<p>${item.msg }</p>
												<ul class="chat-msg-info">
													<li>
														<div class="chat-time">
															<span>${item.chat_date }</span>
														</div>
													</li>
												</ul>
											</div>
										</div>
								<c:if test="${item.sender ne nextSender }">
									</div>
								</li>
								</c:if>
							</c:when>
							<c:otherwise> <!-- 보낸 메세지 -->
								<li class="media sent">
									<div class="media-body">
										<div class="msg-box">
											<div>
												<p>${item.msg }</p>
												<ul class="chat-msg-info">
													<li>
														<div class="chat-time">
															<span>${item.chat_date }</span>
														</div>
													</li>
												</ul>
											</div>
										</div>
								<c:if test="${item.sender ne nextSender }">
									</div>
								</li>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise> <!-- 처음 이후 -->
						<c:choose>
							<c:when test="${sessionScope.doctor.doctor_num ne item.sender }"> <!-- 받은 메세지 -->
								<c:choose>
									<c:when test="${item.sender eq preSender }"> <!-- 이전과 동일 -->
										<div class="msg-box">
											<div>
												<p>${item.msg }</p>
												<ul class="chat-msg-info">
													<li>
														<div class="chat-time">
															<span>${item.chat_date }</span>
														</div>
													</li>
												</ul>
											</div>
										</div>
										<c:if test="${item.sender ne nextSender }">
											</div>
										</li>
										</c:if>
									</c:when>
									<c:otherwise> <!-- 이전과 다름 -->
										<li class="media received">
											<div class="avatar">
												<img src="${path }/resources/doctor/doctorImg/${doctor.d_photo }" alt="User Image" class="avatar-img rounded-circle">
											</div>
											<div class="media-body">
												<div class="msg-box">
													<div>
														<p>${item.msg }</p>
														<ul class="chat-msg-info">
															<li>
																<div class="chat-time">
																	<span>${item.chat_date }</span>
																</div>
															</li>
														</ul>
													</div>
												</div>
										<c:if test="${item.sender ne nextSender }">
											</div>
										</li>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise> <!-- 보낸 메세지 -->
								<c:choose>
									<c:when test="${item.sender eq preSender }"> <!-- 이전과 동일 -->
										<div class="msg-box">
											<div>
												<p>${item.msg }</p>
												<ul class="chat-msg-info">
													<li>
														<div class="chat-time">
															<span>${item.chat_date }</span>
														</div>
													</li>
												</ul>
											</div>
										</div>
										<c:if test="${item.sender ne nextSender }">
											</div>
										</li>
										</c:if>
									</c:when>
									<c:otherwise> <!-- 이전과 다름 -->
										<li class="media sent">
											<div class="media-body">
												<div class="msg-box">
													<div>
														<p>${item.msg }</p>
														<ul class="chat-msg-info">
															<li>
																<div class="chat-time">
																	<span>${item.chat_date }</span>
																</div>
															</li>
														</ul>
													</div>
												</div>
										<c:if test="${item.sender ne nextSender }">
											</div>
										</li>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>	
			<!-- end for -->
			</ul>
		</div>
	</div>
	<div class="chat-footer">
		<div class="input-group">
			<div class="input-group-prepend">
				<div class="btn-file btn">
					<i class="fa fa-paperclip"></i> <input type="file">
				</div>
			</div>
			<input type="text" class="input-msg-send form-control"
				placeholder="Type something">
			<div class="input-group-append">
				<button type="button" class="btn msg-send-btn">
					<i class="fab fa-telegram-plane"></i>
				</button>
			</div>
		</div>
	</div>
</div>
<!-- /Chat Right -->
