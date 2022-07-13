<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 등록</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<style>
    #section{
        margin-left: 60px;
        width: 1200px;
        color: rgb(94, 94, 94);
    }
    #title{
        display: inline-block;
        font-family: NotoSansB;
        font-size: 14px;
        margin-top: 105px;
        margin-left: 65px;
        color: rgb(75, 77, 178);
    }
    #sub_title{
        margin: 0 auto;
        margin-top: 70px;
        margin-bottom: 60px;
        font-family: NotoSansB;
        font-size: 13px;
        color: rgb(94, 94, 94);
        width: 500px;
    }
    #content{
        margin: 0 auto;
        width: 400px;
    }
    .form_text{
        font-size: 13px;
        font-family: NotoSansB;
        color: rgb(94,94,94);
        margin-bottom: 10px;
        display: inline-block;
    }
    .input_text{
        width: 380px;
        height: 38px;
        margin-bottom: 40px;
        border: 1px solid rgb(158, 158, 158);
        border-radius: 3px;
    }
    .input_text::placeholder, select{
        font-family: NotoSansR;
        font-size: 12px;
        padding-left: 4px;
    }
    #add_btn{
        width: 115px;
        height: 40px;
        background-color: rgb(75, 77, 178);
        color:white;
        font-size: 12px;
        font-family: NotoSansR;
         border: 0px;
        margin: 0 auto;
        display: block;
        margin-top: 70px;
        margin-bottom: 220px;
    }
</style>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="section">
    <span id="title">직원 리스트</span>
    <p id="sub_title">* 직원 계정 등록 완료 시, 직원의 이메일(아이디)로 로그인 정보가 전달됩니다.</p>
    <div id="content">
        <form action="" id="submit" method="post">
            <span class="form_text">성명 *</span><br>
            <input type="text" class="input_text" placeholder=" 직원의 성명을 입력해 주세요." required><br>
            <span class="form_text">이메일(아이디) *</span><br> 
            <input type="text" class="input_text" placeholder=" 아이디로 사용할 이메일을 입력해 주세요." required><br>
            <span class="form_text">개인 연락망 *</span><br> 
            <input type="text" class="input_text" placeholder=" 직원의 개인 연락망을 입력해 주세요." required><br>
            <span class="form_text">부서 *</span><br> 
                <select id="select_dept" class="input_text"><br>
                    <c:if test="${not empty deptList}">
            			<c:forEach items="#{deptList}" var="deptList">
            				<option class="deptList" value="${deptList}">${deptList}</option>
            			</c:forEach>
            		</c:if>
                </select>
            <span class="form_text">직위 *</span><br> 
                <select id="select_job" class="input_text"><br>
                    <c:if test="${not empty jobList}">
            			<c:forEach items="#{jobList}" var="jobList">
            				<option class="jobList" value="${jobList}">${jobList}</option>
            			</c:forEach>
            		</c:if>	
                </select>
            <span class="form_text">내선 번호 *</span><br>
            <input type="text" class="input_text" placeholder=" 직원의 내선 번호를 입력해 주세요." required><br>
            <input type="submit" id="add_btn" value="등록">
        </form>
    </div>
</section>
</body>
</html>