<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/attendance/attendance.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>

<style type="text/css">
.attendance_main_box_first_container {
	flex-grow: 1;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="attendance_section">
	<div id="attendance_main_wrap">
		<div id="attendance_main_header">
			<div id="attendance_main_menu_title">일일 근태</div>
			
			
		</div>
		
		<div id="attendance_main_container">
			<div id="attendance_main_box_first">
				<div class="attendance_main_box_first_container">
					<div>일일근태등록</div>
					<div>
						<button>출근</button>
						<button>퇴근</button>
					</div>
				</div>
				<div class="attendance_main_box_first_container">
					<div>출근시간 : </div>
					<div>퇴근시간 : </div>
					<div>출근 IP : </div>
					<div>퇴근 IP : </div>
				</div>
				<div class="attendance_main_box_first_container">
					현시각
				</div>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">근태정보조회</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						근무일자
						<button>조회</button>
					</div>
					<div class="attendance_main_box_content">
						<table>
							<tr>
								<td>근무일자</td>
								<td>사번</td>
								<td>성명</td>
								<td>출근시간</td>
								<td>퇴근시간</td>
								<td>출근IP</td>
								<td>퇴근IP</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="attendance_main_box">
				<div class="attendance_main_box_top">
					<div class="attendance_main_box_title">근태조정요청</div>
				</div>
				<div class="attendance_main_box_container">
					<div class="attendance_main_box_content">
						<form action="">
							조정 근무 일자<input type="text">
							조정 출근 시간<input type="text">
							조정 퇴근 시간<input type="text">
							조정 사유<input type="text">
							<button type="submit">요청</button>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>