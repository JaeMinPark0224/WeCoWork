<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<head>
<style type="text/css">
#intro_wrap {
	
}

#intro_grid {
	display: grid;
	grid-template-columns: 600px 270px 270px;
	grid-template-rows: 440px 215px;
	row-gap: 40px;
	column-gap: 30px;
}

#intro_wecowork {
}

#intro_join {
}

#intro_login {
}

#intro_footer {
	grid-column: 1 / 4;
	background-color: rgb(250, 250, 250);
	padding-right: 40px;
}

#intro_wecowork_img {
	max-width: 600px;
	max-height: 440px;
}

#intro_join_img {
	max-width: 270px;
	max-height: 440px;
	cursor: pointer;
}

#intro_login_img {
	max-width: 270px;
	max-height: 440px;
	cursor: pointer;
}

#intro_footer_wrap {
	margin-top: 72.5px; 
}

.intro_footer_text {
	text-align: right;
	font-size: 12px;
	color: rgb(190, 190, 190);
	font-family: NotoSansR;
	height: 17px;
	line-height: 17px;
}
</style>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<div id="intro_wrap">
	<div id="intro_grid">
		<div id="intro_wecowork">
			<img id="intro_wecowork_img" alt="" src="<%= request.getContextPath()%>/resources/images/first_big.png">
		</div>
		<div id="intro_join">
			<img id="intro_join_img" alt="" src="<%= request.getContextPath()%>/resources/images/second_big.png">
		</div>
		<div id="intro_login">
			<img id="intro_login_img" alt="" src="<%= request.getContextPath()%>/resources/images/th_big.png">
		</div>
		<div id="intro_footer">
			<div id="intro_footer_wrap">
				<div class="intro_footer_text">&#169;WeCoWork Corp. All rights reserved.</div>
				<div class="intro_footer_text">서울 강남구 테헤란로 152 강남파이낸스센터 4301호</div>
				<div class="intro_footer_text">152, Teheran-ro, Gangnam-gu, Seoul, Republic of Korea</div>
				<div class="intro_footer_text">사업자등록번호 : 851-87-00622</div>
				<div class="intro_footer_text">WeCoWork@emal.com</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$("#intro_login_img").on("click", function() {
		location.href="<%= request.getContextPath()%>/login";
	});
	
	$("#intro_join_img").on("click", function() {
		location.href="<%= request.getContextPath()%>/join";	
	});
</script>
</html>