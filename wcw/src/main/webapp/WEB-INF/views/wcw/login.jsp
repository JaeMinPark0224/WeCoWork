<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>WCW 개발자용 로그인 페이지</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<style>
	section{
		font-family: NotoSansR;
        font-size: 13px;
		width: 1200px;
		margin: 0 auto;
	}
	#logo{
		width: 180px;
		margin-top: 50px;
		margin-bottom: 200px;
		margin-left: 0px;
	}
	#title{
		font-family: NotoSansB;
        font-size: 16px;
		margin: 0 auto;
		width: 200px;
		text-align: center;
		margin-bottom: 60px;
		color: rgb(94, 94, 94);
	}
	#form_div{
		width: 300px;
		margin: 0 auto;
		text-align: center;
	}
	.txt{
		display: inline-block;
		width: 75px;
		text-align: left;
		margin-bottom: 8px;
	}
	#login_btn{
		width: 250px;
		height: 40px;
		margin-top: 30px;
		border: 0px;
	}
	input {
		font-family: NotoSansR;
        font-size: 12px;
	}
</style>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
</head>
<body>
<section>
	<img id="logo" src="<%= request.getContextPath() %>/resources/images/logo.png">
	<p id="title">WCW 전용 로그인</p>
	<div id="form_div">
		<form action="<%= request.getContextPath() %>/dp/login.do" method="post">
		<span class="txt">아이디</span>
		<input type="text" name="id" id="id" required><br>
		
		<span class="txt">비밀번호</span>
		<input type="password" name="pwd" id="pwd" required>
		
		<input id="login_btn" type="submit" value="로그인">
	</form>
	</div>
</section>
</body>
</html>