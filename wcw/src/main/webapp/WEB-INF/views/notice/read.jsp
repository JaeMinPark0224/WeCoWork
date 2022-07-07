<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/notice/read.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 조회</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>

</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id=noticeSection>
	<div id="noticePageTitle">공지 조회</div>
	<div class="noticeMain">
		<div class="noticeDateDiv">
			공지일
		</div>
		<div class="noticeDate">
			${notice.nt_date }
		</div>
		<div class="noticeTitleDiv">
			공지제목
		</div>
		<div class="noticeTitl">
			${notice.nt_title }
		</div>
		<div class="noticeContentDiv">
			공지내용
		</div>
		<div class="noticeContent">
			${notice.nt_content }
		</div>
		<hr>
		<div class="noticeCountDiv">
			조회수
		</div>
		<div class="noticeCount">
			<!-- 조회수표기 -->
		</div>
		<button class="Btn" type="button" onclick="location.href='<%= request.getContextPath() %>/notice/list'">확인</button>
	</div>
	
	
	
	
</section>
<script type="text/javascript">
	$(".noticeCount").text(${notice.nt_cnt }+1);
</script>
</body>
</html>