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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<meta charset="UTF-8">
<title>조직도</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>

<style >


</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="attendance_section">
	<div id="attendance_main_wrap">
		<div id="attendance_main_header">
			<div id="attendance_main_menu_title">조직도</div>
		</div>
		<div id="tree">
		</div>
	</div>
</section>
<script>
$('#tree').jstree({ 
	  'core' : {
	    'data' : [
	      { "id" : "ajson1", "parent" : "#", "text" : "Simple root node" },
	      { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
	      { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" },
	      { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" },
	    ]
	  }
	});

</script>
</body>
</html>