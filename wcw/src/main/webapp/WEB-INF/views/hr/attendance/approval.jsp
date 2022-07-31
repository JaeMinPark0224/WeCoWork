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

/* grid box~! */
#attendance_modify_grid_container{
	display: grid;
	grid-template-columns: 1fr 1.5fr 1fr 1.5fr 1fr 1.5fr;
	grid-template-rows: 1fr 3fr 1fr;
	row-gap: 30px;
	
}
#att_modify_reason_text{
	
	grid-column: 2 / 7;
	grid-row: 2 / 3;

}
.attendance_modify_grid_first_row{
	align-self: center;
}

#attendance_modify_submit_btn{
	grid-column: 6 / 7;
	grid-row: 3 / 4;
	justify-self: end;
	
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
			<div id="attendance_main_menu_title">근태 조정 요청 관리</div>
		</div>
		
		<div id="attendance_main_container">
			<div class="attendance_hr_main_box">
				<div class="attendance_main_box_content">
					<div id="search_date_range">
						<div class="font_title">근무일자</div>
						<input type="date" class="att_date_form" id="att_date_start" name="att_date_start">
						<div class="font_content">~</div>
						<input type="date" class="att_date_form" id="att_date_end" name="att_date_end">
						<div class="font_title ">부서명</div>
						<select name="dept_name" id="dept_name">
							<option value="0">전체</option>
						</select>
						<div class="font_title height25">결재 상태</div>
						<select name="att_appr_result" id="att_appr_result">
							<option value="0">전체</option>
						   	<option value="1">승인</option>
						    <option value="2">반려</option>
						    <option value="3">대기</option>
						</select>
						<button type="submit" class="btn_format_mini_gray" id="att_appr_date_search_btn">조회</button>
					</div>
				</div>
				<div class="attendance_main_box_content">
					<table class="attendance_hr_main_box_content_table" id="att_date_search_table">
						<tr class="table_title">
							<td style="width: 10%">근무일</td>
							<td style="width: 7.5%">사번</td>
							<td style="width: 7.5%">성명</td>
							<td style="width: 17%">출근시간</td>
							<td style="width: 17%">퇴근시간</td>
							<td style="width: 17%">수정요청 출근시간</td>
							<td style="width: 17%">수정요청 퇴근시간</td>
							<td style="width: 7%">승인 결과</td>
						</tr>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</section>
<script>
$("#att_appr_date_search_btn").click(function(){
	if($("#att_date_start").val() == "" || $("#att_date_end").val() == ""){
		alert("근무일자를 모두 선택해주세요") ;
		return;
	}
	$(".table_title").eq(0).nextAll().remove();
	$.ajax({
		url: "<%=request.getContextPath()%>/hr/attendance/approval/select",
		type: "post",
		data: {att_date_start:$('#att_date_start').val()
			, att_date_end:$('#att_date_end').val()
			, dept_name:$('#dept_name').val()
			, att_appr_result:$('#att_appr_result').val()
		} ,
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
                html += '<td >'+vo.name+'</td>';
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
                $('#att_date_search_table').append(html);
			}
		},
		error: function(error){
			alert("근태조정 요청에 실패했습니다."); 
		}
	});
});

/*//////////////부서선택///////// */
//셀렉박스 초기화
function selectReset() {
	let $deptSelect = $("#dept_name");
	$deptSelect.children().remove();
	selectOptionAdd($deptSelect, "전체", 0);
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


////////////날짜 유효성 ////////////
//start input -> end min
$("#att_date_start").on("input", function() {
	$("#att_date_end").attr("min", $("#att_date_start").val());
});

// end input -> start max
$("#att_date_end").on("input", function() {
	$("#att_date_start").attr("max", $("#att_date_end").val());
});

</script>
</body>
</html>