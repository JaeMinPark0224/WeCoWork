<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside id="left_aside">
	<img src="<%= request.getContextPath() %>/resources/images/logo.png" id="logo">
	<div id="login_info">
		<div class="profile_circle"></div>
		<div class="company_info font_r font_gray94 font_12px">${loginSSInfo.cp_name }</div>
		<div class="person_info"><span class="font_b font_gray94 font_13px">${loginSSInfo.name }&nbsp;</span><span class="font_r font_gray94 font_13px">${loginSSInfo.job_title }</span></div>
		<button class="btn_format_mini logout_btn" id="logout_btn">로그아웃</button>
	</div>
	<div id="left_menu_scroll">
		<div id="left_menu">
			<div class="left_menu_wrap">
				<div class="left_menu_title">
					<div class="left_menu_hr"></div>
					<div class="left_menu_hr_title">Favorite</div>
				</div>
				<div class="left_menu_wrap_1depth">
					<div class="left_menu_1depth_title" open_chk="f">즐겨찾기 페이지 폴더 이름<i class="fa-solid fa-chevron-right dpeth_arrow"></i></div>
					<div class="left_menu_2depth_content_wrap">
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
					</div>
				</div>
				<div class="left_menu_wrap_1depth">
					<div class="left_menu_1depth_title" open_chk="f">즐겨찾기 페이지 폴더 이름2<i class="fa-solid fa-chevron-right dpeth_arrow"></i></div>
					<div class="left_menu_2depth_content_wrap">
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
						<div class="left_menu_2depth_content">즐겨찾기 페이지</div>
					</div>
				</div>
			</div>
			<div class="left_menu_wrap">
				<div class="left_menu_title">
					<div class="left_menu_hr"></div>
					<div class="left_menu_hr_title">Notice</div>
				</div>
				<div class="left_menu_wrap_1depth">
					<div class="left_menu_1depth_title" open_chk="f">공지사항<i class="fa-solid fa-chevron-right dpeth_arrow"></i></div>
					<div class="left_menu_2depth_content_wrap">
						<div class="left_menu_2depth_content">
							<a href="<%= request.getContextPath() %>/notice/list" target="_blank">
								공지 리스트
							</a>
						</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
					</div>
				</div>
				<div class="left_menu_wrap_1depth">
					<div class="left_menu_1depth_title" open_chk="f">
					알림
					<i class="fa-solid fa-chevron-right dpeth_arrow"></i></div>
					<div class="left_menu_2depth_content_wrap">
						<div class="left_menu_2depth_content">
						<a href="<%= request.getContextPath() %>/notification/list" target="_blank">
							알림리스트
						</a>
						</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
					</div>
				</div>
			</div>
			<div class="left_menu_wrap">
				<div class="left_menu_title">
					<div class="left_menu_hr"></div>
					<div class="left_menu_hr_title">Project</div>
				</div>
				<div class="left_menu_wrap_1depth">
					<div class="left_menu_1depth_title" open_chk="f">프로젝트<i class="fa-solid fa-chevron-right dpeth_arrow"></i></div>
					<div class="left_menu_2depth_content_wrap">
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
					</div>
				</div>
			</div>
			<div class="left_menu_wrap">
				<div class="left_menu_title">
					<div class="left_menu_hr"></div>
					<div class="left_menu_hr_title">Office</div>
				</div>
				<div class="left_menu_wrap_1depth">
					<div class="left_menu_1depth_title" open_chk="f">결재<i class="fa-solid fa-chevron-right dpeth_arrow"></i></div>
					<div class="left_menu_2depth_content_wrap">
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
					</div>
				</div>
				<div class="left_menu_wrap_1depth">
					<div class="left_menu_1depth_title" open_chk="f">근태관리<i class="fa-solid fa-chevron-right dpeth_arrow"></i></div>
					<div class="left_menu_2depth_content_wrap">
						<div class="left_menu_2depth_content" id="attendance_day">일일근태 관리</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
					</div>
				</div>
				<div class="left_menu_wrap_1depth">
					<div class="left_menu_1depth_title" open_chk="f">인사정보<i class="fa-solid fa-chevron-right dpeth_arrow"></i></div>
					<div class="left_menu_2depth_content_wrap">
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
						<div class="left_menu_2depth_content">2depth content</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</aside>
<script>
	$("#logout_btn").on("click", function(){
		location.href="<%= request.getContextPath()%>/logout";
	})
</script>

<script type="text/javascript">
	$(".left_menu_1depth_title").on("mouseenter", function() {
		$(this).css("backgroundColor", "rgba(67, 89, 113, 0.04)");
	});
	$(".left_menu_1depth_title").on("mouseleave", function() {
		if($(this).attr("open_chk") == "f") {
			$(this).css("backgroundColor", "transparent");
		}
	});
	
	$(".left_menu_1depth_title").on("click", function() {
		for(var i = 0; i < $(".left_menu_1depth_title").length; i++) {
			if($(this)[0] == $('.left_menu_1depth_title')[i]) {
				continue;
			} else {
				$('.left_menu_1depth_title').eq(i).css("backgroundColor", "transparent");
				$('.left_menu_1depth_title').eq(i).css("margin-bottom", "0px");
				$('.left_menu_1depth_title').eq(i).children(".dpeth_arrow").css("transform", "rotate(0deg)");
				$('.left_menu_1depth_title').eq(i).parent().css("height", "30px");
				$('.left_menu_1depth_title').eq(i).attr("open_chk", "f");
			}
		}
		if($(this).attr("open_chk") == "f") {
			$(this).css("backgroundColor", "rgba(67, 89, 113, 0.04)");
			$(this).css("margin-bottom", "5px");
			$(this).children(".dpeth_arrow").css("transform", "rotate(90deg)");
			var heightTemp = $(this).next(".left_menu_2depth_content_wrap").children(".left_menu_2depth_content").length * 30 + 35 +"px";
			$(this).parent().css("height", heightTemp);
			$(this).attr("open_chk", "t");
		} else if($(this).attr("open_chk") == "t") {
			$(this).css("backgroundColor", "transparent");
			$(this).css("margin-bottom", "0px");
			$(this).children(".dpeth_arrow").css("transform", "rotate(0deg)");
			$(this).parent().css("height", "30px");
			$(this).attr("open_chk", "f");
		}
	});
	
	$(".left_menu_1depth_content").on("mouseenter", function() {
		$(this).css("backgroundColor", "rgba(67, 89, 113, 0.04)");
	});
	$(".left_menu_1depth_content").on("mouseleave", function() {
		$(this).css("backgroundColor", "transparent");
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
<aside id="favorite_btn_aside">
	<i class="fa-solid fa-star" id="favorite_btn"></i>
</aside>
<script>
	$("#favorite_btn").on('mouseenter', function() {
		console.log("test1");
		$(this).css({
			"color": "#4B4DB2"
		});
	});
	
	$("#favorite_btn").on('mouseleave', function() {
		$(this).css({
			"color": "white"
		});
	});
</script>
<script>
console.log($(window).height());
console.log(window.innerHeight);

	$('#left_menu_scroll').css('height', $(window).height() - $('#left_menu_scroll').offset().top);
	$(window).resize(function() {
		$('#left_menu_scroll').css('height', $(window).height() - $('#left_menu_scroll').offset().top);
		console.log(window.innerHeight - $('#left_menu_scroll').offset().top);
		console.log(window.innerHeight);
		console.log("test1");
	});
</script>
<script>
	$('#attendance_day').click(function() {
		location.href = '<%= request.getContextPath()%>/attendance/day';
	});
</script>