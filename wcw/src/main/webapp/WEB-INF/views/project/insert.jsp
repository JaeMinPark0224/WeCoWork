<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/project/project.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
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
	<%@ include file="/WEB-INF/views/project/projectheader.jsp" %>
		<div id="project_insert_wrap">
			<div class="project_insert_text_title">프로젝트 제목</div>
			<input type="text" id="project_insert_text" placeholder="프로젝트 제목을 입력해 주세요. (최대 30자)">
			<div class="project_insert_text_title">프로젝트 내용</div>
			<textarea id="project_insert_textarea" rows="" cols="" placeholder="프로젝트 내용을 입력해 주세요. (최대 100자)"></textarea>
			<div class="project_insert_menu_wrap">
				<div class="project_insert_text_title">프로젝트 공개 설정</div>
				<div class="project_insert_question_mark"><i class="fa-solid fa-circle-question circle_question"></i>
					<div class="project_insert_question_content">공개 설정시 사원 누구나 참여가 가능합니다.<br>비공개 설정시 초대 받은 사원만 참여가 가능합니다.</div>
				</div>
				<div class="project_insert_toggle_btn_wrap" toggle_chk="f">
					<div class="project_insert_toggle_btn_circle"></div>
				</div>
			</div>
			<div class="project_insert_menu_wrap">
				<div class="project_insert_text_title">관리자 승인 후 참여</div>
				<div class="project_insert_question_mark"><i class="fa-solid fa-circle-question circle_question"></i>
					<div class="project_insert_question_content">프로젝트 참여시 관리자 승인 필요 여부</div>
				</div>
				<div class="project_insert_toggle_btn_wrap" toggle_chk="f">
					<div class="project_insert_toggle_btn_circle"></div>
				</div>
			</div>
			<button id="project_insert_btn">생성</button>
		</div>
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
		} else if($(this).attr("toggle_chk") == 't') {
			$(this).children(".project_insert_toggle_btn_circle").css({
				'left': '2.5px',
			});
			$(this).css("background-color", "gray");
			$(this).attr("toggle_chk", 'f');
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
</body>
</html>