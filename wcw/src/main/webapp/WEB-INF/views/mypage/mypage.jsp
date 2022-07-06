<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/mypage/mypage.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="section">
    <div id="all">
        <form>
            <span id="title">마이페이지</span>
            <div>
            	<div id="profile">
		            	<c:if test="${empty loginSSInfo.profile}">
		            		<img id="prof_img" src="<%= request.getContextPath() %>/resources/images/clear.png">
		            	</c:if>
		            	<c:if test="${not empty loginSSInfo.profile}">
		            		<img id="prof_img" src="${loginSSInfo.profile}">
		            	</c:if>
                        <input type="button" value="프로필 등록" id="prof_btn">
                </div>
                    <div id="content">
                        <span class="tab">아이디(이메일)</span>
                        <span class="info">정보</span><br>
                        <span class="tab">성명</span>
                        <span class="info">정보</span><br>
                        <span class="tab">비밀번호</span>
                        <input type="password" class="pwd" placeholder="영문, 숫자 8~20자리 조합 "><br>
                        <span class="tab">비밀번호 확인</span>
                        <input type="password" class="pwd" placeholder="영문, 숫자 8~20자리 조합 "><br>
                        <span class="tab">내선 번호</span>
                        <span class="info">정보</span><br>
                        <span class="tab">사원 번호</span>
                        <span class="info">정보</span><br>
                        <span class="tab">개인 연락 번호</span>
                        <span class="info">정보</span><br>
                        <span class="tab last">입사일</span>
                        <span class="info">정보</span><br>
                        <span class="tab">회사명</span>
                        <span class="info">정보</span><br>
                        <span class="tab">부서명</span>
                        <span class="info">정보</span><br>
                        <span class="tab">직위</span>
                        <span class="info last">정보</span><br>
                        <span class="tab">서명</span>
                        <div id="sign_section">
                        	<c:if test="${empty loginSSInfo.sign}">
		            			<img id="sign_img" src="<%= request.getContextPath() %>/resources/images/clear.png">
		            		</c:if>
		            		<c:if test="${not empty loginSSInfo.sign}">
		            			<img id="sign_img" src="${loginSSInfo.sign}">
		            		</c:if>
                            <input type="button" id="sign_btn" value="서명 등록">
                        </div><br>
                    </div>
            </div>
            <div id="canvas_container">
                <div id="cc_txt">서명을 등록해 주세요.</div>
                <canvas id="canvas"></canvas>
                <div id="cc_btn">
                    <input type="button" id="cancel" value="취소">
                    <input type="button" id="erase" value="지우기">
                    <input type="button" id="save" value="저장">
                </div>
            </div>
            <input type="submit" id="edit" value="수정하기">
        </form>
    </div>
</section>
</body>
</html>