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
			<div id="attendance_main_menu_title">일일 근태 관리</div>
		</div>
		
		<div id="attendance_main_container">
			<div class="attendance_hr_main_box">
				<div class="attendance_main_box_content">
					<div id="search_date_range">
						<div class="font_title">근무일자</div>
						<input type="date" class="att_date_form" id="att_date_start" name="att_date_start">
						<div class="font_content">~</div>
						<input type="date" class="att_date_form" id="att_date_end" name="att_date_end">
						<button type="submit" class="btn_format_mini_gray" id="att_date_search_btn">조회</button>
					</div>
				</div>
				<div class="attendance_main_box_content">
					<table class="attendance_hr_main_box_content_table" id="att_date_search_table">
						<tr class="table_title">
							<td style="width: 14%">근무일자</td>
							<td style="width: 10%">사번</td>
							<td style="width: 10%">성명</td>
							<td style="width: 19%">출근시간</td>
							<td style="width: 19%">퇴근시간</td>
							<td style="width: 14%">출근IP</td>
							<td style="width: 14%">퇴근IP</td>
						</tr>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</section>
<script>
	$("#att_date_search_btn").click(function(){
		if($("#att_date_start").val() == "" || $("#att_date_end").val() == ""){
			alert("근무일자를 모두 선택해주세요") ;
			return;
		}
		$(".table_title").eq(0).nextAll().remove();
		$.ajax({
			url: "<%=request.getContextPath()%>/hr/attendance/select",
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
                    html += '<td >'+vo.name+'</td>';
                    html += '<td >'+vo.att_clock_in+'</td>';
                    html += '<td >';
	                    if(vo.att_clock_out == null) {
	                    	html += "-";}
	                    else{
	                    	html += vo.att_clock_out;
	                    }
                    html += '</td>';
                    html += '<td >'+vo.ip_clock_in+'</td>';
                    html += '<td >';
	                    if(vo.ip_clock_out == null) {
	                    	html += "-";}
	                    else{
	                    	html += vo.ip_clock_out;
	                    }
                    html += '</td>';
                    html += '</tr>';
                    $('#att_date_search_table').append(html);
				}
			},
			error: function(error){
				alert("일일근태 조회에 실패했습니다."); 
			}
		});
	});
	
////////날짜 유효성 ///////////
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