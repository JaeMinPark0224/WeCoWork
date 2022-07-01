<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/login/findPwd.css">
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
                <form action="<%= request.getContextPath() %>/find/pwd.do" method="post">
                    <div id="f_section">
                        <input type="text" placeholder=" 회사명" name="cp" id="cp" required></input><br>
                        <input type="text" placeholder=" 이메일(아이디)" name="email" id="email" required></input>
                        <input type="button" value="인증하기" id="email_btn_1">
                        <input type="button" value="인증완료" id="email_btn_2"><br>
                        <input type="text" placeholder="성명" name="name" id="name" required></input><br>
                    </div>
                    <div id="f_btn">
                        <input type="button" id="cancel" name="cancel" value="취소">
                        <input type="submit" id="find_pwd" name="find_pwd" value="확인">
                    </div>
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
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
</body>
</html>