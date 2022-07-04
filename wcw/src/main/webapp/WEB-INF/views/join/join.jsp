<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/join/join.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비즈니스 회원가입</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section>
    <div id="txt">
        <p id="main_txt">WeCoWork 비즈니스 회원가입</p><br>
        <span class="mid_txt" id="f_txt">반갑습니다! WeCoWork 비즈니스 계정 회원가입 페이지 입니다.</span><br>
        <span class="mid_txt" id="m_txt">비즈니스 계정 생성을 위해 정보를 입력해 주세요.</span><br>
        <span class="mid_txt">회원가입 완료 후, 빠른 시일 내 최종 승인을 위해 연락처로 연락드리겠습니다.</span>
    </div>
    <form action="" method="" id="btn">
        <span class="btn_name">회사명 *</span><br>
        <input type="text" placeholder=" 회사명을 입력해 주세요." required class="text"><br>
        <span class="btn_name">이메일(아이디) *</span><br> 
        <div class="email_area">
            <input type="text" placeholder=" 연락 가능한 이메일을 입력해 주세요." required  class="text1">
            <input type="button" value="메일전송" id="email_btn_1" class="e_b">
            <input type="button" value="인증완료" id="email_btn_2" class="e_b"><br>
        </div>
        <div class="email_area">
            <input type="text" placeholder=" 인증번호" name="num" required id="d2" class="text2">
            <input type="button" value="인증하기" id="do_btn" class="e_b">
        </div>
        <span class="btn_name" id="pwd_txt">비밀번호 *</span> <br>
        <input type="text" placeholder=" 비밀번호를 입력해 주세요." required class="text"><br>
        <span class="btn_name">비밀번호 확인 *</span> <br>
        <input type="text" placeholder=" 비밀번호를 입력해 주세요." required class="text"><br>
        <span class="btn_name">담당(관리)자 성명 *</span> <br>
        <input type="text" placeholder=" 담당(관리)자 성명을 입력해 주세요." required class="text"><br>
        <span class="btn_name">연락처 *</span> <br>
        <input type="text" placeholder=" 연락 가능한 연락처를 입력해 주세요." required class="text"><br>
        <span class="btn_name">회사 홈페이지 URL</span> <br>
        <input type="text" placeholder=" 비밀번호를 입력해 주세요." class="text">
        <input type="submit" id="submit" value="회원가입 요청">
    </div>
</section>
</body>
</html>