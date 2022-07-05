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
	$("#cancel").click(function(){
		location.href="/wcw/login";
	})
	
	var randomNum = "";
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
				        $("#email").off("click");
			        }));
			        randomNum = Number(result);
	        },
	       	error: function(result){
	       		console.log(error);
	       		console.log("Ajax error");
	       	}
		})
	})
	
	// 인증하기 버튼 클릭 시 인증번호 일치 여부 확인
	$("#do_btn").on("click", (function(){
		num = $("#num").val();
		if(num == ""){
			alert("인증번호 입력 후 인증해 주세요.");
			return;
		}
		
		if(num == randomNum){
			$("#num").hide();
	        $("#do_btn").hide();
	        $("#email_btn_2").show();
	        $("#email").attr("readonly", "readonly");
	        
	        // 난수 번호 삭제
	        $.ajax({
				url: "<%=request.getContextPath()%>/deleteRandomNum",
		        type: "post",
		        data: {employeeEmail: $("#email").val()},
		        success: function(result){
		        	if(result >0){
		        		console.log("난수 delete 성공");	
		        	}
		        	else{
		        		alert("인증에 실패했습니다. 다시 시도해 주세요.");
		        		$("#num").hide();
				        $("#do_btn").hide();
				        $("#email_btn_1").show();
		        	}
		        },
		       	error: function(result){
		       		console.log(error);
		       		console.log("Delete Ajax error");
		       	}
			})
		} else if(num != randomNum){
			alert("인증번호가 일치하지 않습니다. 확인 후 다시 입력해 주세요.");
		}
	}))
	
	// 최종 확인 버튼 클릭 시
	$("#find_pwd").on("click", (function(){
		if($("#do_btn").is(":visible")){
            alert("아메일 인증을 완료해주세요.");
            return;
        }
		if($("#email_btn_1").is(":visible")){
            alert("아메일 인증을 완료해주세요.");
            return;
        }
	}));
	
</script>
</body>
</html>