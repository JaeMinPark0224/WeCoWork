<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/notice/list.css">
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
								<a href="<%= request.getContextPath() %>/notice/read?no=${notice.nt_no }">
									${notice.nt_no }</a></td>
								<td class="noticeTitle">
								<a href="<%= request.getContextPath() %>/notice/read?no=${notice.nt_no }">
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