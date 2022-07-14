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
<title>직원 리스트 조회</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="section">
    <span id="title">직원 리스트</span>
    <select name="select" id="select">
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
						<td class="tb_read"></td>
						<td class="tb_read">${list.emp_no}</td>
						<td class="tb_read">${list.name}</td>
						<td class="tb_read">${list.email}</td>
						<td class="tb_read">${list.join_date}</td>
						<td class="tb_read">${list.dept_name}</td>
						<td class="tb_read">${list.job_title}</td>
						<td class="tb_read">${list.intl_no}</td>
						<td class="tb_read"></td>
						<td class="tb_read last_tb"><input type="hidden" class="empNo" value="${list.emp_no}"></td>
					</tr>
				</c:forEach>
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
            <select id="modal_select_dept">
            	<c:if test="${not empty deptList}">
            		<c:forEach items="#{deptList}" var="deptList">
            			<option class="deptList" value="${deptList}">${deptList}</option>
            		</c:forEach>
            	</c:if>	
            	<c:if test="${empty deptList}">
            		<option class="deptList">생성된 부서 없음</option>
            	</c:if>	
            </select>
            <span class="modal_title">이메일</span>
            <span class="modal_content" id="e_email">이메일 출력</span>
            <span class="modal_title">개인 연락처</span>
            <span class="modal_content" id="e_phone">개인 연락처 출력</span>
            <span class="modal_title">직책</span>
            <select id="modal_select_job">
                <c:if test="${not empty jobList}">
            		<c:forEach items="#{jobList}" var="jobList">
            			<option class="jobList" value="${jobList}">${jobList}</option>
            		</c:forEach>
            	</c:if>	
            </select>
            <span class="modal_title">내선번호</span>
            <input type="text" id="modal_text_intl" value="">
            <span class="modal_title">퇴사 여부</span>
            <select id="modal_select_resign">
                <option value="N" > N</option>
                <option value="Y"> Y</option>
            </select>
            <input type="hidden" value="" id="e_no">
        </div>
        <hr>
        <div id="modal_btn">
        	<input type="button" value="수정" id="modal_edit">
            <input type="button" value="확인" id="modal_cancel">
        </div>
    </div>
</section>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
<script>
// 모달 내 취소버튼 클릭 시 모달 없애기
	$("#modal_cancel").click(function(){
		$("#modal").hide();
	})
	
	$(".page").on('click', function() {
		var option = $('#select').val();
		if($(this).hasClass('page_prev')) {
			location.href="<%= request.getContextPath() %>/hr/employee/list?page=${startPage-1}&option="+option;
		} else if($(this).hasClass('page_num')) {
			location.href="<%= request.getContextPath() %>/hr/employee/list?page="+$(this).text()+"&option="+option;
		} else if($(this).hasClass('page_post')) {
			location.href="<%= request.getContextPath() %>/hr/employee/list?page=${endPage+1}&option="+option;
		}
	});
	
// 필터	
	$("#select").on('change', function() {
		var option = $('#select').val();
		location.href="<%= request.getContextPath() %>/hr/employee/list?page=1&option="+option;
	});
	
	var urlOption = '${option}';
	if(urlOption == 'date') {
		$('#select').val('date').prop('selected', true);
	} else if(urlOption == 'no') {
		$('#select').val('no').prop('selected', true);
	} else if(urlOption == 'name'){
		$('#select').val('name').prop('selected', true);
	}
	
// 필터 (였던 것)
	<%-- $("#select").on('change', function(){
		var selectVal = $(this).val();
		console.log(selectVal);
		$.ajax({
			url: "<%=request.getContextPath()%>/hr/employee/list",
			type: "post",
			data: {selectVal: selectVal, page : 1},
			dataType: 'json',
			success: function(result){
				var html;
				for(var i = 0; i < result.employeeList.length; i++){
					var vo = result.employeeList[i];
					html += '<tr id="list">';
						html += '<td></td>';
	                    html += '<td class="tb_read">'+vo.emp_no+'</td>';
	                    html += '<td class="tb_read">'+vo.name+'</td>';
	                    html += '<td class="tb_read">'+vo.email+'</td>';
	                    html += '<td class="tb_read">'+vo.join_date+'</td>';
	                    html += '<td class="tb_read">'+vo.dept_name+'</td>';
	                    html += '<td class="tb_read">'+vo.job_title+'</td>';
	                    html += '<td class="tb_read">'+vo.intl_no+'</td>';
	                    html += '<td></td>';
                    html += '</tr>';
				}
				
				var g = "";
				if(result.startPage > 1){
					g += '<a class="page" href="/hr/employee/list?page=${startPage-1 }">이전</a>';
				}
				var h = "";
				for(var p = result.startPage; p <= result.endPage; p++){
					h += '<a class="page" href="/hr/employee/list?page='+p+'">'+p+'</a>';
				}
				var i ="";
				if(result.endPage < result.totalpageCnt){
					i += '<a class="Page" href="/hr/employee/list?page=${endPage+1 }">다음</a>';
				}
				console.log("tlqkf");
				console.log(result);
				console.log(result.employeeList.length);
				
				$("#first_line").nextAll().remove();
				$("#table").append(html);
				$("#p_c").children('.page').remove();
				$("#p_c").append(g);
				$("#p_c").append(h);
				$("#p_c").append(i);
			},
			error: function(result){
				console.log("ajax 오류");
			}
		})
	})	 --%>
	
// 사원 상세 정보 모달 띄우기 & 정보 조회
	$(".tb_read").click(function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/hr/employee/select",
			type: "post",
			data: {empNo: $(this).nextAll(".last_tb").children(".empNo").val()},
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
	})
	
	
// 모달 내 수정버튼 클릭 시
	$("#modal_edit").on("click", function(){
		
		//내선번호 유효성 체크
		var intl_no_chk = false;
		var intlVal = $("#modal_text_intl").val();
		var intl = /^[0-9]{1,20}$/;	
		if(!intl.test(intlVal)){
			intl_no_chk = false;
		} else {
			intl_no_chk = true;
		}

		if($('#modal_text_intl').val()== null || $('#modal_text_intl').val()==""){
			alert("직원의 내선번호 입력 후 수정해 주세요.");
			return;
		}
		if(intl_no_chk == false){
			alert("내선번호를 형식에 맞게 작성해 주세요. (숫자 1~20자)");
			return;
		}
		$.ajax({
			url: "<%=request.getContextPath()%>/hr/employee/update",
			type: "post",
			data: {emp_no:$('#e_no').val(),
					dept_name:$('#modal_select_dept').val(), 
					job_title:$('#modal_select_job').val(),
					intl_no:$('#modal_text_intl').val(),
					resign_yn: $('#modal_select_resign').val()},
			success: function(result){
				if(result == 3){
					alert("직원 정보가 수정되었습니다.");
					$("#modal").hide();
					location.href="<%= request.getContextPath() %>/hr/employee/list";
				}
			},
			error: function(result){
				console.log("수정 실패");
			}
		})
	})
</script>
</body>
</html>