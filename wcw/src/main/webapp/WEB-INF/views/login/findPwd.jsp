<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/login/findPwd.css">
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
                <p id="mid_text">비밀번호 찾기</p>
                <form action="<%= request.getContextPath() %>/find/pwd.do" method="post">
                    <div id="f_section">
                        <input type="text" placeholder=" 회사명" name="cp" id="cp" required></input><br>
                        <input type="text" placeholder=" 이메일(아이디)" name="email" id="email" required></input>
                        <input type="button" value="메일전송" id="email_btn_1">
                        <input type="button" value="인증완료" id="email_btn_2"><br>
                        <input type="text" placeholder=" 인증번호" name="num" id="num" required></input>
                        <input type="button" value="인증하기" id="do_btn">
                        <input type="text" placeholder=" 성명" name="name" id="name" required></input><br>
                    </div>
                    <div id="f_btn">
                        <input type="button" id="cancel" name="cancel" value="취소">
                        <input type="submit" id="find_pwd" name="find_pwd" value="확인">
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
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
<script>
	// cancel를 누르면 로그인 페이지로
	$("#findPwd").click(function(){
		location.href="/wcw/login";
	})
	
	$("#email_btn_1").click(function(){
		employeeEmail = $("#email").val();
		
		if(employeeEmail == ""){
			alert("이메일(아이디) 입력 후 인증해 주세요.");
			return;
		}
		
		// 이메일 전송을 위한 난수 insert 및 이메일 발송
		$.ajax({
			url: "<%=request.getContextPath()%>/insertRandomNum",
	        type: "post",
	        data: {employeeEmail: $("#email").val()},
	        success: function(result){
	        	console.log("난수 insert 및 이메일 발송 성공");	
	        	$("#num").show();
	        	$("#do_btn").show();
	        	$("#email_btn_1").hide();
	        		
	        		// email 입력칸 수정 시
	        		$("#email").on("input", (function(){
			            $("#num").hide();
				        $("#do_btn").hide();
				        $("#email_btn_1").show();
				        // TODO 난수 번호 지우기
			        }));
			        
			        // 난수 insert 및 이메일 발송 성공 후, 입력한 인증번호가 맞는지 체크
			        // TODO
	        },
	       	error: function(result){
	       		console.log(error);
	       		console.log("Ajax error");
	       	}
		})
	})
</script>
</body>
</html>