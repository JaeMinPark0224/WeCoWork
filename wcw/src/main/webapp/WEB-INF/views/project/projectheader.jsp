<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="project_main_header">
	<div id="project_main_menu_title">프로젝트 요약</div>
	<div id="project_main_header_btn_wrap">
		<button class="btn_main_gray btn_main_float" id="btn_main_delete">삭제하기</button>
		<button class="btn_main_purple btn_main_float" id="btn_main_complete">완료하기</button>
		<button class="btn_main_purple btn_main_float" id="btn_main_update">수정하기</button>
	</div>
	<div id="project_main_title">프로젝트 제목</div>
	<div id="project_main_tab_wrap">
		<div class="project_main_tab">게시판</div>
		<div class="project_main_tab">업무</div>
		<div class="project_main_tab">할 일</div>
		<div class="project_main_tab">캘린더</div>
		<div class="project_main_tab">파일</div>
		<div class="project_main_tab">참여자</div>
	</div>
	<script>
		$('.project_main_tab').on('click', function() {
			console.log($(this).index());
			switch($(this).index()) {
			case 0:
				location.href = "<%= request.getContextPath()%>/project/board/list"+$(location).attr("search");
				break;
			case 1:
				location.href = "<%= request.getContextPath()%>/project/work/list"+$(location).attr("search");
				break;
			case 2:
				alert("할 일");
				break;
			case 3:
				alert("캘린더");
				break;
			case 4:
				alert("파일");
				break;
			case 5:
				alert("참여자");
				break;
			}
		});
	</script>
</div>