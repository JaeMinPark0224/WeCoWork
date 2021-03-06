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
					<div class="project_main_profile_info">${fn:substring(project.pb_date,0,19) }</div>
				</div>
			</div>
			<div class="project_board_read_title" id="project_board_read_title">${project.pb_title }</div>
			<div class="project_board_read_title">게시물 내용</div>
			<div class="project_board_read_content">${project.pb_content }</div>
			<div class="project_board_read_title">파일 업로드</div>
			<div class="project_board_read_file_wrap">
				<c:forEach items="${fileList }" var="file">
					<div class="project_board_read_file"><span class="project_board_read_file_span" url="${file.pf_url }">${file.pf_name }</span></div>
				</c:forEach>
			</div>
			<button class="project_board_read_btn">확인</button>
		</div>
	</div>
	<form action="<%= request.getContextPath()%>/project/board/delete" id="project_board_delete_form" method="post">
		<input type="hidden" name="pr_no" id="pr_no">
		<input type="hidden" name="pb_no" id="pb_no">
	</form>
</section>
<script type="text/javascript">
//프로젝트 번호
var js_pr_no = (new URL(location.href).searchParams).get('project');

//게시글 번호
var js_pb_no = (new URL(location.href).searchParams).get('no');
console.log(js_pb_no);

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
		$("#project_board_delete_form").get(0).submit();
	});
	
</script>
</body>
</html>