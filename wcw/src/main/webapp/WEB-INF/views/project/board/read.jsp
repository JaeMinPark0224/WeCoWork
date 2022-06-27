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
		<div id="project_main_profile_wrap">
			<div id="project_main_profile_picture_wrap">
			</div>
			<div id="project_main_profile_info_wrap">
				<div class="project_main_profile_info">해외영업팀</div>
				<div class="project_main_profile_info_wrap">
					<div class="project_main_profile_info_name">박재민</div>
					<div class="project_main_profile_info">사원</div>
				</div>
				<div class="project_main_profile_info">2022 - 06 - 06 / 09 : 34</div>
			</div>
		</div>
		<div id="project_board_read_wrap">
			<div class="project_board_read_title">게시물 제목</div>
			<div class="project_board_read_content">프로젝트 게시물 제목입니다</div>
			<div class="project_board_read_title">게시물 내용</div>
			<div class="project_board_read_content">게시물 내용 출력게시물 내용 출력
			게시물 내용 출력게시물 내용 출력게시물 내용 출력
			게시물 내용 출력게시물 내용 출력게시물 내용 출력게시물 내용 출력
			게시물 내용 출력게시물 내용 출력게시물 내용 출력게시물 내용 출력</div>
			<div class="project_board_read_hr"></div>
			<div class="project_board_read_title">파일 업로드</div>
			<div class="project_board_read_content">파일 이름.jpg</div>
			<div class="project_board_read_title">해시 태그</div>
			<div class="project_board_read_content">#태그1, #태그2</div>
			<div class="project_board_read_title">멘션</div>
			<div class="project_board_read_content">@멘션1, @멘션2</div>
			<button class="project_board_read_btn">확인</button>
		</div>
	</div>
</section>
</body>
</html>