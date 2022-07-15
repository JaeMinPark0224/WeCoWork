<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/hr/deptList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>부서 관리</title>
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
    <span class="title">부서 리스트</span>
    <input type="button" id="edit_btn" value="부서 설정">
    <div class="content">
        <table class="table">
            <tr class="first_line">
                <td></td>
                <td>부서 번호</td>
                <td style="width: 20%;">부서명</td>
                <td style="width: 13%;">부서 책임자</td>
                <td style="width: 20%;">생성일</td>
                <td>활성화 여부</td>
                <td style="width: 10%;">총 인원</td>
                <td style="width: 15%;">부모 부서</td>
                <td></td>
            </tr>
            <c:if test="${not empty deptList}">
		        <c:forEach items="${deptList}" var="list">
					<tr class="list">
						<td class="tb_read"></td>
						<td class="tb_read">${list.dept_no}</td>
						<td class="tb_read">${list.dept_name}</td>
						<td class="tb_read">${list.emp_no}</td>
						<td class="tb_read">${list.dept_date}</td>
						<td class="tb_read">${list.active_yn}</td>
						<td class="tb_read">${list.cnt}</td>
						<td class="tb_read">${list.dept_upper_no}</td>
						<td class="tb_read"></td>
						<td class="last_tb"><input type="hidden" class="deptNo" value="${list.dept_no}"></td>
					</tr>
				</c:forEach>
			</c:if>
        </table>
    </div>

    <div id="modal">
        <div id="modal_section">
            <span class="modal_title">부서명</span>
            <input type="text" id="d_name" value="부서명 출력"></span>
            <span class="modal_title">부서 책임자</span>
            <select id="modal_select_dept_cap">
                <option> 부서 직원1</option>
                <option> 부서 직원1</option>
                <option> 부서 직원1</option>
            </select>
            <span class="modal_title">생성일</span>
            <span class="modal_content">부서 생성일 출력</span>
            <span class="modal_title">부모 부서</span>
            <select id="modal_select_dept">
                <option> 부서1</option>
                <option> 부서1</option>
                <option> 부서1</option>
            </select>
            <span class="modal_title">활성화 여부</span>
            <select id="modal_select_yn">
                <option> Y</option>
                <option> N</option>
            </select>
        </div>
        <hr>
        <div id="modal_btn">
            <input type="button" value="취소" id="modal_cancel">
            <input type="button" value="확인" id="modal_edit">
        </div>
    </div>

    <span class="title">부서별 직원 리스트</span>
    <select id="select_dept">
    	<c:if test="${not empty deptList}">
    		<c:forEach items="${deptList}" var="list">
    			<option value="${list.dept_name}">${list.dept_name}</option>
    		</c:forEach>
    	</c:if>
    	<c:if test="${empty deptList}">
    		<option>부서 없음</option>
    	</c:if>
    </select>
    <div class="content">
        <table class="table">
            <tr class="first_line">
                <td></td>
                <td style="width: 8%">사번</td>
                <td style="width: 10%;">성명</td>
                <td style="width: 18%;">이메일</td>
                <td style="width: 18%;">입사일</td>
                <td>직급</td>
                <td style="width: 10%">내선번호</td>
                <td style="width: 18%;">개인 연락처</td>
                <td></td>
            </tr>
            <tr class="list">
                <c:if test="${not empty employeeList}">
			        <c:forEach items="${employeeList}" var="list">
						<tr class="list">
							<td class="tb_read"></td>
							<td class="tb_read">${list.emp_no}</td>
							<td class="tb_read">${list.name}</td>
							<td class="tb_read">${list.email}</td>
							<td class="tb_read">${list.join_date}</td>
							<td class="tb_read">${list.job_title}</td>
							<td class="tb_read">${list.intl_no}</td>
							<td class="tb_read">${list.phone}</td>
							<td class="tb_read"></td>
							<td class="last_tb"><input type="hidden" class="empNo" value="${list.emp_no}"></td>
						</tr>
					</c:forEach>
				</c:if>
            </tr>
        </table>
    </div>
</section>
<script>
//부서 상세 정보 모달 띄우기 & 정보 조회
<%-- $(".tb_read").click(function(){
	$.ajax({
		url: "<%=request.getContextPath()%>/hr/department/update",
		type: "post",
		data: {empNo: $(this).nextAll(".last_tb").children(".deptNo").val()},
		dataType: "json",
		success: function(result){
			// 성명
			$('#e_name').text(result.name);
			// 부서
			$('#modal_select_dept').val(result.dept_name).prop('selected', true);
			// 이메일
			$('#e_email').text(result.email);
			// 연락처
			$('#e_phone').text(result.phone);
			// 직책
			$('#modal_select_job').val(result.job_title).prop('selected', true);
			// 내선번호
			$('#modal_text_intl').val(result.intl_no);
			// 퇴사 현황
			$('#modal_select_resign').val(result.resign_yn).prop('selected', true);
			// 직원 번호
			$('#e_no').val(result.emp_no);
		},
		error: function(result){
			console.log("직원 상세 정보 ajax 오류");
		}
	})
	// 모달 보이게
	$("#modal").show();
}) --%>
</script>
</body>
</html>