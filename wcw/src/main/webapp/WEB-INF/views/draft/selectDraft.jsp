<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/draft/selectDraft.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>기안 상세 정보</title>
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
    <span class="title">기안 조회</span>
    <div class="content">
        <div id="draft_info">
            <span class="info_title">기안 번호</span>
            <span class="info_text">${draft[0].dr_no}</span><br>
            <span class="info_title">기안 구분</span>
            	<c:if test="${draft[0].dr_sort == 1}">
            		<span class="info_text">기안서</span><br>
            	</c:if>
            	<c:if test="${draft[0].dr_sort == 2}">
            		<span class="info_text">지출결의서</span><br>
            	</c:if>
            	<c:if test="${draft[0].dr_sort == 3}">
            		<span class="info_text">정산서</span><br>
            	</c:if>
            <span class="info_title">기안자</span>
            <span class="info_text">${draft[0].name_a}</span><br>
            <span class="info_title">기안자 직위</span>
            <span class="info_text">${draft[0].job_title_a}</span><br>
            <span class="info_title">기안자 부서</span>
            <span class="info_text">${draft[0].dept_name_a}</span><br>
            <span class="info_title">기안일</span>
            <span class="info_text">${draft[0].dr_date}</span><br>
        </div>
        <div id="sign_info">
            <table border="1" id="sign_info_tb">
                <!-- 결재 날짜 -->
                <tr>
                	<c:if test="${not empty draft[0].appr_date}">
                		<td class="s_date" id="1_date">${draft[0].appr_date}</td>
                	</c:if>
                	<c:if test="${empty draft[0].appr_date && draft[0].appr_result == 2}">
                		<td class="s_date" id="1_date" style="color: #CC3D3D;">반려</td>
                	</c:if>
                	<c:if test="${empty draft[0].appr_date && draft[0].appr_result != 2}">
                		<td class="s_date" id="1_date"></td>
                	</c:if>
                	
                    <c:if test="${not empty draft[1].appr_date}">
                		<td class="s_date" id="2_date">${draft[1].appr_date}</td>
                	</c:if>
                	<c:if test="${empty draft[1].appr_date && draft[1].appr_result == 2}">
                		<td class="s_date" id="2_date" style="color: #CC3D3D;">반려</td>
                	</c:if>
                	<c:if test="${empty draft[1].appr_date && draft[1].appr_result != 2}">
                		<td class="s_date" id="2_date"></td>
                	</c:if>
                	
                	<c:if test="${not empty draft[2].appr_date}">
                		<td class="s_date" id="3_date">${draft[2].appr_date}</td>
                	</c:if>
                	<c:if test="${empty draft[2].appr_date && draft[2].appr_result == 2}">
                		<td class="s_date" id="3_date" style="color: #CC3D3D;">반려</td>
                	</c:if>
                	<c:if test="${empty draft[2].appr_date && draft[2].appr_result != 2}">
                		<td class="s_date" id="3_date"></td>
                	</c:if>
                </tr>
                <!-- 결재자 서명 -->
                <tr>
                	<c:if test="${draft[0].appr_result == 1}">
                		<td class="s_sign" id="1_sign"><img src="${draft[0].sign}"></td>
                	</c:if>
                	<c:if test="${draft[0].appr_result != 1}">
                		<td class="s_sign" id="1_sign"></td>
                	</c:if>

                	<c:if test="${draft[1].appr_result == 1}">
                		<td class="s_sign" id="2_sign"><img src="${draft[1].sign}"></td>
                	</c:if>
                	<c:if test="${draft[1].appr_result != 1}">
                		<td class="s_sign" id="2_sign"><img></td>
                	</c:if>
                	
                	<c:if test="${draft[2].appr_result == 1}">
                		<td class="s_sign" id="3_sign"><img src="${draft[2].sign}"></td>
                	</c:if>
                	<c:if test="${draft[2].appr_result != 1}">
                		<td class="s_sign" id="3_sign"></td>
                	</c:if>
                </tr>
                <!-- 결자재 성명 -->
                <tr>
                	<c:if test="${not empty draft[0].emp_no}">
                		<td class="s_name" id="1_name">${draft[0].name}&nbsp;&nbsp;${draft[0].job_title}</td>
                	</c:if>
                	<c:if test="${empty draft[0].emp_no}">
                		<td class="s_name" id="1_name">─</td>
                	</c:if>
                	<c:if test="${not empty draft[1].job_title}">
                		<td class="s_name" id="2_name">${draft[1].name}&nbsp;&nbsp;${draft[1].job_title}</td>
                	</c:if>
                	<c:if test="${empty draft[1].job_title}">
                		<td class="s_name" id="2_name">─</td>
                	</c:if>
                	<c:if test="${not empty draft[2].job_title}">
                		<td class="s_name" id="3_name">${draft[2].name}&nbsp;&nbsp;${draft[2].job_title}</td>
                	</c:if>
                	<c:if test="${empty draft[2].job_title}">
                		<td class="s_name" id="3_name">─</td>
                	</c:if>
                </tr>
            </table>
        </div>


        <div id="draft">
        	<c:if test="${draft[0].dr_sort == 1}">
	            <table class="table" id="table1">
	                <tr>
	                    <td class="first_td">기안 제목</td>
	                    <td class="second_td">${draft[0].dr_title}</td>
	                </tr>
	                <tr>
	                    <td class="first_td">목적</td>
	                    <td class="second_td">${draft[0].dr_purpose}</td>
	                </tr>
	                <tr>
	                    <td class="first_td">기안 내용</td>
	                    <td class="second_td" id="second_td_big">${draft[0].dr_content}</td>
	                </tr>
	                <tr>
	                    <td class="first_td">비고</td>
	                    <td class="second_td">${draft[0].dr_comment}</td>
	                </tr>
	            </table>
            </c:if>
            <c:if test="${draft[0].dr_sort == 2}">
	            <table class="table" id="table2">
	                <tr>
	                    <td class="first_td">결의서 제목</td>
	                    <td class="second_td">${draft[0].dr_title}</td>
	                </tr>
	                <tr>
	                    <td class="first_td">지출 예정 일자</td>
	                    <td class="second_td">${draft[0].dr_expect_date}</td>
	                </tr>
	                <tr>
	                    <td class="first_td">결의서 내용</td>
	                    <td class="second_td" id="second_td_big">${draft[0].dr_content}</td>
	                </tr>
	                <tr>
	                    <td class="first_td">비고</td>
	                    <td class="second_td">${draft[0].dr_comment}</td>
	                </tr>
	            </table>
            </c:if>
            <c:if test="${draft[0].dr_sort == 3}">
	            <table class="table" id="table3">
	                <tr>
	                    <td class="first_td">정산서 제목</td>
	                    <td class="second_td">${draft[0].dr_title}</td>
	                </tr>
	                <tr>
	                    <td class="first_td">발생 기간</td>
	                    <td class="second_td">${draft[0].spend_date}</td>
	                </tr>
	                <tr>
	                    <td class="first_td">지출 목적</td>
	                    <td class="second_td">${draft[0].spend_purpose}</td>
	                </tr>
	                <tr>
	                    <td class="first_td">정산서 내용</td>
	                    <td class="second_td" id="second_td_big">${draft[0].dr_content}</td>
	                </tr>
	                <tr>
	                    <td class="first_td"></td>
	                    <td class="count_td">
	                        <table id="second_table"> 
	                            <tr class="second_tr">
	                                <td class="first_td_scd" class="second_td_first_line"style="width: 13%;">항목</td>
	                                <td id="first_td_scd2" class="second_td_first_line" style="width: 60%;">내용</td>
	                                <td id="first_td_scd3" class="second_td_first_line" style="width: 47%;">금액(숫자)</td>
	                            </tr>
	                            <tr class="second_tr">
	                                <td class="first_td_scd">법인 카드</td>
	                                <td class="second_td">${draft[0].spend_content}</td>
	                                <td class="second_td">${draft[0].spend_amount}</td>
	                            </tr>
	                            <tr class="second_tr">
	                                <td class="first_td_scd">개인 카드</td>
	                                <td class="second_td">${draft[0].spend_content_prvt}</td>
	                                <td class="second_td">${draft[0].spend_amount_prvt}</td>
	                            </tr>
	                            <tr class="second_tr">
	                                <td class="first_td_scd">합계</td>
	                                <td></td>
	                                <td class="second_td">${draft[0].spend_sum}</td>
	                            </tr>
	                        </table>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="first_td">비고</td>
	                    <td class="second_td">${draft[0].dr_comment}</td>
	                </tr>
	            </table>
            </c:if>
        </div>
        <div id="buttons">
            <!-- 삭제 버튼 -->
            <c:if test="${draft[0].name_a == loginSSInfo.name && (draft[0].appr_result == 3 || draft[0].dr_result == 3)}">
            	<input type="button" value="삭제" id="del_btn" class="btn">
            </c:if>
            
            <!-- 확인 버튼 -->
            <input type="button" value="확인" id="ok_btn" class="btn">
            
            <!-- 승인 버튼 -->
            <c:if test="${draft[0].name == loginSSInfo.name && draft[0].appr_result == 3}">
            	<input type="button" value="승인" id="accept_btn" class="btn">
            </c:if>
            <c:if test="${draft[1].name == loginSSInfo.name && draft[1].appr_result == 3}">
            	<input type="button" value="승인" id="accept_btn" class="btn">
            </c:if>
            <c:if test="${draft[2].name == loginSSInfo.name && draft[2].appr_result == 3}">
            	<input type="button" value="승인" id="accept_btn" class="btn">
            </c:if>
            
            <!-- 반려 버튼 -->
            <c:if test="${draft[0].name == loginSSInfo.name && draft[0].appr_result == 3}">
            	<input type="button" value="반려" id="return_btn" class="btn">
            </c:if>
            <c:if test="${draft[1].name == loginSSInfo.name && draft[1].appr_result == 3}">
            	<input type="button" value="반려" id="return_btn" class="btn">
            </c:if>
            <c:if test="${draft[2].name == loginSSInfo.name && draft[2].appr_result == 3}">
            	<input type="button" value="반려" id="return_btn" class="btn">
            </c:if>
        </div>
    </div>
</section>
<script>
// 확인 버튼 클릭 시
$('#ok_btn').click(function(){
	window.history.back();
	<%-- location.href="<%= request.getContextPath() %>/draft/list"; --%>
})

// 삭제 버튼 클릭 시
$('#del_btn').click(function(){
	var dr_no = ${draft[0].dr_no};
	var dr_sort = ${draft[0].dr_sort};
	location.href="<%= request.getContextPath() %>/draft/delete?dr_sort="+dr_sort+"&dr_no="+dr_no;
})

// 승인 버튼 클릭 시
$('#accept_btn').click(function(){
	if(${empty loginSSInfo.sign}){
		alert("서명 등록 후 기안 결재를 진행해 주세요.");
		location.href="<%= request.getContextPath() %>/mypage";
		return;
	} else {
		var num = 1;
		var dr_no = ${draft[0].dr_no};
		var dr_sort = ${draft[0].dr_sort};
		location.href="<%= request.getContextPath() %>/draft/update?dr_sort="+dr_sort+"&dr_no="+dr_no+"&num="+num;
	}
})

// 반려 버튼 클릭 시
$('#return_btn').click(function(){
		var num = 2;
		var dr_no = ${draft[0].dr_no};
		var dr_sort = ${draft[0].dr_sort};
		location.href="<%= request.getContextPath() %>/draft/update?dr_sort="+dr_sort+"&dr_no="+dr_no+"&num="+num;	
})
</script>
</body>
</html>