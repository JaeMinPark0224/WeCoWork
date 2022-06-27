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
	<div id="project_board_list_container">
		<div class="project_board_list_flex_box">
			<div class="project_board_list_flex_box_header">공지</div>
			<div class="project_board_list_flex_box_body">
				<div class="project_board_list_flex_box_body_container">
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
				</div>
			</div>
		</div>
		<div class="project_board_list_flex_box">
			<div class="project_board_list_flex_box_header">상단고정</div>
			<div class="project_board_list_flex_box_body">
				<div class="project_board_list_flex_box_body_container_fix">
					<div class="project_board_fix"><img class="project_board_fix_btn" src="<%= request.getContextPath()%>/resources/images/thumbtack-full.svg"></div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_fix"><img class="project_board_fix_btn" src="<%= request.getContextPath()%>/resources/images/thumbtack-full.svg"></div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_fix"><img class="project_board_fix_btn" src="<%= request.getContextPath()%>/resources/images/thumbtack-full.svg"></div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_fix"><img class="project_board_fix_btn" src="<%= request.getContextPath()%>/resources/images/thumbtack-full.svg"></div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_fix"><img class="project_board_fix_btn" src="<%= request.getContextPath()%>/resources/images/thumbtack-full.svg"></div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
				</div>
			</div>
		</div>
		<div class="project_board_list_flex_box_board">
			<div class="project_board_list_flex_box_board_header">게시물</div>
			<div class="project_board_list_flex_box_board_body">
				<div class="project_board_list_flex_box_body_container_fix">
					<div class="project_board_fix"><img class="project_board_fix_btn" src="<%= request.getContextPath()%>/resources/images/thumbtack-blank.svg"></div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_fix"><img class="project_board_fix_btn" src="<%= request.getContextPath()%>/resources/images/thumbtack-blank.svg"></div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_fix"><img class="project_board_fix_btn" src="<%= request.getContextPath()%>/resources/images/thumbtack-blank.svg"></div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_fix"><img class="project_board_fix_btn" src="<%= request.getContextPath()%>/resources/images/thumbtack-blank.svg"></div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
					<div class="project_board_fix"><img class="project_board_fix_btn" src="<%= request.getContextPath()%>/resources/images/thumbtack-blank.svg"></div>
					<div class="project_board_title">공지사항 제목 공지사항 제목 공지사항 제목</div>
					<div class="project_board_writer">박재민 직급</div>
					<div class="project_board_date">2022.6.22</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
</body>
</html>