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
            <span class="info_text">기안 번호 출력</span><br>
            <span class="info_title">기안 분류</span>
            <span class="info_text">기안 분류 출력</span><br>
            <span class="info_title">기안자 부서</span>
            <span class="info_text">기안자 부서 출력</span><br>
            <span class="info_title">기안자</span>
            <span class="info_text">기안자 출력</span><br>
            <span class="info_title">기안자 직위</span>
            <span class="info_text">기안자 직위 출력</span><br>
            <span class="info_title">기안일</span>
            <span class="info_text">기안일 출력</span><br>
        </div>
        <div id="sign_info">
            <table border="1" id="sign_info_tb">
                <!-- 결재 날짜 -->
                <tr>
                    <td class="s_date" id="1_date"></td>
                    <td class="s_date" id="2_date"></td>
                    <td class="s_date" id="3_date"></td>
                </tr>
                <!-- 결재자 서명 -->
                <tr>
                    <td class="s_sign" id="1_sign"></td>
                    <td class="s_sign" id="2_sign"></td>
                    <td class="s_sign" id="3_sign"></td>
                </tr>
                <!-- 결자재 성명 -->
                <tr>
                    <td class="s_name" id="1_name"></td>
                    <td class="s_name" id="2_name"></td>
                    <td class="s_name" id="3_name"></td>
                </tr>
            </table>
        </div>


        <div id="draft">
            <table class="table" id="table1">
                <tr>
                    <td class="first_td">기안 제목</td>
                    <td class="second_td">기안 제목 출력</td>
                </tr>
                <tr>
                    <td class="first_td">목적</td>
                    <td class="second_td">기안 목적 출력</td>
                </tr>
                <tr>
                    <td class="first_td">기안 내용</td>
                    <td class="second_td" id="second_td_big">기안 내용 출력</td>
                </tr>
                <tr>
                    <td class="first_td">비고</td>
                    <td class="second_td">기안 비고 출력</td>
                </tr>
            </table>
            <table class="table" id="table2">
                <tr>
                    <td class="first_td">결의서 제목</td>
                    <td class="second_td">결의서 제목 출력</td>
                </tr>
                <tr>
                    <td class="first_td">지출 예정 일자</td>
                    <td class="second_td">지출 예정 일자 출력</td>
                </tr>
                <tr>
                    <td class="first_td">결의서 내용</td>
                    <td class="second_td" id="second_td_big">결의서 내용 출력</td>
                </tr>
                <tr>
                    <td class="first_td">비고</td>
                    <td class="second_td">결의서 비고 출력</td>
                </tr>
            </table>
            <table class="table" id="table3">
                <tr>
                    <td class="first_td">정산서 제목</td>
                    <td class="second_td">정산서 제목 출력</td>
                </tr>
                <tr>
                    <td class="first_td">발생 기간</td>
                    <td class="second_td">발생 기간 출력</td>
                </tr>
                <tr>
                    <td class="first_td">지출 목적</td>
                    <td class="second_td">지출 목적 출력</td>
                </tr>
                <tr>
                    <td class="first_td">정산서 내용</td>
                    <td class="second_td" id="second_td_big">정산서 내용 출력</td>
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
                                <td class="second_td">법인카드 내용 출력</td>
                                <td class="second_td">법인카드 금액(숫자) 출력</td>
                            </tr>
                            <tr class="second_tr">
                                <td class="first_td_scd">개인 카드</td>
                                <td class="second_td">개인카드 내용 출력</td>
                                <td class="second_td">갸인카드 금액(숫자) 출력</td>
                            </tr>
                            <tr class="second_tr">
                                <td class="first_td_scd">합계</td>
                                <td></td>
                                <td class="second_td">합계 금액 출력</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="first_td">비고</td>
                    <td class="second_td">정산서 비고 출력</td>
                </tr>
            </table>
        </div>
        <div id="buttons">
            <input type="button" value="삭제" id="del_btn" class="btn">
            <input type="button" value="확인" id="ok_btn" class="btn">
            <input type="button" value="승인" id="accept_btn" class="btn">
            <input type="button" value="반려" id="return_btn" class="btn">
        </div>
    </div>
</section>
</body>
</html>