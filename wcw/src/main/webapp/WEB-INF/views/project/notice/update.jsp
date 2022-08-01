<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/project/project.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/jstree/style.css" />
<script src="<%= request.getContextPath()%>/resources/js/jstree/jstree.js"></script>

<head>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<div id="project_board_insert_modal_background">
	<div id="project_board_insert_modal_wrap">
		<div id="project_board_insert_modal_grid">
			<div id="project_board_insert_modal_header">프로젝트 폴더 선택</div>
			<div id="project_file_tree">
			</div>
			<div id="project_board_insert_modal_btn_wrap">
				<button type="button" class="project_board_insert_modal_btn" id="project_board_insert_modal_cancle_btn">취소</button>
				<button type="button"class="project_board_insert_modal_btn" id="project_board_insert_modal_add_btn">확인</button>
			</div>
		</div>
	</div>
	<i class="fa-solid fa-spinner fa-spin-pulse" id="project_board_file_modal_loading"></i>
</div>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="project_section">
	<div id="project_main_wrap">
	<%@ include file="/WEB-INF/views/project/projectheader.jsp" %>
	<!-- <div id="project_main_menu_title">게시물 작성</div> -->
		<form id="board_form" name="board_form" action="<%= request.getContextPath()%>/project/notice/update.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pn_no" id="pn_no">
			<input type="hidden" name="pr_no" id="pr_no">
			<div id="project_board_insert_wrap">
				<div class="project_board_insert_content">
					<div class="project_board_insert_div_title">공지사항 제목</div>
					<div class="project_input_wrap">
						<input type="text" class="project_board_insert_input_text" name="pn_title" id="pn_title" placeholder="게시물 제목을 입력해 주세요. (최대 30자)">
						<div class="project_board_input_count">0/30자</div>
					</div>
				</div>
				<div class="project_board_insert_content">
					<div class="project_board_insert_div_title">공지사항 내용</div>
					<div class="project_input_wrap">
						<textarea class="project_board_insert_textarea" name="pn_content" id="pn_content" placeholder="프로젝트 내용을 입력해 주세요. (최대 600자)"></textarea>
						<div class="project_board_input_count">0/600자</div>
					</div>
				</div>
				<div class="project_board_insert_content">
					<div class="project_board_insert_div_title">파일 업로드</div>
					<div id="project_board_file_list_wrap">
						<div class="project_board_file_list">
							<c:forEach items="${fileList }" var="file">
								<div class="project_board_file_list_content" pf_no="${file.pf_no }">${file.pff_name }/${file.pf_name }</div>
								<i class="fa-solid fa-xmark file_delete_btn"></i>
							</c:forEach>
						</div>
						<button type="button" id="project_board_file_insert_btn" class="project_board_insert_btn">추가</button>
					</div>
					<c:forEach items="${fileList }" var="file">
						<input type="text" class="project_board_file_name_insert" name="project_file_name">
						<input type="text" class="project_board_parent_no_insert" name="project_parent_no">
						<input type="file" class="project_board_file_insert" name="project_file">
					</c:forEach>
					<input type="text" class="project_board_file_name_insert" name="project_file_name">
					<input type="text" class="project_board_parent_no_insert" name="project_parent_no">
					<input type="file" class="project_board_file_insert" name="project_file">
				</div>
				<button type="button" class="project_board_insert_write_btn">수정하기</button>
			</div>
		</form>
	</div>
</section>
<script type="text/javascript">
	//프로젝트 번호
	var js_pr_no = (new URL(location.href).searchParams).get('project');
	var js_pn_no = (new URL(location.href).searchParams).get('no');

	// 맨션 토글 버튼 위치 조정
	$(".project_insert_toggle_btn_wrap").css("margin-top", "2.5px");
	$(".project_insert_toggle_btn_wrap").css("margin-right", "10px");
	
	// 맨션 토글 기능 구현 
	$('.project_insert_toggle_btn_wrap').on("click", function() {
		if($(this).attr("toggle_chk") == 'f') {
			$(this).children(".project_insert_toggle_btn_circle").css({
				'left': '22.5px',
			});
			$(this).css("background-color", "#4B4DB2");
			$(this).attr("toggle_chk", 't');
			$(this).children('.project_insert_toggle_value').val('Y');
		} else if($(this).attr("toggle_chk") == 't') {
			$(this).children(".project_insert_toggle_btn_circle").css({
				'left': '2.5px',
			});
			$(this).css("background-color", "gray");
			$(this).attr("toggle_chk", 'f');
			$(this).children('.project_insert_toggle_value').val('N');
		}
	});
	
	// 게시물 제목 유효성 체크
	$('#pn_title').on('input', function() {
		let contentCount = $(this).val();
		if(contentCount.length == 0 || contentCount == '') {
			$(this).next().text('0/30자');
		} else {
			$(this).next().text(contentCount.length+'/30자');
		}
		if(contentCount.length > 30) {
			$(this).val($(this).val().substring(0, 30));
			alert('제목은 30자까지 입력 가능합니다.')
			$(this).next().text('30/30자');
		}
	});
	
	// 게시물 내용 유효성 체크
	$('#pn_content').on('input', function() {
		let contentCount = $(this).val();
		if(contentCount.length == 0 || contentCount == '') {
			$(this).next().text('0/600자');
		} else {
			$(this).next().text(contentCount.length+'/600자');
		}
		if(contentCount.length > 600) {
			$(this).val($(this).val().substring(0, 600));
			alert('제목은 600자까지 입력 가능합니다.')
			$(this).next().text('600/600자');
		}
	});
	
	// submit 기능 구현
	$(".project_board_insert_write_btn").on('click', function() {
		
		if($('#pn_title').val() == "") 	{
			alert("게시물 제목을 입력해주세요.");
			$('#pn_title').focus();
			return;
		}
		
		if($('#pn_content').val() == "") {
			alert("게시물 내용을 입력해주세요.");	
			$('#pn_content').focus();
			return;
		}
		
		
		let text = $('.project_board_insert_textarea').val();
		text = text.replaceAll(/(\n|\r\n)/g, "<br>");
		$('.project_board_insert_textarea').val(text);
		
		
		// 미사용 input태그 제거
		$(".project_board_file_name_insert").last().remove();
		$(".project_board_parent_no_insert").last().remove();
		$(".project_board_file_insert").last().remove();
		
		// 더미 데이터 삭제
		let tempLength = $(".project_board_file_insert").length
		for(var i = tempLength - 1; i > -1; i--) {
			if($(".project_board_file_insert").eq(i).val() == '') {
				$(".project_board_file_insert").eq(i).remove();
			}
		}
		
		// 로딩 표시
		$("#project_board_insert_modal_wrap").css("display","none");
		$("#project_board_file_modal_loading").css("display", "block");
		$("#project_board_insert_modal_background").css("display", "block");
		board_form.submit();
	});
	
	// 파일 업로드 기능 구현
	$("#project_board_file_insert_btn").on("click", function () {
		js_pff_no = 0;
		folder_path.length = 0;
		console.log("modal open");
		treeDataAjax();
		$("#project_board_insert_modal_background").css("display", "block");
	});
	
	// 모달창 닫기
	$("#project_board_insert_modal_cancle_btn").on("click", function() {
		$("#project_board_insert_modal_background").css("display", "none");	
	});
	
	// 폴더 선택 확인
	$("#project_board_insert_modal_add_btn").on("click", function() {
		if(js_pff_no == 0) {
			alert("프로젝트 폴더를 선택해주세요.");
			return;
		}
		$("#project_board_insert_modal_background").css("display", "none");	
		console.log($(".project_board_file_insert"));
		$(".project_board_file_insert").last().click();
	});
	
	// 파일 업로드	
	$(".project_board_file_insert").on("change", changeHandler);
	
	// 파일 업로드 change handler 함수
	function changeHandler() {
		$(".project_board_file_name_insert").last().val($(this).get(0).files[0].name);
		$(".project_board_parent_no_insert").last().val(js_pff_no);
		console.log($(".project_board_file_name_insert"));
		console.log($(".project_board_parent_no_insert"));
		console.log($(".project_board_file_name_insert").val());
		console.log($(".project_board_parent_no_insert").val());
		let fullName = $('#project_file_tree').jstree(true).get_path(js_pff_no,"/")+"/"+$(this).get(0).files[0].name;
		$(".project_board_file_list").append('<div class="project_board_file_list_content">'+fullName+'</div>');
		$(".project_board_file_list").append('<i class="fa-solid fa-xmark file_delete_btn"></i>');
		$(".project_board_insert_content").eq(2).append('<input type="text" class="project_board_file_name_insert" name="project_file_name">');
		$(".project_board_insert_content").eq(2).append('<input type="text" class="project_board_parent_no_insert" name="project_parent_no">');
		$(".project_board_insert_content").eq(2).append('<input type="file" class="project_board_file_insert" name="project_file">');
		$(".file_delete_btn").off("click");
		$(".file_delete_btn").on("click", deleteBtn);
		$(".project_board_file_insert").off("change");
		$(".project_board_file_insert").on("change", changeHandler);
	}
	
	// 파일 삭제 기능
	function deleteBtn() {
		if(confirm("파일을 삭제하겠습니까?")) {
			if($(this).prev().get(0).hasAttribute("pf_no")) {
				$("#board_form").append('<input type="hidden" name="delete_pf_list" value="'+$(this).prev().attr("pf_no")+'">');
			}
			let index = $(this).index(".file_delete_btn");
			$(".project_board_file_list_content").eq(index).remove();
			$(".file_delete_btn").eq(index).remove();
			$(".project_board_file_name_insert").eq(index).remove();
			$(".project_board_parent_no_insert").eq(index).remove();
			$(".project_board_file_insert").eq(index).remove();
		}
	}
	
	// 트리구조 생성
	var treeData = [];
	var vo; 
	var js_pff_no = 0;
	var folder_path = [];
	$('#project_file_tree').jstree({ 
		'core' : {
			'data' : treeData,
			"check_callback" : true
		},
		"types" : {
			"folder" : {
				icon:"fa-solid fa-folder"
			},
			"file" : {
				icon:"fa-solid fa-file"				
			}
		},
		'plugins' : ["wholerow" ,"types"]
	});
	//트리 데이터 생성 함수
	function treeDataCreate(list) {
		treeData.length = 0
		for (var i = 0; i < list.length; i++) {
			let tempParent;
			if(list[i].pf_no == 0) {
				if(list[i].pff_level == 0) {
					tempParent = "#";
				}
				else if(list[i].pff_level != 0) {
					tempParent = list[i].pff_ref;
				}
				vo = {
					"id" : list[i].pff_no,
					"parent" : tempParent,
					"text" : list[i].pff_name,
					"type" : "folder"
				};
				treeData.push(vo);
			}
		}
	}
	
	// 트리 데이터 불러오기 ajax
	function treeDataAjax() {
		console.log("treeDataAjax");
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/folder/list",
			data: {
				pr_no : js_pr_no
			},
			dataType : "json",
			success: function(result) {
				console.log(result);
				if(result == -1) {
					location.href = "<%= request.getContextPath()%>/login";					
					return;
				}
				treeDataCreate(result.folderList.concat(result.fileList));
				$('#project_file_tree').jstree(true).settings.core.data = treeData;
				$('#project_file_tree').jstree(true).refresh();
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	}
	
	// 노드 선택
	$('#project_file_tree').on("select_node.jstree", function (event, data) {
		js_pff_no = data.node.id;
		folder_path = data.node.parents;
	});
	
	// 초기값 입력
	$("#pn_title").val("${project.pn_title }");
	$('#pn_content').val("${project.pn_content}");
	$("#pn_title").trigger("input");
	$("#pn_content").trigger("input");
	$(".file_delete_btn").on("click", deleteBtn);
	$("#pn_no").val(js_pn_no);
	$("#pr_no").val(js_pr_no);
</script>
</body>
</html>