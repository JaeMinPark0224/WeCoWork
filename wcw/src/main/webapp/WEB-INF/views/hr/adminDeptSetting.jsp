<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/hr/adminDeptSetting.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>관리자 부서 설정</title>
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
    <span id="title">관리자 부서 설정</span>
    <input type="button" id="edit_btn" value="관리자 설정">
    <div id="content">
        <table id="table">
            <tr id="first_line">
                <td></td>
                <td>사번</td>
                <td>직원명</td>
                <td style="width: 13%;">부서</td>
                <td>직위</td>
                <td style="width: 25%;">입사일</td>
                <td style="width: 5%;">퇴사여부</td>
                <td style="width: 15%;">내선번호</td>
                <td></td>
            </tr>
            <c:if test="${not empty adminList}">
		        <c:forEach items="${adminList}" var="list">
					<tr class="list">
						<td class="tb_read"></td>
						<td class="tb_read">${list.emp_no}</td>
						<td class="tb_read">${list.name}</td>
						<td class="tb_read">${list.dept_name}</td>
						<td class="tb_read">${list.job_title}</td>
						<td class="tb_read">${list.join_date}</td>
						<td class="tb_read">${list.resign_yn}</td>
						<td class="tb_read">${list.intl_no}</td>
						<td class="tb_read"></td>
						<td class="tb_read last_tb"><input type="hidden" class="empNo" value="${list.emp_no}"></td>
					</tr>
				</c:forEach>
			</c:if>
        </table>
    </div>

    <div id="modal">
        <div id="modal_section">
            <span class="modal_title">부서</span>
            <select id="modal_select_dept">
            	<c:if test="${not empty deptList}">
            		<c:forEach items="#{deptList}" var="deptList">
            			<option class="deptList" value="${deptList}">${deptList}</option>
            		</c:forEach>
            	</c:if>
            	<c:if test="${empty deptList}">
            		<option class="deptList" value="none_dept" selected>생성된 부서 없음</option>
            	</c:if>	
            </select>
        </div>
        <hr>
        <div id="modal_btn">
            <input type="button" value="취소" id="modal_cancel">
            <input type="button" value="권한 부여" id="modal_edit">
        </div>
    </div>
</section>
<script>

// 관리자 설정 버튼 클릭 시
$("#edit_btn").click(function(){
	console.log("${adminList[0].dept_name}");
	if("${adminList[0].dept_name}" != ""){
		$('#modal_select_dept').val("${adminList[0].dept_name}").prop('selected', true);
	}
	else {
		$('.deptList').val("#none_dept").prop('selected', true);
	}
	$("#modal").show();
})
// 모달 내 취소 버튼 클릭 시
$("#modal_cancel").click(function(){
	$("#modal").hide();
})

// 모달 내 '권한 부여' 버튼 클릭 시
$("#modal_edit").click(function(){
	var selectVal = $('#modal_select_dept').val();
	console.log(selectVal);
	
	$.ajax({
		url: "<%=request.getContextPath()%>/hr/department/admin/update",
		type: "post",
		data: {selectVal: selectVal},
		dataType: 'json',
		success: function(result){
			if(result > -1){
				alert("관리자 부서 변경이 완료되었습니다");
				location.href="<%= request.getContextPath() %>/hr/department/admin/list";
			}
			else {
				alert("관리자 부서 변경 중 오류가 발생했습니다.");
			}
		},
		error: function(result){
			console.log("권한 부여 ajax 오류");
		}
	})
	
})
</script>
</body>
</html>