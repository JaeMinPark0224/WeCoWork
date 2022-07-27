<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/hr/employeeList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<head>
<meta charset="UTF-8">
<title>직원 정보</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
<style type="text/css">
select {
	border: 1px solid rgb(224, 224, 224);
	width: 138px; height:25px;
	font-size: 12px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);	
	margin-left: 870px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="section">
    <span id="title">직원 정보</span>
    <select name="select" id="select_pi">
        <option value="no"> 사번</option>
        <option value="date"> 입사일</option>
        <option value="name"> 직원명</option>
    </select>
    <div id="content">
        <table id="table">
            <tr id="first_line">
                <td></td>
                <td style="width: 10%">사번</td>
                <td style="width: 10%">직원명</td>
                <td style="width: 18%;">이메일</td>
                <td style="width: 18%;">입사일</td>
                <td style="width: 15%;">부서</td>
                <td style="width: 10%">직급</td>
                <td style="width: 10%">내선번호</td>
                <td></td>
            </tr>
            <c:if test="${not empty employeeList}">
		        <c:forEach items="${employeeList}" var="list">
					<tr class="list">
						<td ></td>
						<td >${list.emp_no}</td>
						<td >${list.name}</td>
						<td >${list.email}</td>
						<td >${list.join_date}</td>
						<td >${list.dept_name}</td>
						<td >${list.job_title}</td>
						<td >${list.intl_no}</td>
						<td ></td>
						<td class="tb_read last_tb"><input type="hidden" class="empNo" name ="empNo" value="${list.emp_no}"></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty employeeList}">
					<tr class="list">
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
					</tr>
			</c:if>
        </table>
         <div id="pageing_all">
                <div class="pageing">
                	<p id="p_c">
                		<c:if test="${not empty employeeList}">
							<c:if test="${startPage > 1 }">
								<a class="page page_prev">이전</a>
							</c:if>
							<c:forEach begin="${startPage }" end="${endPage }" var="p">
								<a class="page page_num" >${p}</a>
							</c:forEach>
							<c:if test="${endPage < totalpageCnt}">
								<a class="page page_post" >다음</a>
							</c:if>
						</c:if>
					</p>
                </div>
          </div>
    </div>
    <div id="modal">
        <div id="modal_section">
            <span class="modal_title">사원명</span>
            <span class="modal_content" id="e_name">사원명 출력</span>
            <span class="modal_title">부서</span>
            <span class="modal_content" id="e_dept">부서 출력</span>
            <span class="modal_title">이메일</span>
            <span class="modal_content" id="e_email">이메일 출력</span>
            <span class="modal_title">개인 연락처</span>
            <span class="modal_content" id="e_phone">개인 연락처 출력</span>
            <span class="modal_title">직책</span>
            <span class="modal_content" id="e_job_title">직책 출력</span>
            <span class="modal_title">내선번호</span>
            <span class="modal_content" id="e_intl_no">내선번호 출력</span>
            <span class="modal_title">퇴사 여부</span>
            <span class="modal_content" id="e_resign_yn">퇴사여부 출력</span>
            <input type="hidden" value="" id="e_no">
        </div>
        <hr>
        <div id="modal_btn">
            <input type="button" value="확인" id="modal_cancel">
        </div>
    </div>
</section>

<script>
// 모달 내 취소버튼 클릭 시 모달 없애기
	$("#modal_cancel").click(function(){
		$("#modal").hide();
	})
	
	$(".page").on('click', function() {
		var option = $('#select_pi').val();
		if($(this).hasClass('page_prev')) {
			location.href="<%= request.getContextPath() %>/hr/employee/list?page=${startPage-1}&option="+option;
		} else if($(this).hasClass('page_num')) {
			location.href="<%= request.getContextPath() %>/hr/employee/list?page="+$(this).text()+"&option="+option;
		} else if($(this).hasClass('page_post')) {
			location.href="<%= request.getContextPath() %>/hr/employee/list?page=${endPage+1}&option="+option;
		}
	});
	
// 필터	
	$("#select_pi").on('change', function() {
		var option = $('#select_pi').val();
		location.href="<%= request.getContextPath() %>/pi/employeeList?page=1&option="+option;
	});
	
	var urlOption = '${option}';
	if(urlOption == 'date') {
		$('#select_pi').val('date').prop('selected', true);
	} else if(urlOption == 'no') {
		$('#select_pi').val('no').prop('selected', true);
	} else if(urlOption == 'name'){
		$('#select_pi').val('name').prop('selected', true);
	}
	

</script>
</body>
</html>