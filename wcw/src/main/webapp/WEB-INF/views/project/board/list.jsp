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
	<div id="project_board_list_container">
		<div class="project_board_list_flex_box">
			<div class="project_board_list_flex_box_header">공지사항</div>
			<div class="project_board_list_flex_box_body">
				<div class="project_board_list_flex_box_body_container">
					<c:forEach items="${noticeList }" var="notice">
						<div class="project_board_title"><span class="project_notice_title_span" pn_no="${notice.pn_no }">${notice.pn_title }</span></div>
						<div class="project_board_writer">${notice.name } ${notice.job_title }</div>
						<div class="project_board_date">${fn:substring(notice.pn_date,0,10) }</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="project_board_list_flex_box">
			<div class="project_board_list_flex_box_header">상단고정</div>
			<div class="project_board_list_flex_box_body">
				<div class="project_board_list_flex_box_body_container_fix">
					<c:forEach items="${boardFixList }" var="board">
						<div class="project_board_list_gird_rows" pr_no = "${board.pb_no }">
							<input class="project_board_num" type="hidden" value="${board.pb_no }">
							<div class="project_board_fix"><img class="project_board_fix_btn" fixChk="Y" src="<%= request.getContextPath()%>/resources/images/thumbtack-full.svg"></div>
							<div class="project_board_title"><span class="project_board_title_span">${board.pb_title}</span></div>
							<div class="project_board_writer">${board.name } ${board.job_title }</div>
							<div class="project_board_date">${fn:substring(board.pb_date,0,10) }</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="project_board_list_flex_box_board">
			<div class="project_board_list_flex_box_board_header">게시물</div>
			<div class="project_board_list_flex_box_board_body">
				<div class="project_board_list_flex_box_body_container_fix">
					<c:forEach items="${boardList }" var="board">
						<div class="project_board_list_gird_rows" pr_no = "${board.pb_no }">
							<input class="project_board_num" type="hidden" value="${board.pb_no }">
							<c:if test="${board.board_fix eq 'Y' }">
								<div class="project_board_fix"><img class="project_board_fix_btn" fixChk="Y" src="<%= request.getContextPath()%>/resources/images/thumbtack-full.svg"></div>
							</c:if>
							<c:if test="${board.board_fix eq 'N' }">
								<div class="project_board_fix"><img class="project_board_fix_btn" fixChk="N" src="<%= request.getContextPath()%>/resources/images/thumbtack-blank.svg"></div>
							</c:if>
							<div class="project_board_title"><span class="project_board_title_span">${board.pb_title}</span></div>
							<div class="project_board_writer">${board.name } ${board.job_title }</div>
							<div class="project_board_date">${fn:substring(board.pb_date,0,10) }</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
<script type="text/javascript">
// 프로젝트 번호
var js_pr_no = (new URL(location.href).searchParams).get('project');

// 게시판 서브 버튼 생성
$("#project_main_tab_wrap").append("<div id='project_board_sub_btn_wrap'></div>")
$("#project_board_sub_btn_wrap").append("<button id='project_notice_insert_btn' class='project_board_sub_btn'>공지사항 작성</button>");
$("#project_board_sub_btn_wrap").append("<button id='project_board_insert_btn' class='project_board_sub_btn'>글 작성</button>");



	// 게시판 작성 페이지 이동
	$("#project_board_insert_btn").on('click', function() {
		location.href = "<%= request.getContextPath()%>/project/board/insert?project=${pr_no}";
	});
	
	// 공지사항 작성 페이지 이동
	$("#project_notice_insert_btn").on('click', function() {
		location.href = "<%= request.getContextPath()%>/project/notice/insert?project=${pr_no}";	
	});
	
	// 공지사항 읽기 페이지 이동
	$(".project_notice_title_span").on('click', function() {
		var pn_no = $(this).attr("pn_no");
		location.href = "<%= request.getContextPath()%>/project/notice/read?project=${pr_no}&no="+pn_no;	
	});
	
	// 게시글 읽기 페이지 이동
	$(".project_board_title_span").on("click", titleClick);
	
	// 게시글 url생성 함수
	function titleClick() {
		var pb_no = $(this).parent().siblings('.project_board_num').val();
		location.href = "<%= request.getContextPath()%>/project/board/read?project=${pr_no}&no="+pb_no;
	}
	
	// 게시글 상단 고정 기능
	$('.project_board_fix_btn').on('click', fixBtnFnc);
	
	// 게시글 상단 고정 기능 구현 함수
	function fixBtnFnc() {
		console.log("project_board_fix_btn click");
		var pb_no = $(this).parent().siblings('.project_board_num').val();
		var fixChk = $(this).attr("fixChk");
		var $this = $(this);
		var urlStr = "";
		if(fixChk == 'Y') {
			urlStr = "<%= request.getContextPath()%>/project/board/fix/delete";
		} else if(fixChk == 'N') {
			urlStr = "<%= request.getContextPath()%>/project/board/fix/insert";	
		}
		
		$.ajax({
			type: "POST",
			url: urlStr,
			data: {
				pb_no: pb_no
			},
			success: function(result){
				if(result == 1) {
					if(fixChk == 'Y') {
						var $temp = $('.project_board_list_flex_box_body_container_fix').eq(1).children('[pr_no='+pb_no+']');
						$temp.find('.project_board_fix_btn').attr('src', "<%= request.getContextPath()%>/resources/images/thumbtack-blank.svg");
						$temp.find('.project_board_fix_btn').attr('fixChk', 'N');
					} else if(fixChk == 'N') {
						var $temp = $('.project_board_list_flex_box_body_container_fix').eq(1).children('[pr_no='+pb_no+']');
						$temp.find('.project_board_fix_btn').attr('src', "<%= request.getContextPath()%>/resources/images/thumbtack-full.svg");
						$temp.find('.project_board_fix_btn').attr('fixChk', 'Y');
					}
					$.ajax({
						type: "POST",
						url: "<%= request.getContextPath()%>/project/board/fix/select",
						data: {
							pr_no : '${pr_no}'
						},
						dataType: 'json',
						success: function(result) {
							console.log(result);
							var $container = $('.project_board_list_flex_box_body_container_fix').eq(0);
							$container.empty();
							for (var i = 0; i < result.length; i++) {
								var board = result[i]; 
								$container.append('<div class="project_board_list_gird_rows" pr_no = "'+board.pb_no+'"></div>');
								var $tempbox = $('.project_board_list_gird_rows[pr_no='+board.pb_no+']').eq(0);
								$tempbox.append('<input class="project_board_num" type="hidden" value="'+board.pb_no +'">');
								$tempbox.append('<div class="project_board_fix"><img class="project_board_fix_btn" fixChk="Y" src="<%= request.getContextPath()%>/resources/images/thumbtack-full.svg"></div>');
								$tempbox.append('<div class="project_board_title"><span class="project_board_title_span">'+board.pb_title+'</span></div>');
								$tempbox.append('<div class="project_board_writer">'+board.name+' '+board.job_title +'</div>');
								$tempbox.append('<div class="project_board_date">'+board.pb_date+'</div>');
							}
							$('.project_board_fix_btn').off('click');
							$('.project_board_fix_btn').on('click', fixBtnFnc);
							$(".project_board_title_span").off("click");
							$(".project_board_title_span").on("click", titleClick);
						},
						error: function(request, status, error) {
							alert('fail');
						}
					});
				}
			},
			error: function(request, status, error){
				alert('fail');
			}
		});
	}
</script>
</body>
</html>