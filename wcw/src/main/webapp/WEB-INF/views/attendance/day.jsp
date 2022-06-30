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
<title>WCW</title>
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
	line-height: 64px;
	border-left: 2px solid rgb(224, 224, 224);
	border-right: 2px solid rgb(224, 224, 224);
	border-bottom: 2px solid rgb(224, 224, 224);
	border-top: 0px;
	text-align: center;
	
}

.first_box_text{
	margin-bottom: 13px;
}

/* 같은 폰트 적용 */
.font_title{
	font-size: 13px;
	font-family: NotoSansB;
	color: rgb(94, 94, 94);
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="attendance_section">
	<div id="attendance_main_wrap">
		<div id="attendance_main_header">
			<div id="attendance_main_menu_title">일일 근태</div>
			
			
		</div>
		
		<div id="attendance_main_container">
			<div id="attendance_main_box_first">
				<div class="attendance_main_box_first_container">
					<div id="insert_attendance_box_top" class="font_title">일일근태등록</div>
					<div id="insert_attendance_box_bottom">
						<button type="button" id="btn_clock_in">출근</button>
						<button type="button" id="btn_clock_out">퇴근</button>
					</div>
				</div>
				<div class="attendance_main_box_first_container">
					<div class="font_title first_box_text">출근 시간 : </div>
					<div class="font_title first_box_text">퇴근 시간 : </div>
					<div class="font_title first_box_text">출근 IP : </div>
					<div class="font_title first_box_text">퇴근 IP : </div>
				</div>
				<div class="attendance_main_box_first_container">
					<div class="font_title">현시각</div>
					<div id="clock">00:00</div>
				</div>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">근태정보조회</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<div class="font_title">근무일자</div>
						<button>조회</button>
					</div>
					<div class="attendance_main_box_content">
						<table>
							<tr>
								<td>근무일자</td>
								<td>사번</td>
								<td>성명</td>
								<td>출근시간</td>
								<td>퇴근시간</td>
								<td>출근IP</td>
								<td>퇴근IP</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">근태조정요청</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<form action="">
							조정 근무 일자<input type="text">
							조정 출근 시간<input type="text">
							조정 퇴근 시간<input type="text">
							조정 사유<input type="text">
							<button type="submit">요청</button>
						</form>
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
				alert(result)
			},
			error: function(error){
				alert(result) 
			}
		});
	});
	

/* 시계~! */
var clockTarget = document.getElementById("clock");

function clock() {
    var date = new Date();
    // date Object를 받아오고 
    var month = date.getMonth();
    // 달을 받아옵니다 
    var clockDate = date.getDate();
    // 몇일인지 받아옵니다 
    var day = date.getDay();
    // 요일을 받아옵니다. 
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
    $("#clock").text(month+1+'월 '+ clockDate +'일 ' + week[day] + '요일 '  + hours + ':' + minutes+':'+seconds);
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