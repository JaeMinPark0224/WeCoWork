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
				<div id="project_main_box_title_company">${project.cp_name }</div>
				<div id="project_main_box_title_participant"></div>
			</div>
			<div class="project_main_box">
				<div class="project_main_box_top">
					<div class="project_main_box_title">공지</div>
				</div>
				<div class="project_main_box_container">
					<c:forEach items="${noticeList }" var="notice">
						<div class="project_main_box_content_title">${notice.pn_title }</div>
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
						<div class="project_main_box_content_title">${board.pb_title}</div>
						<div class="project_main_box_content_date">${fn:substring(board.pb_date,0,10) }</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>