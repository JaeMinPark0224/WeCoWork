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
		<div id="project_todo_header_date"><input type="date" id="projecet_todo_date_input" value="${today }"></div>
		<div id="project_todo_header_progress"></div>
		<div id="project_todo_header_progress_bar_wrap">
			<div id="project_todo_header_progress_bar"></div>
		</div>
	</div>
	<div id="project_todo_content_wrap">
		<div id="project_todo_content_flex_box">
			<div id="project_todo_content_flex_box_head"></div>
			<div id="project_todo_content_flex_box_body">
				<c:forEach items="${todoList }" var="todo">
					<c:choose>
						<c:when test="${todo.pt_complete_yn eq 'Y'}">
							<div class="project_todo_chk_box" chk="${todo.pt_complete_yn }" pt_no="${todo.pt_no }" style="background-color : #4B4DB2;"><i class="fa-solid fa-check project_todo_chk" style="visibility : visible;"></i></div>
							<div class="project_todo_list_title" style="text-decoration: line-through;">[${fn:substring(todo.pt_date,11,16) }] ${todo.pt_content }</div>
						</c:when>
						<c:when test="${todo.pt_complete_yn eq 'N'}">
							<div class="project_todo_chk_box" chk="${todo.pt_complete_yn }" pt_no="${todo.pt_no }"><i class="fa-solid fa-check project_todo_chk"></i></div>
							<div class="project_todo_list_title">[${fn:substring(todo.pt_date,11,16) }] ${todo.pt_content }</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
	</div>
</section>
<script type="text/javascript">
	//프로젝트 번호
	var js_pr_no = (new URL(location.href).searchParams).get('project');

	// 추가 버튼 생성
	$("#project_main_tab_wrap").append("<div id='project_todo_sub_btn_wrap'></div>")
	$("#project_todo_sub_btn_wrap").append("<button id='project_todo_add_btn' class='project_todo_sub_btn'>할 일 추가</button>");
	$("#project_todo_sub_btn_wrap").append("<button id='project_todo_update_btn' class='project_todo_sub_btn'>할 일 수정</button>");
	$("#project_todo_sub_btn_wrap").append("<button id='project_todo_complete_btn' class='project_todo_sub_btn'>수정 완료</button>");
	
	// 진행도 업데이트
	function progressUdpateFnc() {
		// 퍼센트 계산
		let progressPersent = (($(".project_todo_chk_box[chk='Y']").length/$(".project_todo_chk_box").length)*100).toFixed(2);
		console.log(progressPersent);
		if(progressPersent != '0.00' && progressPersent != '100.00' && progressPersent != 'NaN') {
			progressPersent = progressPersent.substr(0,2);
		}
		else if(progressPersent == '0.00') {
			progressPersent = progressPersent.substr(0,1);	
		}
		else if(progressPersent == '100.00') {
			progressPersent = progressPersent.substr(0,3);	
		}
		else if(progressPersent == 'NaN') {
				progressPersent = '0';
		}
		$("#project_todo_header_progress").text(progressPersent+"%");
		
		// progressbar 표시
		let progressBarWidth = 1070 * progressPersent * 0.01 + "px"; 
		$("#project_todo_header_progress_bar").css("width", progressBarWidth);
	}
	progressUdpateFnc();
	
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
				pt_date_year : $("#projecet_todo_date_input").val(),
				pt_date_hour_minute : timeVal
			},
			success: function(result) {
				if(result == -1) {
					location.href = "<%= request.getContextPath()%>/login";					
					return;
				}
				dateChangeFnc();
				$("#project_todo_modal_background").css("display", "none");
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	});
	
	// 할일 체크
	$(".project_todo_chk_box").on("click", todoChkFnc);
	
	// 할일 체크 함수
	function todoChkFnc() {
		let js_pt_no = $(this).attr("pt_no");
		let jt_pt_complete = ($(this).attr("chk") == 'Y')?'N':'Y';
		let $this = $(this);
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/todo/update",
			data: {
				pr_no : js_pr_no,
				pt_no : js_pt_no,
				pt_complete_yn : jt_pt_complete
			},
			success: function(result) {
				if(result == -1) {
					location.href = "<%= request.getContextPath()%>/login";					
					return;
				}
				if($this.attr("chk") == 'N') {
					$this.css({
						"background-color" : "#4B4DB2"
					});
					$this.children(".project_todo_chk").css({
						"visibility" : "visible" 
					});
					$this.next().css({
						"text-decoration": "line-through"
					});
					$this.attr("chk", 'Y');
				} else if ($this.attr("chk") == 'Y') {
					$this.css({
						"background-color" : "rgb(244, 244, 244)"
					});
					$this.children(".project_todo_chk").css({
						"visibility" : "hidden" 
					});
					$this.next().css({
						"text-decoration": "none"
					});
					$this.attr("chk", 'N');
				}
				progressUdpateFnc();
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	}
	
	// 날짜 변경
	$("#projecet_todo_date_input").on("change", dateChangeFnc);
	
	// 날짜 변경 함수
	function dateChangeFnc() {
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/todo/list",
			data: {
				pr_no : js_pr_no,
				pt_date_year : $("#projecet_todo_date_input").val()
			},
			dataType : "json",
			success: function(result) {
				if(result == -1) {
					location.href = "<%= request.getContextPath()%>/login";					
					return;
				}
				$("#project_todo_content_flex_box_body").empty();
				if(result != 0) {
					for (var i = 0; i < result.length; i++) {
						let todo = result[i];
						let htmlText = '';
						if(todo.pt_complete_yn == 'Y') {
							htmlText += '<div class="project_todo_chk_box" chk="'+todo.pt_complete_yn+'" pt_no="'+todo.pt_no+'" style="background-color : #4B4DB2;"><i class="fa-solid fa-check project_todo_chk" style="visibility : visible;"></i></div>';
							htmlText += '<div class="project_todo_list_title" style="text-decoration: line-through;">['+todo.pt_date.substring(11,16)+'] '+todo.pt_content+'</div>';
						}
						else if(todo.pt_complete_yn == 'N') {
							htmlText += '<div class="project_todo_chk_box" chk="'+todo.pt_complete_yn+'" pt_no="'+todo.pt_no+'"><i class="fa-solid fa-check project_todo_chk"></i></div>';
							htmlText += '<div class="project_todo_list_title">['+todo.pt_date.substring(11,16)+'] '+todo.pt_content+'</div>';
						}
						$("#project_todo_content_flex_box_body").append(htmlText);
					}
					$(".project_todo_chk_box").off("click");
					$(".project_todo_chk_box").on("click", todoChkFnc);
				}
				progressUdpateFnc();
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	}
	
	// 할 일 수정 버튼 클릭 이벤트
	$("#project_todo_update_btn").on("click", function() {
		$("#project_todo_add_btn").css("display", "none");
		let $todoList = $(".project_todo_list_title");
		for(var i = 0; i < $todoList.length; i++) {
			let $prev = $todoList.eq(i).prev();
			if($prev.attr("chk") == 'N') {
				let tempStr = $todoList.eq(i).text();
				$todoList.eq(i).empty();
				let htmlText = '<div class="project_todo_update_grid">'
				htmlText += '<input type="time" class="project_todo_list_time_input">';
				htmlText += '<input type="text" class="project_todo_list_title_input">';
				htmlText += '<div class="project_todo_list_update_btn" delChk="f">수정</div>'
				htmlText += '<div class="project_todo_list_delete_btn" delChk="f">삭제</div></div>'
				$todoList.eq(i).append(htmlText);
				$todoList.eq(i).find(".project_todo_list_time_input").val(tempStr.substring(1,6));
				$todoList.eq(i).find(".project_todo_list_title_input").val(tempStr.substring(8));
			}
		}
		$(".project_todo_list_update_btn").off("click");
		$(".project_todo_list_update_btn").on("click", todoListUpdateFnc);
		$(".project_todo_list_delete_btn").off("cilck");
		$(".project_todo_list_delete_btn").on("click", todoListDeleteFnc);
		$(".project_todo_chk_box").off("click");
		$(".project_todo_chk_box").css({
			"cursor" : "auto"
		});
		$("#project_todo_update_btn").css({
			"display" : "none"
		});
		$("#project_todo_complete_btn").css({
			"display" : "block"
		});
		$("#project_todo_cancle_btn").css({
			"display" : "block"
		});
	});
	
	
	// 수정 완료 기능
	$("#project_todo_complete_btn").on("click", function() {
		$("#project_todo_add_btn").css("display", "block");
		dateChangeFnc();
		$("#project_todo_update_btn").css({
			"display" : "block"
		});
		$("#project_todo_complete_btn").css({
			"display" : "none"
		});
		$("#project_todo_cancle_btn").css({
			"display" : "none"
		});
	});
	
	// todo 리스트 삭제 버튼 함수
	// 삭제할 pt_no 임시 저장
	var temp_pt_no = 0;
	function todoListDeleteFnc() {
		temp_pt_no = 0;
		if(!confirm("할 일을 삭제 하시겠습니까?")) {
			return;
		}
		temp_pt_no = $(this).parents(".project_todo_list_title").prev().attr("pt_no"); 
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/todo/delete",
			data: {
				pr_no : js_pr_no,
				pt_no : temp_pt_no 
			},
			success: function(result) {
				if(result == -1) {
					location.href = "<%= request.getContextPath()%>/login";					
					return;
				}
				else if(result == -2) {
					location.href = "<%= request.getContextPath()%>/project/list";	
					return;
				}
				else if(result == 1) {
					alert("삭제가 완료되었습니다.");
					$(".project_todo_chk_box[pt_no='"+temp_pt_no+"']").next().remove();
					$(".project_todo_chk_box[pt_no='"+temp_pt_no+"']").remove();
					progressUdpateFnc();
				}
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	}
	
	// todo 리스트 업데이트 함수
	var temp_pt_content = '';
	var temp_pt_date = '';
	function todoListUpdateFnc() {
		temp_pt_no = 0;
		temp_pt_content = '';
		temp_pt_date = '';
		if(!confirm("할 일을 수정 하시겠습니까?")) {
			return;
		}
		temp_pt_no = $(this).parents(".project_todo_list_title").prev().attr("pt_no"); 
		console.log($(this));
		console.log($(this).next());
		console.log($(this).next().next());
		temp_pt_content = $(this).prev().val(); 
		temp_pt_date = $(this).prev().prev().val();
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/todo/update",
			data: {
				pr_no : js_pr_no,
				pt_no : temp_pt_no,
				pt_content : temp_pt_content,
				pt_date_str : temp_pt_date,
				pt_year : $("#projecet_todo_date_input").val()
			},
			success: function(result) {
				if(result == -1) {
					location.href = "<%= request.getContextPath()%>/login";					
					return;
				}
				else if(result == -2) {
					location.href = "<%= request.getContextPath()%>/project/list";	
					return;
				}
				else if(result == 1) {
					alert("수정이 완료되었습니다.");
					progressUdpateFnc();
				}
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	}
</script>
</body>
</html>