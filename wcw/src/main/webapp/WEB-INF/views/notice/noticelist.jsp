<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"
	crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
<%@ include file="/WEB-INF/views/template/font.jsp"%>
<style type="text/css">
#noticeSection {
	margin-left: 65px;
	font-family: NotoSansB;
}
.noticeBoard{
	height: 740px;
	width: 1070px;
	background-color: rgb(244, 244, 244);
}

#noticePageTitle {
	margin-top: 105px;
	margin-bottom:70px;
	font-size: 14px;
	color: rgb(75, 77, 178);
	
}
.noticeTable{
	text-align: center;
	width: 1070px;
}
.noticeNo{
	width: 59px;
} 
.noticeTableFirstTr .noticeTitle{
	width: 59px;
	
}
.noticeTableFirstTr .noticeDate{
	width: 59px;
	box-sizing: content-box;
}

.noticeTableFirstTr {
	font-size: 12px;
	color: rgb(94, 94, 94);
	background-color: rgb(224, 224, 224);
	height: 60px;
	box-sizing: border-box;
}
.noticeTableFirstTr td{
	vertical-align: middle;
}
.noticeTableContent{
	font-size: 12px;
	color: rgb(94, 94, 94);
	background-color: rgb(244, 244, 244);
	height: 30px;
	line-height: 30px;
	
}
.noticeTableContent td{
	text-align: center;
}
.noticeTableContent .noticeNo{
	/* padding-right: 126px; */
}
.noticeTableContent .noticeTitle{
	/* padding-right: 150px; */
	width: 300px;
}
.noticeTableContent .noticeDate{
	width: 80px;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/template/aside.jsp"%>
	<section id="noticeSection">

		<div id="noticePageTitle">공지사항</div>
		<div class="noticeBoard">
			<c:choose>
				<c:when test="${empty noticelist}">
					<div>작성된 글이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<table class="noticeTable">
						<tr class="noticeTableFirstTr">
							<td class="noticeNo">공지번호</td>
							<td class="noticeTitle">공지제목</td>
							<td class="noticeDate">공지일</td>
						</tr>
						<c:forEach items="${noticelist }" var="notice">
							<tr class="noticeTableContent">
								<td class="noticeNo">${notice.nt_no }</td>
								<td class="noticeTitle">${notice.nt_title }</td>
								<td class="noticeDate">${notice.nt_date }</td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
		</div>






	</section>

</body>
</html>