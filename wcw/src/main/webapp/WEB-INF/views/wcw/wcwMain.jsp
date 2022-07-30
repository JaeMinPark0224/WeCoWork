<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<style>
	section{
		width: 1200px;
		margin: 0 auto;
		font-family: NotoSansR;
        font-size: 12px;
	}
	#content{
		width: 1100px;
		margin-top: 50px;
	}
	#title{
	font-family: NotoSansB;
        font-size: 14px;
		width: 750px;
		margin: 0 auto;
		margin-bottom: 30px;
	}
	table{
		margin: 0 auto;
		border: 1px solid rgb(127, 127, 127);
        border-collapse: collapse;
        text-align: center;
	}
	td, tr{
		border: 1px solid rgb(127, 127, 127);
        border-collapse: collapse;
        padding: 5px;
	}
	#first_line{
		background-color: rgb(210, 210, 210);
	}
	.hidden{
		display: none;
	}
	.btns{
		font-family: NotoSansR;
        font-size: 12px;
	}
</style>
</head>
<body>
<section>
	<div id="content">
		<p id="title">wcw 회원가입 회사 목록</p>
		<table id="table">
	            <tr id="first_line">
	                <td>회사명</td>
	                <td>담당자 성명</td>
	                <td>연락처</td>
	                <td>이메일</td>
	                <td>URL</td>
	                <td>요청일</td>
	                <td>승인여부</td>
	                <td></td>
	            </tr>
	            <c:if test="${not empty companyList}">
			        <c:forEach items="${companyList}" var="list">
						<tr class="list">
							<td class="tb_read" value="${list.cp_no}">${list.cp_name}</td>
							<td class="tb_read" value="${list.cp_no}">${list.cp_join_name}</td>
							<td class="tb_read" value="${list.cp_no}">${list.cp_join_phone}</td>
							<td class="tb_read" value="${list.cp_no}">${list.cp_join_email}</td>
							<c:if test="${not empty list.cp_url }">
								<td class="tb_read" value="${list.cp_no}">${list.cp_url}</td>
							</c:if>
							<c:if test="${empty list.cp_url}">
								<td class="tb_read" value="${list.cp_no}"> - </td>
							</c:if>
							<td class="tb_read" value="${list.cp_no}">${list.cp_date}</td>
							
							<c:if test="${list.cp_appr_yn eq 'Y'}">
								<td class="tb_read" value="${list.cp_no}">승인</td>
							</c:if>
							<c:if test="${list.cp_appr_yn eq 'R'}">
								<td class="tb_read" value="${list.cp_no}">대기</td>
							</c:if>
							<c:if test="${list.cp_appr_yn eq 'N'}">
								<td class="tb_read" value="${list.cp_no}">반려</td>
							</c:if>
							<td>
								<c:if test="${list.cp_appr_yn eq 'Y'}">
									-
								</c:if>
								<c:if test="${list.cp_appr_yn eq 'R'}">
									<button class="btns y_btn" value="${list.cp_no}">가입 승인</button> 
									<button class="btns n_btn" value="${list.cp_no}">가입 반려</button>
								</c:if>
								<c:if test="${list.cp_appr_yn eq 'N'}">
									-
								</c:if>
							</td>
							<td class="tb_read hidden"><input type="hidden" name="cpNo" value="${list.cp_no}"></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty companyList}">
						<tr class="list">
							<td class="tb_read2"></td>
							<td class="tb_read2"></td>
							<td class="tb_read2"></td>
							<td class="tb_read2"></td>
							<td class="tb_read2"></td>
							<td class="tb_read2"></td>
							<td class="tb_read2"></td>
							<td class="tb_read2"></td>
						</tr>
				</c:if>
	        </table>
	</div>     
</section>
<script>
// 승인 버튼 클릭 시
$('.y_btn').click(function(){	
	$.ajax({
		url: "<%=request.getContextPath()%>/dp/updateCompany"
		, type: "post"
		, data: {cp_no: $(this).val(),
				 type: "1"}
		, success: function(result){
			if(result == 1){
				alert("승인 처리가 완료되었습니다.");
				location.href="<%=request.getContextPath()%>/dp/main";
			} else {
				alert("승인 처리에 오류가 발생했습니다. 다시 시도해 주세요.");
			}
		}
		, error: function(result){
			console.log("승인 ajax 오류");	
		}
	})
})

// 반려 버튼 클릭 시
$('.n_btn').click(function(){
	$.ajax({
		url: "<%=request.getContextPath()%>/dp/updateCompany"
		, type: "post"
		, data: {cp_no: $(this).val(),
				 type: "2"}
		, success: function(result){
			if(result == 1){
				alert("반려 처리가 완료되었습니다.");
				location.href="<%=request.getContextPath()%>/dp/main";
			} else {
				alert("반려 처리에 오류가 발생했습니다. 다시 시도해 주세요.");
			}
		}
		, error: function(result){
			console.log("반려 ajax 오류");	
		}
	})
})
</script>
</body>
</html>