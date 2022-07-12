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
	<div id="project_main_wrap">
	<div id="project_main_menu_title">게시물 작성</div>
		<form action="<%= request.getContextPath()%>/project/board/insert.do" method="post">
			<input type="hidden" value="${pr_no }" name="pr_no">
			<div id="project_board_insert_wrap">
				<div class="project_board_insert_content">
					<div class="project_board_insert_div_title">게시물 제목</div>
					<div class="project_input_wrap">
						<input type="text" class="project_board_insert_input_text" name="pb_title" id="pb_title" placeholder="게시물 제목을 입력해 주세요. (최대 30자)">
						<div class="project_board_input_count">0/30자</div>
					</div>
				</div>
				<div class="project_board_insert_content">
					<div class="project_board_insert_div_title">게시물 내용</div>
					<div class="project_input_wrap">
						<textarea class="project_board_insert_textarea" name="pb_content" id="pb_content" placeholder="프로젝트 내용을 입력해 주세요. (최대 600자)"></textarea>
						<div class="project_board_input_count">0/600자</div>
					</div>
				</div>
				<div class="project_board_insert_content">
					<div class="project_board_insert_div_title">파일 업로드</div>
					<input type="text" class="project_board_insert_input_text">
				</div>
				<div class="project_board_insert_content">
					<div class="project_board_insert_div_title">해시 태그</div>
					<input type="text" class="project_board_insert_input_text">
					<button type="button" class="project_board_insert_btn">추가</button>
				</div>
				<div class="project_board_insert_content">
					<div class="project_board_insert_div_title">멘션</div>
					<div class="project_board_insert_mention">
						<div class="project_board_insert_mention_title">전체 멘션</div>
						<div class="project_insert_toggle_btn_wrap" toggle_chk="f">
							<div class="project_insert_toggle_btn_circle"></div>
							<input type="hidden" name="mention_all" class="project_insert_toggle_value" id="mention_all" value="N">
						</div>
						<div class="project_board_insert_mention_title">관리자 멘션</div>
						<div class="project_insert_toggle_btn_wrap" toggle_chk="f">
							<div class="project_insert_toggle_btn_circle"></div>
							<input type="hidden" name="mention_admin" class="project_insert_toggle_value" id="mention_admin" value="N">
						</div>
					</div>
					<input type="text" class="project_board_insert_input_text">
					<button type="button" class="project_board_insert_btn">추가</button>
				</div>
				<button type="submit" class="project_board_insert_write_btn">추가</button>
			</div>
		</form>
	</div>
</section>
<script type="text/javascript">
	$(".project_insert_toggle_btn_wrap").css("margin-top", "2.5px");
	$(".project_insert_toggle_btn_wrap").css("margin-right", "10px");
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
	
	$('#pb_title').on('input', function() {
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
	
	$('#pb_content').on('input', function() {
		let contentCount = $(this).val();
		if(contentCount.length == 0 || contentCount == '') {
			$(this).next().text('0/600자');
		} else {
			$(this).next().text(contentCount.length+'/600자');
		}
		if(contentCount.length > 600) {
			$(this).val($(this).val().substring(0, 600));
			alert('제목은 600자까지 입력 가능합니다.')
			$(this).next().text('600/600자');
		}
	});
	
</script>
</body>
</html>