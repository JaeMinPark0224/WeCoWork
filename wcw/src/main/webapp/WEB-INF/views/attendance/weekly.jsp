<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/attendance/attendance.css">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> 
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
								<td style="width: 15%">날짜</td>
								<td style="width: 17%">근무시간</td>
								<td style="width: 21%">출근 시간</td>
								<td style="width: 21%">퇴근 시간</td>
								<td style="width: 15%">연장 근로 시간</td>
							</tr>
							
						</table>
						
						<div class="charts">
		                    <canvas id="chart1"></canvas>
		                </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>

/* 년월, 주차 선택 후 날짜표시 */
	
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
/* 		console.log(endDate.toLocaleDateString());
		var startyear = startDate.toLocaleDateString().substr(0,4);
		var startmonth = startDate.toLocaleDateString().substr(6,1);
		startmonth = ((startmonth) < 10) ? '0'+(startmonth) : (startmonth);
		var startdate = startDate.toLocaleDateString().substr(8,2);
		startdate = ((startdate) < 10) ? '0'+(startdate) : (startdate); */
		console.log(startDate.toISOString().split('T')[0]);
		$('#startDate').append(startDate.toISOString().split('T')[0]);
		$('#endDate').append(endDate.toISOString().split('T')[0]);
	}
	
	$("#att_date_search_btn").click(function(){
		if($('#att_month').val() == "") {
			alert("기준년월을 선택해주세요") ;
			return;
		}
		$(".table_title").nextAll().remove();
		$.ajax({
			url: "<%=request.getContextPath()%>/attendance/selectWeekly",
			type: "post",
			data: {att_date_start_str:$('#startDate').text()
				, att_date_end_str:$('#endDate').text()} ,
			dataType:"json",
			success: function(result){
				console.log(result);
				var day = ['일', '월', '화', '수', '목', '금', '토'];
				var html;
				var extendtime = 144000000;
				var worktimetotal = 0;
				for(var i = 0; i < result.length; i++){
					var vo = result[i];
					if(vo.att_clock_out != null) {
						var worktimedaily = new Date(vo.att_clock_out).getTime()-new Date(vo.att_clock_in).getTime(); 
					} else {
						worktimedaily = 0;
					}
					worktimetotal = worktimetotal + worktimedaily;  
					html = "";
					html += '<tr class="table_content_white">';
                    html += '<td >'+day[new Date(vo.att_date).getDay()]+'</td>';
                    html += '<td >'+vo.att_date.substr(0,10)+'</td>';
                    if(vo.att_clock_out != null) {
	                    html += '<td >'+ tohhmmss(worktimedaily)+'</td>';
                    } else {
                    	html += '<td >'+ '근무중'+'</td>';
                    }
                    html += '<td >'+vo.att_clock_in+'</td>';
                    html += '<td >';
                    if(vo.att_clock_out == null) {
                    	html += "-";}
                    else{
                    	html += vo.att_clock_out;
                    }
               		html += '</td>';
                    html += '<td >'+tohhmmss(worktimetotal - extendtime)+'</td>';
                    html += '</tr>';
				}
                    $('#att_appr_date_search_table').append(html);
				html = "";
				html += '<tr class="table_content_white">';
                html += '<td >'+'${loginSSInfo.emp_no}'+'</td>';
                html += '<td >'+'${loginSSInfo.name}'+'</td>';
                html += '<td >'+'${loginSSInfo.dept_name}'+'</td>';
                html += '<td >'+tohhmmss(worktimetotal)+'</td>';
                html += '<td >'+'40시간'+'</td>';
                html += '<td >'+tohhmmss(worktimetotal - extendtime)+'</td>';
                html += '<td >'+tohhmmss(worktimetotal/((result.length == 0)?1:result.length))+'</td>';
                html += '</tr>';
                $('#att_date_search_table').append(html);
                
               	var worktimearray = [0, 0, 0, 0, 0, 0, 0];
                for(var i = 0; i < 6; i++){
                	var worktimedaily = 0;
                	if(result[i] != undefined) {
	                	if(result[i].att_clock_out != null) {
							worktimedaily = new Date(result[i].att_clock_out).getTime()-new Date(result[i].att_clock_in).getTime(); 
							worktimedaily = worktimedaily / 3600000;
						} else {
							worktimedaily = 0;
						}
	                	var dayIndex = new Date(result[i].att_date).getDay();
	                	if(dayIndex == 0) {
	                		dayIndex = 7;
	                	}
	                	worktimearray[dayIndex-1] = worktimedaily; 
                	}
                }
                for(var i = 0; i < 6; i++){
	               	myChart1.data.datasets[0].data[i] = worktimearray[i];
                }
               	myChart1.update();
			},
			error: function(error){
				alert("주간근태 조회에 실패했습니다.") ;
			}
		});
	});
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
	
/*////////////////// 차트 /////////////////// */
const chart1 = document.getElementById('chart1').getContext('2d');
    const myChart1 = new Chart(chart1, {
        type: 'line',
        data: {
            labels: ['월', '화', '수', '목', '금', '토', '일'],
            datasets: [{
                label: '근무시간',
                data: [0, 0, 0, 0, 0, 0, 0],
                backgroundColor: '#4B4DB2',
                borderColor: '#4B4DB2'
                
            }]
        },
        options: {
            scales: {
                y: { beginAtZero: true}
            }
        }
    });


/*///////////////  시계~! ///////////////////////*/
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