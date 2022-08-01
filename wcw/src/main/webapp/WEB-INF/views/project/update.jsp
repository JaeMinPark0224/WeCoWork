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
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="project_section">
<script type="text/javascript">
	$("#project_section").css("display", "none");
</script>
	<div id="project_main_wrap">
		<form name="project_insert_form">
			<input type="hidden" name="pr_no" value="${project.pr_no }">
			<div id="project_insert_wrap">
				<div class="project_insert_text_title">프로젝트 제목</div>
				<div class="project_input_wrap">
					<input type="text" id="project_insert_text" name='pr_title' placeholder="프로젝트 제목을 입력해 주세요. (최대 30자)">
					<div class="project_input_count">0/30자</div>
				</div>
				<div class="project_insert_text_title">프로젝트 내용</div>
				<div class="project_input_wrap">
					<textarea id="project_insert_textarea" name="pr_content" rows="" cols="" placeholder="프로젝트 내용을 입력해 주세요. (최대 400자)"></textarea>
					<div class="project_input_count">0/400자</div>
				</div>
				<div class="project_insert_menu_wrap">
					<div class="project_insert_text_title">프로젝트 공개 설정</div>
					<div class="project_insert_question_mark"><i class="fa-solid fa-circle-question circle_question"></i>
						<div class="project_insert_question_content">공개 설정시 사원 누구나 참여가 가능합니다.<br>비공개 설정시 초대 받은 사원만 참여가 가능합니다.</div>
					</div>
					<div class="project_insert_toggle_btn_wrap" toggle_chk="f">
						<div class="project_insert_toggle_btn_circle"></div>
						<input type="hidden" name="pr_open_yn" class="project_insert_toggle_value" id="pr_open_yn" value="N">
					</div>
				</div>
				<div class="project_insert_menu_wrap">
					<div class="project_insert_text_title">관리자 승인 후 참여</div>
					<div class="project_insert_question_mark"><i class="fa-solid fa-circle-question circle_question"></i>
						<div class="project_insert_question_content">프로젝트 참여시 관리자 승인 필요 여부</div>
					</div>
					<div class="project_insert_toggle_btn_wrap" toggle_chk="f">
						<div class="project_insert_toggle_btn_circle"></div>
						<input type="hidden" name="pr_join_open" class="project_insert_toggle_value" id="pr_join_open" value="N">
					</div>
				</div>
				<button type="button" id="project_insert_btn">수정</button>
			</div>
		</form>
	</div>
</section>
<script type="text/javascript">
	$('#project_main_menu_title').text('프로젝트 생성');
	$('#project_main_header_btn_wrap').css("display", "none");
	$('#project_main_title').css("display", "none");
	$('#project_main_tab_wrap').css("display", "none");
	$("#project_section").css("display", "block");
</script>
<script type="text/javascript">
	$('.project_insert_toggle_btn_wrap').on("click", function() {
		if($(this).attr("toggle_chk") == 'f') {
			$(this).children(".project_insert_toggle_btn_circle").css({
				'left': '22.5px',
			});
			$(this).css("background-color", "#4B4DB2");
			$(this).attr("toggle_chk", 't');
			$(this).children('.project_insert_toggle_value').val('Y');
		} else if($(this).attr("toggle_chk") == 't') {
			$(this).children(".project_insert_toggle_btn_circle").css({
				'left': '2.5px',
			});
			$(this).css("background-color", "gray");
			$(this).attr("toggle_chk", 'f');
			$(this).children('.project_insert_toggle_value').val('N');
		}
	});
</script>
<script type="text/javascript">
	$(".circle_question").hover(function() {
		if($('.project_insert_question_content')[0] == $(this).next('.project_insert_question_content')[0]) {
			$(this).next('.project_insert_question_content').css("width", "260px");
		} else {
			$(this).next('.project_insert_question_content').css("width", "200px");
		}
		$(this).next('.project_insert_question_content').fadeIn(200);
	},
	function() {
		$(this).next('.project_insert_question_content').fadeOut(100);
	});
</script>
<script type="text/javascript">
	$('#project_insert_btn').on('click', function() {
		if($("#project_insert_text").val() == "") {
			alert("프로젝트 제목을 입력해주세요.");
			$("#project_insert_text").focus();
			return;
		}
		
		if($("#project_insert_textarea").val() == "") {
			alert("프로젝트 내용을 입력해주세요.");	
			$("#project_insert_textarea").focus();
			return;
		}
		project_insert_form.action = "<%= request.getContextPath()%>/project/update.do"
		project_insert_form.method = "post";
		project_insert_form.submit();
	});
</script>
<script type="text/javascript">
	$('#project_insert_text').on('input', function() {
		let contentCount = $(this).val();
		if(contentCount.length == 0 || contentCount == '') {
			$(this).next().text('0/30자');
		} else {
			$(this).next().text(contentCount.length+'/30자');
		}
		if(contentCount.length > 30) {
			$(this).val($(this).val().substring(0, 30));
			alert('제목은 30자까지 입력 가능합니다.')
			$(this).next().text('30/30자');
		}
	});
	$('#project_insert_textarea').on('input', function() {
		let contentCount = $(this).val();
		if(contentCount.length == 0 || contentCount == '') {
			$(this).next().text('0/400자');
		} else {
			$(this).next().text(contentCount.length+'/400자');
		}
		if(contentCount.length > 400) {
			$(this).val($(this).val().substring(0, 400));
			alert('내용은 400자까지 입력 가능합니다.')
			$(this).next().text('400/400자');
		}
	});
	
	// 초기값 지정
	$("#project_insert_text").val("${project.pr_title}");
	$('#project_insert_textarea').val("${project.pr_content}");
	$("#project_insert_text").trigger("input");
	$("#project_insert_textarea").trigger("input");
	console.log("${project}");
	if("${project.pr_open_yn}" == 'Y') {
		$(".project_insert_toggle_btn_wrap").eq(0).trigger("click");
	}
	if("${project.pr_join_open}" == 'Y') {
		$(".project_insert_toggle_btn_wrap").eq(1).trigger("click");
	}
</script>
</body>
</html>