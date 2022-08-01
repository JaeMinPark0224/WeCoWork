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

#grid_content_todo_list_grid {
	display: grid;
	grid-template-columns: 230px 30px;
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
	height: 100px;
	overflow: auto;
}

.grid_content_calendar_list {
	font-size: 13px;
	font-family: NotoSansB;
	color: rgb(158, 158, 158);
	text-align: center;
}

#grid_content_approval_title_wrap {
	display: grid;
	grid-template-columns: 1fr 1fr;
}

#grid_content_approval_view {
    justify-self: end;
    font-size: 14px;
    font-family: NotoSansB;
    color: rgb(158, 158, 158);
    height: 25px;
    line-height: 25px;
    cursor: pointer;
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

.fc-addButton-button {
	background-color: rgb(244, 244, 244) !important;
	border: none !important;
	padding: 0 !important;
	box-shadow: none !important;
}

.fc-addButton-button .fa-plus {
	display: block;
	font-size: 24px !important;
	color: rgb(158, 158, 158);
	width: 21px !important;
	height: 24px !important;
	font-family: "Font Awesome 6 Free" !important;
	font-weight: 900 !important;
}

.fc-daygrid-day-top {
	margin-top: 6px;
}

#main_modal_background {
	display: none;
	z-index: 2;
	background-color: rgba(128, 128, 128, 0.356);
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
}

#main_modal_wrap {
	width: 320px;
	position: absolute;
 	top: 50%;
  	left: 50%;
  	transform: translate(-50%,-50%);
  	background-color: rgb(250, 250, 250);
}

#main_modal_grid {
	display: grid;
	grid-template-rows: 50px 120px 45px;
	font-size: 0px;
}

#main_modal_title {
	font-size: 17px;
	font-family: NotoSansB;
	align-self: center;
	color: rgb(94, 94, 94);
	text-align: center;
	height: 20px;
	line-height: 20px;
}

#main_modal_input {
	text-align: center;
	align-self: center;
}

#todo_content {
	width: 180px;
	border: 1px solid rgb(224, 224, 224);
    font-family: NotoSansR;
    font-size: 12px;
    color: rgb(94, 94, 94);
}

#todo_content_cnt {
	margin-left: 7px;
	font-family: NotoSansR;
    font-size: 12px;
    color: rgb(158, 158, 158);
}

#main_modal_btn_wrap {
	display: grid;
	grid-template-columns: 1fr 1fr;
	box-sizing: border-box;
	border-top: 1px solid rgb(224, 224, 224);
	height: 45px;
} 

.modal_btn {
	width: 160px;
	height: 44px;
	display: block;
	font-size: 12px;
	font-family: NotoSansR;
	cursor: pointer;
	align-self: center;
	justify-self: center;
	background-color: rgb(250, 250, 250);
}

.modal_btn:hover {
	background-color: #4B4DB2;
	color: rgb(250, 250, 250) !important;
}

#modal_cancle_btn {
	color: rgb(158, 158, 158);
}

#modal_add_btn {
	color: #4B4DB2;
}

.modal_text {
	font-size: 12px;
	font-family: NotoSansR;
	color: rgb(158, 158, 158);
	line-height: 20px;
}

.todo_delete_btn {
	align-self: center;
	justify-self: center;
	color: rgb(158, 158, 158);
	cursor: pointer;
}

.grid_content_calendar_list_item {
	cursor: pointer;
}

.grid_content_calendar_list_item:hover {
	color: #4B4DB2;
}
</style>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
</head>
<body>
<div id="main_modal_background">
	<div id="main_modal_wrap">
		<div id="main_modal_grid">
			<div id="main_modal_title">TODO 추가</div>
			<div id="main_modal_input">
				<input type="text" name="todo_content" id="todo_content"><span id="todo_content_cnt">0 / 20자</span>
				<div class="modal_text">*TODO 내용을 입력해주세요.<br>*최대 20자까지 가능합니다.</div>
			</div>
			<div id="main_modal_btn_wrap">
				<button class="modal_btn" id="modal_cancle_btn">취소</button>
				<button class="modal_btn" id="modal_add_btn">추가</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="main_section">
	<div id="main_wrap">
		<div id="main_title">${loginSSInfo.cp_name }</div>
		<div id="main_grid_wrap">
			<div class="grid_content" id="grid_content_attendance">
				<div id="grid_content_attendance_title" class="grid_content_title">근태관리</div>
				<div id="grid_content_attendance_date"></div>
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
				<div id="grid_content_todo_list_grid">
					<c:forEach items="${todoList }" var="todo">
						<div class="grid_content_todo_list">${todo.todo_content }</div>
						<i class="fa-solid fa-xmark todo_delete_btn" todo_no=${todo.todo_no }></i>
					</c:forEach>
				</div>
			</div>
			<div class="grid_content" id="grid_content_profile">
				<div id="grid_content_profile_flex">
					<div id="grid_content_profile_wrap">
						<c:if test="${not empty loginSSInfo.profile }">
							<img id="grid_content_profile_img" src="${loginSSInfo.profile }">
						</c:if>
					</div>
					<div id="grid_content_profile_dept_name">${loginSSInfo.dept_name }</div>
					<div id="grid_content_profile_name_wrap">
						<div id="grid_content_profile_name">${loginSSInfo.name }</div>
						<div id="grid_content_profile_job_name">${loginSSInfo.job_title }</div>
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
							<span class="grid_content_calendar_date"></span>
							<span class="grid_content_calendar_day"></span>
						</div>
						<div class="grid_content_calendar_list_wrap">
							<div class="grid_content_calendar_list"></div>
						</div>
					</div>
					<div class="grid_content_calendar_gird">
						<div class="grid_content_calendar_date_wrap">
							<span class="grid_content_calendar_date"></span>
							<span class="grid_content_calendar_day"></span>
						</div>
						<div class="grid_content_calendar_list_wrap">
							<div class="grid_content_calendar_list"></div>
						</div>
					</div>
					<div class="grid_content_calendar_gird">
						<div class="grid_content_calendar_date_wrap">
							<span class="grid_content_calendar_date"></span>
							<span class="grid_content_calendar_day"></span>
						</div>
						<div class="grid_content_calendar_list_wrap">
							<div class="grid_content_calendar_list"></div>
						</div>
					</div>
					<div class="grid_content_calendar_gird">
						<div class="grid_content_calendar_date_wrap">
							<span class="grid_content_calendar_date"></span>
							<span class="grid_content_calendar_day"></span>
						</div>
						<div class="grid_content_calendar_list_wrap">
							<div class="grid_content_calendar_list"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="grid_content" id="grid_content_approval">
				<div id="grid_content_approval_title_wrap">
					<div id="grid_content_approval_title" class="grid_content_title">공지사항</div>
					<div id="grid_content_approval_view">더보기</div>
				</div>
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
				right: ''
			},
			initialView: 'dayGridMonth',
			customButtons: {
				addButton : {
					icon:'fa-solid fa-plus',
					click: function() {
						console.log("test button click");	
					}
				}
			},
			eventClick: function (info) {
				info.jsEvent.preventDefault();
				if (info.event.url) {
				      window.open(info.event.url);
			    }
			}
		});
		calendar.render();
		for(var i = 0; i < $(".fc-daygrid-day-number").length; i++) {
			$(".fc-daygrid-day-number").eq(i).text($(".fc-daygrid-day-number").eq(i).text().replace("일", ""));
		}
	})
})();

//로그 아웃
$("#grid_content_profile_logout_span").on("click", function(){
	location.href="<%= request.getContextPath()%>/logout";
});

// 시계
function clock() {
    var date = new Date();
    // date Object를 받아오고 
    var year = date.getFullYear();
    var month = date.getMonth();
    month = ((month+1) < 10) ? '0'+(month+1) : (month+1);
    // 달을 받아옵니다 
    var clockDate = date.getDate();
    clockDate = (clockDate < 10) ? '0'+clockDate : clockDate;
    // 몇일인지 받아옵니다  
    var day = date.getDay();
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    // 요일은 숫자형태로 리턴되기때문에 미리 배열을 만듭니다. 
    var hours = date.getHours();
    hours = (hours < 10) ? '0'+hours : hours;
    // 시간을 받아오고 
    var minutes = date.getMinutes();
    minutes = (minutes < 10) ? '0'+minutes : minutes;
    // 분도 받아옵니다.
    var seconds = date.getSeconds();
    seconds = (seconds < 10) ? '0'+seconds : seconds;
    // 초까지 받아온후 
    $("#grid_content_attendance_date").text(year+'년 '+month+'월 '+ clockDate + '일 ('+ week[day] +') '+ hours + ':' + minutes+':'+seconds);
}

// 시계 타이머 설정
function init() {
	clock();
	setInterval(clock, 1000);
}

// 시계 동작
init();

// 출근 버튼
$("#grid_content_attendance_btn").on("click", function() {
	alert("출근 버튼 입니다.");
});

// 퇴근 버튼
$("#grid_content_attendance_btn").on("click", function() {
	alert("퇴근 버튼 입니다.");
});

// TODO 추가 버튼
$("#grid_content_todo_plus").on("click", function() {
	if($(".grid_content_todo_list").length >= 10) {
		alert("TODO 리스트 최대 10개까지 등록 가능합니다.");
		return;
	}
	$("#main_modal_background").css("display", "block");
});

// modal 창 닫기 버튼
$("#modal_cancle_btn").on("click", function() {
	$("#main_modal_background").css("display", "none");	
	$("#todo_content").val("");
	$("#todo_content").trigger("input");
});

// todo 추가 버튼
$("#modal_add_btn").on("click", function() {
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/todo/insert",
		data: {
			todo_content : $("#todo_content").val()
		},
		success: function(result) {
			if(result == -1) {
				location.href = "<%= request.getContextPath()%>/login";					
				return;
			}
			else if(result == -2) {
				location.href = "<%= request.getContextPath()%>/project/list";					
				return;
			}
			else {
				alert("TODO 리스트에 추가 되었습니다.");
				location.reload();					
				return;
			}
		},
		error: function(request, status, error) {
			alert("fail");
			console.log(request);
			console.log(status);
			console.log(error);
		}
	});
});

// todo_content 글자 카운트
$('#todo_content').on('input', function() {
	let contentCount = $(this).val();
	if(contentCount.length == 0 || contentCount == '') {
		$(this).next().text('0 / 20자');
	} else {
		$(this).next().text(contentCount.length+' / 20자');
	}
	if(contentCount.length > 20) {
		$(this).val($(this).val().substring(0, 20));
		alert('제목은 20자까지 입력 가능합니다.')
		$(this).next().text('20 / 20자');
	}
});

// todo delete btn hover
$(".todo_delete_btn").hover(
		function() {
			$(this).css("color", "#4B4DB2");
			$(this).prev().css("color", "#4B4DB2");
		},
		function() {
			$(this).css("color", "rgb(158, 158, 158)");
			$(this).prev().css("color", "rgb(158, 158, 158)");
		}
);

// todo 삭제
$(".todo_delete_btn").on("click", function() {
	if(!confirm("삭제하시겠습니까?")) {
		return;
	}
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/todo/delete",
		data: {
			todo_no : $(this).attr("todo_no")
		},
		success: function(result) {
			if(result == -1) {
				location.href = "<%= request.getContextPath()%>/login";					
				return;
			}
			else if(result == -2) {
				location.href = "<%= request.getContextPath()%>/project/list";					
				return;
			}
			else {
				alert("TODO 리스트에서 삭제 되었습니다.");
				location.reload();					
				return;
			}
		},
		error: function(request, status, error) {
			alert("fail");
			console.log(request);
			console.log(status);
			console.log(error);
		}
	});
})

// 초기값 설정
var today = new Date();
for(var i = 0; i < $(".grid_content_calendar_date").length; i++) {
	var week_info = ['일', '월', '화', '수', '목', '금', '토'];
	$(".grid_content_calendar_date").eq(i).text(today.getDate() + "일");
	$(".grid_content_calendar_date").eq(i).next().text(week_info[today.getDay()] + "요일");
	today.setDate(today.getDate() + 1);
}
<c:forEach items="${calendarMyList}" var="work">
	today = new Date();
	var pw_start_date = new Date("${work.pw_start_date}");
	pw_start_date.setHours(0);
	pw_start_date.setMilliseconds(0);
	pw_start_date.setMinutes(0);
	pw_start_date.setSeconds(0);
	var pw_end_date = new Date("${work.pw_end_date}");
	pw_end_date.setHours(23);
	pw_end_date.setMilliseconds(99);
	pw_end_date.setMinutes(59);
	pw_end_date.setSeconds(59);
	for(var i = 0; i < 4; i++) {
		if(pw_start_date < today && today < pw_end_date) {
			$(".grid_content_calendar_list").eq(i).append("<span class='grid_content_calendar_list_item' pr_no='${work.pr_no}' pw_no='${work.pw_no}'>${work.pw_title}<br></span>");
		}
		today.setDate(today.getDate() + 1);
	}
</c:forEach>
for(var i = 0; i < 4; i++) {
	if($(".grid_content_calendar_list").eq(i).text() == '') {
		$(".grid_content_calendar_list").eq(i).text("등록된 업무가 없습니다.");
	}
}

// 업무명 클릭시 업무 페이지 이동
$(".grid_content_calendar_list_item").on("click", function() {
	window.open("<%= request.getContextPath()%>/project/work/read?project="+$(this).attr('pr_no')+"&no="+$(this).attr('pw_no'));
});
</script>
</body>
</html>