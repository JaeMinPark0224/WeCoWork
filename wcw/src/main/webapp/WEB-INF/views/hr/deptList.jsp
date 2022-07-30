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
    <input type="button" id="create_btn" value="부서 생성">
    <div class="content">
        <table class="table">
            <tr class="first_line">
                <td></td>
                <td>부서 번호</td>
                <td style="width: 22%;">부서명</td>
                <td>부서 책임자</td>
                <td style="width: 28%;">생성일</td>
                <td style="width: 7%;">활성화 여부</td>
                <td style="width: 22%;">부모 부서</td>
                <td></td>
            </tr>
            <c:if test="${not empty deptList}">
		        <c:forEach items="${deptList}" var="list">
					<tr class="list" dept_no="${list.dept_no}">
						<td class="tb_read"></td>
						<td class="tb_read">${list.dept_no}</td>
						<td class="tb_read">${list.dept_name}</td>
						<c:if test="${not empty list.admin_name}">
							<td class="tb_read">${list.admin_name}</td>
						</c:if>
						<c:if test="${empty list.admin_name}">
							<td class="tb_read">-</td>
						</c:if>
						<td class="tb_read">${list.dept_date}</td>
						<td class="tb_read">${list.active_yn}</td>
						<c:if test="${not empty list.dept_upper_name}">
							<td class="tb_read">${list.dept_upper_name}</td>
						</c:if>
						<c:if test="${empty list.dept_upper_name}">
							<td class="tb_read">-</td>
						</c:if>
						<td class="tb_read"></td>
						<td class="last_tb"><input type="hidden" class="deptNo" value="${list.dept_no}"></td>
						<td class="last_tb"><input type="hidden" class="deptName" value="${list.dept_name}"></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty deptList}">
				<tr class="list">
					<td class="tb_read"></td>
					<td class="tb_read"></td>
					<td class="tb_read"></td>
					<td class="tb_read"></td>
					<td class="tb_read"></td>
					<td class="tb_read"></td>
					<td class="tb_read"></td>
					<td class="tb_read"></td>
				</tr>
			</c:if>
        </table>
    </div>

	<!-- 부서 상세 정보 및 수정용 모달 -->
    <div id="modal">
        <div id="modal_section">
        	
            <span class="modal_title">부서명</span>
            <input type="text" id="d_name">
            <span class="modal_title">부서 책임자</span>
            
            <select id="modal_select_dept_adm">
            </select>
            
            <span class="modal_title">생성일</span>
            <span class="modal_content" id="d_date">부서 생성일 출력</span>
            <span class="modal_title">부모 부서</span>
            <select id="modal_select_dept_dp">
                <c:if test="${not empty deptList}">
            		<c:forEach items="#{deptList}" var="list">
            			<option class="deptList" value="${list.dept_name}">${list.dept_name}</option>
            		</c:forEach>
            		<option id="nope" value="-1" selected>부모 부서 없음</option>
            	</c:if>
            </select>
            <span class="modal_title">활성화 여부</span>
            <select id="modal_select_yn">
                <option> Y</option>
                <option> N</option>
            </select>
        </div>
        <hr>
        <div id="modal_btn">
        	<input type="button" value="수정" id="modal_edit">
            <input type="button" value="확인" id="modal_cancel">
        </div>
    </div>
    
    <!-- 부서 생성용 모달 -->
    <div id="modal2">
        <div id="modal_section2">
        	<span class="modal_title">부서명</span>
        	<input type="text" placeholder="부서명을 입력해 주세요." id="create_name">
         
            <span class="modal_title">부모 부서</span>
            <select id="modal2_select_dept">
            	<c:if test="${not empty deptList}">
            		<c:forEach items="#{deptList}" var="list">
            			<option class="deptList" value="${list.dept_no}">${list.dept_name}</option>
            		</c:forEach>
            		<option id="nope2" value="-1" selected>부모 부서 없음</option>
            	</c:if>
            	<c:if test="${empty deptList}">
            		<option id="nope2" value="-1">부서 없음</option>
            	</c:if>
            </select>
        </div>
        <hr>
        <div id="modal_btn2">
			<input type="button" value="취소" id="modal_cancel2">
        	<input type="button" value="생성" id="modal_edit2">
        </div>
    </div>

    

    <span class="title">부서별 직원 리스트</span>
    <select id="select_dept">
    	<c:if test="${not empty deptNameList}">
    		<c:forEach items="${deptNameList}" var="list">
    			<option value="${list}">${list}</option>
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
                <c:if test="${not empty employeeList}">
			        <c:forEach items="${employeeList}" var="list">
						<tr class="list">
							<td class="tb_read2"></td>
							<td class="tb_read2">${list.emp_no}</td>
							<td class="tb_read2">${list.name}</td>
							<td class="tb_read2">${list.email}</td>
							<td class="tb_read2">${list.join_date}</td>
							<td class="tb_read2">${list.job_title}</td>
							<td class="tb_read2">${list.intl_no}</td>
							<td class="tb_read2">${list.phone}</td>
							<td class="tb_read2"></td>
							<td class="last_tb2"><input type="hidden" class="empNo2" value="${list.emp_no}"></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty employeeList}">
					<tr class="list">
						<td class="tb_read2"></td>
						<td class="tb_read2"></td>
						<td class="tb_read2"></td>
						<td class="tb_read2"></td>
						<td class="tb_read2"></td>
						<td class="tb_read2"></td>
						<td class="tb_read2"></td>
						<td class="tb_read2"></td>
						<td class="tb_read22"></td>
					</tr>
				</c:if>
        </table>
    </div>
</section>
<script>
var js_dept_no;

//부서 상세 정보 모달 띄우기 & 정보 조회
 $(".tb_read").click(function(){

	$('#modal2').hide();
	 
	$("#modal_select_dept_adm").children("option").remove();
	//$('#modal_select_dept_dp').val('#nope').prop('selected', true);
	//$('#modal_select_dept_dp').children("#nope").prop('selected', true);
	console.log($('#modal_select_dept_dp').children("#nope").prop('selected', true));
	$.ajax({
		url: "<%=request.getContextPath()%>/hr/department/select",
		type: "post",
		data: {deptNo: $(this).nextAll(".last_tb").children(".deptNo").val(),
			deptName: $(this).nextAll(".last_tb").children(".deptName").val()},
		dataType: "json",
		success: function(result){
			// 부서명
			$('#d_name').val(result.form_dept.dept_name);
			// 부서 책임자
			   // 해당 부서 내 직원 리스트 출력
				for(var i = 0; i < result.employeeList_dept.length; i++){
					// 직원 이름 리스트 중, 해당 부서의 책임자와 이름이 동일하다면 해당 이름이 selected
					if(result.employeeList_dept[i].name == result.form_dept.admin_name){
						var option = $("<option selected value='"+result.employeeList_dept[i].emp_no+"'>" + result.employeeList_dept[i].name + "</option>");
					} else{
						var option = $("<option value='"+result.employeeList_dept[i].emp_no+"'>" + result.employeeList_dept[i].name + "</option>");	
					}
					$('#modal_select_dept_adm').append(option);
				}
				
				// 해당 부서에 책임자가 없다면 없음이 selected 되도록
				if(typeof result.form_dept.admin_name == "undefined"){
					var basic1 = $("<option value='-2' selected>" + "없음" + "</option>");
					$('#modal_select_dept_adm').append(basic1);
				} else{
					var basic2 = $("<option value='-2'>" + "없음" + "</option>");
					$('#modal_select_dept_adm').append(basic2);
				}

			// 부서 생성일
			$('#d_date').text(result.form_dept.dept_date);
			
			// 부모 부서 selected
			if(typeof result.form_dept.dept_upper_name != "undefined"){
				$('#modal_select_dept_dp').val(result.form_dept.dept_upper_name).prop('selected', true);
			}
			// 활성화 여부
			$('#modal_select_yn').val(result.form_dept.active_yn).prop('selected', true);
			
			js_dept_no = result.form_dept.dept_no;
		},
		error: function(result){
			console.log("부서 상세 정보 ajax 오류");
		}
	})
	// 모달 보이게
	$("#modal").show();
})
</script>
<script>
// 모달 내 확인 버튼 클릭 시
$('#modal_cancel').click(function(){
	$("#modal").hide();	
})

// 모달 내 수정 버튼 클릭 시
var chkDeptName = false;
	
$('#modal_edit').click(function(){
	
	// 부서명 유효성 체크
	var nameVal = $("#d_name").val();
	var name = /^[가-힣]{2,10}$/;
		    		
	if(!name.test(nameVal)){
		chkDeptName = false;
	} else {
		chkDeptName = true;
	}

	if(chkDeptName == false) {
		alert("부서명을 형식에 맞게 입력해 주세요. (한글 2~10자)");
		return;
	}
	
	// 부서명 미입력 시
	var tf = $('#d_name').val();
	console.log(tf);
	if(tf.length < 1){
		alert("부서명을 입력 후 생성해 주세요.");
		return;
	}
	$.ajax({
		url: "<%=request.getContextPath()%>/hr/department/update",
		type: "post",
		data: {dept_name:$('#d_name').val(),
				emp_no:$('#modal_select_dept_adm').val(),  // 책임자 사원 번호 
				dept_upper_name:$('#modal_select_dept_dp').val(), // 부모 부서 부서명
				modal_select_yn:$('#modal_select_yn').val(),
				dept_no : js_dept_no // 수정할 부서 번호
				},
		success: function(result){
			if(result = 1){
				alert("부서가 수정되었습니다.");
			}else{
				alert("부서 수정에 실패했습니다.");
			}
			location.href="<%= request.getContextPath() %>/hr/department/list";
		},
		error: function(result){
			console.log("부서 수정 실패");
		}
	})
})
</script>

<script>
// 부서 생성 버튼 클릭 시
$('#create_btn').click(function(){
	$('#modal').hide();
	$('#modal2').show();
})
// 부서 생성 모달 내 생성 버튼 클릭 시
var chkDeptName2 = false;

// 부서명 유효성 체크
	$("#create_name").focusout(function(){
		var nameVal2 = $("#create_name").val();
		var name2 = /^[가-힣]{2,10}$/;
		    		
		   if(!name2.test(nameVal2)){
			  chkDeptName2 = false;
		   } else {
			  chkDeptName2 = true;
		   }
	});

$('#modal_edit2').click(function(){
	if(chkDeptName2 == false) {
		alert("부서명을 형식에 맞게 입력해 주세요. (한글 2~10자)");
		return;
	}
	
	// 부서명 미입력 시
	var tf = $('#create_name').val();
	if(tf.length < 1){
		alert("부서명을 입력 후 생성해 주세요.");
		return;
	}
		
	$.ajax({
		url: "<%=request.getContextPath()%>/hr/department/insert",
		type: "post",
		data: {dept_name:$('#create_name').val(),
				dept_upper_no:$('#modal2_select_dept').val()
				},
		success: function(result){
			if(result = 1){
				alert("부서가 생성되었습니다.");
			}else{
				alert("부서 생성에 실패했습니다.");
			}
			location.href="<%= request.getContextPath() %>/hr/department/list";
		},
		error: function(result){
			console.log("부서 생성 실패");
		}
	})
})
// 부서 생성 모달 내 취소 버튼 클릭 시
$('#modal_cancel2').click(function(){
	$('#modal2').hide();
})
</script>

<script>
// 부서별 직원 리스트 조회 필터 변경 시
	$('#select_dept').on("change", function(){
		var option = $('#select_dept').val();
		location.href="<%= request.getContextPath() %>/hr/department/list?option="+option;
	})
	
	if('${option}' == null || '${option}' == ""){
		$('#select_dept').val('${first_dept_name}').prop('selected', true);
	} else{
		$('#select_dept').val('${option}').prop('selected', true);
	}

</script>
</body>
</html>