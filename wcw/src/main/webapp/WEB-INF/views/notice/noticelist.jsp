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
<title>공지사항 리스트</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<style type="text/css">
	#noticeSection{
		margin-left: 65px;
		font-family: NotoSansB;
	}
	
	#noticePageTitle{
		margin-top: 105px;
		font-size: 14px;
		color: rgb(75, 77, 178);
	
	}
	.noticeTableFirstTr{
		font-size: 12px;
		color: rgb(94, 94, 94);
	}
</style>

</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="noticeSection">

	<div id="noticePageTitle">
		공지사항
	</div>
	<div class="noticeTable">
		<table>
			<tr class="noticeTableFirstTr">
				<td>공지번호</td>
				<td>공지제목</td>
				<td>공지일</td>
			</tr>
			<c:forEach items="${noticelist }" var="notice">
			<tr>
				<td>${notice.nt_no }</td>
				<td>${notice.nt_title }</td>
				<td>${notice.nt_date }</td>
			</tr>
			</c:forEach>
			
		</table>
		
	</div>
	





</section>
	
</body>
</html>