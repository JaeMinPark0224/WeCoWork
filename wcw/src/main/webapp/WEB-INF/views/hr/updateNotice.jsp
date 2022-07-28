<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/hr/updateNotice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="section">
    <span id="title">공지 수정</span>
    <form id="submit" action="<%= request.getContextPath() %>/hr/notice/update.do" method="post">
        <div id="content">
            <div id="input">
                <p class="content_txt">공지사항 제목</p>
                <input type="text" id="noti_title" name="nt_title" maxlength="100" placeholder=" 공지사항 제목을 입력하세요." value="${notice.nt_title}" required>
                <p class="content_txt">공지사항 내용</p>
                <textarea id="noti_content" name="nt_content" maxlength="300" placeholder=" 공지사항 내용을 입력하세요." required>${notice.nt_content}</textarea>
            </div>
            <input type="hidden" name="nt_no" value="${notice.nt_no}">
            <input type="submit" id="ok_btn" value="수정">
        </div>
    </form>
</section>
</body>
</html>