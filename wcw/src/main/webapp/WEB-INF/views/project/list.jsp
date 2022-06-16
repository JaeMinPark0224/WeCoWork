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
	<div id="project_wrap">
		<div id="project_title" class="font_b font_14px font_purple">프로젝트 리스트</div>
		<div id="project_tap_menu">
			<div class="project_tap">모든 프로젝트</div>
			<div class="project_tap">공개 프로젝트</div>
			<div class="project_tap">비공개 프로젝트</div>
			<div class="project_tap">완료 프로젝트</div>
			<div class="project_tap">참여한 프로젝트</div>
			<div id="project_list_text_box_wrap"><input id="project_list_text_box" type="text"></div>
		</div>
		<div id="project_list_wrap">
			<div class="project_list_block">
				<div class="project_list_color"></div>
				<div class="project_list_title">프로젝트 제목</div>
				<div class="project_list_update">업데이트 : 2022 06 16</div>
				<div class="project_list_dept">디자인팀 외 1</div>
				<img class="project_list_fix" src="<%= request.getContextPath()%>/resources/images/bahai-empty.svg">
			</div>
		</div>
	</div>
</section>
</body>
</html>