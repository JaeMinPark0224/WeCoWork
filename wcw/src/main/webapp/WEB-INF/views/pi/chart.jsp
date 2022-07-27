<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/attendance/attendance.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://unpkg.com/treeflex/dist/css/treeflex.css" rel="stylesheet">
<meta charset="UTF-8">
<title>조직도</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>

<style >

.example .tf-nc {
  	width: 110px;
	/* height: 40px; */
	/* line-height: 24px; */
	background-color: #4B4DB2;
	font-size: 12px;
	color: white;
	font-family: NotoSansR;
	border: none;
	text-align: center;
	
}
.tf-tree .tf-nc:before,
.tf-tree .tf-nc:after {
  border-left : solid 1px rgb(224, 224, 224);
}
.tf-tree li li:before {
  border-top : solid 1px rgb(224, 224, 224);
}

.emp_list {
	width: 110px;
	border: 1px solid #4B4DB2;
	z-index : 3;
	background-color: white;
	box-sizing: border-box;
	min-height: 25px;
	margin-top: 6px;
}

.vertical_line {
	border-left: 2px solid black;
	height: 10px;
	position: relative;
}

.emp_list_sub {
	width: 110px;
	border: 1px solid #4B4DB2;
	z-index : 2;
	background-color: white;
	box-sizing: border-box;
}

.emp_name {
	font-size: 12.5px;
	color: #4B4DB2;
	text-align: center;
	height: 25px;
	line-height: 25px;
	font-family: NotoSansR;
}

.tf-nc::before  {
	top: -1.33125em !important;
	height: 1.3em !important;
}

.tf-nc::after {
	height: 1.3em !important;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="attendance_section">
	<div id="attendance_main_wrap">
		<div id="attendance_main_header">
			<div id="attendance_main_menu_title">조직도</div>
		</div>
		
		<div class="tf-tree example">
			<ul depth="0">
				<li>
					<span class="tf-nc" dept_no="0">대표이사</span>
			    </li>
			</ul>
		</div>
	</div>
</section>
<script>
var deptList = [];
var chkList = [];
var vo;
<c:forEach items="${upperDeptList}" var="dept">
	vo = {
			dept_no : "${dept.dept_no}",
			dept_name : "${dept.dept_name}",
			emp_no : "${dept.emp_no}",
			dept_upper_no : "${dept.dept_upper_no}"
	}
	deptList.push(vo);
	chkList.push(${dept.dept_no});
</c:forEach>
var empList = [];
<c:forEach items="${empDeptList}" var="emp">
	vo = {
			emp_no : "${emp.emp_no}",
			name : "${emp.name}",
			dept_no : "${emp.dept_no}"
	}
	empList.push(vo);
</c:forEach>
createTree();

function createTree() {
	createDepth(deptList, 0);
	while(chkList.length != 0) {
		for(var i = 0; i < deptList.length; i++) {
			if(chkChildDept(deptList[i].dept_no)) {
				createDepth(deptList, deptList[i].dept_no);
				$("span[dept_no = "+deptList[i].dept_no+"]").append("<div class='emp_list' dept_no = "+deptList[i].dept_no+"></div>");
				$("span[dept_no = "+deptList[i].dept_no+"]").css({
					"padding": "6px 0px 0px 0px"
				});
				for(var j = 0; j < empList.length; j++) {
					if(deptList[i].dept_no == empList[j].dept_no) {
						$(".emp_list[dept_no = "+deptList[i].dept_no+"]").append("<div class='emp_name'>"+empList[j].name+"</div>");
					}
				}
			}
			else {
				$("span[dept_no = "+deptList[i].dept_no+"]").after("<div class='emp_list_sub' dept_no = "+deptList[i].dept_no+"></div>");
				for(var j = 0; j < empList.length; j++) {
					if(deptList[i].dept_no == empList[j].dept_no) {
						$(".emp_list_sub[dept_no = "+deptList[i].dept_no+"]").append("<div class='emp_name'>"+empList[j].name+"</div>");
					}					
				}
			}
		}
	}
}

function createDepth(deptList, upper_dept_no) {
	let depth = $("span[dept_no = "+upper_dept_no+"]").parents().eq(1).attr("depth");
	depth = parseInt(depth) + 1;
	$("span[dept_no = "+upper_dept_no+"]").after("<ul depth='"+depth+"'></ul>");
	for(var i = 0; i < deptList.length; i++) {
		if(deptList[i].dept_upper_no == upper_dept_no) {
			$("ul[depth = "+depth+"]").append('<li><span class="tf-nc" dept_no="'+deptList[i].dept_no+'">'+deptList[i].dept_name+'</span></li>')
			chkList = chkList.filter((element) => element != deptList[i].dept_no);
		}
	}
}

function chkChildDept(dept_no) {
	let result = false;
	for(var i = 0; i< deptList.length; i++) {
		if(deptList[i].dept_upper_no == dept_no) {
			result = true;
		}
	}
	return result;
}

</script>
</body>
</html>