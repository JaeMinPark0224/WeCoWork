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
<title>휴가 관리</title>
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
#vacation_text{
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

#vaca_select, #vaca_select_allday, #year_select, #vaca_sort, #vaca_confirm{
	border: 1px solid rgb(224, 224, 224);
	height: 25px;
	width: 138px;
	font-size: 12px;
	font-family: NotoSansR;
}
.height25{
	height: 25px;
    line-height: 25px;
}

/* grid box~! */
#vacation_grid_container{
	display: grid;
    grid-template-rows: 25px 25px 75px 30px;
    grid-template-columns: 1fr 6fr 3fr;
    row-gap: 10px;
}

.vacation_flex {
	display: flex;
	gap: 30px;
}

.flex_justify_end {
	justify-self : end;
}

#vacation_text {
	grid-column: 2/4;
}

#vacation_submit_btn {
	grid-column: 3/4;
	justify-self : end;
}

.flexbox1{
	display: flex;
    gap: 30px;
}
.flexbox1:first-child {
    height: 25px;
    line-height: 25px;
}

.vacation_flex_box{
	display: flex;
	gap: 30px;
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
			<div id="attendance_main_menu_title">휴가 관리</div>
		</div>
		
		<div id="attendance_main_container">
			
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">휴가 신청</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<div id="vacation_grid_container">
							<div class="font_title attendance_modify_grid_first_row height25">신청 일자</div>
							<input type="date" id="vacation_req_date" name="att_appr_req_date" class="attendance_modify_grid_first_row att_date_form">
							<div class="vacation_flex flex_justify_end">
								<div class="font_title">휴가 구분</div>
								<select name="vaca_select" id="vaca_select">
									<option value="1">연차휴가</option>
									<option value="2">출산휴가</option>
									<option value="3">배우자 출산휴가</option>
									<option value="4">가족 돌봄 휴가</option>
									<option value="5">생리휴가</option>
								</select>
							</div>
							<div class="font_title attendance_modify_grid_first_row">휴가 기간</div>
							<div class="vacation_flex">
								<input type="date" id="vacation_start" name="att_appr_req_date" class="attendance_modify_grid_first_row att_date_form">
								<div>~</div>
								<input type="date" id="vacation_end" name="att_appr_req_date" class="attendance_modify_grid_first_row att_date_form">
							</div>
							<div class="vacation_flex flex_justify_end">
								<div class="font_title">전일 / 반일</div>
								<select name="vaca_select_allday" id="vaca_select_allday">
									<option value="1">전일</option>
									<option value="2">반일-오전</option>
									<option value="3">반일-오후</option>
								</select>
							</div>
							<div class="font_title">신청 사유</div>
							<input type="text" id="vacation_text">
							<button type="submit" class="btn_format_mini" id="vacation_submit_btn">요청</button>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">휴가 신청 내역</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<div class="vacation_flex_box">
							<div class="font_title height25">기준 년도</div>
							<select name="year" id="year_select">
							</select>
							<div class="font_title height25">결재 상태</div>
							<select name="vaca_confirm" id="vaca_confirm">
								<option value="0">전체</option>
							   	<option value="1">진행중</option>
							    <option value="2">승인</option>
							    <option value="3">반려</option>
							</select>
							<div class="font_title height25">휴가 구분</div>
							<select name="vaca_sort" id="vaca_sort">
								<option value="0">전체</option>
							   	<option value="1">연차휴가</option>
							    <option value="2">출산휴가</option>
							    <option value="3">배우자 출산휴가</option>
							    <option value="4">가족 돌봄 휴가</option>
							    <option value="5">생리휴가</option>
							</select>
							<div style="flex-grow : 1; text-align: right;">
								<button type="button" class="btn_format_mini_gray flex_justify_end" id="vaca_list_search_btn">조회</button>
							</div>
						</div>
						<table class="attendance_main_box_content_table" id="vaca_date_search_table">
							<tr class="table_title">
								<td style="width: 14%">신청일</td>
								<td style="width: 11%">휴가 구분</td>
								<td style="width: 11%">전일/반일</td>
								<td style="width: 16%">시작일</td>
								<td style="width: 16%">종료일</td>
								<td style="width: 10%">사용일수</td>
								<td style="width: 10%">잔여일수</td>
								<td style="width: 12%">결재상태</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>

/* 휴가신청 ajax */

	$(vacation_submit_btn).click(function(){
		if($("#vacation_req_date").val() == "" 
				|| $("#vacation_start").val() == "" 
				|| $("#vacation_end").val() == ""
				|| $("#vaca_select").val() == ""
				|| $("#vaca_select_allday").val() == ""
				|| $("#vacation_text").val() == ""){
			alert("신청 일자, 휴가 구분, 휴가 기간, 전일/반일, 휴가사유를 모두 입력해주세요.") ;
			return;
		}
		if($("#vacation_start").val() != $("#vacation_end").val() && $("#vaca_select_allday").val() != "1"){
			alert("반일 휴가를 신청할 수 없습니다. 전일을 선택해주세요.") ;
			return;
		}
		$.ajax({
			url: "<%=request.getContextPath()%>/vacation/insert",
			type: "post",
			data: {vacation_req_date:$('#vacation_req_date').val()
				, vacation_start:$('#vacation_start').val()
				, vacation_end:$('#vacation_end').val()
				, vaca_select:$('#vaca_select').val()
				, vaca_select_allday:$('#vaca_select_allday').val()
				, vacation_text:$('#vacation_text').val()
			},
			
			success: function(result){
				alert("휴가 신청이 완료되었습니다.");
				$('#vacation_req_date').val('');
				$('#vaca_select').val('');
				$('#vaca_select_allday').val('');
				$('#vacation_text').val('');
				location.reload();
			},
			error: function(error){
				alert("휴가 신청에 실패했습니다.") ;
			}
		});
	});
		
	$("#vaca_list_search_btn").click(function(){
		if($("#year_select").val() == ""){
			alert("기준년도를 선택해주세요") ;
			return;
		}
		$(".table_title").eq(0).nextAll().remove();
		$.ajax({
			url: "<%=request.getContextPath()%>/vacation/select",
			type: "post",
			dataType : "json",
			data: {year_select:$('#year_select').val()
				, vaca_confirm:$('#vaca_confirm').val()
				, vaca_sort:$('#vaca_sort').val()
			},
			
			success: function(result){
				console.log(result);
				var html;
				for(var i = 0; i < result.length; i++){
					var vo = result[i];
					html = "";
					html += '<tr class="table_content_white">';
                    html += '<td >'+vo.vaca_req_date.substr(0,10)+'</td>';
                    html += '<td >';
	                    if(vo.vaca_sort == '1') {
	                    	html += "연차휴가";}
	                    else if(vo.vaca_sort == 2){
	                    	html += "출산휴가";
	                    }else if(vo.vaca_sort == 3){
	                    	html += "배우자 출산휴가";
	                    }else if(vo.vaca_sort == 5){
	                    	html += "생리휴가";
	                    }else if(vo.vaca_sort == 4){
	                    	html += "가족 돌봄 휴가";
	                    }else{
	                    	html += "error";
	                    }
	                html += '</td>';
	                html += '<td >';
	                    if(vo.vaca_allday == '1') {
	                    	html += "전일";}
	                    else if(vo.vaca_allday == 2){
	                    	html += "반일-오전";
	                    }else if(vo.vaca_allday == 3){
	                    	html += "반일-오후";
	                    }
	                html += '</td>';
                    html += '<td >'+vo.vaca_start.substr(0,10)+'</td>';
                    html += '<td >'+vo.vaca_end.substr(0,10)+'</td>';
                    html += '<td >'+vo.vaca_cnt+'</td>';
                    html += '<td >'+vo.vu_count+'</td>';
                    html += '<td >';
	                    if(vo.vaca_confirm == '1') {
	                    	html += "진행중";}
	                    else if(vo.vaca_confirm == '2'){
	                    	html += "승인";
	                    }else if(vo.vaca_confirm == '3'){
	                    	html += "반려";
	                    }
	            	html += '</td>';
                    html += '</tr>';
                    $('#vaca_date_search_table').append(html);
				}
				vuCountFnc();
			},
			error: function(error){
				alert("휴가신청내역 조회에 실패했습니다.") ;
			}
		});
	});

	
	
function vuCountFnc() {
	console.log("vuCountFnc");
	console.log($(".table_content_white").length);
	for(var i = $(".table_content_white").length - 1; i > -1; i--) {
		if($(".table_content_white").eq(i).children().eq(7).text() == '승인') {
			var tempVuCount = parseFloat($(".table_content_white").eq(i).children().eq(6).text()) - parseFloat($(".table_content_white").eq(i).children().eq(5).text());
			for(var j = i; j > -1 ; j--) {
				if($(".table_content_white").eq(j).children().eq(1).text() == $(".table_content_white").eq(i).children().eq(1).text()) {
					$(".table_content_white").eq(j).children().eq(6).text(tempVuCount);
				}
			}
		}
	}
}
	
/* 입사년도 부터 지금년도까지 셀렉박스에 추가 */	
	var joinYear = '${loginSSInfo.join_date}'.substr(0,4);
	var currentYear = (new Date()).getFullYear();
	for(var i = currentYear; i >= Number(joinYear); i--) {
		$('#year_select').append('<option value="'+i+'">'+i+'년</option>');
	}

////////////날짜선택 유효성 /////////////
var today = new Date();
var today_year = today.getFullYear();
var today_month = today.getMonth();
today_month = ((today_month+1) < 10) ? '0'+(today_month+1) : (today_month+1);
var today_clockDate = today.getDate();
today_clockDate = (today_clockDate < 10) ? '0'+today_clockDate : today_clockDate;
//신청일자 오늘부터
$("#vacation_req_date").on("click", function() {
	$("#vacation_req_date").attr("min", today_year+'-'+today_month+'-'+today_clockDate);
});
//휴가기간
$("#vacation_req_date").on("input", function() {
	$("#vacation_start").attr("min",$("#vacation_req_date").val());
});
$("#vacation_start").on("input", function() {
	$("#vacation_end").attr("min", $("#vacation_start").val());
});
$("#vacation_end").on("input", function() {
	$("#vacation_start").attr("max", $("#vacation_end").val());
});

</script>
</body>
</html>