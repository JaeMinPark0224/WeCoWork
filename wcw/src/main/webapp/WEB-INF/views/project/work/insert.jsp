<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/project/project.css">
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
	<div id="project_work_read_wrap">
		<div id="project_work_read_content_wrap">
			<div id="project_work_read_content_grid_box">
				<div class="project_work_read_content_left">업무명</div>
				<div class="project_work_read_content_right">
					<input type="text" id="project_work_title_input_text">
				</div>
				<div class="project_work_read_content_hr"></div>
				<div class="project_work_read_content_left">상태</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_state_wrap">
						<div class="project_work_read_content_state">요청</div>
						<div class="project_work_read_content_state">진행</div>
						<div class="project_work_read_content_state">보류</div>
						<div class="project_work_read_content_state">완료</div>
						<div class="project_work_read_content_state">피드백</div>
					</div>
				</div>
				<div class="project_work_read_content_left">업무자</div>
				<div class="project_work_read_content_right">
					<button type="button" id="project_work_worker_add_btn">업무자 추가</button>
					<div class="project_work_read_content_worker_wrap">
						<div class="project_work_read_content_worker">박재민</div>
						<div class="project_work_read_content_worker">서유빈</div>
						<div class="project_work_read_content_worker">이진정</div>
						<div class="project_work_read_content_worker">민승택</div>
						<div class="project_work_read_content_worker">박재민</div>
						<div class="project_work_read_content_worker">서유빈</div>
						<div class="project_work_read_content_worker">이진정</div>
						<div class="project_work_read_content_worker">민승택</div>
					</div>
				</div>
				<div class="project_work_read_content_left">일정</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_date_wrap">
						<div class="project_work_read_content_date_input_wrap">
							<div class="project_work_read_content_date_input_text">시작일</div>
							<input class="project_work_read_content_date_input_date" type="datetime-local">
						</div>
						<div class="project_work_read_content_date_input_wrap">
							<div class="project_work_read_content_date_input_text">종료일</div>
							<input class="project_work_read_content_date_input_date" type="datetime-local">
						</div>
					</div>
				</div>
				<div class="project_work_read_content_left">내용</div>
				<div class="project_work_read_content_right">
					<textarea id="project_work_content_input_textarea"></textarea>
				</div>
				<div class="project_work_read_content_hr"></div>
				<div class="project_work_read_content_left">댓글</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_comment_profile"></div>
					<div class="project_work_read_comment_input_wrap">
						<input type="text" class="project_work_read_comment_input_text">
						<button class="project_work_read_comment_insert_btn">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
<script type="text/javascript">
	$('.project_work_read_content_state').css("cursor", "pointer");
</script>
</body>
</html>