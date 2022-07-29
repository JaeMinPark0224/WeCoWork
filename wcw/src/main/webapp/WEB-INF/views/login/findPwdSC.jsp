<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/login/findPwdSC.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
	<section>
        <div id="section">
            <div id="mid">
                <p id="mid_text">비밀번호 변경</p>
                <form action="<%= request.getContextPath() %>/updatePwd" method="post" id="submit">
                	<div id="f_section">
                        <input type="hidden" name="email" value="${email}">
                        <input type="password" id="newPwd1" class="newPwd" name="newPwd" placeholder=" 변경할 비밀번호 입력" required>
                        <input type="password" id="newPwd2" class="newPwd" placeholder=" 변경할 비밀번호 입력 확인" required>
                    </div>
                    <div id="f_btn">
                        <input type="button" id="go_login" name="go_login" value="로그인">
                        <input type="submit" id="ok" name="ok" value="변경하기">
                    </div>
                </form>
                <div id="last">
                    <span class="last_text" id="last_text_1">
                        ⓒ WeCoWork Corp.
                    </span>
                    <span class="last_text" id="last_text_2">
                        All rights reserved
                    </span>
                </div>
            </div>
        </div>
    </section>
<script>
// 유효성 체크
var chkPwd = false;
	// 비밀번호 유효성 검사
	$("#newPwd1").focusout(function(){
	    var pwd = /^[0-9a-zA-Z]{8,20}$/;
	    var pwd1 = $("#newPwd1").val();
	    		
	    if(!pwd.test(pwd1)){
	    	chkPwd = false;
	    } else {
	    	chkPwd = true;
	    }
	 });
</script>
<script>
	$("#go_login").click(function(){
		location.href="/wcw/login";
	})
	
// 수정하기 버튼 클릭 시
	$("#submit").submit(function(){
		var pwd1 = $("#newPwd1").val();
		var pwd2 = $("#newPwd2").val();
		
		if(pwd1 != pwd2){
			alert("비밀번호와 비밀번호 확인에 입력한 비밀번호를 동일하게 입력해 주세요.");
			return false;
		}
		if(pwd1 == "" || pwd1 == null){
			alert("변경하고자 하는 비밀번호를 새롭게 입력해 주세요.");
			return false;
		}
		if(chkPwd == false){
			alert("비밀번호를 형식에 맞게 입력해 주세요. (영문 대소문자, 숫자 8~20자)");
			return false;
		}
	})
</script>
</body>
</html>