<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/draft/insertDraft.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>기안 작성</title>
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
        <span class="title">기안 작성</span><br>
        <div id="content">
            <span class="sub_title" id="draft_select_title">기안 분류</span>
            <select id="draft_select" class="select">
                <option>기안서</option>
                <option>지출결의서</option>
                <option>정산서</option>
            </select>
            <span class="sub_title" id="emp_select_title">결재자</span>
            <select id="emp_select1" class="select">
                <option>직원명</option>
                <option>직원명</option>
                <option>직원명</option>
                <option>직원명</option>
            </select>
            <select id="emp_select2" class="select">
                <option>직원명</option>
                <option>직원명</option>
                <option>직원명</option>
                <option>직원명</option>
            </select>
            <select id="emp_select3" class="select">
                <option>직원명</option>
                <option>직원명</option>
                <option>직원명</option>
                <option>직원명</option>
            </select>
            <form id="tables">
                <table class="table" id="table1" border="1px">
                    <tr>
                        <td class="first_td">기안 제목</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">경유</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">목적</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">기안 내용</td>
                        <td class="first_td_textarea"><textarea class="textarea" class="write_td"></textarea></td>
                    </tr>
                    <tr>
                        <td class="first_td">비고</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                </table>
                <table class="table" id="table2">
                    <tr>
                        <td class="first_td">품의서 제목</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">예정 일자</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">품의서내용</td>
                        <td class="first_td_textarea"><textarea class="textarea" class="write_td"></textarea></td>
                    </tr>
                    <tr>
                        <td class="first_td">비고</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                </table>
                <table class="table" id="table3" border="1px">
                    <tr>
                        <td class="first_td">정산서 제목</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">발생 기간</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">목적</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                    <tr>
                        <td class="first_td">기안 내용</td>
                        <td class="first_td_textarea"><textarea class="textarea" class="write_td"></textarea></td>
                    </tr>
                    <tr>
                        <td class="first_td"></td>
                        <td class="count_td">
                            <table id="second_table"> 
                                <tr class="second_tr">
                                    <td class="first_td_scd">항목</td>
                                    <td id="first_td_scd2">내용</td>
                                    <td id="first_td_scd3">금액(숫자)</td>
                                </tr>
                                <tr class="second_tr">
                                    <td class="first_td_scd">법인 카드</td>
                                    <td><input type="text" class="card_content"></td>
                                    <td><input type="text" class="card_won"></td>
                                </tr>
                                <tr class="second_tr">
                                    <td class="first_td_scd">개인 카드</td>
                                    <td><input type="text" class="card_content"></td>
                                    <td><input type="text" class="card_won"></td>
                                </tr>
                                <tr class="second_tr">
                                    <td class="first_td_scd">합계</td>
                                    <td></td>
                                    <td><input type="text" class="card_won" id="total_won" readonly></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="first_td">비고</td>
                        <td><input type="text" class="write_td"></td>
                    </tr>
                </table>
                <input type="submit" id="ok_btn" value="상신">
            </form>
        </div>
    </section>   
</body>
</html>