<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 조회</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<style type="text/css">
#noticeSection {
	margin-left: 65px;
	font-family: NotoSansB;
}
#noticePageTitle {
	margin-top: 105px;
	margin-bottom:70px;
	font-size: 14px;
	color: rgb(75, 77, 178);
	
}
.noticeMain{
	margin-left: 360px;
	width: 375px;
}
.noticeMain{
	font-size: 13px;
}
.noticeDateDiv,.noticeTitleDiv,.noticeContentDiv,.noticeCountDiv{
	margin-bottom: 23px;
 }
.noticeDate, .noticeTitl{
 	margin-bottom: 65px;
 }
.noticeCountDiv{
 	margin-top: 65px;
 }
.noticeTitl,.noticeContent{
 	width: 376px;
 }
.noticeContent{
 	height: 260px;
 }
 .noticeDate, .noticeTitl,.noticeContent,.noticeCount{
 	color: rgb(94, 94, 94);
 }
 .Btn{
 	cursor: pointer;
 	margin-left:129px;
 	width: 115px;
 	height: 40px;
 	margin-top: 76px;
 	margin-bottom: 220px;
 	color: white;
 	background: rgb(75, 77, 178);
 }
</style>
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