<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/attendance/attendance.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주간 근태 관리</title>
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
}

/* #att_month, #att_month_text, #week_select{
	margin-right: 39px
} */
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

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="attendance_section">
	<div id="attendance_main_wrap">
		<div id="attendance_main_header">
			<div id="attendance_main_menu_title">주간 근태</div>
		</div>
		
		<div id="attendance_main_container">
			<div id="attendance_main_box_first" class="flexbox1">
				<div class="font_title" id="att_month_text">기준 년월</div>
				<input type="month" id="att_month" name="att_month" class="att_date_form">
				<select name="week" id="week_select">
				   	<option value="1">1주차</option>
				    <option value="2">2주차</option>
				    <option value="3">3주차</option>
				    <option value="4">4주차</option>
				    <option value="5">5주차</option>
				 </select>
				 <div id="startDate" class="date_div"></div>
				 <div>~</div>
				 <div id="endDate" class="date_div"></div>
				<button type="submit" class="btn_format_mini_gray" id="att_date_search_btn">조회</button>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">주간 근태 현황</div>
				</div>
				<div class="attendance_main_box_container">
					
					<div class="attendance_main_box_content">
						<table class="attendance_main_box_content_table" id="att_date_search_table">
							<tr class="table_title">
								<td style="width: 14%">사번</td>
								<td style="width: 11%">성명</td>
								<td style="width: 11%">부서</td>
								<td style="width: 16%">총 근로 시간</td>
								<td style="width: 16%">기본 근로 시간</td>
								<td style="width: 16%">연장 근로 시간</td>
								<td style="width: 16%">일 평균 근로 시간</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">주간 근태 내역</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<table class="attendance_main_box_content_table" id="att_appr_date_search_table">
							<tr class="table_title">
								<td style="width: 11%">요일</td>
								<td style="width: 17%">날짜</td>
								<td style="width: 15%">근무시간</td>
								<td style="width: 21%">출근 시간</td>
								<td style="width: 21%">퇴근 시간</td>
								<td style="width: 15%">연장 근로 시간</td>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>

/* 출퇴근~! */
	$("#btn_clock_in").click(function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/attendance/insert",
			type: "post",
			success: function(result){
				alert(result);
			},
			error: function(error){
				alert(error) ;
			}
		});
	});
	
	$("#btn_clock_out").click(function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/attendance/update",
			type: "post",
			success: function(result){
				alert(result);
			},
			error: function(error){
				alert(error) ;
			}
		});
	});
	
	$("#att_month").on("input", week_input_function);
	
	$("#week_select").on("input", week_input_function);
	
	function week_input_function() {
		if($('#att_month').val() == "") {
			return;
		}
		$(".date_div").contents().filter(function(){ return this.nodeType != 1; }).remove();
		console.log('input'); // input check
		var dt = new Date($('#att_month').val()); // 월별 첫번째날로 date 생성
		var weekNum = $('#week_select').val(); //원하는 주차(사용자 입력값)
		var monthTemp = dt.getMonth(); //월 
		var startDate;
		var endDate;
		if(weekNum != 1) {
			dt.setDate(dt.getDate() + ((weekNum-1) * 7));
			startDate = new Date(dt.getTime());
			endDate = new Date(dt.getTime());
			while(startDate.getDay() != 1) { // 1 = 월요일
				startDate.setDate(startDate.getDate()-1);
			}
			while(endDate.getDay() != 0) {
				endDate.setDate(endDate.getDate() + 1);
				if(endDate.getMonth() != monthTemp) {
					endDate.setDate(endDate.getDate() - 1);
					break;
				}
			}
		} else if(weekNum ==1) {
			startDate = new Date(dt.getTime());
			endDate = new Date(dt.getTime());
			while(endDate.getDay() != 0) { // day = 0~6 일~토요일
				endDate.setDate(endDate.getDate() + 1);
			}
		}
		console.log(startDate.toLocaleDateString());
		console.log(endDate.toLocaleDateString());
		$('#startDate').append(startDate.toLocaleDateString());
		$('#endDate').append(endDate.toLocaleDateString());
	}
	
	$("#att_date_search_btn").click(function(){
		
		<%-- $(".table_title").eq(0).nextAll().remove();
		$.ajax({
			url: "<%=request.getContextPath()%>/attendance/read",
			type: "post",
			data: {att_date_start:$('#att_date_start').val()
				, att_date_end:$('#att_date_end').val()} ,
			dataType:"json",
			success: function(result){
				console.log(result);
				var html;
				for(var i = 0; i < result.length; i++){
					var vo = result[i];
					html = "";
					html += '<tr class="table_content_white">';
                    html += '<td >'+vo.att_date.substr(0,10)+'</td>';
                    html += '<td >'+vo.emp_no+'</td>';
                    html += '<td >'+'${loginSSInfo.name}'+'</td>';
                    html += '<td >'+vo.att_clock_in+'</td>';
                    html += '<td >'+vo.att_clock_out+'</td>';
                    html += '<td >'+vo.ip_clock_in+'</td>';
                    html += '<td >'+vo.ip_clock_out+'</td>';
                    html += '</tr>';
                    $('#att_date_search_table').append(html);
				}
			},
			error: function(error){
				alert(error); 
			}
		}); --%>
	});
	
	$('.attendance_modify_submit_btn').click(function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/attendance/approval/insert",
			type: "post",
			data: {att_appr_req_date:$('#att_appr_req_date').val()
				, att_appr_clock_in_str:$('#att_appr_clock_in').val()
				, att_appr_clock_out_str:$('#att_appr_clock_out').val()
				, att_modify_reason_text:$('#att_modify_reason_text').val()
			},
			
			success: function(result){
				alert("요청이 완료되었습니다. result = " + result);
				$('#att_appr_req_date').val('');
				$('#att_appr_clock_in').val('');
				$('#att_appr_clock_out').val('');
				$('#att_modify_reason_text').val('');
			},
			error: function(error){
				alert("요청 실패") ;
			}
		});
	});
	
	$("#att_appr_date_search_btn").click(function(){
		$(".table_title").eq(1).nextAll().remove();
		$.ajax({
			url: "<%=request.getContextPath()%>/attendance/approval/read",
			type: "post",
			data: {att_date_start_str:$('#att_appr_date_start').val()
				, att_date_end_str:$('#att_appr_date_end').val()} ,
			dataType:"json",
			success: function(result){
				console.log(result);
				var html;
				for(var i = 0; i < result.length; i++){
					var vo = result[i];
					html = "";
					html += '<tr class="table_content_white">';
                    html += '<td >'+vo.att_appr_req_date.substr(0,10)+'</td>';
                    html += '<td >'+vo.emp_no+'</td>';
                    html += '<td >'+'${loginSSInfo.name}'+'</td>';
                    html += '<td >'+vo.att_clock_in+'</td>';
                    html += '<td >'+vo.att_clock_out+'</td>';
                    html += '<td >'+vo.att_appr_clock_in+'</td>';
                    html += '<td >'+vo.att_appr_clock_out+'</td>';
                    html += '<td >';
                    if(vo.att_appr_result == 1) {
                    	html += "승인";
                    } else if (vo.att_appr_result == 2) {
						html += "반려";
                    } else if (vo.att_appr_result == 3) {
						html += "대기";
                    }
                    html += '</td>';
                    html += '</tr>';
                    $('#att_appr_date_search_table').append(html);
				}
			},
			error: function(error){
				alert(error); 
			}
		});
	});

/* 시계~! */
var clockTarget = document.getElementById("clock");

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
    $("#clock").text(year+'-'+month+'-'+ clockDate + ' / '  + hours + ':' + minutes+':'+seconds);
    //':${minutes < 10 ? '0${minutes }'  : minutes }:${seconds < 10 ? '0${seconds }'  : seconds }'
    //clockTarget.innerText = '${month+1}월 ${clockDate}일 ${week[day]}요일' +
    //'${hours < 10 ? '0${hours}' : hours}:${minutes < 10 ? '0${minutes }'  : minutes }:${seconds < 10 ? '0${seconds }'  : seconds }';
    // 월은 0부터 1월이기때문에 +1일을 해주고 
    // 시간 분 초는 한자리수이면 시계가 어색해보일까봐 10보다 작으면 앞에0을 붙혀주는 작업을 3항연산으로 했습니다. 
}

function init() {
	clock();
	// 최초에 함수를 한번 실행시켜주고 
	setInterval(clock, 1000);
	// setInterval이라는 함수로 매초마다 실행을 해줍니다.
	// setInterval은 첫번째 파라메터는 함수이고 두번째는 시간인데 밀리초단위로 받습니다. 1000 = 1초 
}

init();


</script>
</body>
</html>