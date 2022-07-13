<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
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
        <form action="<%=request.getContextPath()%>/hr/employee/insert" id="submit" method="post">
            <span class="form_text">성명 *</span><br>
            <input type="text" class="input_text" name="name" id="e_name" placeholder=" 직원의 성명을 입력해 주세요." required><br>
            <span class="form_text">이메일(아이디) *</span><br> 
            <input type="text" class="input_text" name="email"placeholder=" 아이디로 사용할 이메일을 입력해 주세요." required><br>
            <span class="form_text">개인 연락망 *</span><br> 
            <input type="text" class="input_text" name="phone" id="e_phone" placeholder=" 직원의 개인 연락망을 입력해 주세요." required><br>
            <span class="form_text">부서 *</span><br> 
                <select id="select_dept" name="dept_name" class="input_text">
                    <c:if test="${not empty deptList}">
            			<c:forEach items="#{deptList}" var="deptList">
            				<option class="deptList" value="${deptList}">${deptList}</option>
            			</c:forEach>
            		</c:if>
                </select>
            <span class="form_text">직위 *</span><br> 
                <select id="select_job" name="job_title" class="input_text">
                    <c:if test="${not empty jobList}">
            			<c:forEach items="#{jobList}" var="jobList">
            				<option class="jobList" value="${jobList}">${jobList}</option>
            			</c:forEach>
            		</c:if>	
                </select>
            <span class="form_text">내선 번호 *</span><br>
            <input type="text" class="input_text" name="intl_no" id="e_intl" placeholder=" 직원의 내선 번호를 입력해 주세요." required><br>
            <input type="submit" id="add_btn" value="등록">
        </form>
    </div>
</section>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
<script>
// 유효성 검사
	// 직원 성명
	var chkName = false;
	        
	$("#e_name").focusout(function(){
		var nameVal = $("#e_name").val();
		var name = /^[가-힣]{2,7}$/;
		    		
		   if(!name.test(nameVal)){
		    chkName = false;
		   } else {
		    chkName = true;
		   }
	});

	// 직원 연락처
	var chkPhone = false;
	        
	$("#e_phone").focusout(function(){
		var phoneVal = $("#e_phone").val();
		var phone = /^[0-9]{9,12}$/;
		   	
		   if(!phone.test(phoneVal)){
		    chkPhone = false;
		   } else {
		    chkPhone = true;
		   }
	});
	
	// 직원 내선번호
	var intl_no_chk = false;
	
	$("#e_intl").focusout(function(){
		var intlVal = $("#e_intl").val();
		var intl = /^[0-9]{1,30}$/;	
			if(!intl.test(intlVal)){
				intl_no_chk = false;
			} else {
				intl_no_chk = true;
			}
	});
</script>
<script>
// 직원 계정 등록을 위한 ajax
	$("submit").submit(function(){
		// 유효성 검사 확인
		if(chkName == false){
			alert("직원의 성명을 형식에 맞게 입력해 주세요. (한글 2~6자)");
			return;
		}
		if(chkPhone == false){
			alert("직원의 연락처를 형식에 맞게 입력해 주세요. (숫자 9~12자)");
			return;
		}
		if(intl_no_chk == false){
			alert("직원의 내선번호를 형식에 맞게 작성해 주세요. (숫자 1~20자)");
			return;
		}
	})
</script>
</body>
</html>