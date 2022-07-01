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
		<div id="project_main_container">
			<div id="project_main_box_title">
				<div id="project_main_box_title_title">프로젝트 제목</div>
				<div id="project_main_box_title_content"></div>
				<div id="project_main_box_title_company">머슬톡톡</div>
				<div id="project_main_box_title_participant"></div>
			</div>
			<div class="project_main_box">
				<div class="project_main_box_top">
					<div class="project_main_box_title">공지</div>
				</div>
				<div class="project_main_box_container">
					<div class="project_main_box_content_title">공지 제목 제목 제목 [댓글수]</div>
					<div class="project_main_box_content_date">2022.06.17</div>
					<div class="project_main_box_content_title">공지 제목 제목 제목 [댓글수]</div>
					<div class="project_main_box_content_date">2022.06.17</div>
					<div class="project_main_box_content_title">공지 제목 제목 제목 [댓글수]</div>
					<div class="project_main_box_content_date">2022.06.17</div>
					<div class="project_main_box_content_title">공지 제목 제목 제목 [댓글수]</div>
					<div class="project_main_box_content_date">2022.06.17</div>
					<div class="project_main_box_content_title">공지 제목 제목 제목 [댓글수]</div>
					<div class="project_main_box_content_date">2022.06.17</div>
				</div>
			</div>
			<div class="project_main_box">
				<div class="project_main_box_top">
					<div class="project_main_box_title">게시판</div>
				</div>
				<div class="project_main_box_container">
					<div class="project_main_box_content_title">게시판 제목 제목 제목 [댓글수]</div>
					<div class="project_main_box_content_date">2022.06.17</div>
					<div class="project_main_box_content_title">게시판 제목 제목 제목 [댓글수]</div>
					<div class="project_main_box_content_date">2022.06.17</div>
					<div class="project_main_box_content_title">게시판 제목 제목 제목 [댓글수]</div>
					<div class="project_main_box_content_date">2022.06.17</div>
					<div class="project_main_box_content_title">게시판 제목 제목 제목 [댓글수]</div>
					<div class="project_main_box_content_date">2022.06.17</div>
					<div class="project_main_box_content_title">게시판 제목 제목 제목 [댓글수]</div>
					<div class="project_main_box_content_date">2022.06.17</div>
				</div>
			</div>
		</div>
	</div>
</section>

</body>
</html>