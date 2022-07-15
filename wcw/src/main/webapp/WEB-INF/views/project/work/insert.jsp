<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/project/project.css">
<head>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="project_section">
	<div id="project_main_wrap">
	<%@ include file="/WEB-INF/views/project/projectheader.jsp" %>	
	<div id="project_work_read_wrap">
	<form name="project_work_form" action="<%= request.getContextPath()%>/project/work/insert.do" method="post">
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
						<div class="project_work_read_content_worker">박재민</div>
						<div class="project_work_read_content_worker">서유빈</div>
						<div class="project_work_read_content_worker">이진정</div>
						<div class="project_work_read_content_worker">민승택</div>
						<div class="project_work_read_content_worker">박재민</div>
						<div class="project_work_read_content_worker">서유빈</div>
						<div class="project_work_read_content_worker">이진정</div>
						<div class="project_work_read_content_worker">민승택</div>
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
	$("#pr_no").val((new URL(location.href).searchParams).get('project'));
	
	$(".project_input_count").css({
		"top" : "5px",
		"left": "560px"
	});
	
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
		let text = $('.project_work_content_input_textarea').val();
		text = text.replaceAll(/(\n|\r\n)/g, "<br>");
		$('.project_work_content_input_textarea').val(text);
		project_work_form.submit();
	});
	

	
</script>
</body>
</html>