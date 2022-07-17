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
			<c:forEach items="${workList }" var="work">
				<c:choose>
					<c:when test="${work.pw_order eq 0 }">
						<div class="project_work_body_content">
							<div class="project_work_header_content sub_work_content"><i class="fa-solid fa-chevron-down sub_work_list_btn" openChk="f"></i></div>
							<div class="project_work_header_content work_state_content">
								<div class="work_state_div work_state_type${work.pw_status }"><c:choose>
									<c:when test="${work.pw_status eq 1}">요청</c:when>
									<c:when test="${work.pw_status eq 2}">진행</c:when>
									<c:when test="${work.pw_status eq 3}">보류</c:when>
									<c:when test="${work.pw_status eq 4}">완료</c:when>
									<c:when test="${work.pw_status eq 5}">피드백</c:when>
								</c:choose></div>
							</div>
							<div class="project_work_header_content work_rank_content"><c:choose>
								<c:when test="${work.pw_priority eq 1 }"><i class="fa-solid fa-arrow-up work_rank_arrow"></i></c:when>
								<c:when test="${work.pw_priority eq 2 }"><i class="fa-solid fa-minus work_rank_arrow"></i></c:when>
								<c:when test="${work.pw_priority eq 3 }"><i class="fa-solid fa-arrow-down work_rank_arrow"></i></c:when>
							</c:choose></div>
							<div class="project_work_header_content work_name_content work_name_content_left"><span class="work_title_span" pw_no = "${work.pw_no }">${work.pw_title }</span></div>
							<div class="project_work_header_content work_manager_content">${work.name }</div>
							<div class="project_work_header_content work_date_content">${fn:substring(work.pw_date,0,10) }</div>
						</div>
					</c:when>
					<c:when test="${work.pw_order ne 0 }">
						<div class="project_work_body_sub_content">
							<div class="project_work_header_content sub_work_content"></div>
							<div class="project_work_header_content work_state_content">
								<div class="work_state_div work_state_type${work.pw_status }"><c:choose>
									<c:when test="${work.pw_status eq 1}">요청</c:when>
									<c:when test="${work.pw_status eq 2}">진행</c:when>
									<c:when test="${work.pw_status eq 3}">보류</c:when>
									<c:when test="${work.pw_status eq 4}">완료</c:when>
									<c:when test="${work.pw_status eq 5}">피드백</c:when>
								</c:choose></div>
							</div>
							<div class="project_work_header_content work_rank_content"><c:choose>
								<c:when test="${work.pw_priority eq 1 }"><i class="fa-solid fa-arrow-up work_rank_arrow"></i></c:when>
								<c:when test="${work.pw_priority eq 2 }"><i class="fa-solid fa-minus work_rank_arrow"></i></c:when>
								<c:when test="${work.pw_priority eq 3 }"><i class="fa-solid fa-arrow-down work_rank_arrow"></i></c:when>
							</c:choose></div>
							<div class="project_work_header_content work_name_content work_name_content_left"><span class="work_title_span" pw_no = "${work.pw_no }">${work.pw_title }</span></div>
							<div class="project_work_header_content work_manager_content">${work.name }</div>
							<div class="project_work_header_content work_date_content">${fn:substring(work.pw_date,0,10) }</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	// 프로젝트 번호
	var js_pr_no = (new URL(location.href).searchParams).get('project');
	
	// projectheader에 버튼 추가
	$("#project_main_tab_wrap").append("<div id='project_work_insert_btn_wrap'><button id='project_work_insert_btn'>업무 추가</button></div>");
	
	// 업무 추가 버튼 이벤트 등록
	$("#project_work_insert_btn").on("click", function() {
		location.href = "<%= request.getContextPath()%>/project/work/insert?project="+js_pr_no;
	});
	
	// 업무 읽기 기능 이벤트 등록
	$('.work_title_span').on("click", function() {
		let pw_no = $(this).attr("pw_no");
		location.href = "<%= request.getContextPath()%>/project/work/read?project="+js_pr_no+"&no="+pw_no;	
	});
	
	// 하위 업무가 업는 업무의 하위 업무 펼치기 버튼 삭제
	for (var i = 0; i < $(".project_work_body_content").length; i++) {
		if(!$(".project_work_body_content").eq(i).next().hasClass("project_work_body_sub_content")) {
			$(".project_work_body_content").eq(i).find(".sub_work_list_btn").remove();
		}
	}
	
	// 하위 업무들 묶기
	var prevIndex = 0;
	for(var i = 0; i < $(".project_work_body_sub_content").length; i++) {
		if($(".project_work_body_sub_content").eq(i).next().hasClass("project_work_body_content") || i == $(".project_work_body_sub_content").length - 1) {
			$(".project_work_body_sub_content").slice(prevIndex, i+1).wrapAll('<div class="sub_work_slide_div"></div>');
			prevIndex = i + 1;
		}
	}
	
	// 하위 업무 펼치기
	$(".sub_work_list_btn").on("click", function() {
		let $subList = $(this).parents(".project_work_body_content").next();
		// 하위 업무가 존재한다면
		if($subList.hasClass("sub_work_slide_div")) {
			// 하위 업무 리스트가 닫혀 있다면
			if($(this).attr("openChk") == "f"){
				$subList.slideDown({
					duration: 400
				});
				$(this).attr("openChk", "t");
				$(this).css({
					"transform" : "rotate(180deg)"
				});
			}
			// 하위 업무 리스트가 열려 있다면
			else if($(this).attr("openChk") == "t") {
				$subList.slideUp({
					duration: 400
				});
				$(this).attr("openChk", "f");	
				$(this).css({
					"transform" : "rotate(0deg)"
				});
			}
		}
	});
</script>
</body>
</html>