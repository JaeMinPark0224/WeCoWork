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
	<%@ include file="/WEB-INF/views/project/projectheader.jsp" %>
	<div id="project_todo_header_wrap">
		<div id="project_todo_header_date">2022-06-10</div>
		<div id="project_todo_header_progress">50%</div>
		<div id="project_todo_header_progress_bar_wrap">
			<div id="project_todo_header_progress_bar"></div>
		</div>
	</div>
	<div id="project_todo_content_wrap">
		<div id="project_todo_content_flex_box">
			<div id="project_todo_content_flex_box_head"></div>
			<div id="project_todo_content_flex_box_body">
				<div class="project_todo_chk_box"></div>
				<div class="project_todo_list_title">[13:00] 할일 목록 이름</div>
				<div class="project_todo_chk_box"></div>
				<div class="project_todo_list_title">[13:00] 할일 목록 이름</div>
				<div class="project_todo_chk_box"></div>
				<div class="project_todo_list_title">[13:00] 할일 목록 이름</div>
				<div class="project_todo_chk_box"></div>
				<div class="project_todo_list_title">[13:00] 할일 목록 이름</div>
				<div class="project_todo_chk_box"></div>
				<div class="project_todo_list_title">[13:00] 할일 목록 이름</div>
			</div>
		</div>
	</div>
	</div>
</section>
<script type="text/javascript">
	$("#project_main_tab_wrap").append("<button id='project_work_update_btn'>업무 수정</button>");
	$("#project_main_tab_wrap").append("<button id='project_work_delete_btn'>업무 삭제</button>");
</script>
</body>
</html>