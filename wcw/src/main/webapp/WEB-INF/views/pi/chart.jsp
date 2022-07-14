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
  /* css here */
}
.tf-custom .tf-nc:before,
.tf-custom .tf-nc:after {
  /* css here */
}
.tf-custom li li:before {
  /* css here */
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
		  <ul>
		    <li>
		      <span class="tf-nc">대표이사</span>
		      <ul>
		        <li>
		          <span class="tf-nc">2</span>
		          <ul>
		            <li><span class="tf-nc">4</span></li>
		            <li>
		              <span class="tf-nc">5</span>
		              <ul>
		                <li><span class="tf-nc">9</span></li>
		                <li><span class="tf-nc">10</span></li>
		              </ul>
		            </li>
		            <li><span class="tf-nc">6</span></li>
		          </ul>
		        </li>
		        <li>
		          <span class="tf-nc">3</span>
		          <ul>
		            <li><span class="tf-nc">7</span></li>
		            <li><span class="tf-nc">8</span></li>
		          </ul>
		        </li>
		      </ul>
		    </li>
		  </ul>
		</div>
	</div>
</section>
<script>

</script>
</body>
</html>