<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/attendance/attendance.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.0,npm/fullcalendar@5.11.0/locales-all.min.js"></script>
<meta charset="UTF-8">
<title>월간 근태 관리</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>

<style type="text/css">
.attendance_main_box_first_container {
	flex-grow: 1;
}

#insert_attendance_box_top{
	width: 240px;
	height: 36px;
	border: 2px solid rgb(224, 224, 224);
	background-color: rgb(244, 244, 244);
	text-align: center;
	line-height: 36px;
	
}
#insert_attendance_box_bottom{
	width: 240px;
	height: 64px;
	border-left: 2px solid rgb(224, 224, 224);
	border-right: 2px solid rgb(224, 224, 224);
	border-bottom: 2px solid rgb(224, 224, 224);
	border-top: 0px;
	text-align: center;
	display: flex;
	align-items: center;
}
#insert_box_bottom_buttons{
	margin: auto;
}


.first_box_text{
	margin-bottom: 13px;
}

#search_date_range{
	display: flex;
	gap: 30px;
}

#att_appr_clock_in, #att_appr_clock_out{
	border: 1px solid rgb(224, 224, 224);
	width: 138px; height:25px;
	font-size: 12px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);	
}
#att_modify_reason_text{
	border: 1px solid rgb(224, 224, 224);
	font-size: 12px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}

#week_select{
	border: 1px solid rgb(224, 224, 224);
	font-size: 12px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}

#startDate, #endDate{
	border: 1px solid rgb(224, 224, 224);
	height: 25px;
	width: 138px;
	font-size: 12px;
	font-family: NotoSansR;
	text-align: center;
}

.charts {
	width: 955px;
	height: 450px;
	display: inline-block;
	margin-top: 58px;
}


/* grid box~! */
.flexbox1{
	display: flex;
    gap: 30px;
}
.flexbox1:first-child {
    height: 25px;
    line-height: 25px;
}

/* 같은 폰트 적용 */
.font_title{
	font-size: 13px;
	font-family: NotoSansB;
	color: rgb(94, 94, 94);
}
.font_content{
	font-size: 13px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}

#clock{
	font-size: 13px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}
#calendar{
	font-family: NotoSansR;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="attendance_section">
	<div id="attendance_main_wrap">
		<div id="attendance_main_header">
			<div id="attendance_main_menu_title">월간 근태</div>
		</div>
		
		<div id="attendance_main_container">
			<div id="attendance_main_box_first" class="flexbox1">
				<div class="font_title" id="att_month_text">기준 년월</div>
				<input type="month" id="att_month" name="att_month" class="att_date_form">
				
				<button type="submit" class="btn_format_mini_gray" id="att_date_search_btn">조회</button>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">월간 근태 현황</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<div id='calendar'></div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>
<script>
// 기준 년월 input tag에 초기 값 넣기
var today = new Date();
var month = today.getMonth();
month = ((month+1) < 10) ? '0'+(month+1) : (month+1);
$("#att_month").val(today.getFullYear()+"-"+month);

/* 년월, 주차 선택 후 날짜표시 */
	
	// 숫자를 hh:mm:ss로 바꾸는 함수
	function tohhmmss(num) {
		var stringHMS = '';
		num = num / 1000;
		var hh = Math.floor(num/3600);
		var mm = Math.floor((num - (hh * 3600))/60);
		var ss = num - (hh * 3600) - (mm * 60);
		stringHMS = hh + '시간 ' + mm + "분 " + ss +'초';
		if(num < 0) {
			stringHMS = "-";
		}

		return stringHMS;
	}
	
/*////////////////// 캘린더 /////////////////// */
var calendar = null;
	(function() {
		$(function() {
			var calendarEl = $("#calendar")[0];
			calendar = new FullCalendar.Calendar(calendarEl, {
				height: '700px',
				expandRows: true,
				headerToolbar: {
					left: 'prev',
					center: 'title',
					right: 'next'
				},
				locale : 'ko',
				initialView: 'dayGridMonth',
				displayEventTime: false,
				eventDisplay : "block",
				events: [
				    { // this object will be "parsed" into an Event Object
				      title: 'The Title', // a property!
				      start: '2020-07-01', // a property!
				      end: '2020-07-22' // a property! ** see important note below about 'end' **
				    }
				  ]
			});
			calendar.render();
			console.log(workMyEventSource);
			calendar.addEventSource(workMyEventSource);
			
			//캘린더 지정한 월루 이동
			$("#att_date_search_btn").click(function(){
				calendar.gotoDate( $('#att_month').val());
			});
		})
	})();

	$("#att_month").on("input", function(){
		$('#calendar').FullCalendar('gotoDate', $('#att_month').val());
	});

	
	
	///캘린더에 나타내기
// fullcalendar event source 생성
var workMyEvents = [];
var vo;

<c:forEach items="${monthlylist}" var="att">
	console.log("${att}");
	vo = null;
	// 근무 
	<c:if test="${not empty att.att_date}">
		vo = {
				title : "출근",
				start : "${att.att_date}",
				color : "#4B4DB2"
		}
		workMyEvents.push(vo);
	</c:if>
	// 휴가 
	<c:if test="${not empty att.vaca_start && att.vaca_confirm == 2}">
		vo = {
				title : "휴가",
				start : "${att.vaca_start}",
				end   : "${att.vaca_end} 23:59:59",
				color : "rgb(242, 205, 220)"
		}
		workMyEvents.push(vo);
	</c:if>
	<c:if test="${not empty att.vaca_start && att.vaca_confirm == 1}">
		vo = {
				title : "휴가 결재중",
				start : "${att.vaca_start}",
				end   : "${att.vaca_end} 23:59:59",
				color : "rgb(224, 224, 224)",
				textColor : "rgb(94, 94, 94)"
		}
		workMyEvents.push(vo);
	</c:if>
</c:forEach>
var workMyEventSource = {
		id : "myEvent",
		events : workMyEvents
};
</script>
</body>
</html>