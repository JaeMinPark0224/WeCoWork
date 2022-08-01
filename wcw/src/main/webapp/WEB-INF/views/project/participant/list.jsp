<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/project/project.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<div id="project_participant_modal_background">
	<div id="project_participant_modal_wrap">
		<div id="project_participant_modal_grid">
			<div id="project_participant_modal_tap_wrap">
				<span class="project_participant_modal_tap" chk="t">책임자 추가</span>
				<span class="project_participant_modal_tap" chk="f">책임자 박탈</span>
				<span class="project_participant_modal_tap" chk="f">참여자 강퇴</span>
				<span class="project_participant_modal_tap_invite">참여자 초대</span>
				<span class="project_participant_modal_tap_accept">참여 승인</span>
			</div>
			<div class="project_participant_modal_name">부서</div>
			<div class="project_participant_modal_select_wrap">
				<select id="project_participant_modal_select_dept">
					<option value="0">부서 선택</option>
				</select>
			</div>
			<div class="project_participant_modal_name">성명</div>
			<div class="project_participant_modal_select_wrap">
				<select id="project_participant_modal_select_name">
					<option value="0">성명 선택</option>
				</select>
			</div>
			<div id="project_participant_modal_btn_wrap">
				<button type="button" class="project_participant_modal_btn" id="project_participant_modal_cancle_btn">취소</button>
				<button type="button"class="project_participant_modal_btn" id="project_participant_modal_add_btn">확인</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="project_section">
	<div id="project_main_wrap">
	<%@ include file="/WEB-INF/views/project/projectheader.jsp" %>
		<div id="project_participant_wrap">
			<div class="project_participant_flex_wrap">
				<div class="project_participant_header_wrap">
					<div class="projecet_participant_header">프로젝트 책임자</div>
				</div>
				<div class="project_participant_body_wrap">
					<div class="project_participant_body_flex">
						<c:forEach items="${deptAList }" var="dept">
							<div class="project_participant_dept_name">${dept }</div>
							<div class="project_participant_body_gird">
								<c:forEach items="${participantAList }" var="participant">
									<c:if test="${dept eq participant.dept_name }">
										<div class="project_workder_gird">
											<div class="project_workder_profile">
												<c:if test="${empty participant.profile}">
											    	<img class="project_worker_profile_img" src="<%= request.getContextPath() %>/resources/images/clear.png">
											    </c:if>
											    <c:if test="${not empty participant.profile}">
											        <img class="project_worker_profile_img" src="${participant.profile}">
											   	</c:if>
											</div>
											<div class="project_workder_name_dept">
												<span class="project_workder_name">${participant.name } </span>
												<span class="project_workder_dept">${participant.job_title }</span>
											</div>
											<div class="project_workder_num">#${participant.intl_no }</div>
											<div class="project_workder_email">${participant.email }</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="project_participant_flex_wrap">
				<div class="project_participant_header_wrap">
					<div class="projecet_participant_header">프로젝트 참여자</div>
				</div>
				<div class="project_participant_body_wrap">
					<div class="project_participant_body_flex">
						<c:forEach items="${deptBList }" var="dept">
							<div class="project_participant_dept_name">${dept }</div>
							<div class="project_participant_body_gird">
								<c:forEach items="${participantBList }" var="participant">
									<c:if test="${dept eq participant.dept_name }">
										<div class="project_workder_gird">
											<div class="project_workder_profile">
												<c:if test="${empty participant.profile}">
											    	<img class="project_worker_profile_img" src="<%= request.getContextPath() %>/resources/images/clear.png">
											    </c:if>
											    <c:if test="${not empty participant.profile}">
											        <img class="project_worker_profile_img" src="${participant.profile}">
											   	</c:if>
											</div>
											<div class="project_workder_name_dept">
												<span class="project_workder_name">${participant.name } </span>
												<span class="project_workder_dept">${participant.job_title }</span>
											</div>
											<div class="project_workder_num">#${participant.intl_no }</div>
											<div class="project_workder_email">${participant.email }</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
// 프로젝트 번호
var js_pr_no = (new URL(location.href).searchParams).get('project');

// ajax 로 전달 받은 사원 정보 저장
var employee;

// 참가자 설정 및 초대 버튼 생성
<c:if test="${pr_emp_authority eq 'A'}">
	$("#project_main_tab_wrap").append("<button id='project_participant_update_btn'>설정</button>");
	$("#project_main_tab_wrap").append("<button id='project_participant_invite_btn'>초대</button>");
	$("#project_main_tab_wrap").append("<button id='project_participant_accept_btn'>승인</button>");
</c:if>

// 모달창 열기
$("#project_participant_update_btn").on("click", function() {
	$(".project_participant_modal_tap").css("display", "block");
	$(".project_participant_modal_tap_invite").css("display", "none");
	$(".project_participant_modal_tap_accept").css("display", "none");
	$(".project_participant_modal_tap").css("color", "rgb(51, 51, 51)");
	$(".project_participant_modal_tap").attr("chk", "f");
	$(".project_participant_modal_tap").eq(0).css("color", "#4B4DB2");
	$(".project_participant_modal_tap").eq(0).attr("chk", "t");
	$("#project_participant_modal_background").css("display", "block");
	adminAddFnc();
});

// 책임자 추가 리스트 ajax 함수
function adminAddFnc() {
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/participant/list",
		data: {
			pr_no : js_pr_no,
			authority : "B"
		},
		dataType: "json",
		success: function(result) {
			console.log(result);
			employee = result.participantList;
			let $deptSelect = $("#project_participant_modal_select_dept");
			// 셀렉박스 초기화
			selectReset();
			for(var i = 0; i < result.deptList.length; i++) {
				let deptName = result.deptList[i];
				selectOptionAdd($deptSelect, deptName);
			}
			$deptSelect.off("change");
			$deptSelect.on("change", employeeList);
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}

// 책임자 박탈 리스트 ajax 함수
function adminDeleteFnc() {
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/participant/list",
		data: {
			pr_no : js_pr_no,
			authority : "A"
		},
		dataType: "json",
		success: function(result) {
			console.log(result);
			employee = result.participantList;
			let $deptSelect = $("#project_participant_modal_select_dept");
			// 셀렉박스 초기화
			selectReset();
			for(var i = 0; i < result.deptList.length; i++) {
				let deptName = result.deptList[i];
				selectOptionAdd($deptSelect, deptName);
			}
			$deptSelect.off("change");
			$deptSelect.on("change", employeeList);
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}

// 참여자 강퇴 리스트 ajax 함수
function empDeleteFnc() {
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/participant/list",
		data: {
			pr_no : js_pr_no,
			authority : "B"
		},
		dataType: "json",
		success: function(result) {
			console.log(result);
			employee = result.participantList;
			let $deptSelect = $("#project_participant_modal_select_dept");
			// 셀렉박스 초기화
			selectReset();
			for(var i = 0; i < result.deptList.length; i++) {
				let deptName = result.deptList[i];
				selectOptionAdd($deptSelect, deptName);
			}
			$deptSelect.off("change");
			$deptSelect.on("change", employeeList);
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}

// 셀렉박스 초기화
function selectReset() {
	let $deptSelect = $("#project_participant_modal_select_dept");
	let $employeeSelect = $("#project_participant_modal_select_name");
	$deptSelect.children().remove();
	selectOptionAdd($deptSelect, "부서 선택", 0);
	$employeeSelect.children().remove();
	selectOptionAdd($employeeSelect, "성명 선택", 0);
}

// 셀렉박스에 옵션 추가
function selectOptionAdd($dom, name, value) {
	if(typeof value == "undefined") {
		let html = "<option>"+name+"</option>";
		$dom.append(html);
	} else {
		let html = "<option value='"+value+"'>"+name+"</option>";
		$dom.append(html);
	}
}

// 부서 선택시 사원 리스트 출력 함수
function employeeList() {
	let $deptSelect = $("#project_participant_modal_select_dept");
	let $employeeSelect = $("#project_participant_modal_select_name");
	// '부서 선택' 옵션 삭제
	if($(this).val() != "0") {
		$deptSelect.children("[value = '0']").remove();
	}
	
	// 사원 리스트 초기화
	$employeeSelect.children().remove();
	selectOptionAdd($employeeSelect, "성명 선택", 0);
	// 사원 리스트 추가
	for(var i = 0; i < employee.length; i++) {
		if($deptSelect.val() == employee[i].dept_name) {
			let employeeName = employee[i].name;
			selectOptionAdd($employeeSelect, employeeName, employee[i].ep_no);
		}
	}
	$employeeSelect.off('change');
	$employeeSelect.on('change', employeeSelectFirstRemove);
}

// 사원 선택시 이벤트 설정
function employeeSelectFirstRemove() {
	// '사원, 직급 선택' 옵션 삭제
	$("#project_participant_modal_select_name").children("[value = '0']").remove();
}

// 모달창 내 탭 이벤트
$(".project_participant_modal_tap").on("click", function() {
	if($(this).attr("chk") == 'f') {
		$(".project_participant_modal_tap").attr("chk", "f");
		$(".project_participant_modal_tap").css("color", "rgb(51, 51, 51)");
		$(this).attr("chk", "t");
		$(this).css("color", "#4B4DB2");
		selectReset();
	}
	
	let tapIndex = $(".project_participant_modal_tap[chk = 't']").index();
	console.log(tapIndex);
	switch(tapIndex) {
		case 0:
			adminAddFnc();
			break;
		case 1:
			adminDeleteFnc();
			break;
		case 2:
			empDeleteFnc();
			break;
	}
});

// 모달창 추가 버튼 클릭 이벤트
$("#project_participant_modal_add_btn").on("click", function() {
	let $deptSelect = $("#project_participant_modal_select_dept");
	let $employeeSelect = $("#project_participant_modal_select_name");
	
	if($deptSelect.val() == 0) {
		alert("부서를 선택하세요.");
		return;
	}
	if($employeeSelect.val() == 0) {
		alert("사원을 선택하세요.");	
		return;
	}
	let tapIndex = $(".project_participant_modal_tap[chk = 't']").index();
	tapIndex = ($(".project_participant_modal_tap_invite").css("display") == 'block')?3:tapIndex;
	tapIndex = ($(".project_participant_modal_tap_accept").css("display") == 'block')?4:tapIndex;
	switch(tapIndex) {
		case 0:
			adminAdd();
			break;
		case 1:
			adminDelete();
			break;
		case 2:
			employeDelete();
			break;
		case 3:
			employeInvite();
			break;
		case 4:
			employeAccept();
			break;
	}
});

// 추가 버튼 클릭시 책임자 추가 기능 ajax
function adminAdd() {
	let $employeeSelect = $("#project_participant_modal_select_name");
	let js_emp_no = $employeeSelect.val() 
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/participant/update",
		data: {
			pr_no : js_pr_no,
			emp_no : js_emp_no,
			pr_emp_authority : "A"
		},
		success: function(result) {
			if(result == 1) {
				location.reload();
			}
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}

//추가 버튼 클릭시 책임자 박탈 기능 ajax
function adminDelete() {
	if($(".project_participant_body_wrap").eq(0).find(".project_workder_gird").length == 1) {
		alert("책임자를 박탈할 수 없습니다.");	
		return;
	}
	let $employeeSelect = $("#project_participant_modal_select_name");
	let js_emp_no = $employeeSelect.val();
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/participant/update",
		data: {
			pr_no : js_pr_no,
			emp_no : js_emp_no,
			pr_emp_authority : "B"
		},
		success: function(result) {
			if(result == 1) {
				location.reload();
			}
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}

//추가 버튼 클릭시 참여자 강퇴 기능 ajax
function employeDelete() {
	let $employeeSelect = $("#project_participant_modal_select_name");
	let js_emp_no = $employeeSelect.val() 
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/participant/delete",
		data: {
			pr_no : js_pr_no,
			emp_no : js_emp_no,
		},
		success: function(result) {
			if(result == 1) {
				location.reload();
			}
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}

//모달창 닫기
$("#project_participant_modal_cancle_btn").on("click", function() {
	$("#project_participant_modal_background").css("display", "none");	
});
</script>
<script type="text/javascript">
// 초대 버튼 클릭시 모달차 열기
$("#project_participant_invite_btn").on("click", function() {
	$(".project_participant_modal_tap").css("display", "none");
	$(".project_participant_modal_tap_accept").css("display", "none");
	$(".project_participant_modal_tap_invite").css("display", "block");
	$("#project_participant_modal_background").css("display", "block");
	inviteList();
});

// 프로젝트에 참여중이지 않은 사원 리스트 조회
function inviteList() {
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/participant/list",
		data: {
			pr_no : js_pr_no,
			authority : 'D'
		},
		dataType: "json",
		success: function(result) {
			console.log(result);
			employee = result.participantList;
			let $deptSelect = $("#project_participant_modal_select_dept");
			// 셀렉박스 초기화
			selectReset();
			for(var i = 0; i < result.deptList.length; i++) {
				let deptName = result.deptList[i];
				selectOptionAdd($deptSelect, deptName);
			}
			$deptSelect.off("change");
			$deptSelect.on("change", employeeList);
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}

// 프로젝트에 사원 초대하는 ajax 기능
function employeInvite() {
	let $employeeSelect = $("#project_participant_modal_select_name");
	let js_emp_no = $employeeSelect.val() 
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/participant/insert",
		data: {
			pr_no : js_pr_no,
			emp_no : js_emp_no,
		},
		dataType: "json",
		success: function(result) {
			if(result == 1) {
				location.reload();
			}
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}

// 승인 버튼 클릭 모달 창 열기
$("#project_participant_accept_btn").on("click", function() {
	$(".project_participant_modal_tap").css("display", "none");
	$(".project_participant_modal_tap_invite").css("display", "none");
	$(".project_participant_modal_tap_accept").css("display", "block");
	$("#project_participant_modal_background").css("display", "block");
	acceptList();
});

//프로젝트에 참여 신청한 사원 리스트 조회
function acceptList() {
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/participant/list",
		data: {
			pr_no : js_pr_no,
			authority : 'C'
		},
		dataType: "json",
		success: function(result) {
			console.log(result);
			employee = result.participantList;
			let $deptSelect = $("#project_participant_modal_select_dept");
			// 셀렉박스 초기화
			selectReset();
			for(var i = 0; i < result.deptList.length; i++) {
				let deptName = result.deptList[i];
				selectOptionAdd($deptSelect, deptName);
			}
			$deptSelect.off("change");
			$deptSelect.on("change", employeeList);
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}

//프로젝트에 사원 승인하는 ajax 기능
function employeAccept() {
	let $employeeSelect = $("#project_participant_modal_select_name");
	let js_emp_no = $employeeSelect.val() 
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/participant/update",
		data: {
			pr_no : js_pr_no,
			emp_no : js_emp_no,
			pr_emp_authority : "B"
		},
		dataType: "json",
		success: function(result) {
			if(result == 1) {
				alert("참여 승인을 완료했습니다.");
				location.reload();
			}
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}
</script>
</body>
</html>
