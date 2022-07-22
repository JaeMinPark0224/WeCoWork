<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/draft/insertDraft.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>기안 작성</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="section">
        <span class="title">기안 작성</span><br>
        <div id="content">
			            <span class="sub_title" id="draft_select_title">기안 분류</span>
			            <select id="draft_select" class="select">
			                <option value="1">기안서</option>
			                <option value="2">지출결의서</option>
			                <option value="3">정산서</option>
			            </select>
			            <span class="sub_title" id="emp_select_title">결재자</span>
			            <select id="emp_select1" emp_no class="select">
			            	<option selected disabled>결재자1</option>
			            	<c:forEach items="${employeeList}" var="list">
			            		<c:if test="${list.job_level < loginSSInfo.job_level}">
			            			<option value="${list.job_level}" emp_no="${list.emp_no}">${list.name}</option>
			            		</c:if>
			            	</c:forEach>
			            </select>
			            <select id="emp_select2" class="select" disabled>
			            	<option selected disabled>결재자2</option>
			                <option>선택안함</option>
			            </select>
			            <select id="emp_select3" class="select" disabled>
			            	<option selected disabled>결재자3</option>
			                <option>선택안함</option>
			            </select>
			            <div id="tables">
				            <form action="<%=request.getContextPath()%>/draft/insert.do" method="post" class="submit">
					            <input type="hidden" name="emp_no_1" class="emp_no_1">
		        				<input type="hidden" name="emp_no_2" class="emp_no_2">
		        				<input type="hidden" name="emp_no_3" class="emp_no_3">
		        				<input type="hidden" name="dr_sort" class="dr_sort" value="1">
				                <table class="table" id="table1">
				                    <tr>
				                        <td class="first_td">기안 제목</td>
				                        <td><input type="text" class="write_td" name="dr_title" id="dr_title"></td>
				                    </tr>
				                    <tr>
				                        <td class="first_td">목적</td>
				                        <td><input type="text" class="write_td" name="dr_purpose" id="dr_purpose"></td>
				                    </tr>
				                    <tr>
				                        <td class="first_td">기안 내용</td>
				                        <td class="first_td_textarea">
				                        	<textarea class="textarea" class="write_td" name="dr_content"  id="dr_content"></textarea>
				                        </td>
				                    </tr>
				                    <tr>
				                        <td class="first_td">비고</td>
				                        <td><input type="text" class="write_td" name="dr_comment"></td>
				                    </tr>
				                </table>
				                <input type="submit" id="ok_btn1" value="상신" style="display: block;">
	        				</form>
	        				<form action="<%=request.getContextPath()%>/draft/insert.do" method="post" class="submit">
	        					<input type="hidden" name="emp_no_1" class="emp_no_1">
		        				<input type="hidden" name="emp_no_2" class="emp_no_2">
		        				<input type="hidden" name="emp_no_3" class="emp_no_3">
		        				<input type="hidden" name="dr_sort" class="dr_sort" value="2">
		        				<table class="table" id="table2">
				                    <tr>
				                        <td class="first_td">결의서 제목</td>
				                        <td><input type="text" class="write_td" name="dr_title"  id="dr_title1"></td>
				                    </tr>
				                    <tr>
				                        <td class="first_td">지출 예정 일자</td>
				                        <td><input type="text" class="write_td" name="dr_expect_date" id="dr_expect_date"></td>
				                    </tr>
				                    <tr>
				                        <td class="first_td">결의서 내용</td>
				                        <td class="first_td_textarea">
				                        	<textarea class="textarea" class="write_td" name="dr_content"  id="dr_content2"></textarea>
				                        </td>
				                    </tr>
				                    <tr>
				                        <td class="first_td">비고</td>
				                        <td><input type="text" class="write_td" name="dr_comment"></td>
				                    </tr>
				                </table>
				                <input type="submit" id="ok_btn2" value="상신">
	        				</form>
	        				<form action="<%=request.getContextPath()%>/draft/insert.do" method="post" class="submit">
	        					<input type="hidden" name="emp_no_1" class="emp_no_1">
		        				<input type="hidden" name="emp_no_2" class="emp_no_2">
		        				<input type="hidden" name="emp_no_3" class="emp_no_3">
		        				<input type="hidden" name="dr_sort" class="dr_sort" value="3">
		        				<table class="table" id="table3">
				                    <tr>
				                        <td class="first_td">정산서 제목</td>
				                        <td><input type="text" class="write_td" name="dr_title" id="dr_title2"></td>
				                    </tr>
				                    <tr>
				                        <td class="first_td">발생 기간</td>
				                        <td><input type="text" class="write_td" name="spend_date" id="spend_date"></td>
				                    </tr>
				                    <tr>
				                        <td class="first_td">지출 목적</td>
				                        <td><input type="text" class="write_td" name="spend_purpose"  id="spend_purpose"></td>
				                    </tr>
				                    <tr>
				                        <td class="first_td">상세 내용</td>
				                        <td class="first_td_textarea">
				                        	<textarea class="textarea" class="write_td" name="dr_content" id="dr_content2"></textarea>
				                        </td>
				                    </tr>
				                    <tr>
				                        <td class="first_td"></td>
				                        <td class="count_td">
				                            <table id="second_table"> 
				                                <tr class="second_tr">
				                                    <td class="first_td_scd">항목</td>
				                                    <td id="first_td_scd2">내용</td>
				                                    <td id="first_td_scd3">금액(숫자)</td>
				                                </tr>
				                                <tr class="second_tr">
				                                    <td class="first_td_scd">법인 카드</td>
				                                    <td><input type="text" class="card_content" name="spend_content"></td>
				                                    <td><input type="number" class="card_won" id="cp_card" name="spend_amount"></td>
				                                </tr>
				                                <tr class="second_tr">
				                                    <td class="first_td_scd">개인 카드</td>
				                                    <td><input type="text" class="card_content" name="spend_content_prvt"></td>
				                                    <td><input type="number" class="card_won" id="ep_card" name="spend_amount_prvt"></td>
				                                </tr>
				                                <tr class="second_tr">
				                                    <td class="first_td_scd">합계</td>
				                                    <td></td>
				                                    <td><input type="number" class="card_won" id="total_won" name="spend_sum" readonly></td>
				                                </tr>
				                            </table>
				                        </td>
				                    </tr>
				                    <tr>
				                        <td class="first_td">비고</td>
				                        <td><input type="text" class="write_td" name="dr_comment"></td>
				                    </tr>
				                </table>
				                <input type="submit" id="ok_btn3" value="상신">
	        				</form>
			            </div>
        </div>
</section>
<script>
// 기안 분류 변경 시
$("#draft_select").on('change', function() {
	var option = $('#draft_select').val();
	if(option == 1){
		$('#table1').show();
		$('#table2').hide();
		$('#table3').hide();
		$('#ok_btn1').show();
		$('#ok_btn2').hide();
		$('#ok_btn3').hide();
	}
	else if(option == 2){
		$('#table1').hide();
		$('#table2').show();
		$('#table3').hide();
		$('#ok_btn1').hide();
		$('#ok_btn2').show();
		$('#ok_btn3').hide();
	}
	else if(option == 3){
		$('#table1').hide();
		$('#table2').hide();
		$('#table3').show();
		$('#ok_btn1').hide();
		$('#ok_btn2').hide();
		$('#ok_btn3').show();
	}
});

// 결재자 선택
$('#emp_select1').change(function(){
	
	// 결재자1 선택이 되었으면
	$('#emp_select3').children().remove();
	$('#emp_select3').attr("disabled", true);
	var option = $("<option selected disabled>" + "결재자3" + "</option>");
	$('#emp_select3').append(option);
	
	if($('#emp_select1').val() != null){
		// 결재자2 선택할 수 있도록
		$('#emp_select2').children().remove();
		<c:forEach items="${employeeList}" var="employee">
			if("${employee.job_level}" < $('#emp_select1').val()) {
				var option = $("<option value='${employee.job_level}' emp_no='${employee.emp_no}'>${employee.name}</option>");
				$('#emp_select2').append(option);
			}
		</c:forEach>
		// 결재자2에 선택안함 옵션 추가
		$('#emp_select2').append("<option>선택안함</option>");
	}
	
	// 결재자1에 '대표' 선택시 결재자2 선택 불가
	if($('#emp_select1').val() == "0"){
		$('#emp_select2').attr("disabled", true);
		var option = $("<option selected disabled'>" + "결재자2" + "</option>");
		$('#emp_select2').append(option);
		
		$('#emp_select3').attr("disabled", true);
		var option2 = $("<option selected disabled>" + "결재자3" + "</option>");
		$('#emp_select3').append(option2);
	}
	if($('#emp_select1').val() != "0"){
		$('#emp_select2').removeAttr("disabled");
	}
	$(".emp_no_1").val($("#emp_select1 option:selected").attr("emp_no"));
})




$('#emp_select2').change(function(){
	$('#emp_select3').attr("disabled", true);
	
	// 결재자2가 선택이 되었으면
	if($('#emp_select2').val() != null){
		// 결재자3 선택할 수 있도록
		$('#emp_select3').removeAttr("disabled");
	}
	// 결재자2에 '대표' 선택시 결재자3 선택 불가
	if($('#emp_select2').val() == "0"){
		$('#emp_select3').attr("disabled", true);
		$('#emp_select3').children().remove();
		var option = $("<option>선택안함</option>");
		$('#emp_select3').append(option);
	}

		// 결재자2 선택이 되었으면
		if($('#emp_select2').val() != null){
			// 결재자3 선택할 수 있도록
			$('#emp_select3').children().remove();
			<c:forEach items="${employeeList}" var="employee">
				if("${employee.job_level}" < $('#emp_select2').val()) {
					var option = $("<option value='${employee.job_level}' emp_no='${employee.emp_no}'>${employee.name}</option>");
					$('#emp_select3').append(option);
				}
			</c:forEach>
			// 결재자2에 선택안함 옵션 추가
			$('#emp_select3').append("<option>선택안함</option>");
		}
	
		// 결재자2가 선택되지 않았다면
		if($('#emp_select2').val() == null || ($('#emp_select2').val() == '선택안함')){
			// 결재자3 선택 못하도록
			$('#emp_select3').attr("disabled", true);
			$('#emp_select3').children().remove();
			var option = $("<option>선택안함</option>");
			$('#emp_select3').append(option);
		}
		
	$(".emp_no_2").val($("#emp_select2 option:selected").attr("emp_no"));
})


$('#emp_select3').change(function(){
	$(".emp_no_3").val($("#emp_select3 option:selected").attr("emp_no"));
})
</script>


<script>
// 정산서 - 카드 금약(숫자) 입력 시 자동 합계 계산
$('.card_won').focusout(function(){
	var cpCard = -999;
	var epCard = -99999;
	
	if($('#cp_card').val() == ""){
		cpCard = 0;	
	}
	else{
		cpCard = parseInt($('#cp_card').val());
	}

	if($('#ep_card').val() == ""){
		epCard = 0;	
	}
	else{
		epCard = parseInt($('#ep_card').val());
	}
	
	var total = cpCard + epCard;
	$('#total_won').val(total);
})
</script> 
<script>
// 유효성 체크
$('.submit').submit(function(){
	$(".emp_no_1").val($("#emp_select1 option:selected").attr("emp_no"));
	$(".emp_no_2").val($("#emp_select2 option:selected").attr("emp_no"));
	$(".emp_no_3").val($("#emp_select3 option:selected").attr("emp_no"));
	console.log($('#draft_select').val());
	
	// 결재자 1명 이상 선택하도록
	if($('#emp_select1').val() == null){
		alert("결재자를 1명 이상 선택해 주세요.");
		return false;
	}
	
	if($('#draft_select').val() == 1){
		// 기안서
		if(($('#dr_title').val() == null) || ($('#dr_title').val() == "")){
			alert("기안 제목을 작성해 주세요.");
			return false;
		}
		if(($('#dr_content').val() == null) || ($('#dr_content').val() == "")){
			alert("기안 내용을 작성해 주세요.");
			return false;
		}
		if(($('#dr_purpose').val() == null) || ($('#dr_purpose').val() == "")){
			alert("기안 목적을 작성해 주세요.");
			return false;
		}	
	}
	
	if($('#draft_select').val() == 2){
		// 지출결의서
		if(($('#dr_title1').val() == null) || ($('#dr_title1').val() == "")){
			alert("결의서 제목을 작성해 주세요.");
			return false;
		}
		if(($('#dr_content2').val() == null) || ($('#dr_content2').val() == "")){
			alert("결의서 내용을 작성해 주세요.");
			return false;
		}
		if(($('#dr_expect_date').val() == null) || ($('#dr_expect_date').val() == "")){
			alert("지출 예정 일자를 작성해 주세요.");
			return false;
		}	
	}
	
	if($('#draft_select').val() == 3){
		// 정산서
		if(($('#dr_title2').val() == null) || ($('#dr_title2').val() == "")){
			alert("정산서 제목을 작성해 주세요.");
			return false;
		}
		if(($('#spend_date').val() == null) || ($('#spend_date').val() == "")){
			alert("발생 기간을 작성해 주세요.");
			return false;
		}
		if(($('#spend_purpose').val() == null) || ($('#spend_purpose').val() == "")){
			alert("지출 목적을 작성해 주세요.");
			return false;
		}
		if(($('#dr_content2').val() == null) || ($('#dr_content2').val() == "")){
			alert("상세 내용 작성해 주세요.");
			return false;
		}
		if(($('#cp_card').val() == null ||$('#cp_card').val() == "") && ($('#ep_card').val() == null || $('#ep_card').val() == "")){
			alert("법인 또는 개인 카드 사용 금액을 작성해 주세요.");
			return false;
		}	
	}
})
</script>
</body>
</html>