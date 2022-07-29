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
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
		<div id="project_board_read_wrap">
			<div id="project_main_profile_wrap">
				<div id="project_main_profile_picture_wrap">
				</div>
				<div id="project_main_profile_info_wrap">
					<div class="project_main_profile_info">${project.dept_name }</div>
					<div class="project_main_profile_info_wrap">
						<div class="project_main_profile_info_name">${project.name }</div>
						<div class="project_main_profile_info">${project.job_title }</div>
					</div>
					<div class="project_main_profile_info">${fn:substring(project.pn_date,0,19) }</div>
				</div>
			</div>
			<div id="project_board_read_grid">
				<div class="project_board_read_title">게시물 제목</div>
				<div class="project_board_read_title" id="project_board_read_title">${project.pn_title }</div>
				<div class="project_board_read_title">게시물 내용</div>
				<div class="project_board_read_content">${project.pn_content }</div>
				<c:if test="${not empty fileList }">
				<div class="project_board_read_title">파일 업로드</div>
				<div class="project_board_read_file_wrap">
					<c:forEach items="${fileList }" var="file">
						<div class="project_board_read_file"><span class="project_board_read_file_span" url="${file.pf_url }">${file.pf_name }</span></div>
					</c:forEach>
				</div>
				</c:if>
				<div class="project_board_read_hr"></div>
				<div class="project_board_read_comemnt_title">댓글</div>
				<div class="project_board_read_comemnt_content_flex">
					<div class="project_board_read_comemnt_content_wrap">
						<div class="project_board_read_comemnt_content_profile_wrap">
							<div class="project_board_read_comemnt_content_profile_img"></div>
							<div class="project_board_read_comment_content_profile_flex">
								<div class="project_board_read_comemnt_content_profile_name">${loginSSInfo.name }</div>
								<div class="project_board_read_comemnt_content_profile_job">${loginSSInfo.job_title }</div>
							</div>
						</div>
						<div class="project_board_read_comemnt_content_input_wrap">
							<textarea type="text" class="project_board_read_comemnt_content_input" name=""></textarea>
							<button type="button" class="project_board_read_comemnt_content_input_btn">등록</button>
						</div>
					</div>
					<c:forEach items="${commentList }" var="comment">
						<div class="project_board_read_comemnt_content_wrap">
							<div class="project_board_read_comemnt_content_profile_wrap">
								<div class="project_board_read_comemnt_content_profile_img"></div>
								<div class="project_board_read_comment_content_profile_flex">
									<div class="project_board_read_comemnt_content_profile_name">${comment.name }</div>
									<div class="project_board_read_comemnt_content_profile_job">${comment.job_title }</div>
								</div>
								<div class="project_board_read_comemnt_content_date">${fn:substring(comment.pc_date,0,19) }</div>
								<c:if test="${loginSSInfo.emp_no eq comment.emp_no }">
									<button type="button" pc_no="${comment.pc_no }" class="project_board_read_comemnt_content_delete_btn">삭제</button>
								</c:if>
								<c:if test="${loginSSInfo.emp_no eq comment.emp_no }">
									<button type="button" pc_no="${comment.pc_no }" class="project_board_read_comemnt_content_update_btn">수정</button>
								</c:if>
							</div>
							<div class="project_board_read_comemnt_content_input_wrap">
								<div class="project_board_read_comemnt_content">${comment.pc_content }</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<button class="project_board_read_btn">확인</button>
		</div>
	</div>
	<form action="<%= request.getContextPath()%>/project/board/delete" id="project_board_read_form" method="post">
		<input type="hidden" name="pr_no" id="pr_no">
		<input type="hidden" name="pb_no" id="pb_no">
	</form>
</section>
<script type="text/javascript">
//프로젝트 번호
var js_pr_no = (new URL(location.href).searchParams).get('project');

//게시글 번호
var js_pn_no = (new URL(location.href).searchParams).get('no');

//게시판 서브 버튼 생성
$("#project_main_tab_wrap").append("<div id='project_board_sub_btn_wrap'></div>")
$("#project_board_sub_btn_wrap").append("<button id='project_board_update_btn' class='project_board_sub_btn'>수정하기</button>");
$("#project_board_sub_btn_wrap").append("<button id='project_board_delete_btn' class='project_board_sub_btn'>삭제하기</button>");

	$('.project_board_read_btn').on('click', function() {
		location.href = "<%= request.getContextPath()%>/project/board/list/?project=${pr_no}";
	})
	
	$(".project_board_read_file_span").on("click", function() {
		download($(this).attr("url"), $(this).text());
	});
	
	// 파일 다운로드 함수
	function download(url, name) {
		console.log(url);
		console.log(name);
	    axios({
	          url: url,
	          method: 'GET',
	          responseType: 'blob'
	    })
	          .then((response) => {
	                const url = window.URL
	                      .createObjectURL(new Blob([response.data]));
	                const link = document.createElement('a');
	                link.href = url;
	                link.setAttribute('download', name);
	                document.body.appendChild(link);
	                link.click();
	                document.body.removeChild(link);
	          })
	}
	
	// 게시글 삭제 기능
	$("#project_board_delete_btn").on("click", function() {
		if(!confirm("게시글을 삭제하겠습니까?")) {
			return;
		}
		$("#pr_no").val(js_pr_no);
		$("#pb_no").val(js_pb_no);
		$("#project_board_read_form").get(0).action = "<%= request.getContextPath()%>/project/board/delete";
		$("#project_board_read_form").get(0).submit();
	});
	
	
	// 게시글 업데이트 기능
	$("#project_board_update_btn").on("click", function () {
		if(!confirm("게시글을 수정하겠습니까?")) {
			return;
		}
		location.href = "<%= request.getContextPath()%>/project/board/update?project="+js_pr_no+"&no="+js_pb_no;
	});
	
	// 댓글 등록
	$(".project_board_read_comemnt_content_input_btn").on("click", function() {
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/comment/insert",
			dataType: "json",
			data: {
				pn_no : js_pn_no,
				pc_content: $(".project_board_read_comemnt_content_input").val().replaceAll(/(\n|\r\n)/g, "<br>")
			},
			success: function(result) {
				if(result == -1) {
										
				}
				else {
					console.log(result);
					createCommentList(result);
					$(".project_board_read_comemnt_content_input").val('');
				}
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	});
	
	// 댓글 삭제
	$(".project_board_read_comemnt_content_delete_btn").on("click", deleteCommentFnc);
	
	// 댓글 삭제 함수
	function deleteCommentFnc() {
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/comment/delete",
			dataType: "json",
			data: {
				pc_no : $(this).attr("pc_no"),
				pn_no : js_pn_no
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
	$(".project_board_read_comemnt_content_update_btn").on("click", updateBtnFnc);
	
	// 댓글 수정 버튼 수정 기능
	function updateBtnFnc() {
		$(this).text("수정 완료");
		$(this).off("click");
		$(this).on("click", updateDoCommentFnc);
		let temtText = $(this).parent().next().children().text();
		$(this).parent().next().children().remove();
		$(this).parent().next().append('<textarea type="text" class="project_board_read_comemnt_content_input" name="">'+temtText+'</textarea>');
	}
	
	// 댓글 수정 함수 기능
	function updateDoCommentFnc() {
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/comment/update",
			dataType: "json",
			data: {
				pc_no : $(this).attr("pc_no"),
				pn_no : js_pn_no,
				pc_content : $(this).parent().next().children().val().val().replaceAll(/(\n|\r\n)/g, "<br>")
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
		$(".project_board_read_comemnt_content_wrap").eq(0).nextAll().remove();
		for(var i = 0; i < commentList.length; i++) {
			$(".project_board_read_comemnt_content_flex").append('<div class="project_board_read_comemnt_content_wrap"></div');
			$(".project_board_read_comemnt_content_wrap").last().append('<div class="project_board_read_comemnt_content_profile_wrap"></div');
			$(".project_board_read_comemnt_content_wrap").last().append('<div class="project_board_read_comemnt_content_input_wrap"></div');
			$(".project_board_read_comemnt_content_profile_wrap").last().append('<div class="project_board_read_comemnt_content_profile_img"></div>');
			$(".project_board_read_comemnt_content_profile_wrap").last().append('<div class="project_board_read_comment_content_profile_flex"></div>');
			$(".project_board_read_comment_content_profile_flex").last().append('<div class="project_board_read_comemnt_content_profile_name">'+commentList[i].name+'</div>');
			$(".project_board_read_comment_content_profile_flex").last().append('<div class="project_board_read_comemnt_content_profile_job">'+commentList[i].job_title+'</div>');
			$(".project_board_read_comemnt_content_profile_wrap").last().append('<div class="project_board_read_comemnt_content_date">'+commentList[i].pc_date+'</div>');
			$(".project_board_read_comemnt_content_input_wrap").last().append('<div class="project_board_read_comemnt_content">'+commentList[i].pc_content+'</div>');
			if(commentList[i].emp_no == ${loginSSInfo.emp_no}) {
				$(".project_board_read_comemnt_content_profile_wrap").last().append('<button type="button" pc_no="'+commentList[i].pc_no+'" class="project_board_read_comemnt_content_delete_btn">삭제</button>');
				$(".project_board_read_comemnt_content_profile_wrap").last().append('<button type="button" pc_no="'+commentList[i].pc_no+'" class="project_board_read_comemnt_content_update_btn">수정</button>');
			}
		}
		$(".project_board_read_comemnt_content_delete_btn").off("click");
		$(".project_board_read_comemnt_content_delete_btn").on("click", deleteCommentFnc);
		$(".project_board_read_comemnt_content_update_btn").off("click");
		$(".project_board_read_comemnt_content_update_btn").on("click", updateBtnFnc);
	}
</script>
</body>
</html>