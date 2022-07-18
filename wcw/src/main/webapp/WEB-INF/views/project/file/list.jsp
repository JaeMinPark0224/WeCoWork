<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/project/project.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/jstree/style.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath()%>/resources/js/jstree/jstree.js"></script>
<head>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<div id="project_file_modal_background">
	<i class="fa-solid fa-spinner fa-spin-pulse" id="project_file_modal_loading"></i>
</div>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="project_section">
	<div id="project_main_wrap">
	<%@ include file="/WEB-INF/views/project/projectheader.jsp" %>
		<div id="project_file_tree">
		</div>
	</div>
</section>
<script type="text/javascript">
// 프로젝트 번호
var js_pr_no = (new URL(location.href).searchParams).get('project');

//추가 버튼 생성
<c:if test="${fn:length(folderList) eq 0}">
	$("#project_main_tab_wrap").append("<div id='project_file_sub_btn_wrap'></div>")
	$("#project_file_sub_btn_wrap").append("<button id='project_folder_add_btn' class='project_file_sub_btn'>기본 폴더 생성</button>");
</c:if>

// 기본 폴더 생성 기능
$("#project_folder_add_btn").on("click", function() {
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/folder/insert",
		data: {
			pr_no : js_pr_no,
			root : true
		},
		success: function(result) {
			if(result == -1) {
				location.href = "<%= request.getContextPath()%>/login";					
				return;
			}
			alert(result);
			console.log(result);
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
});

// 폴더 데이터 생성
var treeData = [];
var vo; 
<c:forEach items="${folderList}" var="folder">
vo = {
	"id" : "${folder.pff_no}",
	"parent" : <c:if test="${folder.pff_level eq 0 }">"#"</c:if><c:if test="${folder.pff_level ne 0 }">"${folder.pff_ref}"</c:if>,
	"text" : "${folder.pff_name}"		
}
treeData.push(vo);
</c:forEach>

// 트리 데이터 생성 함수
function treeDataCreate(list) {
	treeData.length = 0
	for (var i = 0; i < list.length; i++) {
		let tempParent;
		if(list[i].pff_level == 0) {
			tempParent = "#";
		}
		else if(list[i].pff_level != 0) {
			tempParent = list[i].pff_ref;
		}
		vo = {
			"id" : list[i].pff_no,
			"parent" : tempParent,
			"text" : list[i].pff_name
		};
		treeData.push(vo);
	}
}

// 트리구조 생성
$('#project_file_tree').jstree({ 
	'core' : {
		'data' : treeData,
		"check_callback" : true
	},
	'plugins' : ["contextmenu", "wholerow" ]
});


// 노드 선택
$('#project_file_tree').on("select_node.jstree", function (event, data) {
	console.log("select_node.jstree");
	console.log(event);
	console.log(data);
});

// 노드 생성
$('#project_file_tree').on("create_node.jstree", function (event, data) {
	console.log("create_node.jstree");
	$("#project_file_modal_background").css("display", "block");
	
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/folder/insert",
		data: {
			pr_no : js_pr_no,
			pff_name : data.node.text,
			pff_ref : data.node.parent,
			pff_level : data.node.parents.length - 1
		},
		success: function(result) {
			if(result == -1) {
				location.href = "<%= request.getContextPath()%>/login";					
				return;
			}
			if(result == 1) {
				treeDataAjax();
			}
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
});


// 노드 이름 변경
$('#project_file_tree').on("rename_node.jstree", function (event, data) {
	console.log("rename_node.jstree");
	console.log(event);
	console.log(data);
	console.log(data.node.id);
	console.log(data.node.text);
	$("#project_file_modal_background").css("display", "block");
	
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/folder/update",
		data: {
			pr_no : js_pr_no,
			pff_no : data.node.id,
			pff_name : data.node.text
		},
		success: function(result) {
			if(result == -1) {
				location.href = "<%= request.getContextPath()%>/login";					
				return;
			}
			if(result == -2) {
				location.href = "<%= request.getContextPath()%>/project/list";	
				return;
			}
			treeDataAjax();
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
});

// 노드 삭제
$('#project_file_tree').on("remove_node.jstree", function (event, data) {
	console.log("remove_node.jstree");
	console.log(event);
	console.log(data);
});

// 트리 데이터 불러오기 ajax
function treeDataAjax() {
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/folder/list",
		data: {
			pr_no : js_pr_no
		},
		dataType : "json",
		success: function(result) {
			if(result == -1) {
				location.href = "<%= request.getContextPath()%>/login";					
				return;
			}
			treeDataCreate(result);
			$('#project_file_tree').jstree(true).settings.core.data = treeData;
			$('#project_file_tree').jstree(true).refresh();
			$("#project_file_modal_background").css("display", "none");
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}
</script>
</body>
</html>