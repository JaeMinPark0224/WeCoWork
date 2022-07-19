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
	line-height: 25px;
}

.charts {
	width: 955px;
	height: 450px;
	display: inline-block;
	margin-top: 58px;
}

#attendance_main_box_first_hr {
	margin-top: 45px;
	width: 1070px;
	color: rgb(94, 94, 94);
	/* background-color: rgb(159, 197, 232); */
/* 	box-sizing: border-box; */
}
#bluechip{
	width: 12px;
	height: 12px;
	background-color: rgb(75, 77, 178);
	border-radius: 50%;
	margin-right: 5px;
}
#pinkchip{
	width: 12px;
	height: 12px;
	background-color: rgb(242, 205, 220);
	border-radius: 50%;
	margin-left: 10px;
	margin-right: 5px;
}
#att_month_text, #dept_name_txt, #emp_name_txt{
	height: 25px;
	line-height: 25px;
}
#att_month, #dept_name, #emp_name {
	margin-right: 20px;
}


/* grid box~! */
#abovetable_flex{
	display:flex;
	flex-direction: row-reverse; 
	
}
#attendance_main_box_first_hr{
	display:flex;
	gap: 15px;
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
			<div id="attendance_main_menu_title">월간 근태 관리</div>
		</div>
		
		<div id="attendance_main_container">
			<div id="attendance_main_box_first_hr">
				<div class="font_title" id="att_month_text">기준 년월</div>
				<input type="month" id="att_month" name="att_month" class="att_date_form">
				
				 <div class="font_title" id="dept_name_txt">부서명</div>
				<select name="dept_name" id="dept_name">
					<option value="0">전체</option>
				</select>
				<div class="font_title " id="emp_name_txt">사원명</div>
				<select name="emp_name" id="emp_name">
					<option value="0">전체</option>
				</select>
				<button type="submit" class="btn_format_mini_gray" id="att_date_search_btn">조회</button>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">월간 근태 현황</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<div id="abovetable_flex">
							<div class="font_title">휴가</div>
							<div id="pinkchip"></div>
							<div class="font_title">출근</div>	
							<div id="bluechip"></div>
						</div>
						<table class="attendance_main_box_content_table" id="att_date_search_table" style="margin-top: 10px;">
							<tr class="table_title">
								<td >성명</td>
								<td >부서</td>
								<c:forEach begin="1" end="31" var="i">
									<td class="date_td" style="width: 2.2%">${i }</td>
								</c:forEach>
								<td style="width: 3%">출근</td>
								<td style="width: 3%">휴가</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>
<script>
	$("#att_month").on("change", function(){
		let year = $(this).val().substring(0,4);
		let month = $(this).val().substring(5,7);
		let maxDate = new Date(year,month,0).getDate();
		// 만약 maxDate가 28이면 28까지 나타난다.
		// 테이블의 정보를 가져와서 28보다 크면 삭제
		let $td = $(".date_td"); 
		for (var i = 0; i < $td.length; i++) {
			if($td.eq(i).text() > maxDate) {
				$td.eq(i).remove();
			}
			if(i == $td.length -1 && $td.eq(i).text() < maxDate) {
				for (var j = parseInt($td.eq(i).text()); j < maxDate; j++) {
					$(".date_td").eq(j-1).after('<td class="date_td" style="width: 2.2%">'+(j+1)+'</td>');
				}
			}
		}
	});

	$("#att_date_search_btn").click(function(){
		$(".table_title").nextAll().remove();
		$.ajax({
			url: "<%=request.getContextPath()%>/hr/attendance/selectWeekly",
			type: "post",
			data: {att_date_start_str:$('#startDate').text()
				, att_date_end_str:$('#endDate').text()
				, dept_name:$('#dept_name').val()
				, name:$('#emp_name').text()
				, emp_no : $('#emp_name').val()
			} ,
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
                    $('#att_appr_date_search_table').append(html);
				}
				html = "";
				html += '<tr class="table_content_white">';
                html += '<td >'+vo.emp_no+'</td>';
                html += '<td >'+vo.name+'</td>';
                html += '<td >'+vo.dept_name+'</td>';
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
				alert(error); 
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
	


/*//////////////부서, 성명 선택///////// */
// 셀렉박스 초기화
function selectReset() {
	let $deptSelect = $("#dept_name");
	let $employeeSelect = $("#emp_name");
	$deptSelect.children().remove();
	selectOptionAdd($deptSelect, "전체", 0);
	$employeeSelect.children().remove();
	selectOptionAdd($employeeSelect, "전체", 0);
}

//셀렉박스에 옵션 추가
function selectOptionAdd($dom, name, value) {
	if(typeof value == "undefined") {
		let html = "<option>"+name+"</option>";
		$dom.append(html);
	} else {
		let html = "<option value='"+value+"'>"+name+"</option>";
		$dom.append(html);
	}
}

<c:forEach items="${deptList}" var="dept">
	selectOptionAdd($("#dept_name"), "${dept.dept_name}");
</c:forEach>

var employee = [];
var employeeVo;
<c:forEach items="${empList}" var="emp">
	employeeVo = {
		dept_name : "${emp.dept_name}"
		,name : "${emp.name}"
		,emp_no : "${emp.emp_no}"
	}
	employee.push(employeeVo);
</c:forEach>


$("#dept_name").on("change", employeeList);

//부서 선택시 사원 리스트 출력 함수
function employeeList() {
	let $deptSelect = $("#dept_name");
	let $employeeSelect = $("#emp_name");
	// '부서 선택' 옵션 삭제
	if($(this).val() != "0") {
		$deptSelect.children("[value = '0']").remove();
	}
	
	// 사원 리스트 초기화
	$employeeSelect.children().remove();
	selectOptionAdd($employeeSelect, "전체", 0);
	// 사원 리스트 추가
	for(var i = 0; i < employee.length; i++) {
		if($deptSelect.val() == employee[i].dept_name) {
			let employeeName = employee[i].name;
			selectOptionAdd($employeeSelect, employeeName, employee[i].emp_no);
		}
	}
	$employeeSelect.off('change');
	$employeeSelect.on('change', employeeSelectFirstRemove);
}

//사원 선택시 이벤트 설정
function employeeSelectFirstRemove() {
	// '사원, 직급 선택' 옵션 삭제
	$("#emp_name").children("[value = '0']").remove();
}

</script>
</body>
</html>