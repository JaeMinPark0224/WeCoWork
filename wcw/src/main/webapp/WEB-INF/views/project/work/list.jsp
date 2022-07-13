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
		<div id="project_work_wrap">
			<div id="project_work_header">
				<div class="project_work_header_content sub_work_content"></div>
				<div class="project_work_header_content work_state_content"><span class="font_12px">상태</span></div>
				<div class="project_work_header_content work_rank_content"><span class="font_12px">우선순위</span></div>
				<div class="project_work_header_content work_name_content"><span class="font_12px">업무명</span></div>
				<div class="project_work_header_content work_manager_content"><span class="font_12px">담당자</span></div>
				<div class="project_work_header_content work_date_content"><span class="font_12px">작성일</span></div>
			</div>
			<div id="project_work_body">
				<div class="project_work_body_content">
					<div class="project_work_header_content sub_work_content"><i class="fa-solid fa-chevron-down"></i></div>
					<div class="project_work_header_content work_state_content">
						<div class="work_state_div work_state_type1">요청</div>
					</div>
					<div class="project_work_header_content work_rank_content"><i class="fa-solid fa-arrow-up work_rank_arrow"></i></div>
					<div class="project_work_header_content work_name_content">업무명 2022.07.12까지 코딩 끝내기 2022.07.12까지 코딩 끝내기</div>
					<div class="project_work_header_content work_manager_content">박재민</div>
					<div class="project_work_header_content work_date_content">2022.06.27</div>
				</div>
				<div class="project_work_body_content">
					<div class="project_work_header_content sub_work_content"><i class="fa-solid fa-chevron-down"></i></div>
					<div class="project_work_header_content work_state_content">
						<div class="work_state_div work_state_type2">진행</div>
					</div>
					<div class="project_work_header_content work_rank_content"><i class="fa-solid fa-arrow-up work_rank_arrow"></i></div>
					<div class="project_work_header_content work_name_content">업무명 2022.07.12까지 코딩 끝내기 2022.07.12까지 코딩 끝내기</div>
					<div class="project_work_header_content work_manager_content">박재민</div>
					<div class="project_work_header_content work_date_content">2022.06.27</div>
				</div>
				<div class="project_work_body_content">
					<div class="project_work_header_content sub_work_content"><i class="fa-solid fa-chevron-down"></i></div>
					<div class="project_work_header_content work_state_content">
						<div class="work_state_div work_state_type3">보류</div>
					</div>
					<div class="project_work_header_content work_rank_content"><i class="fa-solid fa-minus work_rank_arrow"></i></div>
					<div class="project_work_header_content work_name_content">업무명 2022.07.12까지 코딩 끝내기 2022.07.12까지 코딩 끝내기</div>
					<div class="project_work_header_content work_manager_content">박재민</div>
					<div class="project_work_header_content work_date_content">2022.06.27</div>
				</div>
				<div class="project_work_body_content">
					<div class="project_work_header_content sub_work_content"><i class="fa-solid fa-chevron-down"></i></div>
					<div class="project_work_header_content work_state_content">
						<div class="work_state_div work_state_type4">완료</div>
					</div>
					<div class="project_work_header_content work_rank_content"><i class="fa-solid fa-arrow-down work_rank_arrow"></i></div>
					<div class="project_work_header_content work_name_content">업무명 2022.07.12까지 코딩 끝내기 2022.07.12까지 코딩 끝내기</div>
					<div class="project_work_header_content work_manager_content">박재민</div>
					<div class="project_work_header_content work_date_content">2022.06.27</div>
				</div>
				<div class="project_work_body_content">
					<div class="project_work_header_content sub_work_content"><i class="fa-solid fa-chevron-down"></i></div>
					<div class="project_work_header_content work_state_content">
						<div class="work_state_div work_state_type5">피드백</div>
					</div>
					<div class="project_work_header_content work_rank_content"><i class="fa-solid fa-arrow-down work_rank_arrow"></i></div>
					<div class="project_work_header_content work_name_content">업무명 2022.07.12까지 코딩 끝내기 2022.07.12까지 코딩 끝내기</div>
					<div class="project_work_header_content work_manager_content">박재민</div>
					<div class="project_work_header_content work_date_content">2022.06.27</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	// projectheader에 버튼 추가
	$("#project_main_tab_wrap").append("<div id='project_work_insert_btn_wrap'><button id='project_work_insert_btn'>업무 추가</button></div>");
	
	// 업무 추가 버튼 이벤트 등록
	$("#project_work_insert_btn").on("click", function() {
		location.href = "<%= request.getContextPath()%>/project/work/insert?project=${pr_no}";
	});
</script>
</body>
</html>