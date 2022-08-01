<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="project_main_header">
	<div id="project_main_menu_title">프로젝트</div>
	<div id="project_main_header_btn_wrap">
		<script type="text/javascript">
		var js_pr_no = (new URL(location.href).searchParams).get('project'); 
		var js_pr_title = "";
		console.log(window.location.href);
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/authority/check",
			data: {
				pr_no : js_pr_no,
			},
			dataType: "json",
			success: function(result) {
				console.log(result);
				js_pr_title = result.project.pr_title;
				$("#project_main_title").text(js_pr_title);
				if(result.result == -1) {
					
				}
				else if(result.result == 0) {
					console.log(result);
				}
				else if(result.result == 1) {
					$("#project_main_header_btn_wrap").append('<button class="btn_main_gray btn_main_float" id="btn_main_delete">삭제</button>');
					if(result.complete == "N") {
						$("#project_main_header_btn_wrap").append('<button class="btn_main_purple btn_main_float" id="btn_main_complete">완료</button>');
					}
					$("#project_main_header_btn_wrap").append('<button class="btn_main_purple btn_main_float" id="btn_main_update">수정</button>');
					$("#btn_main_delete").on("click", function () {
						if(confirm("프로젝트를 삭제 하시겠습니까?")) {
							$.ajax({
								type: "POST",
								url: "<%= request.getContextPath()%>/project/delete",
								data: {
									pr_no : js_pr_no
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
									else {
										alert("프로젝트를 삭제했습니다.");
										location.href = "<%= request.getContextPath()%>/project/list";					
										return;
									}
								},
								error: function(request, status, error) {
									alert("fail");
									console.log(request);
									console.log(status);
									console.log(error);
								}
							});
						}
					});
					$("#btn_main_update").on("click", function () {
						if(confirm("프로젝트를 수정 하시겠습니까?")) {
							location.href = "<%= request.getContextPath()%>/project/update?project="+js_pr_no;
						}
					});
					$("#btn_main_complete").on("click", function () {
						if(confirm("프로젝트를 완료 하시겠습니까?")) {
							$.ajax({
								type: "POST",
								url: "<%= request.getContextPath()%>/project/complete",
								data: {
									pr_no : js_pr_no
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
									else {
										alert("프로젝트를 완료했습니다.");
										location.reload();					
										return;
									}
								},
								error: function(request, status, error) {
									alert("fail");
									console.log(request);
									console.log(status);
									console.log(error);
								}
							});
						}
					});
				}
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
		</script>
	</div>
	<div id="project_main_title"></div>
	<script type="text/javascript">
		$("#project_main_title").text(js_pr_title);
	</script>
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
		
		$("#project_main_menu_title").on("click", function() {
			location.href = "<%= request.getContextPath()%>/project/list";
		});
		
		$("#project_main_title").on("click", function() {
			location.href = "<%= request.getContextPath()%>/project/main?project="+js_pr_no;
		});
	</script>
</div>