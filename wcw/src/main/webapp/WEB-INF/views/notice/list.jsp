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
.noticeTable a{
	color: rgb(94, 94, 94);
}
.noticeBoard{
	height: 800px;
	width: 1070px;
	background-color: rgb(244, 244, 244);
	margin-bottom: 220px;
}

#noticePageTitle {
	margin-top: 105px;
	margin-bottom:70px;
	font-size: 14px;
	color: rgb(75, 77, 178);
	
}
.noticeTable{
	text-align: center;
	border-collapse: separate;
  	border-spacing: 0 30px;
}

.noticeDate{
	padding-left: 180px;
	width: 149px;
}
.noticeTableDiv{
	text-align: center;
	width: 1070px;
}
.noticeNo{
	width: 59px;
    padding-left: 108px;
} 
.noticeTitle{
	padding-left: 128px;
	width: 376px;
}
.noticeNoDiv{
	width: 59px;
	margin-left: 115px;
	margin-right: 300px;
}
.noticeDateDiv{
	margin-left: 365px;
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
	height: 20px;
	line-height: 20px;
}
.noticeTableContent td{
	text-align: center;
}
.noticeTableContent .noticeNo{
	/* padding-right: 126px; */
}
.noticeTableContent .noticeDate{
	width: 80px;
}
.noticeTitleDiv{
	font-size: 12px;
	color: rgb(94, 94, 94);
	background-color: rgb(224, 224, 224);
	height: 60px;
	box-sizing: border-box;
	line-height: 60px;
}
.paging{
	text-align: center;
	position: absolute;
    top: 830px;
    left: 535px;
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
				<div class="noticeTitleDiv">
					<span class="noticeNoDiv">
						공지번호
					</span>
					<span class="noticeTitleDiv">
						공지제목
					</span>
					<span class="noticeDateDiv">
						공지일
					</span>
				</div>
					<table class="noticeTable">
						<c:forEach items="${noticelist }" var="notice">
							<tr class="noticeTableContent">
								<td class="noticeNo">
								<a href="<%= request.getContextPath() %>/notice/read<%-- ?nt_no=${notice.nt_no } --%>">
									${notice.nt_no }</a></td>
								<td class="noticeTitle">
								<a href="<%= request.getContextPath() %>/notice/read?nt_no=${notice.nt_no }">
									${notice.nt_title }</a></td>
								<td class="noticeDate">${notice.nt_date }</td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
			<p class="paging">
				<c:if test="${startPage > 1 }">
					<a href="noticelist?page=${startPage-1 }">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:forEach begin="${startPage }" end="${endpage }" var="p">
					<a href="noticelist?page=${p }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				<c:if test="${endpage < totalpageCnt}">
					<a href="noticelist?page=${endpage+1 }">다음</a>
				</c:if>
			</p>
		</div>






	</section>

</body>
</html>