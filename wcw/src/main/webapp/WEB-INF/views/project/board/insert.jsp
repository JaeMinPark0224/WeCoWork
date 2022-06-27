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
	<div id="project_board_insert_wrap">
		<div class="project_board_insert_content">
			<div class="project_board_insert_div_title">게시물 제목</div>
			<input type="text" class="project_board_insert_input_text">
		</div>
		<div class="project_board_insert_content">
			<div class="project_board_insert_div_title">게시물 내용</div>
			<textarea class="project_board_insert_textarea"></textarea>
		</div>
		<div class="project_board_insert_content">
			<div class="project_board_insert_div_title">파일 업로드</div>
			<input type="text" class="project_board_insert_input_text">
		</div>
		<div class="project_board_insert_content">
			<div class="project_board_insert_div_title">해시 태그</div>
			<input type="text" class="project_board_insert_input_text">
			<button class="project_board_insert_btn">추가</button>
		</div>
		<div class="project_board_insert_content">
			<div class="project_board_insert_div_title">멘션</div>
			<div class="project_board_insert_mention">
				<div class="project_board_insert_mention_title">전체 멘션</div>
				<div class="project_board_insert_mention_toggle">
					<div class="project_board_insert_mention_toggle_circle"></div>
				</div>
				<div class="project_board_insert_mention_title">관리자 멘션</div>
				<div class="project_board_insert_mention_toggle">
					<div class="project_board_insert_mention_toggle_circle"></div>
				</div>
			</div>
			<input type="text" class="project_board_insert_input_text">
			<button class="project_board_insert_btn">추가</button>
		</div>
		<button class="project_board_insert_write_btn">추가</button>
	</div>
	</div>
</section>
</body>
</html>