<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/hr/selectNotice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id=section>
	<div class="title">공지사항</div>
	<div class="content">
		<div class="ct_title">
			공지일
		</div>
		<div class="ct_content">
			${notice.nt_date}
		</div>
		<div class="ct_title">
			공지제목
		</div>
		<div class="ct_content">
			${notice.nt_title}
		</div>
		<div class="ct_title">
			공지내용
		</div>
		<div class="ct_content">
			${notice.nt_content}
		</div>
		<form action="<%= request.getContextPath() %>/hr/notice/update" method="post" name="form">
			<input type="hidden" id="num" name="num" value="${notice.nt_no}">
		</form>
		<div id="btns">
			<div>
				<input type="button" class="btn" id="del_btn" value="삭제">
				<input type="button" class="btn" id="edit_btn" value="수정">
				<input type="button" class="btn1" id="ok_btn" value="확인">
			</div>
		</div>
	</div>
</section>
<script>
// 삭제 버튼 클릭 시
$('#del_btn').click(function(){
	var num = $('#num').val();
	location.href="<%= request.getContextPath() %>/hr/notice/delete?num="+num;
})

// 수정 버튼 클릭 시
$('#edit_btn').click(function(){
	document.form.submit();
})

// 확인 버튼 클릭 시
$('#ok_btn').click(function(){
	location.href="<%= request.getContextPath() %>/hr/notice/list";
})
</script>
</body>
</html>