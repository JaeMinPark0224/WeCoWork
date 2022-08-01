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
<script type="text/javascript">
	<c:if test="${not empty msg}">
		alert("${msg}");
	</c:if>
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="project_section">
	<div id="project_main_wrap">
	<%@ include file="/WEB-INF/views/project/projectheader.jsp" %>
		<div id="project_main_container">
			<div id="project_main_box_title">
				<div id="project_main_box_title_title">${project.pr_title }</div>
				<div id="project_main_box_title_content">${project.pr_content }</div>
				<div id="project_main_box_title_wrap">
					<div id="project_main_box_title_company">${project.cp_name }</div>
					<c:if test="${participant_cnt ne 0}">
						<div id="project_main_box_title_participant">${participant_name } 외${participant_cnt }명</div>
					</c:if>
					<c:if test="${participant_cnt eq 0}">
						<div id="project_main_box_title_participant">${participant_name }</div>
					</c:if>
				</div>
			</div>
			<div class="project_main_box">
				<div class="project_main_box_top">
					<div class="project_main_box_title">공지</div>
				</div>
				<div class="project_main_box_container">
					<c:forEach items="${noticeList }" var="notice">
						<div class="project_main_box_content_title"><span class="project_notice_title_span" pn_no="${notice.pn_no }">${notice.pn_title }</span></div>
						<div class="project_main_box_content_date">${fn:substring(notice.pn_date,0,10) }</div>
					</c:forEach>
				</div>
			</div>
			<div class="project_main_box">
				<div class="project_main_box_top">
					<div class="project_main_box_title">게시판</div>
				</div>
				<div class="project_main_box_container">
					<c:forEach items="${boardList }" var="board">
						<div class="project_main_box_content_title"><span class="project_board_title_span" pb_no="${board.pb_no }">${board.pb_title}</span></div>
						<div class="project_main_box_content_date">${fn:substring(board.pb_date,0,10) }</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
//공지사항 읽기 페이지 이동
$(".project_notice_title_span").on('click', function() {
	var pn_no = $(this).attr("pn_no");
	location.href = "<%= request.getContextPath()%>/project/notice/read?project=${pr_no}&no="+pn_no;	
});

//게시글 읽기 페이지 이동
$(".project_board_title_span").on("click", function() {
	var pb_no = $(this).attr("pb_no");
	location.href = "<%= request.getContextPath()%>/project/board/read?project=${pr_no}&no="+pb_no;
});

</script>
</body>
</html>