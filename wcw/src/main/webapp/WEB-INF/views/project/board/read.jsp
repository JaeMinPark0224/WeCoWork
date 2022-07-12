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
				<div class="project_main_profile_info">${project.dept_name }</div>
				<div class="project_main_profile_info_wrap">
					<div class="project_main_profile_info_name">${project.name }</div>
					<div class="project_main_profile_info">${project.job_title }</div>
				</div>
				<div class="project_main_profile_info">${project.pb_date }</div>
			</div>
		</div>
		<div id="project_board_read_wrap">
			<div class="project_board_read_title">게시물 제목</div>
			<div class="project_board_read_content">${project.pb_title }</div>
			<div class="project_board_read_title">게시물 내용</div>
			<div class="project_board_read_content">${project.pb_content }</div>
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
<script type="text/javascript">
	$('.project_board_read_btn').on('click', function() {
		location.href = "<%= request.getContextPath()%>/project/board/list/?project=${pr_no}";
	})
</script>
</body>
</html>