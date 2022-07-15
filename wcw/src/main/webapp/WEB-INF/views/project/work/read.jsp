<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/project/project.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
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
		<div id="project_work_read_profile_wrap">
			<div id="project_work_read_profile_pic"></div>
			<div id="project_work_read_profile_text_wrap">
				<div class="project_work_read_profile_text">${work.dept_name }</div>
				<div class="project_work_read_profile_text"><span class="font_b">${work.name }</span> 사원</div>
				<div class="project_work_read_profile_text">${fn:substring(work.pw_date,0,16) }</div>
			</div>
		</div>
		<div id="project_work_read_content_wrap">
			<div id="project_work_read_content_grid_box">
				<div class="project_work_read_content_left">업무명</div>
				<div class="project_work_read_content_right"><span class="font_12px">${work.pw_title }</span></div>
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
						<div class="project_work_read_content_date">시작일: ${fn:substring(work.pw_start_date,0,16) }</div>
						<div class="project_work_read_content_date">종료일: ${fn:substring(work.pw_end_date,0,16) }</div>
					</div>
				</div>
				<div class="project_work_read_content_left">내용</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_content">${work.pw_content }</div>
				</div>
				<div class="project_work_read_content_left">하위업무</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_sub_work">
						<i class="fa-solid fa-chevron-down project_work_read_sub_work_btn"></i>
						<button class="project_work_read_sub_work_add_btn">하위 업무 추가</button>
					</div>
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
	$("#project_main_tab_wrap").append("<button id='project_work_update_btn'>업무 수정</button>");
	$("#project_main_tab_wrap").append("<button id='project_work_delete_btn'>업무 삭제</button>");
	
	
	var stateRgb1 = 'rgb(87, 184, 184)';
	var stateRgb2 = 'rgb(230, 126, 34)';
	var stateRgb3 = 'rgb(231, 76, 60)';
	var stateRgb4 = 'rgb(94, 94, 94)';
	var stateRgb5 = 'rgb(75, 77, 178)';
	console.log($(".project_work_read_content_state").eq(${work.pw_status - 1}));
	$(".project_work_read_content_state").eq(${work.pw_status - 1}).css({
		'background-color' : stateRgb${work.pw_status},
		'color' : 'white'
	});
	
	$(".project_work_read_content_state").css("cursor", "default");
</script>
</body>
</html>