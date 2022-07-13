<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/mypage/mypage.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="section">
    <div id="all">
        <form action="<%= request.getContextPath() %>/mypage.do" method="post" id="submit" enctype="multipart/form-data">
            <span id="title">마이페이지</span>
            <div>
            	<div id="profile">
		            	<c:if test="${empty loginSSInfo.profile}">
		            		<img id="prof_img" name = "prof_img" src="<%= request.getContextPath() %>/resources/images/clear.png">
		            	</c:if>
		            	<c:if test="${not empty loginSSInfo.profile}">
		            		<img id="prof_img" name = "prof_img" src="${loginSSInfo.profile}">
		            	</c:if>
                        <input type="button" value="프로필 등록" id="prof_btn">
                        <input type="file" id="file" name="file" style="display:none" onchange="f_check(this)" accept="image/jpg, image/jpeg, image/png">
                </div>
                    <div id="content">
                        <span class="tab">아이디(이메일)</span>
                        <span class="info">정보</span><br>
                        <span class="tab">성명</span>
                        <span class="info">정보</span><br>
                        <span class="tab">비밀번호</span>
                        <input type="password" id = "pwd1" name="pwd" class="pwd" placeholder="영문, 숫자 8~20자리 조합 "><br>
                        <span class="tab">비밀번호 확인</span>
                        <input type="password" id = "pwd2" class="pwd" placeholder="영문, 숫자 8~20자리 조합 "><br>
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
		            			<img id="sign_img" name="sign_img" src="<%= request.getContextPath() %>/resources/images/clear.png">
		            		</c:if>
		            		<c:if test="${not empty loginSSInfo.sign}">
		            			<img id="sign_img" name="sign_img" src="${loginSSInfo.sign}">
		            		</c:if>
                            <input type="button" id="sign_btn" value="서명 등록">
                            <input type="hidden" name="sign_file" id="sign_file" style="display: none">
                        </div><br>
                    </div>
            </div>
            <div id="canvas_container">
                <div id="cc_txt">서명을 등록해 주세요.</div>
                <canvas id="canvas"></canvas>
                <div id="cc_btn">
                    <input type="button" id="cancel" value="취소">
                    <input type="button" id="erase" value="지우기">
                    <input type="button" id="save" value="저장" onclick="toDataURL()">
                </div>
            </div>
            <input type="submit" id="edit" value="수정하기">
        </form>
    </div>
</section>
<script>
alert("${msg}");
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
<script>
	// 서명 등록 버튼 클릭 시
	$("#sign_btn").click(function(){
		$("#canvas_container").show();
	})
	
	// 서명 모달 내 취소 버튼 클릭 시
	$("#cancel").click(function(){
		$("#canvas_container").hide();
	})
	
	// 서명 모달 내 저장 버튼 클릭 시 실행
	function toDataURL(){
		var signImage = document.getElementById('sign_img');
		signImage.src = canvas.toDataURL();
		$("#canvas_container").hide();
	}
	$("#save").click(function(){
		var data = canvas.toDataURL("image/png");
		/* var dataUrl = data.substring(data.indexof("iVBOR")); */
		$("#sign_file").attr("value", data).val(data);
	})
	
	// 프로필 변경 버튼 클릭 시 file을 클릭한 것과 같도록
	$("#prof_btn").click(function(){
		document.all.file.click();
	})
	
	var chkPwd = false;
	// 비밀번호 유효성 검사
	$("#pwd1").focusout(function(){
	    var pwd = /^[0-9a-zA-Z]{8,20}$/;
	    var pwd1 = $("#pwd1").val();
	    		
	    if(!pwd.test(pwd1)){
	    	chkPwd = false;
	    } else {
	    	chkPwd = true;
	    }
	 });
	
	// 수정하기 버튼 클릭 시
	$("#submit").submit(function(){
		var pwd1 = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		if((pwd1 !="") && (pwd2 == null || pwd2 == "")){
			alert("비밀번호 변경을 원할 시, 비밀번호 확인에도 변경하고자 하는 비밀번호를 입력해 주세요.");
			return false;
		}
		
		if(pwd1 != pwd2){
			alert("비밀번호와 비밀번호 확인에 입력한 비밀번호를 동일하게 입력해 주세요.");
			return false;
		}
		
		if(pwd1 !=""){
			if(chkPwd == false){
				alert("비밀번호를 형식에 맞게 입력해 주세요. (영문 대소문자, 숫자 8~20자)");
				return false;
			}	
		}
	})
</script>
<script>
// 캔버스 설정
    var isDrawing = false;
    var x = 0;
    var y = 0;

    var canvas = document.getElementById("canvas");
    var ctx = canvas.getContext("2d");

    canvas.addEventListener("mousedown", function (e) {
        x = e.offsetX;
        y = e.offsetY;
        isDrawing = true;
    });

    canvas.addEventListener("mousemove", function (e) {
        if (isDrawing) {
            drawSign(ctx, x, y, e.offsetX, e.offsetY);
            x = e.offsetX;
            y = e.offsetY;
        }
    });

    canvas.addEventListener("mouseup", function (e) {
        if (isDrawing) {
            drawSign(ctx, x, y, e.offsetX, e.offsetY);
            x = 0;
            y = 0;
            isDrawing = false;
        }
    });

    canvas.addEventListener("mouseleave", function (e) {
        x = 0;
        y = 0;
        isDrawing = false;
    });

    document.getElementById("erase").addEventListener("click", function (e) {
        if (ctx != null) {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        }
    });

    function drawSign(ctx, x1, y1, x2, y2) {
        if (ctx != null) {
            ctx.save();
            ctx.beginPath();
            ctx.strokeStyle = "#191919"; // 선 색상
            ctx.lineWidth = 2; // 선 굵기
            ctx.moveTo(x1, y1);
            ctx.lineTo(x2, y2);
            ctx.stroke();
            ctx.closePath();
            ctx.restore();
        };
    };
</script>
<script>
    // 프로필 이미지 변경 시 미리보기
    $('input[name="file"]').change(function(){
	    priviewFile(this, '#prof_img');
	});
	
	function priviewFile(input, expression) {
	    if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function (e) {
		    	$(expression).attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</body>
</html>