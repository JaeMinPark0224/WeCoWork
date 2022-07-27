<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.0,npm/fullcalendar@5.11.0/locales-all.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
<head>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<style type="text/css">
#main_section {
	position: absolute;
	left: 300px;
}
#main_wrap {
	margin: 105px 125px 220px 125px;
	position: relative;
	width: 1070px;
}

#main_title {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(75, 77, 178);
	height: 20px;
	line-height: 20px;
	margin-bottom: 70px;
}

#main_grid_wrap {
	display: grid;
	grid-template-columns: 340px 340px 340px;
	grid-template-rows: 340px 340px 340px;
	gap: 25px;
}

.grid_content {
	background-color: rgb(244, 244, 244);
}

.grid_content_title {
	font-size: 17px;
	font-family: NotoSansB;
	color: rgb(94,94,94);
	height: 25px;
	line-height: 25px;
}

#grid_content_attendance {
	padding: 40px;
}

#grid_content_todo {
	padding: 40px;
}

#grid_content_profile {
	padding: 40px 110px;
}

#grid_content_calendar {
	grid-column: 1 / 2;
	grid-row: 2 / 4;
}

#grid_content_approval {
	padding: 40px;
	grid-column: 2 / 4;
	grid-row: 2 / 3;
}

#grid_content_notice {
	padding: 40px;
	grid-column: 2 / 4;
	grid-row: 3 / 4;
}

#grid_content_attendance_date {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
	margin-top: 10px;
	margin-bottom: 40px;
	height: 20px;
	line-height: 20px;
}

#grid_content_attendance_time_grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-template-rows: 20px 20px;
	row-gap: 10px;
}

.grid_content_attendance_time_text {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(94, 94, 94);
	line-height: 20px;
	justify-self: start;
}

.grid_content_attendance_time_data {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
	line-height: 20px;
	justify-self: end;
}

#grid_content_attendance_hr {
	height: 1px;
	background-color: rgb(224, 224, 224);
	margin: 37px 0px;
}

#grid_content_attendance_btn_wrap {
	display: flex;
	gap: 20px;
}

.grid_content_attendance_btn {
	width: 120px;
	height: 40px;
	border: 1px solid #4B4DB2;
	background-color: #4B4DB2;
	color: rgb(243, 243, 243);
	font-size: 12px;
	font-family: NotoSansR;
	cursor: pointer;
}

.grid_content_attendance_btn:hover {
	background-color: rgb(250, 250, 250);	
	color: #4B4DB2;
}

#grid_content_todo_title_wrap {
	display: grid;
	grid-template-columns: 1fr 1fr;
}

#grid_content_todo_plus {
	font-size: 24px;
	justify-self: end;
	color: rgb(158, 158, 158);
	height: 25px;
	line-height: 25px;
	cursor: pointer;
}

#grid_content_todo_list_flex {
	display: flex;
	flex-direction: column;
	gap: 10px;
	margin-top: 30px;
}

.grid_content_todo_list {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
}

#grid_content_profile_flex {
	display: flex;
	flex-direction: column;
}

#grid_content_profile_wrap {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	background-color: rgb(230, 230, 230);	
	overflow: hidden;
}

#grid_content_profile_img {
	width: 120px;
	height: 120px;
}

#grid_content_profile_dept_name {
	font-size: 14px;
	height: 20px;
	line-height: 20px;
	font-family: NotoSansR;
	color: rgb(158, 158, 158);
	text-align: center;
	margin-top: 30px;
}

#grid_content_profile_name_wrap {
	display: flex;
	justify-content: center;
	gap: 5px;
	margin-top: 10px;
}

#grid_content_profile_name {
	font-size: 17px;
	font-family: NotoSansB;
	color: rgb(94, 94, 94);
	height: 20px;
	line-height: 20px;
}

#grid_content_profile_job_name {
	font-size: 17px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
	height: 20px;
	line-height: 20px;
}

#grid_content_profile_logout {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
	text-align: center;
	height: 20px;
	line-height: 20px;
	margin-top: 40px;
}

#grid_content_profile_logout_span {
	cursor: pointer;
}

#grid_content_calendar_wrap {
	margin: 40px;
	margin-bottom: 0px;
}

#calendar {
	width: 260px;
	height: 260px;
}

.fc-toolbar-title {
	font-size: 17px !important;
	font-family: NotoSansB;
	color: rgb(94, 94, 94);
}

.fc-daygrid-day-number {
	font-size: 12px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
}

.fc-col-header-cell-cushion  {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
}

.fc-daygrid-day-events {
	min-height: 0px !important;
}

.fc-theme-standard td {
	border: none;
}

.fc-scrollgrid {
	border: none !important;
}

.fc-theme-standard th {
	border: none !important;
}

.fc-daygrid-day-top {
	justify-content: center;
} 

.fc-day-sun .fc-col-header-cell-cushion {
	color: rgb(192, 57, 43);
}

.fc-day-sat .fc-col-header-cell-cushion {
	color: rgb(41, 128, 185);
}

#grid_content_calendar_hr {
	height: 1px;
	background-color: rgb(224, 224, 224);
}
#grid_content_calendar_flex {
	display: flex;
	flex-direction: column;
}

.grid_content_calendar_gird {
	display: grid;
	grid-template-columns: 80px 200px;
	height: 100px;
	column-gap: 20px;
}

.grid_content_calendar_gird:nth-of-type(1) {
	background-color: rgb(230, 230, 230);
}

.grid_content_calendar_date_wrap {
	display: grid;
	grid-template-rows: 1fr 1fr;
	margin-left: 40px;
}

.grid_content_calendar_date {
	font-size: 14px;
	font-family: NotoSansB;
	color: #4B4DB2;
	align-self: end;
	justify-self: center;
}

.grid_content_calendar_day {
	font-size: 14px;
	font-family: NotoSansB;
	color: #4B4DB2;
	align-self: start;
	justify-self: center;
}

.grid_content_calendar_list_wrap {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.grid_content_calendar_list {
	font-size: 13px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
	text-align: center;
}

#grid_content_approval_tap_wrap {
	height: 25px;
	display: grid;
	grid-template-columns: 130px 1fr;
	margin-top: 30px;
}

.grid_content_approval_date {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(94, 94, 94);
	height: 25px;
	line-height: 25px;
}

.grid_content_approval_app_date {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(94, 94, 94);
	height: 25px;
	line-height: 25px;
}

#grid_content_notice_title_wrap {
	display: grid;
	grid-template-columns: 1fr 1fr;
}

#grid_content_notice_title {
	justify-self: start;
}

#grid_content_notice_view {
	justify-self: end;
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
	height: 25px;
	line-height: 25px;
	cursor: pointer;
}

#grid_content_notice_flex {
	margin-top: 30px;
	display: flex;
	flex-direction: column;
}

.grid_content_notice_grid {
	height: 25px;
	display: grid;
	grid-template-columns: 130px 1fr;
}

.grid_contetn_notice_list_date {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
}

.grid_contetn_notice_list_title {
	font-size: 14px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
}

#grid_contetn_notice_list_date_top {
	color: rgb(94, 94, 94);	
}

#grid_contetn_notice_list_title_top {
	color: rgb(94, 94, 94);
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="main_section">
	<div id="main_wrap">
		<div id="main_title">가나다 컴퍼니</div>
		<div id="main_grid_wrap">
			<div class="grid_content" id="grid_content_attendance">
				<div id="grid_content_attendance_title" class="grid_content_title">근태관리</div>
				<div id="grid_content_attendance_date">2022년 7월 26일 (화) 20:06:30</div>
				<div id="grid_content_attendance_time_grid">
					<div class="grid_content_attendance_time_text">출근시간</div>
					<div class="grid_content_attendance_time_data">08:43:36</div>
					<div class="grid_content_attendance_time_text">퇴근시간</div>
					<div class="grid_content_attendance_time_data">미등록</div>
				</div>
				<div id="grid_content_attendance_hr"></div>
				<div id="grid_content_attendance_btn_wrap">
					<button class="grid_content_attendance_btn">출근</button>
					<button class="grid_content_attendance_btn">퇴근</button>
				</div>
			</div>
			<div class="grid_content" id="grid_content_todo">
				<div id="grid_content_todo_title_wrap">
					<div id="grid_content_todo_title" class="grid_content_title">TODO</div>
					<i class="fa-solid fa-plus" id="grid_content_todo_plus"></i>
				</div>
				<div id="grid_content_todo_list_flex">
					<div class="grid_content_todo_list">7월 월말 보고서 작성</div>
					<div class="grid_content_todo_list">8월 계획보고서 작성</div>
					<div class="grid_content_todo_list">테스트 테스트 테스트</div>
					<div class="grid_content_todo_list">테스트 테스트 테스트</div>
					<div class="grid_content_todo_list">테스트 테스트 테스트</div>
					<div class="grid_content_todo_list">테스트 테스트 테스트</div>
					<div class="grid_content_todo_list">테스트 테스트 테스트</div>
				</div>
			</div>
			<div class="grid_content" id="grid_content_profile">
				<div id="grid_content_profile_flex">
					<div id="grid_content_profile_wrap">
						<img id="grid_content_profile_img" src="${loginSSInfo.profile }">
					</div>
					<div id="grid_content_profile_dept_name">마케팅영업팀</div>
					<div id="grid_content_profile_name_wrap">
						<div id="grid_content_profile_name">박재민</div>
						<div id="grid_content_profile_job_name">사원</div>
					</div>
					<div id="grid_content_profile_logout"><span id="grid_content_profile_logout_span">로그아웃</span></div>
				</div>
			</div>
			<div class="grid_content" id="grid_content_calendar">
				<div id="grid_content_calendar_wrap">
					<div id="calendar"></div>
				</div>
				<div id="grid_content_calendar_hr"></div>
				<div id="grid_content_calendar_flex">
					<div class="grid_content_calendar_gird">
						<div class="grid_content_calendar_date_wrap">
							<span class="grid_content_calendar_date">27일</span>
							<span class="grid_content_calendar_day">목요일</span>
						</div>
						<div class="grid_content_calendar_list_wrap">
							<div class="grid_content_calendar_list">등록된 업무가 없습니다.</div>
						</div>
					</div>
					<div class="grid_content_calendar_gird">
						<div class="grid_content_calendar_date_wrap">
							<span class="grid_content_calendar_date">28일</span>
							<span class="grid_content_calendar_day">목요일</span>
						</div>
						<div class="grid_content_calendar_list_wrap">
							<div class="grid_content_calendar_list">등록된 업무가 없습니다.</div>
						</div>
					</div>
					<div class="grid_content_calendar_gird">
						<div class="grid_content_calendar_date_wrap">
							<span class="grid_content_calendar_date">29일</span>
							<span class="grid_content_calendar_day">목요일</span>
						</div>
						<div class="grid_content_calendar_list_wrap">
							<div class="grid_content_calendar_list">등록된 업무가 없습니다.</div>
						</div>
					</div>
					<div class="grid_content_calendar_gird">
						<div class="grid_content_calendar_date_wrap">
							<span class="grid_content_calendar_date">30일</span>
							<span class="grid_content_calendar_day">목요일</span>
						</div>
						<div class="grid_content_calendar_list_wrap">
							<div class="grid_content_calendar_list">등록된 업무가 없습니다.</div>
						</div>
					</div>
				</div>
			</div>
			<div class="grid_content" id="grid_content_approval">
				<div id="grid_content_approval_title" class="grid_content_title">결재 대기 문서</div>
				<div id="grid_content_approval_tap_wrap">
					<div class="grid_content_approval_date">기안일</div>
					<div class="grid_content_approval_app_date">제목</div>
				</div>
			</div>
			<div class="grid_content" id="grid_content_notice">
				<div id="grid_content_notice_title_wrap">
					<div id="grid_content_notice_title" class="grid_content_title">공지사항</div>
					<div id="grid_content_notice_view">더보기</div>
				</div>
				<div id="grid_content_notice_flex">
					<div class="grid_content_notice_grid">
						<div class="grid_contetn_notice_list_date" id="grid_contetn_notice_list_date_top">공지일</div>
						<div class="grid_contetn_notice_list_title" id="grid_contetn_notice_list_title_top">제목</div>
					</div>
					<div class="grid_content_notice_grid">
						<div class="grid_contetn_notice_list_date">2022-07-27</div>
						<div class="grid_contetn_notice_list_title">[디자인팀] 2022년 하반기 신제품 시안 요청</div>
					</div>
					<div class="grid_content_notice_grid">
						<div class="grid_contetn_notice_list_date">2022-07-27</div>
						<div class="grid_contetn_notice_list_title">[인사팀] 2022년 상반기 인사고과 안내</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
var calendarEl;
var calendar;
(function() {
	$(function() {
		calendarEl = $("#calendar")[0];
		calendar = new FullCalendar.Calendar(calendarEl, {
			height: '260px',
			locale: 'ko',
			expandRows: true,
			headerToolbar: {
				left: 'title',
				center: '',
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
		console.log($(".fc-daygrid-day-number"));
		for(var i = 0; i < $(".fc-daygrid-day-number").length; i++) {
			console.log("test");
			$(".fc-daygrid-day-number").eq(i).text($(".fc-daygrid-day-number").eq(i).text().replace("일", ""));
		}
	})
})();

</script>
</body>
</html>