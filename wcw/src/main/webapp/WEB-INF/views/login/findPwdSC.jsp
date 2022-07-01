<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/login/findPwdSC.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
	<section>
        <div id="section">
            <div id="mid">
                <p id="mid_text">비밀번호 찾기</p>
                    <div id="f_section">
                        <p id="id_text">아이디: ${emailInfo}</p>
                        <p id="pwd_text">비밀번호: ${pwdInfo}</p>
                    </div>
                    <div id="f_btn">
                        <input type="button" id="go_login" name="go_login" value="로그인">
                        <input type="button" id="ok" name="ok" value="확인">
                    </div>
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
	$("#go_login").click(function(){
		location.href="/wcw/login";
	})
	$("#ok").click(function(){
		location.href="/wcw/";
	})
</script>
</body>
</html>