<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/project/project.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<div id="project_todo_modal_background">
	<div id="project_todo_modal_wrap">
		<div id="project_todo_modal_grid">
			<div id="project_todo_modal_tap_wrap">
				<span class="project_todo_modal_tap_invite">할 일 추가</span>
			</div>
			<div class="project_todo_modal_name">내용</div>
			<div class="project_todo_modal_select_wrap">
				<input type="text" id="project_todo_modal_text">
			</div>
			<div class="project_todo_modal_name">시간 설정</div>
			<div class="project_todo_modal_select_wrap">
				<input type="time" id="project_todo_modal_time">
			</div>
			<div id="project_todo_modal_btn_wrap">
				<button type="button" class="project_todo_modal_btn" id="project_todo_modal_cancle_btn">취소</button>
				<button type="button"class="project_todo_modal_btn" id="project_todo_modal_add_btn">확인</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="project_section">
	<div id="project_main_wrap">
	<%@ include file="/WEB-INF/views/project/projectheader.jsp" %>
	<div id="project_todo_header_wrap">
		<div id="project_todo_header_date">${today }</div>
		<div id="project_todo_header_progress">50%</div>
		<div id="project_todo_header_progress_bar_wrap">
			<div id="project_todo_header_progress_bar"></div>
		</div>
	</div>
	<div id="project_todo_content_wrap">
		<div id="project_todo_content_flex_box">
			<div id="project_todo_content_flex_box_head"></div>
			<div id="project_todo_content_flex_box_body">
				<c:forEach items="${todoList }" var="todo">
					<div class="project_todo_chk_box" chk="${todo.pt_complete_yn }"><i class="fa-solid fa-check project_todo_chk"></i></div>
					<div class="project_todo_list_title">[${fn:substring(todo.pt_date,11,16) }] ${todo.pt_content }</div>
				</c:forEach>
			</div>
		</div>
	</div>
	</div>
</section>
<script type="text/javascript">
	//프로젝트 번호
	var js_pr_no = (new URL(location.href).searchParams).get('project');

	$("#project_main_tab_wrap").append("<button id='project_todo_add_btn'>할 일 추가</button>");
	$("#project_main_tab_wrap").append("<button id='project_todo_update_btn'>할 일 수정</button>");
	
	// 할 일 추가 버튼 모달창 열기
	$("#project_todo_add_btn").on("click", function() {
		$("#project_todo_modal_text").val('');
		$("#project_todo_modal_time").val('');
		$("#project_todo_modal_background").css("display", "block");
	});
	
	// 모달창 닫기 버튼
	$("#project_todo_modal_cancle_btn").on("click", function() {
		$("#project_todo_modal_background").css("display", "none");	
	});
	
	// 할 일 추가 버튼 클릭시 db에 저장
	$("#project_todo_modal_add_btn").on("click", function() {
		console.log('btn click');
		let textVal = $("#project_todo_modal_text").val();
		let timeVal = $("#project_todo_modal_time").val();
		console.log(textVal);
		if(textVal == '') {
			alert("내용을 입력해주세요.");
			return;
		}
		if(timeVal == '') {
			alert("시간을 입력해주세요.");
			return;
		}
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/todo/insert",
			data: {
				pr_no : js_pr_no,
				pt_content : textVal,
				pt_date_year : $("#project_todo_header_date").text(),
				pt_date_hour_minute : timeVal
			},
			success: function(result) {
				alert(result);
				console.log("result : " + result);
				/* if(result == 1) {
					location.reload();
				} */
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	});
	
	// 할일 체크
	$(".project_todo_chk_box").on("click", function() {
		console.log($(this));
		if($(this).attr("chk") == 'N') {
			$(this).css({
				"background-color" : "#4B4DB2"
			});
			$(this).children(".project_todo_chk").css({
				"visibility" : "visible" 
			});
			$(this).next().css({
				"text-decoration": "line-through"
			});
			$(this).attr("chk", 'Y');
		} else if ($(this).attr("chk") == 'Y') {
			$(this).css({
				"background-color" : "rgb(244, 244, 244)"
			});
			$(this).children(".project_todo_chk").css({
				"visibility" : "hidden" 
			});
			$(this).next().css({
				"text-decoration": "none"
			});
			$(this).attr("chk", 'N');
		}
	});
</script>
</body>
</html>