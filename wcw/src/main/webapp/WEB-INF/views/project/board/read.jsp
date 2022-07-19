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
</section>
<script type="text/javascript">
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
	
</script>
</body>
</html>