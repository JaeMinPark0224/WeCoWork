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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/jstree/style.css" />
<script src="<%= request.getContextPath()%>/resources/js/jstree/jstree.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
		<form id="uploadForm">
			<input type="file" name="project_file" id="project_file_input_file" style="display : none;">
		</form>
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
var treeFileDate = [];
var vo; 
<c:forEach items="${folderList}" var="folder">
vo = {
	id : "${folder.pff_no}",
	parent : <c:if test="${folder.pff_level eq 0 }">"#"</c:if><c:if test="${folder.pff_level ne 0 }">"${folder.pff_ref}"</c:if>,
	text : "${folder.pff_name}",
	type : "folder"
}
treeData.push(vo);
</c:forEach>

<c:forEach items="${fileList}" var="file">
vo = {
	id : "file_${file.pf_no}",
	parent : "${file.pff_no}",
	text : "${file.pf_name}",
	type : "file",
	a_attr : {file_url : "${file.pf_url}"
				, pb_no : "${file.pb_no}"}
}
treeFileDate.push(vo);
</c:forEach>

// 트리 데이터 생성 함수
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
		}
		else {
			tempParent = list[i].pff_no;
			vo = {
				"id" : "file_"+list[i].pf_no,
				"parent" : tempParent,
				"text" : list[i].pf_name,
				"type" : "file",
				a_attr : {file_url : list[i].pf_url
							, pb_no : list[i].pb_no}
			};	
		}
		treeData.push(vo);
	}
}

// 트리구조 생성
console.log(treeData.concat(treeFileDate));
$('#project_file_tree').jstree({ 
	core : {
		data : treeData.concat(treeFileDate),
		check_callback : true
	},
	types : {
		folder : {
			icon:"fa-solid fa-folder"
		},
		
		file : {
			icon:"fa-solid fa-file"
		}
	},
	contextmenu : {
		items : function (o, cb) {
			if(o.original.type == "folder") {
				return {
					"create" : {
						"separator_before"	: false,
						"separator_after"	: true,
						"_disabled"			: false,
						"label"				: "Folder Create",
						"action"			: function (data) {
							var inst = $.jstree.reference(data.reference),
								obj = inst.get_node(data.reference);
							inst.create_node(obj, {}, "last", function (new_node) {
								try {
									inst.edit(new_node);
								} catch (ex) {
									setTimeout(function () { inst.edit(new_node); },0);
								}
							});
						}
					},
					"rename" : {
						"separator_before"	: false,
						"separator_after"	: false,
						"_disabled"			: false,
						"label"				: "Rename",
						"action"			: function (data) {
							var inst = $.jstree.reference(data.reference),
								obj = inst.get_node(data.reference);
							inst.edit(obj);
						}
					},
					"remove" : {
						"separator_before"	: true,
						"icon"				: false,
						"separator_after"	: false,
						"_disabled"			: false,
						"label"				: "Delete",
						"action"			: function (data) {
							var inst = $.jstree.reference(data.reference),
								obj = inst.get_node(data.reference);
							if(inst.is_selected(obj)) {
								inst.delete_node(inst.get_selected());
							}
							else {
								inst.delete_node(obj);
							}
						}
					},
					"addfile" : {
						"separator_before"	: true,
						"icon"				: false,
						"separator_after"	: false,
						"_disabled"			: false,
						"label"				: "File Upload",
						"action"			: function (data) {
							$("#project_file_input_file").get(0).click();
						}
					}
				};
			}
			else if(o.original.type == "file") {
				return {
					"downloadfile" : {
						"separator_before"	: true,
						"icon"				: false,
						"separator_after"	: false,
						"_disabled"			: false,
						"label"				: "Download",
						"action"			: function (data) {
							console.log(data);
							download(data.reference[0].attributes.getNamedItem("file_url").value, data.reference[0].text);
						}
					},
					"rename" : {
						"separator_before"	: true,
						"separator_after"	: true,
						"_disabled"			: false,
						"label"				: "Rename",
						"action"			: function (data) {
							var inst = $.jstree.reference(data.reference),
								obj = inst.get_node(data.reference);
							inst.edit(obj);
						}
					},
					"delete" : {
						"separator_before"	: true,
						"separator_after"	: true,
						"_disabled"			: false,
						"label"				: "Delete",
						"action"			: function (data) {
							deleteFile(data);
						}
					}
				}
			}
		}
	},
	'plugins' : ["contextmenu", "wholerow" ,"types"]
});

// 파일 업로드 기능 구현
$("#project_file_input_file").on("change", function() {
	$("#project_file_modal_background").css("display", "block");
	var form = $("#uploadForm")[0];
	var formData = new FormData(form);
	formData.append("pff_no", $('#project_file_tree').jstree(true).get_selected());
	formData.append("pf_name", $(this).get(0).files[0].name);
	formData.append("pr_no", js_pr_no);
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/file/insert",
		data: formData,
		enctype : "multipart/form-data",
		contentType : false,
		processData : false,
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

// 노드 선택
$('#project_file_tree').on("select_node.jstree", function (event, data) {
	console.log("select_node.jstree");
	console.log(event);
	console.log(data);
	console.log(data.node);
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
	$("#project_file_modal_background").css("display", "block");
	if(data.node.type == "folder") {
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
	}
	else if (data.node.type == "file") {
		let cnt = 0;
		let dotArray = data.node.text.match(/\./g);
		if(dotArray != null) {
			cnt = dotArray.length;
		}
		if(cnt == 0) {
			data.node.text = data.node.text + "." + data.old.split(".")[1];
		}
		else {
			alert("확장자 없이 파일이름만 작성해주세요.");
			data.node.text = data.old;
		}
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/project/file/update",
			data: {
				pr_no : js_pr_no,
				pf_no : data.node.id.replace("file_",""),
				pf_name : data.node.text
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
				else if(result == 1) {
					treeDataAjax();
				}
			},
			error: function(request, status, error) {
				alert("fail");
			}
		});
	}
});

// 노드 삭제
$('#project_file_tree').on("remove_node.jstree", function (event, data) {
	console.log("remove_node.jstree");
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
			console.log(result);
			if(result == -1) {
				location.href = "<%= request.getContextPath()%>/login";					
				return;
			}
			treeDataCreate(result.folderList.concat(result.fileList));
			$('#project_file_tree').jstree(true).settings.core.data = treeData;
			$('#project_file_tree').jstree(true).refresh();
			$("#project_file_modal_background").css("display", "none");
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}

//파일 다운로드 함수
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

//파일 삭제 함수
function deleteFile(data) {
	let pb_no = data.reference[0].getAttributeNode("pb_no").value;
	let pf_no = data.reference[0].getAttributeNode("id").value.split("_")[1];
	let pf_url = data.reference[0].getAttributeNode("file_url").value.split("/");
	pf_url = pf_url[pf_url.length - 1];
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/project/file/delete",
		data: {
			pr_no : js_pr_no,
			pf_no : pf_no,
			pb_no : pb_no,
			pf_name : pf_url
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
			else if(result == 1) {
				treeDataAjax();
			}
			else if(result == 0) {
				alert("파일 삭제에 실패했습니다.\n게시물 파일은 게시물 삭제시에만 삭제 가능합니다.");
				treeDataAjax();
			}
		},
		error: function(request, status, error) {
			alert("fail");
		}
	});
}
</script>
</body>
</html>