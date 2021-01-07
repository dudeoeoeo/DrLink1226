$(function() {

	//setInterval(function(){	
		var uid = '${sessionScope.user.p_name}';
				
		var now = new Date();   //현재시간
		var year = now.getFullYear();   //현재시간 중 4자리 연도
		var month = now.getMonth();   //현재시간 중 달. 달은 0부터 시작하기 때문에 +1 
		if((month+"").length < 2){
		    month="0"+month;   //달의 숫자가 1자리면 앞에 0을 붙임.
		}
		var date = now.getDate();      //현재 시간 중 날짜.
		if((date+"").length < 2){
		    date="0"+date;      
		}
		var hour = now.getHours();   //현재 시간 중 시간.
		if((hour+"").length < 2){
			hour="0"+hour;      
		}
		var min = now.getMinutes();   //현재 시간 중 시간.
		if((min+"").length < 2){
			min="0"+min;      
		}
		var today = new Date(Number(year),Number(month),Number(date),Number(hour),Number(min))      //오늘 날짜 완성.

		
		
		var appointment ='${sessionScope.user.appointment}';
			
	    var yyyyMMdd = String(appointment);
	    var ap_date = new Date(Number(yyyyMMdd.substring(0,4)), Number(yyyyMMdd.substring(5,7))-1, 
	    		Number(yyyyMMdd.substring(8,10)), Number(yyyyMMdd.substring(10,12)), Number(yyyyMMdd.substring(13,15)));

		today=moment(today).format('YY-MM-DD, H:mm')
		ap_date=moment(ap_date).format('YY-MM-DD, H:mm')
		alert(today)
		alert(uid)
		alert(ap_date)
	 	
		if (uid){	
			if('January 7th 2021, 18:04'==today){
				window.onload = function () {
			        if (window.Notification) {
			            Notification.requestPermission();
			        }
			    }
				
				notify();
				
			    function calculate() {
			        setTimeout(function () {
			            notify();
			        }, 3000);
			    }
			    
				function notify() {
					if (Notification.permission !== 'granted') {
						alert('notification is disabled');
					} else {
						var notification = new Notification('💕진료 예약 알림💕', {
							icon : '${path}/resources/assets/img/favicon.png',
							body : '곧 진료가 시작됩니다. 진료실에 입장해주세요',
							requireInteraction : true
						//timestamp: dts
						});
			
						notification.onclick = function() {
							window.open('https://192.168.0.44:3100/dr_linkVideo');
						};
			
						  notification.onclose = function () {
						     window.open('https://192.168.0.44:3100/dr_linkVideo');
						 };
					}
				}
			};//if문
		}//2번째if문

	 //},60*1000);//setInterval
	});