<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/login/login.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<script>
$(function(){
    // 쿠키값을 가져온다.
    var cookie_user_email = getLogin();

    /**
    * 쿠키값이 존재하면 id에 쿠키에서 가져온 id를 할당한 뒤
    * 체크박스를 체크상태로 변경
    */
    if(cookie_user_email != "") {
    	$("#email").val(cookie_user_email);
    	$("#saveId").attr("checked", true);
    }

    // 아이디 저장 체크시
    $("#saveId").on("click", function(){
	    var _this = this;
	    var isRemember;
	    console.log('test2');
	    console.log($(_this).is(":checked"));
	    if($(_this).is(":checked")) {
	    	isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
	    	if(!isRemember) {
	    		 $(_this).attr("checked", false);
	    	}
	    }
    });
    
  //로그인 버튼 클릭시
    $("#login").on("click", function(){
        if($("#saveId").is(":checked")){ // 저장 체크시
        	saveLogin($("#email").val());
        } else{ // 체크 해제시는 공백
        	saveLogin("");
        }
    });
});
</script>
<script>
/**
 * 로그인 정보 저장
 */
 function saveLogin(email) {
	    if(email != "") {
		// userid 쿠키에 id 값을 7일간 저장
		    setSave("email", email, 7);
	    }else{
	    // userid 쿠키 삭제
	    	setSave("email", email, -1);
	    }
 }

 /**
 * Cookie에 user_id를 저장
 */
 function setSave(name, value, expiredays) {
 	var today = new Date();
 	today.setDate( today.getDate() + expiredays );
 	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
 }

 /**
 * 쿠키값을 가져오기
 */

 function getLogin() {
 // userid 쿠키에서 email 값을 가져온다.
	    var cook = document.cookie + ";";
	    var idx = cook.indexOf("email", 0);
	    var val = "";

	    if(idx != -1) {
		    cook = cook.substring(idx, cook.length);
		    begin = cook.indexOf("=", 0) + 1;
		    end = cook.indexOf(";", begin);
		    val = unescape(cook.substring(begin, end));
	    }
	    return val;
 }
</script>
</script>

<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section>
	<div id="section">
		<div id="top">
	        <p id="top_text">로그인</p>
	    </div>
	    <div id="mid">
	        <p id="mid_text">WeCoWork 로그인</p>
	        <form action="login.do" method="post">
	            <div id="f_section">
	                <input type="text" placeholder=" 이메일(아이디)" name="email" id="email" required></input><br>
	                <input type="password" placeholder=" 비밀번호" name="pwd" id="pwd" required></input><br>
	            </div>
	            <div id="m_section">
	                <input type="checkbox" name="autoLogin" id="autoLogin"><label for="autoLogin"> 자동 로그인</label>
	                <input type="checkbox" name="saveId" id="saveId"><label for="saveId"> 아이디 저장</label>
	                <span id="findPwd">비밀번호 찾기</span>
	            </div>
	            <input type="submit" id="login" name="login" value="로그인">
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
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>

	// 비밀번호 찾기 버튼 클릭 시 
	$("#findPwd").click(function(){
		location.href="/wcw/find/pwd";
	})
</script>
</body>
</html>