<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	margin: 0px;
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
	top: 17px;
}
.chat_Title img{
	width: 25px;
	height: 25px;
}
.menu_img{
	display: inline-block;
}
.Title_menu{
	float: left;
	position: relative;
	top: 17px;
}
.chat_search{
	width: 100%;
	height: 28px;
}
#search{
	width: 20px;
	height: 20px;
}
.chat_search input{
	width: 90%;
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
	bottom: 0;
	position: absolute;
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
	</section>
	<footer class="footer">
		<div class="char_insert">
			생성
		</div>
	</footer>
	</div>
</body>
</html>