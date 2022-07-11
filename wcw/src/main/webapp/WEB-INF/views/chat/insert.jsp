<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/template/font.jsp"%>
<style type="text/css">
body{
	margin: 0px;
	font-family: NotoSansB; 
	font-size: 12px;
}
.chat_Title{
	width: 100%;
	height: 50px;
	background: rgb(75, 77, 178);
	color: white;
}
.Title_text{
	font-size: 12px;
	position: relative;
	top: 16px;
}
.Title_menu{
	float: left;
	position: relative;
	top: 12px;
}
.chat_Title img{
	width: 25px;
	height: 25px;
}
.menu_img{
	display: inline-block;
}
.chat_search{
	height: 28px;
	margin: 10px 0 0 10px;
}
#search{
	width: 20px;
	height: 20px;
	vertical-align: middle;
}
.chat_search input{
	width: 85%;
}
.char_insert{
	vertical-align: bottom;
}
#wrap{
	min-height: 100vh;
	position: relative;
	width: 100%;
}
.footer{
	width: 100%;
	height: 40px;
	background: rgb(75, 77, 178);
	color: white;
	text-align: center;
	line-height: 40px;
	cursor: pointer;
	font-size: 12px;
}
.menu_a{
	margin: 15px;
}
.empListDiv{
	cursor: pointer;
	margin: 10px 0 10px 0;
}
.empList{
	margin: 10px 0px 10px 0px;
	display: inline-block;
	height: 40px;
	vertical-align: middle;
}
.empProfile{
	width: 40px;
	height: 40px;
	display: inline-block;
	margin: 0px 15px 0px 15px;
	vertical-align: middle;
}
.empmail{
	color: rgb(94,94,94);
	margin-top: 5px;
    line-height: 24px;
}
.empClick{
	background: rgba(75, 77, 178, .3);
}
</style>
</head>
<body>
<div id="wrap">
<section>
	<div class="chat_Title">
		<div class="Title_menu">
			<a class="menu_a" href="">
				<img src="<%= request.getContextPath() %>/resources/images/menubar-icon.svg">
			</a>
		</div>
		<div class="Title_text">
			새로운 채팅
		</div>
	</div>
	<div class="chat_search">
		<img src="<%= request.getContextPath() %>/resources/images/search-icon.svg" id="search">
		<input type="text" placeholder="이름 및 이메일로 검색">
	</div>
	<div class="empListAll">
		<c:forEach items="${emplist}" var="emplist">
		<div class="empListDiv">
			<c:choose>
			<c:when test="${empty emplist.profile }">
				<div class="empProfile">
					<img src="<%= request.getContextPath() %>/resources/images/default-profile.svg" id="profile">
				</div>
			</c:when>
			</c:choose>
			<div class="empList">
				<span class="empname">${emplist.name } 사원</span>
				<br>
				<span class="empmail">${emplist.email }</span> 
			</div>
		</div>
		</c:forEach>
	</div>
	</section>
	<footer class="footer">
		<div class="char_insert">
			생성
		</div>
	</footer>
	</div>
	<script type="text/javascript">
		$('.empListDiv').click(function() {
			$(this).toggleClass('empClick');
		});
	</script>
</body>




</html>