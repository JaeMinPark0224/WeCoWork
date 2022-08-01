<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/locale/ko.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/project/project.css">
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
	<div id="project_work_read_wrap">
	<form name="project_work_form" id="project_work_form" action="<%= request.getContextPath()%>/project/work/insert.do" method="post">
	<c:if test="${not empty ref_pw_no }">
		<input type="hidden" name="pw_ref_no" id="pw_ref_no" value="${ref_pw_no }">
	</c:if>
	<input type="hidden" name="pr_no" id="pr_no">
		<div id="project_work_read_content_wrap">
			<div id="project_work_read_content_grid_box">
				<div class="project_work_read_content_left">업무명</div>
				<div class="project_work_read_content_right">
					<input type="text" name="pw_title" id="project_work_title_input_text" placeholder="업무명을 입력해 주세요. (최대 30자)">
					<div class="project_input_count">0/30자</div>
				</div>
				<div class="project_work_read_content_hr"></div>
				<div class="project_work_read_content_left">상태</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_state_wrap">
						<input type="hidden" name="pw_status" id="pw_status" value="0">
						<div class="project_work_read_content_state" chk="f">요청</div>
						<div class="project_work_read_content_state" chk="f">진행</div>
						<div class="project_work_read_content_state" chk="f">보류</div>
						<div class="project_work_read_content_state" chk="f">완료</div>
						<div class="project_work_read_content_state" chk="f">피드백</div>
					</div>
				</div>
				<div class="project_work_read_content_left">우선순위</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_priority_wrap">
						<input type="hidden" name="pw_priority" id="pw_priority" value="0">
						<div class="project_work_read_content_priority" chk="f">상</div>
						<div class="project_work_read_content_priority" chk="f">중</div>
						<div class="project_work_read_content_priority" chk="f">하</div>
					</div>
				</div>
				<div class="project_work_read_content_left">업무자</div>
				<div class="project_work_read_content_right">
					<button type="button" id="project_work_worker_add_btn">업무자 추가</button>
					<div class="project_work_read_content_worker_wrap">
					</div>
				</div>
				<div class="project_work_read_content_left">일정</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_date_wrap">
						<div class="project_work_read_content_date_input_wrap">
							<div class="project_work_read_content_date_input_text">시작일</div>
							<input name="pw_start_date_str" class="project_work_read_content_date_input_date" type="datetime-local">
						</div>
						<div class="project_work_read_content_date_input_wrap">
							<div class="project_work_read_content_date_input_text">종료일</div>
							<input name="pw_end_date_str" class="project_work_read_content_date_input_date" type="datetime-local">
						</div>
					</div>
				</div>
				<div class="project_work_read_content_left">내용</div>
				<div class="project_work_read_content_right">
					<textarea name="pw_content" id="project_work_content_input_textarea" placeholder="업무 내용을 입력해 주세요. (최대 600자)"></textarea>
					<div class="project_input_count">0/600자</div>
				</div>
				<div id="project_work_add_btn_wrap">
					<button type="button" id="project_work_add_btn">추가</button>
				</div>
			</div>
		</div>
	</form>
	</div>
	</div>
</section>
<script type="text/javascript">
	//프로젝트 번호
	var js_pr_no = (new URL(location.href).searchParams).get('project');
	
	// ajax로 받은 데이터 저장
	var employee;
	
	// Moment.js 로케일 설정
	moment.locale('ko'); 
	
	// 프로젝트 번호 입력
	$("#pr_no").val((new URL(location.href).searchParams).get('project'));
	
	// 글자수 체크 위치 변경	
	$(".project_input_count").css({
		"top" : "5px",
		"left": "560px"
	});
	
	
	// input text 글자수 체크
	$('#project_work_title_input_text').on('input', function() {
		let maxCnt = 30;
		let contentCount = $(this).val();
		if(contentCount.length == 0 || contentCount == '') {
			$(this).next().text('0/'+maxCnt+'자');
		} else {
			$(this).next().text(contentCount.length+'/'+maxCnt+'자');
		}
		if(contentCount.length > maxCnt) {
			$(this).val($(this).val().substring(0, maxCnt));
			alert('제목은 '+maxCnt+'자까지 입력 가능합니다.')
			$(this).next().text(maxCnt+'/'+maxCnt+'자');
		}
	});
	
	// textarea 글자수 체크
	$('#project_work_content_input_textarea').on('input', function() {
		let maxCnt = 600;
		let contentCount = $(this).val();
		if(contentCount.length == 0 || contentCount == '') {
			$(this).next().text('0/'+maxCnt+'자');
		} else {
			$(this).next().text(contentCount.length+'/'+maxCnt+'자');
		}
		if(contentCount.length > maxCnt) {
			$(this).val($(this).val().substring(0, maxCnt));
			alert('제목은 '+maxCnt+'자까지 입력 가능합니다.')
			$(this).next().text(maxCnt+'/'+maxCnt+'자');
		}
	});
	
	// 업무 상태 배경색 변경
	$(".project_work_read_content_state").on("click", function() {
		let workState = $(this).index();
		let stateRgb1 = 'rgb(87, 184, 184)';
		let stateRgb2 = 'rgb(230, 126, 34)';
		let stateRgb3 = 'rgb(231, 76, 60)';
		let stateRgb4 = 'rgb(94, 94, 94)';
		let stateRgb5 = 'rgb(75, 77, 178)';
		if($(this).attr("chk") == 'f') {
			$('.project_work_read_content_state').css({
				'color': 'rgb(94, 94, 94)',
				'background-color':  'rgb(224, 224, 224)'				
			});
			$('.project_work_read_content_state').attr("chk", 'f');
			$(this).attr("chk", 't');
			$("#pw_status").val($(this).index());
			switch(workState) {
			case 1:
				$(this).css({
					'color': 'white',
					'background-color' : stateRgb1
				});
				break;
			case 2:
				$(this).css({
					'color': 'white',
					'background-color' : stateRgb2
				});
				break;
			case 3:
				$(this).css({
					'color': 'white',
					'background-color' : stateRgb3
				});
				break;
			case 4:
				$(this).css({
					'color': 'white',
					'background-color' : stateRgb4
				});
				break;
			case 5:
				$(this).css({
					'color': 'white',
					'background-color' : stateRgb5
				});
				break;
			}
		} else if($(this).attr("chk") == 't') {
			$(this).attr("chk", 'f');
			$(this).css({
				'color': 'rgb(94, 94, 94)',
				'background-color':  'rgb(224, 224, 224)'
			});
			$("#pw_status").val(0);
		}
	});
	
	// 우선순위 선택
	$(".project_work_read_content_priority").on('click', function() {
		let workPriority = $(this).index();
		if($(this).attr("chk") == 'f') {
			$('.project_work_read_content_priority').css({
				'color': 'rgb(94, 94, 94)',
				'background-color':  'rgb(224, 224, 224)'				
			});
			$('.project_work_read_content_priority').attr("chk", 'f');
			$(this).attr("chk", 't');
			$("#pw_priority").val($(this).index());
			$(this).css({
				'color': 'white',
				'background-color': '#4B4DB2'
			})
		} else if($(this).attr("chk") == 't') {
			$(this).attr("chk", 'f');
			$(this).css({
				'color': 'rgb(94, 94, 94)',
				'background-color':  'rgb(224, 224, 224)'
			});
			$("#pw_priority").val(0);
		}
	});
	
	// 업무자 추가
	$("#project_work_worker_add_btn").on("click", function() {
		participantListFnc();
		// 모달창 열기		
		$("#project_participant_modal_background").css("display", "block");
		// 탭 매뉴 초기화
		$(".project_participant_modal_tap").css("display", "none");
		// 업무자 추가 탭 활성화
		$(".project_participant_modal_tap_invite").text("업무자 추가");
		$(".project_participant_modal_tap_invite").css("display", "block");
	});
	
	// 업무자 추가 모달창 확인 버튼 클릭
	$("#project_participant_modal_add_btn").on("click", function() {
		let $deptSelect = $("#project_participant_modal_select_dept");
		let $employeeSelect = $("#project_participant_modal_select_name");
		let js_emp_no = $employeeSelect.val();
		if($deptSelect.val() == 0) {
			alert("부서를 선택하세요.");
			return;
		}
		if($employeeSelect.val() == 0) {
			alert("사원을 선택하세요.");	
			return;
		}
		
		
		let empName= $("#project_participant_modal_select_name option:checked").text();
		let appendText = '<div class="project_work_read_content_worker" emp="'+js_emp_no+'">'+empName+'</div>';
		let $worker = $(".project_work_read_content_worker");
		for(var i = 0; i < $worker.length; i++) {
			if($worker.eq(i).attr("emp") == js_emp_no) {
				alert("이미 추가된 사원입니다.");
				$("#project_participant_modal_background").css("display", "none");
				return;
			}
		}
		$(".project_work_read_content_worker_wrap").append(appendText);
		$(".project_work_read_content_worker[emp="+js_emp_no+"]").append('<i class="fa-solid fa-xmark work_worker_cancle" emp="'+js_emp_no+'"></i>');
		$(".work_worker_cancle").off("click");
		$(".work_worker_cancle").on("click", workerDelete);
		$("#project_participant_modal_background").css("display", "none");
	});
	
	// 업무자 추가 모달창 취소 버튼 클릭
	$("#project_participant_modal_cancle_btn").on("click", function() {
		$("#project_participant_modal_background").css("display", "none");		
	});
	
	// 참여자 리스트 조회
	function participantListFnc() {
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/participant/list",
			data: {
				pr_no : js_pr_no,
				authority : "ALL"
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
	
	// 일정 칸에서 시작일이 종료일보다 앞선 날이여야 한다.
	$(".project_work_read_content_date_input_date").on("input", function(event) {
		let $startDateInput = $(".project_work_read_content_date_input_date").eq(0);
		let $endDateInput = $(".project_work_read_content_date_input_date").eq(1);
		let startDate = new Date($startDateInput.val());
		let endDate = new Date($endDateInput.val());
		
		if(startDate.getTime() >= endDate.getTime()) {
			if($(this)[0] == $startDateInput[0]) {
				alert("시작일은 "+moment(endDate).format('LLLL') + " 이전만 가능합니다.");
			} else if($(this)[0] == $endDateInput[0]) {
				alert("종료일은 "+moment(startDate).format('LLLL') + " 이후만 가능합니다.");
			}
			$(this).val($(this).data("prevVal"));
		} else {
			$(this).data("prevVal", $(this).val());
		}
		
	});
	
	// 
	
	// submit 유효성 체크
	$("#project_work_add_btn").on("click", function() {
		if($("#project_work_title_input_text").val() == '') {
			alert("업무명을 입력해주세요.");	
			return;
		}
		if($("#pw_status").val() == '0') {
			alert("업무 상태를 선택해주세요.");
			return;
		}
		if($("#pw_priority").val() == '0') {
			alert("우선순위를 선택해주세요.");
			return;
		}
		if($(".project_work_read_content_worker").length == 0) {
			alert("업무자를 추가해주세요.");
			return;	
		} else {
			for(var i = 0; i < $(".project_work_read_content_worker").length; i++) {
				let inputEmpNo = "<input type='hidden' name='empNoList' value='"+$(".project_work_read_content_worker").eq(i).attr('emp')+"'>";
				$("#project_work_form").append(inputEmpNo);
			}
		}
		if($(".project_work_read_content_date_input_date").eq(0).val() == '') {
			alert("시작일을 선택해주세요.");
			return;
		}
		if($(".project_work_read_content_date_input_date").eq(0).val() == '') {
			alert("종료일을 선택해주세요.");	
			return;
		}
		if($("#project_work_content_input_textarea").val() == '') {
			alert("업무 내용을 입력해주세요.");	
			return;	
		}
		let text = $('#project_work_content_input_textarea').val();
		text = text.replaceAll(/(\n|\r\n)/g, "<br>");
		$('#project_work_content_input_textarea').val(text);
		project_work_form.submit();
	});
	
	// 업무자 삭제
	function workerDelete() {
		console.log("workerDelete");
		console.log($(this));
		console.log($(this).parent());
		$(this).parent().remove();
	}
</script>
</body>
</html>