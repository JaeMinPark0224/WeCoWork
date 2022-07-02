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
<title>알림 리스트</title>
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
.CheckDiv{
	font-size: 13px;
}
.AllCheck{
	margin-left: 11px;
}
.CheckText{
	height: 20px;
	line-height: 20px;
	display: inline-block;
	vertical-align: bottom;
}
.AllCheck{
	vertical-align: bottom;
}
.verLine{
	border-left: thin solid red;
	height: 15px;
	width: 20px;
	display: inline-block;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="noticeSection">
	<div id="noticePageTitle">알림 리스트</div>
	<div class="CheckDiv">
	<div class="CheckText">전체선택</div>
		<input class="AllCheck" type="checkbox">
		<div class="verLine"></div>
	</div>

</section>

</body>
</html>