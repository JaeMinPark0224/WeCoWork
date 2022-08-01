<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/project/project.css">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.0,npm/fullcalendar@5.11.0/locales-all.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="project_section">
	<div id="project_main_wrap">
	<%@ include file="/WEB-INF/views/project/projectheader.jsp" %>
	<div id='calendar'></div>
	</div>
</section>
<script type="text/javascript">
	var calendarEl;
	var calendar;
	(function() {
		$(function() {
			calendarEl = $("#calendar")[0];
			calendar = new FullCalendar.Calendar(calendarEl, {
				height: '800px',
				locale: 'ko',
				expandRows: true,
				displayEventTime: false,
				dayMaxEventRows: true,
				headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth'
				},
				initialView: 'dayGridMonth',
				eventClick: function (info) {
					info.jsEvent.preventDefault();
					if (info.event.url) {
					      window.open(info.event.url);
				    }
				}
			});
			calendar.render();
		})
	})();
</script>
<script type="text/javascript">
	// 서브 버튼 생성
	$("#project_main_tab_wrap").append("<div id='project_calendar_sub_btn_wrap'></div>")
	$("#project_calendar_sub_btn_wrap").append("<button id='project_calendar_all_btn' class='project_calendar_sub_btn' chk='f'>전체 업무</button>");
	$("#project_calendar_sub_btn_wrap").append("<button id='project_calendar_my_btn' class='project_calendar_sub_btn' chk='f'>나의 업무</button>");
</script>
<script type="text/javascript">
	//프로젝트 번호
	var js_pr_no = (new URL(location.href).searchParams).get('project');

	// 색상 코드
	let stateRgb1 = 'rgb(87, 184, 184)';
	let stateRgb2 = 'rgb(230, 126, 34)';
	let stateRgb3 = 'rgb(231, 76, 60)';
	let stateRgb4 = 'rgb(94, 94, 94)';
	let stateRgb5 = 'rgb(75, 77, 178)';

	// fullcalendar event source 생성
	var workMyEvents = [];
	var vo;
	<c:forEach items="${calendarMyList }" var="calendar">
		vo = {
				title: "${calendar.pw_title}",
				start: "${calendar.pw_start_date}",
				end: "${calendar.pw_end_date}",
				color: stateRgb${calendar.pw_status},
				url : "<%= request.getContextPath()%>/project/work/read?project="+js_pr_no+"&no="+${calendar.pw_no},
		}
		workMyEvents.push(vo);
	</c:forEach>
	var workMyEventSource = {
			id : "myEvent",
			events : workMyEvents
	};
	
	var workAllEvents = [];
	<c:forEach items="${calendarAllList }" var="calendar">
	vo = {
			title: "${calendar.pw_title}",
			start: "${calendar.pw_start_date}",
			end: "${calendar.pw_end_date}",
			color: stateRgb${calendar.pw_status},
			url : "<%= request.getContextPath()%>/project/work/read?project="+js_pr_no+"&no="+${calendar.pw_no},
	}
	workAllEvents.push(vo);
	</c:forEach>
	var workAllEventSource = {
			id : "allEvent",
			events : workAllEvents
	};
	console.log(workAllEventSource);
	
	// 전체 업무 보기
	$("#project_calendar_all_btn").on("click", function() {
		if($(this).attr("chk") == "f") {
			if($("#project_calendar_my_btn").attr("chk") == "t") {
				$("#project_calendar_my_btn").css({
					"background-color" : "rgb(230, 230, 230)",
					"color" : "rgb(94, 94, 94)"
				});
				calendar.getEventSourceById("myEvent").remove();
				$("#project_calendar_my_btn").attr("chk", "f");
			}
			$(this).css({
				"background-color" : "#4B4DB2",
				"color" : "white"
			});
			calendar.addEventSource(workAllEventSource);
			$(this).attr("chk", "t");
		} else if ($(this).attr("chk") == "t") {
			$(this).css({
				"background-color" : "rgb(230, 230, 230)",
				"color" : "rgb(94, 94, 94)"
			});
			calendar.getEventSourceById("allEvent").remove();
			$(this).attr("chk", "f");
		}
	});
	
	// 나의 업무 보기
	$("#project_calendar_my_btn").on("click", function() {
		if($(this).attr("chk") == "f") {
			if($("#project_calendar_all_btn").attr("chk") == "t") {
				$("#project_calendar_all_btn").css({
					"background-color" : "rgb(230, 230, 230)",
					"color" : "rgb(94, 94, 94)"
				});
				calendar.getEventSourceById("allEvent").remove();
				$("#project_calendar_all_btn").attr("chk", "f");
			}
			calendar.addEventSource(workMyEventSource);
			$(this).css({
				"background-color" : "#4B4DB2",
				"color" : "white"
			});
			$(this).attr("chk", "t");
		} else if ($(this).attr("chk") == "t") {
			calendar.getEventSourceById("myEvent").remove();
			$(this).css({
				"background-color" : "rgb(230, 230, 230)",
				"color" : "rgb(94, 94, 94)"
			});
			$(this).attr("chk", "f");
		}
	});
</script>
</body>
</html>