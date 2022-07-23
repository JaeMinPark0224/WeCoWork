<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/draft/approvalList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>결재함</title>
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
    <span class="title">결재함</span>
    <div class="content">
        <table class="table">
            <tr class="first_line">
                <td></td>
                <td>기안 번호</td>
                <td style="width: 10%;">분류</td>
                <td style="width: 17%;">기안 제목</td>
                <td style="width: 8%;">기안자</td>
                <td style="width: 14%;">기안일</td>
                <td style="width: 14%;">처리기한</td>
                <td>기안 상태</td>
                <td>결재 여부</td>
                <td></td>
            </tr>
            <c:if test="${not empty apprList}">
		        <c:forEach items="${apprList}" var="list">
					<tr class="list" dr_sort>
						<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}"></td>
						<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">${list.dr_no}</td>
						<c:if test="${list.dr_sort eq 1}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">기안서</td>
						</c:if>
						<c:if test="${list.dr_sort eq 2}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">지출결의서</td>
						</c:if>
						<c:if test="${list.dr_sort eq 3}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">정산서</td>
						</c:if>
						<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">${list.dr_title}</td>
						<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">${list.name_a}</td>
						<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">${list.dr_date}</td>
						<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">${list.dr_due_date}</td>
						
						<c:if test="${list.dr_result eq 1}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">진행중</td>
						</c:if>
						<c:if test="${list.dr_result eq 2}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">완료: 승인</td>
						</c:if>
						<c:if test="${list.dr_result eq 3}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">완료: 부결</td>
						</c:if>
						<c:if test="${list.dr_result eq 4}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">완료: 반려</td>
						</c:if>
						<c:if test="${list.dr_result eq 5}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">상신</td>
						</c:if>
						
						<c:if test="${list.appr_result == 1}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">승인</td>
						</c:if>
						<c:if test="${list.appr_result == 2}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">반려</td>
						</c:if>
						<c:if test="${list.appr_result == 3}">
							<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}">대기</td>
						</c:if>
						
						<td class="tb_read" value="${list.dr_no}" dr_sort="${list.dr_sort}"></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty apprList}">
				<tr class="list">
					<td class="tb_read2"></td>
					<td class="tb_read2"></td>
					<td class="tb_read2"></td>
					<td class="tb_read2"></td>
					<td class="tb_read2"></td>
					<td class="tb_read2"></td>
					<td class="tb_read2"></td>
					<td class="tb_read2"></td>
					<td class="tb_read2"></td>
					<td class="tb_read2"></td>
				</tr>
			</c:if>
        </table>
        <div id="pageing_all">
                <div class="pageing">
                	<p id="p_c">
                		<c:if test="${not empty apprList}">
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
// 기안 정보 클릭 시 해당 기안의 상세보기 페이지로 이동
$('.tb_read').click(function(){
	console.log($(this).attr("value"));
	var drNo = $(this).attr("value");
	var dr_sort = $(this).attr("dr_sort");
	location.href="<%= request.getContextPath() %>/draft/select?dr_sort="+dr_sort+"&drNo="+drNo;
})
</script>
</body>
</html>