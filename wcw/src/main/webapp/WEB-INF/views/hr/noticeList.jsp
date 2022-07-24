<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/hr/noticeList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>공지 리스트</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="section">
	<span class="title">공지사항</span>
	<input type="button" id="create_btn" value="공지 작성">
    <div id="content">
        <table id="table">
            <tr id="first_line">
                <td></td>
                <td style="width: 20%">공지 번호</td>
                <td style="width: 50%">공지 제목</td>
                <td style="width: 30%;">공지일</td>
                <td></td>
            </tr>
            <c:if test="${not empty noticeList}">
		        <c:forEach items="${noticeList}" var="list">
					<tr class="list">
						<td class="tb_read"></td>
						<td class="tb_read">${list.nt_no}</td>
						<td class="tb_read">${list.nt_title}</td>
						<td class="tb_read">${list.nt_date}</td>
						<td class="tb_read"></td>
						<td class="tb_read last_tb"><input type="hidden" name="ntNo" class="ntNo" value="${list.nt_no}"></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty noticeList}">
					<tr class="list">
						<td class="tb_read2"></td>
						<td class="tb_read2"></td>
						<td class="tb_read2">작성된 공지사항이 없습니다.</td>
						<td class="tb_read2"></td>
						<td class="tb_read2"></td>
					</tr>
			</c:if>
        </table>
         <div id="pageing_all">
                <div class="pageing">
                	<p id="p_c">
                		<c:if test="${not empty noticeList}">
							<c:if test="${startPage > 1 }">
								<a class="page page_prev">이전</a>
							</c:if>
							<c:forEach begin="${startPage }" end="${endPage }" var="p">
								<a class="page page_num" >${p}</a>
							</c:forEach>
							<c:if test="${endPage < totalpageCnt}">
								<a class="page page_post" >다음</a>
							</c:if>
						</c:if>
					</p>
                </div>
          </div>
    </div>
</section>
<script>
// 공지 작성 버튼 클릭 시
$('#create_btn').click(function() {
	location.href = '<%= request.getContextPath()%>/hr/notice/insert';
});
</script>
</body>
</html>