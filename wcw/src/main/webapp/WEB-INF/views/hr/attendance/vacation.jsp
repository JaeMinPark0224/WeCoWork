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

#attendance_main_box_first_hr {
	margin-top: 45px;
	width: 1070px;
	color: rgb(94, 94, 94);
	/* background-color: rgb(159, 197, 232); */
/* 	box-sizing: border-box; */
}

/* grid box~! */
#attendance_main_box_first_hr{
	display: grid;
    grid-template-columns: 0.7fr 1.5fr 0.7fr 1.5fr 0.7fr 1.5fr 2fr;
    grid-template-rows: 1fr 1fr;
    gap: 10px 20px;
    align-items: center;
}
/* #attendance_main_box_first_hr:first-child {
    height: 25px;
    line-height: 25px;
}
 */
#dept_name_txt{
	grid-column: 1 / 2;
	grid-row: 2 / 3;
}
#dept_name{
	grid-column: 2 / 3;
	grid-row: 2 / 3;
}
#emp_name_txt{
	grid-column: 3 / 4;
	grid-row: 2 / 3;
}
#emp_name{
	grid-column: 4 / 5;
	grid-row: 2 / 3;
}
#att_date_search_btn{
	grid-column: 7 / 8;
	grid-row: 2 / 3;
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

/* 모달 */
#modal{
	width: 280px;
    height: 482px;
    position: absolute;
    top: 50%;
    left: 450px;
    background-color: white;
    display: none;
    box-shadow: 3px 3px 10px rgb(210 210 210);
}
.tb_read{
   	cursor: pointer;
   }
#modal_section{
    display: block;
    margin: 0 auto;
    width: 226px;
    margin-top: 30px;
}
.modal_title{
    font-family: NotoSansR;
    display: block;
    font-size: 11px;
    margin-bottom: 5px;
    color: rgb(158, 158, 158);
}
.modal_content{
    font-family: NotoSansB;
    font-size: 12px;
    display: block;
    margin-bottom: 20px;
    color: rgb(94, 94, 94);
}
#modal_vaca_denied{
    font-family: NotoSansB;
    font-size: 12px;
    width: 225px;
    height: 30px;
    margin-bottom: 22px;
    color: rgb(94, 94, 94);
    border: 1px solid rgb(224, 224, 224);
}
#modal_vaca_confirm{
    font-family: NotoSansB;
    font-size: 12px;
    width: 225px;
    height: 30px;
    margin-bottom: 22px;
    color: rgb(94, 94, 94);
}
#modal_btn{
    margin: 0 auto;
    margin-bottom: 20px;
    width: 207px;
}
#modal_edit{
    color: rgb(75, 77, 178);
}
#modal_cancel, #modal_edit{
    width: 100px;
    height: 38px;
    border: 0px;
    font-family: NotoSansR;
    font-size: 12px;
    background-color: white;
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
			<div id="attendance_main_box_first_hr">
				<div class="font_title" id="att_month_text">기준 년도</div>
				<select name="year" class="att_date_form" id="year_select"></select>
				<div class="font_title height25">휴가 구분</div>
				<select name="vaca_sort" id="vaca_sort">
					<option value="0">전체</option>
				   	<option value="1">연차휴가</option>
				    <option value="2">출산휴가</option>
				    <option value="3">배우자 출산휴가</option>
				    <option value="4">생리휴가</option>
				    <option value="5">가족 돌봄 휴가</option>
				</select>
				 <div class="font_title height25">결재 상태</div>
				<select name="vaca_confirm" id="vaca_confirm">
					<option value="0">전체</option>
				   	<option value="1">진행중</option>
				    <option value="2">승인</option>
				    <option value="3">반려</option>
				</select>
				 <div class="font_title" id="dept_name_txt">부서명</div>
				<select name="dept_name" id="dept_name">
					<option value="0">전체</option>
				</select>
				<div class="font_title " id="emp_name_txt">사원명</div>
				<select name="emp_name" id="emp_name">
					<option value="0">전체</option>
				</select>
				<button type="submit" class="btn_format_mini_gray" id="vaca_list_search_btn">조회</button>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">휴가 신청 내역</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<table class="attendance_main_box_content_table" id="vaca_date_search_table">
							<tr class="table_title">
								<td style="width: 6%">사번</td>
								<td style="width: 10%">성명</td>
								<td style="width: 13%">신청일</td>
								<td style="width: 10%">휴가 구분</td>
								<td style="width: 10%">전일/반일</td>
								<td style="width: 14%">시작일</td>
								<td style="width: 14%">종료일</td>
								<td style="width: 7%">사용일수</td>
								<td style="width: 7%">잔여일수</td>
								<td style="width: 9%">결재상태</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<div id="modal">
        <div id="modal_section">
            <span class="modal_title">사원번호</span>
            <span class="modal_content" id="e_no">사원번호 출력</span>
            <span class="modal_title">휴가 신청자</span>
            <span class="modal_content" id="e_name">사원명 출력</span>
            <span class="modal_title">부서</span>
            <span class="modal_content" id="d_name">부서명 출력</span>
            <span class="modal_title">휴가 사유</span>
            <span class="modal_content" id="v_comment">휴가 사유 출력</span>
            <span class="modal_title">결재 상태</span>
            <span class="modal_content" id="v_confirm">결재 상태 출력</span>
            <span class="modal_title">승인</span>
            <select name="modal_vaca_confirm" id="modal_vaca_confirm">
			    <option value="2">승인</option>
			    <option value="3">반려</option>
			</select>
            <span class="modal_title" id="v_denied">반려사유</span>
            <input type="text" id="modal_vaca_denied" value="">
            <input type="hidden" value="" id="e_no">
        </div>
        <hr>
        <div id="modal_btn">
        	<input type="button" value="결재" id="modal_edit">
            <input type="button" value="닫기" id="modal_cancel">
        </div>
    </div>
</section>
<script>
	
/* 회사 가입년도 부터 지금년도까지 셀렉박스에 추가 */	
	var joinYear = '${cp_date}'.substr(0,4);
	var currentYear = (new Date()).getFullYear();
	for(var i = currentYear; i >= Number(joinYear); i--) {
		$('#year_select').append('<option value="'+i+'">'+i+'년</option>');
	}

/* 휴가 내역 조회 */
$(vaca_list_search_btn).click(function(){
	if($("#year_select").val() == ""){
		alert("기준년도를 선택해주세요") ;
		return;
	}
		$(".table_title").eq(0).nextAll().remove();
		$.ajax({
			url: "<%=request.getContextPath()%>/hr/attendance/vacation/select",
			type: "post",
			dataType: "json",
			data: {year_select:$('#year_select').val()
				, vaca_confirm:$('#vaca_confirm').val()
				, vaca_sort:$('#vaca_sort').val()
				, dept_name:$('#dept_name').val()
				, name:$('#emp_name').text()
				, emp_no: $('#emp_name').val()
			},
			
			success: function(result){
				console.log(result);
				var html;
				for(var i = 0; i < result.length; i++){
					var vo = result[i];
					html = "";
					html += '<tr class="table_content_white">';
                    html += '<td class="tb_read">'+vo.emp_no+'</td>';
                    html += '<td class="tb_read">'+vo.name+'</td>';
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
                    html += '<td class="tb_read">';
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
				$(".tb_read").off("click");
				$(".tb_read").on("click", {data: result}, openModal);
				
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
		if($(".table_content_white").eq(i).children().eq(9).text() == '승인') {
			var tempVuCount = parseInt($(".table_content_white").eq(i).children().eq(8).text()) - parseInt($(".table_content_white").eq(i).children().eq(7).text());
			for(var j = i; j > -1 ; j--) {
				if($(".table_content_white").eq(j).children().eq(0).text() == $(".table_content_white").eq(i).children().eq(0).text()
						&& $(".table_content_white").eq(j).children().eq(3).text() == $(".table_content_white").eq(i).children().eq(3).text()) {
					$(".table_content_white").eq(j).children().eq(8).text(tempVuCount);
				}
			}
		}
	}
}

// 모달창 정보 입력 함수 
function openModal(data) {
	console.log("openModal");
	let vo = data.data.data
	console.log(vo);
	console.log(vo[0]);
	let temp_index = $(this).parent().index();
	console.log($(this).parent().index());
	$("#modal").css("display", "block");
	$('#e_no').text(vo[temp_index-1].emp_no);
	$('#e_name').text(vo[temp_index-1].name);
	$('#d_name').text(vo[temp_index-1].dept_name);
	$('#v_comment').text(vo[temp_index-1].vaca_comment);
	if(vo[temp_index-1].vaca_confirm == '1') {
		$('#v_confirm').text("진행중")}
    else if(vo[temp_index-1].vaca_confirm == '2'){
    	$('#v_confirm').text("승인")
    }else if(vo[temp_index-1].vaca_confirm == '3'){
    	$('#v_confirm').text("반려")
    }
	$("#modal_edit").off("click");
	$("#modal_edit").on("click",{vaca_no : vo[temp_index-1].vaca_no}, function updateVaca(data){
		let temp_vaca_no = data.data.vaca_no;
		$.ajax({
			url: "<%=request.getContextPath()%>/hr/attendance/vacation/update",
			type: "post",
			data: {
				vaca_no: temp_vaca_no
				, modal_vaca_confirm: $('#modal_vaca_confirm').val()
				, modal_vaca_denied: $('#modal_vaca_denied').val()
			},
			success: function(result){
				alert("요청이 완료되었습니다. result = " + result);
			},
			error: function(error){
				alert("요청 실패") ;
			}
		});
	});
}

//모달 내 수정버튼 클릭 시
function updateVaca(){
	$.ajax({
		url: "<%=request.getContextPath()%>/hr/attendance/vacation/update",
		type: "post",
		data: {
			vaca_no: vo.vaca_no
			, modal_vaca_confirm: $('#modal_vaca_confirm').val()
			, modal_vaca_denied: $('#modal_vaca_denied').val()
		},
		success: function(result){
			alert("요청이 완료되었습니다. result = " + result);
		},
		error: function(error){
			alert("요청 실패") ;
		}
	});
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

// 모달 숨기기
$("#modal_cancel").click(function(){
	$("#modal").hide();
})
</script>
</body>
</html>