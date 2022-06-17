<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside id="left_aside">
	<img src="<%= request.getContextPath() %>/resources/images/logo.png" id="logo">
	<div id="login_info">
		<div class="profile_circle"></div>
		<div class="company_info font_r font_gray94 font_12px">가나다컴퍼니</div>
		<div class="person_info"><span class="font_b font_gray94 font_13px">박재민&nbsp;</span><span class="font_r font_gray94 font_13px">사원</span></div>
		<button class="btn_format_mini logout_btn">로그아웃</button>
	</div>
	<div id="left_menu">
		<div class="left_menu_1depth">
			<div class="left_menu_1depth_title">사원 관리</div>
			<div class="left_menu_2depth" open_chk="false">
				<div class="left_menu_2depth_content">직원 조회</div>
				<div class="left_menu_2depth_content">직원 가입 관리</div>
			</div>
		</div>
		<div class="left_menu_1depth">
			<div class="left_menu_1depth_title">회사 관리</div>
			<div class="left_menu_2depth" open_chk="false">
				<div class="left_menu_2depth_content">직원 조회</div>
				<div class="left_menu_2depth_content">직원 가입 관리</div>
			</div>
		</div>
		<div class="left_menu_1depth">
			<div class="left_menu_1depth_title">근태 관리</div>
			<div class="left_menu_2depth" open_chk="false">
				<div class="left_menu_2depth_content">직원 조회</div>
				<div class="left_menu_2depth_content">직원 가입 관리</div>
			</div>
		</div>
		<div class="left_menu_1depth">
			<div class="left_menu_1depth_title">공지 관리</div>
			<div class="left_menu_2depth" open_chk="false">
				<div class="left_menu_2depth_content">직원 조회</div>
				<div class="left_menu_2depth_content">직원 가입 관리</div>
			</div>
		</div>
		<div class="left_menu_1depth">
			<div class="left_menu_1depth_title">회사 관리</div>
			<div class="left_menu_2depth" open_chk="false">
				<div class="left_menu_2depth_content">직원 조회</div>
				<div class="left_menu_2depth_content">직원 가입 관리</div>
			</div>
			<!-- test3채팅삭제할거에요 걱정마세요 여기부터-->
			<div class="left_menu_1depth_title">
				<a href="<%=request.getContextPath()%>/chat.do" target="_blank">test3채팅</a> 
			</div>
			<!-- test3채팅 여기까지 삭제-->
			<!-- test5채팅삭제할거에요 걱정마세요 여기부터-->
			<div class="left_menu_1depth_title">
				<a href="<%=request.getContextPath()%>/chat5.do" target="_blank">test5채팅</a> 
			</div>
			<!-- test3채팅 여기까지 삭제-->
		</div>
	</div>
</aside>
<script type="text/javascript">
	$(".left_menu_1depth").on("click", function(event) {
		console.log(event.target);
		console.log(event.target.className);
		if(event.target.className == "left_menu_1depth_title") {
			if($(this).children(".left_menu_2depth").attr("open_chk") == "false") {
				var heightTemp = $(this).find(".left_menu_2depth_content").length * 29 + "px";
				$(this).children(".left_menu_2depth").css("height", heightTemp);
				$(this).children(".left_menu_2depth").attr("open_chk", "true");
			} else if($(this).children(".left_menu_2depth").attr("open_chk") == "true") {
				$(this).children(".left_menu_2depth").css("height", "0px");
				$(this).children(".left_menu_2depth").attr("open_chk", "false");
			}
		}
	});
	$(".left_menu_2depth_content").on("mouseenter", function() {
		$2depth = $(".left_menu_2depth_content");
		for (var i = 0; i < $2depth.length; i++) {
			$2depth.eq(i).css("color", "rgb(127, 127, 127)");
			$2depth.eq(i).css("font-family", "NotoSansR");
		}
		$(this).css("color", "#4B4DB2");
		$(this).css("font-family", "NotoSansB");
	});
	
</script>
<button id="chat_btn"><i class="fa-solid fa-chevron-left chat_btn_arrow"></i></button>
<aside id="right_aside" open_chk="false">
	<div id="chat_wrap">
		<div id="chat_header">
			<div id="chat_header_wrap">
				<div class="chat_header_tap">채팅</div>
				<div class="chat_header_tap">근무</div>
				<div class="chat_header_tap">TODO</div>
			</div>
		</div>
		<div id="chat_body"></div>
	</div>
</aside>
<script type="text/javascript">
	$("#chat_btn").on("mouseenter", function() {
		$(this).css({
			width : "100px",
			height : "100px"
		});
		$(".chat_btn_arrow").css("transform", "translate(-15px, 0)");
	});
	
	$("#chat_btn").on("mouseleave", function() {
		$(this).css({
			width : "65px",
			height : "65px"
		});
		$(".chat_btn_arrow").css("transform", "translate(-10px, 0)");
	});
	
	$("#chat_btn").on("click", function() {
		if($("#right_aside").attr("open_chk") == "false") {			
			$("#right_aside").css("width", "300px");
			$("#chat_btn").css("right", "300px");
			$("#right_aside").attr("open_chk", "true");
			$(".chat_btn_arrow").removeClass("fa-chevron-left");
			$(".chat_btn_arrow").addClass("fa-chevron-right");
		} else if($("#right_aside").attr("open_chk") == "true") {
			$("#right_aside").css("width", "0px");
			$("#chat_btn").css("right", "0px");
			$("#right_aside").attr("open_chk", "false");
			$(".chat_btn_arrow").removeClass("fa-chevron-right");
			$(".chat_btn_arrow").addClass("fa-chevron-left");
		}
	});
</script>
