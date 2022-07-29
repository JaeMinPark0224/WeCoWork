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
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="project_section">
	<div id="project_main_wrap">
	<%@ include file="/WEB-INF/views/project/projectheader.jsp" %>	
	<div id="project_work_read_wrap">
		<div id="project_work_read_content_wrap">
			<div id="project_work_read_profile_wrap">
				<div id="project_work_read_profile_pic">
					<c:if test="${empty work.profile}">
				    	<img class="project_worker_profile_img" src="<%= request.getContextPath() %>/resources/images/clear.png">
				    </c:if>
				    <c:if test="${not empty work.profile}">
				        <img class="project_worker_profile_img" src="${work.profile}">
				   	</c:if>
				</div>
				<div id="project_work_read_profile_text_wrap">
					<div class="project_work_read_profile_text">${work.dept_name }</div>
					<div class="project_work_read_profile_text"><span class="font_b">${work.name }</span> ${work.job_title }</div>
					<div class="project_work_read_profile_text">${fn:substring(work.pw_date,0,16) }</div>
				</div>
			</div>
			<div id="project_work_read_content_grid_box">
				<div class="project_work_read_content_left">업무명</div>
				<div class="project_work_read_content_right"><span class="font_12px">${work.pw_title }</span></div>
				<div class="project_work_read_content_hr"></div>
				<div class="project_work_read_content_left">상태</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_state_wrap">
						<div class="project_work_read_content_state">요청</div>
						<div class="project_work_read_content_state">진행</div>
						<div class="project_work_read_content_state">보류</div>
						<div class="project_work_read_content_state">완료</div>
						<div class="project_work_read_content_state">피드백</div>
					</div>
				</div>
				<div class="project_work_read_content_left">우선순위</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_priority_wrap">
						<input type="hidden" name="pw_priority" id="pw_priority" value="0">
						<div class="project_work_read_content_priority" chk="f">상</div>
						<div class="project_work_read_content_priority" chk="f">중</div>
						<div class="project_work_read_content_priority" chk="f">하</div>
					</div>
				</div>
				<div class="project_work_read_content_left">업무자</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_worker_wrap">
						<c:forEach items="${workerList }" var="worker">
							<div class="project_work_read_content_worker" emp="${worker.emp_no }">${worker.name }</div>
						</c:forEach>
					</div>
				</div>
				<div class="project_work_read_content_left">일정</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_date_wrap">
						<div class="project_work_read_content_date">시작일: ${fn:substring(work.pw_start_date,0,16) }</div>
						<div class="project_work_read_content_date">종료일: ${fn:substring(work.pw_end_date,0,16) }</div>
					</div>
				</div>
				<div class="project_work_read_content_left">내용</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_content_content">${work.pw_content }</div>
				</div>
				<c:if test="${work.pw_tier == 0 }">
				<div class="project_work_read_content_left">하위업무</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_sub_work">
						<i class="fa-solid fa-chevron-down project_work_read_sub_work_btn" openChk="f"></i>
						<button class="project_work_read_sub_work_add_btn">하위 업무 추가</button>
					</div>
					<div id="project_work_read_sub_work_row_gird">
						<div class="project_work_read_sub_work_column_gird">
							<div class="project_work_read_sub_work_state_text">상태</div>
							<div class="project_work_read_sub_work_priority">우선순위</div>
							<div class="project_work_read_sub_work_title">업무명</div>
							<div class="project_work_read_sub_work_name">담당자</div>
							<div class="project_work_read_sub_work_date">작성일</div>
						</div>
						<c:forEach items="${subWorkList }" var="work">
							<div class="project_work_read_sub_work_column_gird">
								<div class="project_work_read_sub_work_state work_state_type${work.pw_status }">
									<c:choose>
									<c:when test="${work.pw_status eq 1}">요청</c:when>
									<c:when test="${work.pw_status eq 2}">진행</c:when>
									<c:when test="${work.pw_status eq 3}">보류</c:when>
									<c:when test="${work.pw_status eq 4}">완료</c:when>
									<c:when test="${work.pw_status eq 5}">피드백</c:when>
									</c:choose>
								</div>
								<div class="project_work_read_sub_work_priority"><c:choose>
								<c:when test="${work.pw_priority eq 1 }"><i class="fa-solid fa-arrow-up sub_work_rank_arrow"></i></c:when>
								<c:when test="${work.pw_priority eq 2 }"><i class="fa-solid fa-minus sub_work_rank_arrow"></i></c:when>
								<c:when test="${work.pw_priority eq 3 }"><i class="fa-solid fa-arrow-down sub_work_rank_arrow"></i></c:when>
							</c:choose></div>
								<div class="project_work_read_sub_work_title"><span class="project_work_read_sub_work_title_span" pw_no = "${work.pw_no }">${work.pw_title }</span></div>
								<div class="project_work_read_sub_work_name">${work.name }</div>
								<div class="project_work_read_sub_work_date">${fn:substring(work.pw_date,0,10) }</div>
							</div>
						</c:forEach>
					</div>
				</div>
				</c:if>
				<div class="project_work_read_content_hr"></div>
				<div class="project_work_read_content_left">댓글</div>
				<div class="project_work_read_content_right">
					<div class="project_work_read_comment_flex">
						<div class="project_work_read_comemnt_content_wrap">
							<div class="project_work_read_comemnt_content_profile_wrap">
								<div class="project_work_read_comemnt_content_profile_img"></div>
								<div class="project_work_read_comment_content_profile_flex">
									<div class="project_work_read_comemnt_content_profile_name">${loginSSInfo.name }</div>
									<div class="project_work_read_comemnt_content_profile_job">${loginSSInfo.job_title }</div>
								</div>
							</div>
							<div class="project_work_read_comemnt_content_input_wrap">
								<textarea type="text" class="project_work_read_comemnt_content_input" name=""></textarea>
								<button type="button" class="project_work_read_comemnt_content_input_btn">등록</button>
							</div>
						</div>
						<c:forEach items="${commentList }" var="comment">
						<div class="project_work_read_comemnt_content_wrap">
							<div class="project_work_read_comemnt_content_profile_wrap">
								<div class="project_work_read_comemnt_content_profile_img"></div>
								<div class="project_work_read_comment_content_profile_flex">
									<div class="project_work_read_comemnt_content_profile_name">${comment.name }</div>
									<div class="project_work_read_comemnt_content_profile_job">${comment.job_title }</div>
								</div>
								<div class="project_work_read_comemnt_content_date">${fn:substring(comment.pc_date,0,19) }</div>
								<c:if test="${loginSSInfo.emp_no eq comment.emp_no }">
									<button type="button" pc_no="${comment.pc_no }" class="project_work_read_comemnt_content_delete_btn">삭제</button>
								</c:if>
								<c:if test="${loginSSInfo.emp_no eq comment.emp_no }">
									<button type="button" pc_no="${comment.pc_no }" class="project_work_read_comemnt_content_update_btn">수정</button>
								</c:if>
							</div>
							<div class="project_work_read_comemnt_content_input_wrap">
								<div class="project_work_read_comemnt_content">${comment.pc_content }</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<form action="<%= request.getContextPath()%>/project/work/delete" method="post" id="work_delete">
		<input type="hidden" name="pw_no" id="pw_no">
		<input type="hidden" name="pr_no" id="pr_no">
	</form>
</section>
<script type="text/javascript">
	var js_pr_no = (new URL(location.href).searchParams).get('project'); 
	var js_pw_no = (new URL(location.href).searchParams).get('no');

	<c:if test="${loginSSInfo.emp_no eq work.ep_no}">
		$("#project_main_tab_wrap").append("<button id='project_work_update_btn'>업무 수정</button>");
		$("#project_main_tab_wrap").append("<button id='project_work_delete_btn'>업무 삭제</button>");
	</c:if>
	
	
	var stateRgb1 = 'rgb(87, 184, 184)';
	var stateRgb2 = 'rgb(230, 126, 34)';
	var stateRgb3 = 'rgb(231, 76, 60)';
	var stateRgb4 = 'rgb(94, 94, 94)';
	var stateRgb5 = 'rgb(75, 77, 178)';
	$(".project_work_read_content_state").eq(${work.pw_status - 1}).css({
		'background-color' : stateRgb${work.pw_status},
		'color' : 'white'
	});
	
	$(".project_work_read_content_priority").eq(${work.pw_priority - 1}).css({
		'background-color' : '#4B4DB2',
		'color' : 'white'	
	});
	
	$(".project_work_read_content_state").css("cursor", "default");
	$(".project_work_read_content_priority").css("cursor", "default");
	
	// 하위 업무 펼치기
	$(".project_work_read_sub_work_btn").on("click", function() {
		if($(this).attr("openChk") == 'f') {
			$("#project_work_read_sub_work_row_gird").slideDown({
				duration: 400,
				start : function() {
					$(this).css({
						display: "grid"
					});
				}
			});
			$(this).attr("openChk", "t");
			$(this).css("transform", "rotate(180deg)");
		}
		else if ($(this).attr("openChk") == 't') {
			$("#project_work_read_sub_work_row_gird").slideUp({
				duration: 400,
			});
			$(this).attr("openChk", "f");	
			$(this).css("transform", "rotate(0deg)");
		}
	});
	
	// 하위 업무 추가 페이지 이동
	$(".project_work_read_sub_work_add_btn").on("click", function() {
		location.href = "<%= request.getContextPath()%>/project/work/insert?project="+js_pr_no+"&no="+js_pw_no;
	});
	
	// 업무 수정 기능
	$("#project_work_update_btn").on("click", function() {
		location.href = "<%= request.getContextPath()%>/project/work/update?project="+js_pr_no+"&no="+js_pw_no;
	});
	
	// 업무 삭제 기능
	$("#project_work_delete_btn").on("click", function() {
		$("#pw_no").val(js_pw_no);
		$("#pr_no").val(js_pr_no);
		$("#work_delete").get(0).submit();
	});
	
	// 댓글 등록
	$(".project_work_read_comemnt_content_input_btn").on("click", function() {
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/comment/insert",
			dataType: "json",
			data: {
				pw_no : js_pw_no,
				pc_content: $(".project_work_read_comemnt_content_input").val().replaceAll(/(\n|\r\n)/g, "<br>")
			},
			success: function(result) {
				if(result == -1) {
										
				}
				else {
					console.log(result);
					createCommentList(result);
					$(".project_work_read_comemnt_content_input").val('');
				}
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	});
	
	// 댓글 삭제
	$(".project_work_read_comemnt_content_delete_btn").on("click", deleteCommentFnc);
	
	// 댓글 삭제 함수
	function deleteCommentFnc() {
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/comment/delete",
			dataType: "json",
			data: {
				pc_no : $(this).attr("pc_no"),
				pw_no : js_pw_no
			},
			success: function(result) {
				if(result == -1) {
										
				}
				else {
					console.log(result);
					createCommentList(result);
				}
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	}
	
	// 댓글 수정
	$(".project_work_read_comemnt_content_update_btn").on("click", updateBtnFnc);
	
	// 댓글 수정 버튼 수정 기능
	function updateBtnFnc() {
		$(this).text("수정 완료");
		$(this).off("click");
		$(this).on("click", updateDoCommentFnc);
		let temtText = $(this).parent().next().children().text();
		$(this).parent().next().children().remove();
		$(this).parent().next().append('<textarea type="text" class="project_board_read_comemnt_content_input" name="">'+temtText+'</textarea>');
	}
	
	// 댓글 수정 함수
	function updateDoCommentFnc() {
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/comment/update",
			dataType: "json",
			data: {
				pc_no : $(this).attr("pc_no"),
				pw_no : js_pw_no,
				pc_content : $(this).parent().next().children().val().replaceAll(/(\n|\r\n)/g, "<br>")
			},
			success: function(result) {
				if(result == -1) {
										
				}
				else {
					console.log(result);
					createCommentList(result);
				}
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	}
	
	// 댓글리스트 생성
	function createCommentList(commentList) {
		$(".project_work_read_comemnt_content_wrap").eq(0).nextAll().remove();
		for(var i = 0; i < commentList.length; i++) {
			$(".project_work_read_comment_flex").append('<div class="project_work_read_comemnt_content_wrap"></div');
			$(".project_work_read_comemnt_content_wrap").last().append('<div class="project_work_read_comemnt_content_profile_wrap"></div');
			$(".project_work_read_comemnt_content_wrap").last().append('<div class="project_work_read_comemnt_content_input_wrap"></div');
			$(".project_work_read_comemnt_content_profile_wrap").last().append('<div class="project_work_read_comemnt_content_profile_img"></div>');
			$(".project_work_read_comemnt_content_profile_wrap").last().append('<div class="project_work_read_comment_content_profile_flex"></div>');
			$(".project_work_read_comment_content_profile_flex").last().append('<div class="project_work_read_comemnt_content_profile_name">'+commentList[i].name+'</div>');
			$(".project_work_read_comment_content_profile_flex").last().append('<div class="project_work_read_comemnt_content_profile_job">'+commentList[i].job_title+'</div>');
			$(".project_work_read_comemnt_content_profile_wrap").last().append('<div class="project_work_read_comemnt_content_date">'+commentList[i].pc_date+'</div>');
			$(".project_work_read_comemnt_content_input_wrap").last().append('<div class="project_work_read_comemnt_content">'+commentList[i].pc_content+'</div>');
			if(commentList[i].emp_no == ${loginSSInfo.emp_no}) {
				$(".project_work_read_comemnt_content_profile_wrap").last().append('<button type="button" pc_no="'+commentList[i].pc_no+'" class="project_work_read_comemnt_content_delete_btn">삭제</button>');
				$(".project_work_read_comemnt_content_profile_wrap").last().append('<button type="button" pc_no="'+commentList[i].pc_no+'" class="project_work_read_comemnt_content_update_btn">수정</button>');
			}
		}
		$(".project_work_read_comemnt_content_delete_btn").off("click");
		$(".project_work_read_comemnt_content_delete_btn").on("click", deleteCommentFnc);
		$(".project_work_read_comemnt_content_update_btn").off("click");
		$(".project_work_read_comemnt_content_update_btn").on("click", updateBtnFnc);
	}
</script>
</body>
</html>