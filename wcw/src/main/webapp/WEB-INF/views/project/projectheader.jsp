<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="project_main_header">
	<div id="project_main_menu_title">프로젝트</div>
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
		<script type="text/javascript">
			// 프로젝트 탭 볼드체
			let project_main_tab_text = $(location).attr('pathname').split('/')[3];
			let project_main_tab_index;
			if(project_main_tab_text == "board") {
				project_main_tab_index = 0;
			} 
			else if(project_main_tab_text == "work") {
				project_main_tab_index = 1;
			}
			else if(project_main_tab_text == "todo") {
				project_main_tab_index = 2;	
			}
			else if(project_main_tab_text == "calendar") {
				project_main_tab_index = 3;	
			}
			else if(project_main_tab_text == "file") {
				project_main_tab_index = 4;	
			}
			else if(project_main_tab_text == "participant") {
				project_main_tab_index = 5;
			}
			$(".project_main_tab").eq(project_main_tab_index).css("font-family", "NotoSansB");
		</script>
	</div>
	<script>
		$('.project_main_tab').on('click', function() {
			var js_pr_no = (new URL(location.href).searchParams).get('project'); 
			switch($(this).index()) {
			case 0:
				location.href = "<%= request.getContextPath()%>/project/board/list?project="+js_pr_no;
				break;
			case 1:
				location.href = "<%= request.getContextPath()%>/project/work/list?project="+js_pr_no;
				break;
			case 2:
				location.href = "<%= request.getContextPath()%>/project/todo/list?project="+js_pr_no;
				break;
			case 3:
				location.href = "<%= request.getContextPath()%>/project/calendar/list?project="+js_pr_no;
				break;
			case 4:
				location.href = "<%= request.getContextPath()%>/project/file/list?project="+js_pr_no;
				break;
			case 5:
				location.href = "<%= request.getContextPath()%>/project/participant/list?project="+js_pr_no;
				break;
			}
		});
	</script>
</div>