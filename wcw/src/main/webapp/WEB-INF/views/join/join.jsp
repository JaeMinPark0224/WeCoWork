<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink2.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/join/join.css">
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
    <form action="join.do" method="post" id="submit">
        <span class="btn_name">회사명 *</span><br>
        <input type="text" placeholder=" 회사명을 입력해 주세요." name="cp_name" id="cp_name" class="text" required><br>
        <span class="btn_name">이메일(아이디) *</span><br> 
        <div class="email_area">
            <input type="text" placeholder=" 연락 가능한 이메일을 입력해 주세요." name="email" id="email" class="text1" required>
            <input type="button" value="메일전송" id="email_btn_1" class="e_b">
            <input type="button" value="인증완료" id="email_btn_2" class="e_b"><br>
        </div>
        <div class="email_area">
            <input type="text" placeholder=" 인증번호" name="num" id="d2" class="text2">
            <input type="button" value="인증하기" id="do_btn" class="e_b">
        </div>
        <span class="btn_name" id="pwd_txt">비밀번호 *</span> <br>
        <input type="password" placeholder=" 비밀번호를 입력해 주세요." name="pwd" id="pwd_1" class="text" required><br>
        <span class="btn_name">비밀번호 확인 *</span> <br>
        <input type="password" placeholder=" 비밀번호를 입력해 주세요." id="pwd_2" class="text" required><br>
        <span class="btn_name">담당(관리)자 성명 *</span> <br>
        <input type="text" placeholder=" 담당(관리)자 성명을 입력해 주세요." id="cp_join_name" name="cp_join_name" class="text" required><br>
        <span class="btn_name">연락처 *</span> <br>
        <input type="text" placeholder=" 연락 가능한 연락처를 입력해 주세요." id="cp_join_phone" name="cp_join_phone" class="text" required><br>
        <span class="btn_name">회사 홈페이지 URL</span> <br>
        <input type="text" placeholder=" 회사 홈페이지 URL을 입력해 주세요." id="cp_url" name="cp_url" class="text">
        <input type="submit" id="ok" value="회원가입 요청">
    </form>    
</section>
<script>
	// 유효성 검사

		// 회사명 형식 확인
    	var chkCpName = false;
    	
	    	$("#cp_name").focusout(function(){
	    		
	    		var cp_name = /^[a-zA-Z가-힣]{1,20}$/;
	    		var cp_nameVal = $("#cp_name").val();
	    		
	    		if(!cp_name.test(cp_nameVal)){
	    			chkCpName = false;
	    		} else {
	    			chkCpName = true;
	    			console.log("회사명 정규표현식 완료");
	    		}
	    	});
	        
	     // 비밀번호 형식 확인
	        var chkPwd = false;
	        var chkPwd2 = false;
	        
			$("#pwd_1").focusout(function(){
			
		    	var pwd = /^[0-9a-zA-Z]{8,20}$/;
		    	var pwdVal = $("#pwd_1").val();
		    		
		    	if(!pwd.test(pwdVal)){
		    		chkPwd = false;
		    	} else {
		    		chkPwd = true;
		    	}
		    });
	        
		// 비밀번호 확인 형식 확인
	        var chkPwdCk = false;
	        
			$("#pwd_2").focusout(function(){
			
		    	var pwdCk = /^[0-9a-zA-Z]{8,20}$/;
		    	var pwdCkVal = $("#pwd_2").val();
		    		
		    	if(!pwdCk.test(pwdCkVal)){
		    		chkPwdCk = false;
		    	} else {
		    		chkPwdCk = true;
		    	}
		    });   
			
		// 이름 형식 확인
	        var chkName = false;
	        
			$("#cp_join_name").focusout(function(){
				var nameVal = $("#cp_join_name").val();
				var name = /^[가-힣]{2,10}$/;
		    		
		    	if(!name.test(nameVal)){
		    		chkName = false;
		    	} else {
		    		chkName = true;
		    	}
		    });
			
		// 연락처 형식 확인
	        var chkPhone = false;
	        
			$("#cp_join_phone").focusout(function(){
				var phoneVal = $("#cp_join_phone").val();
				var phone = /^[0-9]{9,12}$/;
		    		
		    	if(!phone.test(phoneVal)){
		    		chkPhone = false;
		    	} else {
		    		chkPhone = true;
		    	}
		    });

/////////////////////////////////////////////////////////////////

	var randomNum = "";
	// 메일전송 버튼 클릭 시 
	$("#email_btn_1").click(function(){
		email = $("#email").val();
		
		// 이메일을 입력하지 않았을 경우
		if(email == ""){
			alert("이메일(아이디) 입력 후 인증해 주세요.");
			return;
		}
		
		// 이메일 중복 체크
		$.ajax({
			url: "<%=request.getContextPath()%>/checkEmail",
	        type: "post",
	        data: {email: $("#email").val()},
	        success: function(result){
	        	// 이메일이 중복된 경우
	        	if(result != 0){
	        		alert("중복된 이메일입니다. 다른 이메일을 사용해 주세요");
	        	}
	        	// 이메일이 중복되지 않은 경우
	        	else {
	        		// 이메일 전송을 위한 난수 insert 및 이메일 발송
	        		$.ajax({
	        			url: "<%=request.getContextPath()%>/insertRandomNum",
	        	        type: "post",
	        	        data: {employeeEmail: $("#email").val()},
	        	        success: function(result){
	        	        	console.log("난수 insert 및 이메일 발송 성공");	
	        	        	$("#d2").show();
	        	        	$("#do_btn").show();
	        	        	$("#email").css("margin-bottom", "10px");
	        	        	$("#email_btn_1").hide();
	        	        		
	        	        		// email 입력칸 수정 시
	        	        		$("#email").on("input", (function(){
	        			            $("#d2").hide();
	        				        $("#do_btn").hide();
	        				        $("#email_btn_1").show();
	        				        $("#email").css("margin-bottom", "0px");
	        				        $("#email").off("click");
	        			        }));
	        			        randomNum = Number(result);
	        	        },
	        	       	error: function(result){
	        	       		console.log(error);
	        	       		console.log("Ajax error");
	        	       	}
	        		})
	        	}
	        },
	       	error: function(result){
	       		console.log(error);
	       	}
		})
		
	});
	
	// 인증하기 버튼 클릭 시 인증번호 일치 여부 확인
	$("#do_btn").on("click", (function(){
		num = $("#d2").val();
		if(num == ""){
			alert("인증번호 입력 후 인증해 주세요.");
			return;
		}
		
		if(num == randomNum){
			$("#d2").hide();
	        $("#do_btn").hide();
	        $("#email_btn_2").show();
	        $("#email").css("margin-bottom", "0px");
	        $("#email").attr("readonly", "readonly");
		} else if(num != randomNum){
			alert("인증번호가 일치하지 않습니다. 확인 후 다시 입력해 주세요.");
		}
	}))
	
	var rt = true;
	// 회원가입 버튼 클릭 시
	$("#submit").submit(function(){
		rt = true;
		
		// 비밀번호, 비밀번호 확인 체크
        if($("#pwd_1").val() != $("#pwd_2").val()){
 		    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.");
 			return rt = false;
 		}
        // 이메일 인증 확인
        if($("#email_btn_1").is(":visible")){
            alert("이메일 인증을 완료해주세요.");
            return rt = false;
        }
        if($("#do_btn").is(":visible")){
            alert("이메일 인증을 완료해주세요.");
            return rt = false;
        }
		
		// 형식 확인
		if(chkCpName == false){
			alert("회사명을 형식에 맞게 입력해 주세요. (영문 대소문자, 한글 1~20자)");
			return rt = false;
		}	
		if($("#email_btn_1").is(":visible")){
            alert("이메일 인증을 완료해주세요.");
            return rt = false;
        }
		if(chkPwd == false){
			alert("비밀번호를 형식에 맞게 입력해 주세요. (영문 대소문자, 숫자 8~20자)");
			return rt = false;
		}
		if(chkPwdCk == false){
			alert("비밀번호 확인 내 입력 값을 형식에 맞게 입력해 주세요. (영문 대소문자, 숫자 4~20자)");
			return rt = false;
		}
		if(chkName == false){
			alert("담당(관리)자 성명을 형식에 맞게 입력해 주세요. (한글 2~10자)");
			return rt = false;
		}
		if(chkPhone == false){
			alert("연락처를 형식에 맞게 입력해 주세요. (숫자 9~12자)");
			return rt = false;
		}
	})
	
</script>
</body>
</html>