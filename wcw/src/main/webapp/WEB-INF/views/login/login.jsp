<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/login/login.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section>
	<div id="section">
		<div id="top">
	        <p id="top_text">로그인</p>
	    </div>
	    <div id="mid">
	        <p id="mid_text">WeCoWork 로그인</p>
	        <form action="login.do" method="post">
	            <div id="f_section">
	                <input type="text" placeholder=" 이메일(아이디)" name="email" id="email" required></input><br>
	                <input type="password" placeholder=" 비밀번호" name="pwd" id="pwd" required></input><br>
	            </div>
	            <div id="m_section">
	                <input type="checkbox" name="autoLogin" id="autoLogin"><label for="autoLogin"> 자동 로그인</label>
	                <input type="checkbox" name="saveId" id="saveId"><label for="saveId"> 아이디 저장</label>
	                <span id="findPwd">비밀번호 찾기</span>
	            </div>
	            <input type="submit" id="login" name="login" value="로그인">
	        </form>
	        <div id="last">
	            <span class="last_text" id="last_text_1">
	                ⓒ WeCoWork Corp.
	            </span>
	            <span class="last_text" id="last_text_2">
	                All rights reserved
	            </span>
	        </div>
	    </div>
    </div>
</section>
<script>
	$("#findPwd").click(function(){
		location.href="/wcw/find/pwd";
	})
</script>
</body>
</html>