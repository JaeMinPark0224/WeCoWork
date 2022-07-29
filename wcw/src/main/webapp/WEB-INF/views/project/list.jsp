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
<head>
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<div id="project_list_modal_background">
	<input type="hidden" id="project_list_modal_val">
	<input type="hidden" id="project_list_modal_join_open">
	<div id="project_list_modal_wrap">
		<div id="project_list_modal_flex">
			<div id="project_list_modal_title"></div>
			<div id="project_list_modal_people"></div>
			<div id="project_list_modal_notice"></div>
			<div id="project_list_modal_btn_wrap">
				<button type="button" class="project_list_modal_btn project_list_modal_btn_cancle font_gray190">취소</button>
				<button type="button" class="project_list_modal_btn project_list_modal_btn_participate font_purple">참여</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="project_section">
	<div id="project_wrap">
		<div id="project_title" class="font_b font_14px font_purple">프로젝트 리스트</div>
		<div id="project_tap_menu">
			<div class="project_tap">모든 프로젝트</div>
			<div class="project_tap">참여중 프로젝트</div>
			<div class="project_tap">즐겨찾기 프로젝트</div>
			<div class="project_tap">완료 프로젝트</div>
			<div id="project_list_text_box_wrap">
				<input id="project_list_text_box" type="text"><i class="fa-solid fa-magnifying-glass" id="project_list_search_btn"></i>
			</div>
		</div>
		<div id="project_list_wrap">
			<c:forEach var = "item" items="${projectList }">
			<div class="project_list_block">
				<input class="project_list_pr_no_hidden" type="hidden" value="${item.pr_no}">
				<div class="project_list_color"></div>
				<div class="project_list_title">${item.pr_title }</div>
				<div class="project_list_update">생성일 : ${fn:substring(item.pr_date,0,10) }</div>
				<div class="project_list_dept"></div>
				<c:if test="${item.pr_fav eq '0'}">
					<img class="project_list_fav" favChk = 'f' src="<%= request.getContextPath()%>/resources/images/bahai-empty.svg">
				</c:if>
				<c:if test="${item.pr_fav ne '0'}">
					<img class="project_list_fav" favChk = 't' src="<%= request.getContextPath()%>/resources/images/bahai-full.svg">
				</c:if>
				<c:if test="${item.pr_join_open eq 'N'}">
					<img class="project_list_unlock" unlockChk = 't' src="<%= request.getContextPath()%>/resources/images/unlock.png">
				</c:if>
				<c:if test="${item.pr_join_open eq 'Y'}">
					<img class="project_list_unlock" unlockChk = 'f' src="<%= request.getContextPath()%>/resources/images/lock.png">
				</c:if>
			</div>
			</c:forEach>
		</div>
		<div class="project_list_page_btn_wrap">
			<c:if test="${startPage > 5}">
				<div class="project_page_btn"><i class="fa-solid fa-angle-left"></i></div>
			</c:if>
			<c:forEach var="index" begin="${startPage }" end="${endPage }">
				<div class="project_page_btn">${index }</div>
			</c:forEach>
			<c:if test="${endPage ne totalPageCnt}">
				<div class="project_page_btn"><i class="fa-solid fa-angle-right"></i></div>
			</c:if>
		</div>
	</div>
</section>
<script type="text/javascript">
	// 페이지 번호
	var js_page_no = (new URL(location.href).searchParams).get('page');
	
	// 페이지 옵션
	var js_option = (new URL(location.href).searchParams).get('option');
	
	// 페이지 검색 
	var js_search = (new URL(location.href).searchParams).get('search');
	console.log(js_search);
	console.log(js_search == null);
	// 페이지 번호 url 설정
	$(".project_page_btn").on("click", function() {
		let textUrl = "<%= request.getContextPath()%>/project/list?page=";
		if($(this).children().length == 0) {
			textUrl += $(this).text()+"&option="+js_option;
			if(js_search != null) {
				textUrl += "&search=" + js_search;
			}
			location.href = textUrl;
		}		
	});
	
	// 페이지 처리
	for(var i = 0; i < $(".project_page_btn").length; i++) {
		if($(".project_page_btn").eq(i).text() == js_page_no) {
			$(".project_page_btn").eq(i).css({
				"background-color" : "#4B4DB2",
				color : "white"
			});
			break;
		}
	}
	
	$('.project_list_fav').on('mouseenter', function() {
		if($(this).attr("favChk") == 'f') {
			$(this).attr('src', '<%= request.getContextPath()%>/resources/images/bahai-full.svg');
		}
	});
	
	$('.project_list_fav').on('mouseleave', function() {
		if($(this).attr("favChk") == 'f') {
			$(this).attr('src', '<%= request.getContextPath()%>/resources/images/bahai-empty.svg');
		}
	});
	
	$('.project_list_block').click(function(event) {
		if(event.target.classList.contains('project_list_fav')) {
			var urlStr = '';
			var confirmChk;
			if($(event.target).attr("favChk") == 'f') {
				urlStr = "<%=request.getContextPath()%>/project/favorite/insert";
				if(confirm("프로젝트를 즐겨찾기에 등록하시겠습니까?")){
					confirmChk = true;
				} else {
					confirmChk = false;
				}
			} else {
				urlStr = "<%=request.getContextPath()%>/project/favorite/delete";
				if(confirm("프로젝트를 즐겨찾기에서 제거하시겠습니까?")){
					confirmChk = true;
				} else {
					confirmChk = false;
				}
			}
			if(confirmChk) {
				var successChk = false;
				$.ajax({
					type: "POST",
					url: urlStr,
					data: {
						pr_no: $(event.target).siblings('.project_list_pr_no_hidden').val()
					},
					success: function(result){
						if(result != '0') {
							for(var i = 0; i < $('.project_list_pr_no_hidden').length; i++) {
								if($('.project_list_pr_no_hidden').eq(i).val() == result) {
									if($('.project_list_fav').eq(i).attr("favChk") == 'f') {
										$('.project_list_fav').eq(i).attr("favChk", 't');
										$('.project_list_fav').eq(i).attr('src', '<%= request.getContextPath()%>/resources/images/bahai-full.svg');
									} else {
										$('.project_list_fav').eq(i).attr("favChk", 'f');
										$('.project_list_fav').eq(i).attr('src', '<%= request.getContextPath()%>/resources/images/bahai-empty.svg');
									}
								}
							}
						}
					},
					error: function(request, status, error){
						alert('fail') ;
					}
				});
			}
		} else {
			$("#project_list_modal_val").val($(this).children('.project_list_pr_no_hidden').val());
			$('#project_list_modal_title').text($(this).children('.project_list_title').text());
			$('#project_list_modal_people').text($(this).children('.project_list_dept').text());
			if($(this).children('.project_list_unlock').attr('unlockChk') == 't') {
				$("#project_list_modal_notice").text('');
				$("#project_list_modal_join_open").val('N');
			} else {
				$("#project_list_modal_notice").text('*관리자 승인 후 참여 가능');
				$("#project_list_modal_join_open").val('Y');
			}
			$.ajax({
				type: "POST",
				url: "<%=request.getContextPath()%>/project/participant/read",
				data: {
					pr_no : $("#project_list_modal_val").val()
				},
				success: function(result) {
					if(result == 1) {
						location.href = "<%= request.getContextPath()%>/project/main?project="+$('#project_list_modal_val').val();
					} else {
						console.log("heare");
						$("#project_list_modal_background").css('display', 'block');
						$('.project_list_modal_btn_participate').off('click');
						$('.project_list_modal_btn_participate').on('click', function() {
							if($("#project_list_modal_join_open").val() == 'N') {
								$.ajax({
									type: "POST",
									url: "<%= request.getContextPath()%>/project/participant/insert",
									data: {
										pr_no : $('#project_list_modal_val').val()
									},
									success: function(result) {
										if(result == 1) {
											location.href = "<%= request.getContextPath()%>/project/main?project="+$('#project_list_modal_val').val();											
										}
									},
									error: function(request, status, error) {
										alert('fail');
									}
								});
							}
							
							<%-- location.href = "<%= request.getContextPath()%>/project/main?project="+$('#project_list_modal_val').val(); --%>
						});
					}
				},
				error: function(request, status, error){
					alert('fail') ;
				}
			});
		}
	});	
	$('.project_list_modal_btn_cancle').on('click', function() {
		$('#project_list_modal_background').css('display', 'none');
	});
	
	$(".project_tap").on("click", function() {
		let index = $(this).index();
		console.log(index);
		switch(index) {
		case 0 :
			console.log("모든 프로젝트");
			location.href="<%= request.getContextPath()%>/project/list?page=1&option=all";
			break;
		case 1 :
			console.log("참여중 프로젝트");
			location.href="<%= request.getContextPath()%>/project/list?page=1&option=participant";
			break;
		case 2 :
			console.log("즐겨찾기 프로젝트");
			location.href="<%= request.getContextPath()%>/project/list?page=1&option=bookmark";
			break;
		case 3 :
			console.log("완료 프로젝트");
			location.href="<%= request.getContextPath()%>/project/list?page=1&option=complete";
			break;
		}
	});
	
	// 검색 기능
	$("#project_list_search_btn").on("click", function() {
		console.log($("#project_list_text_box").val());
		location.href="<%= request.getContextPath()%>/project/list?page=1&option="+js_option+"&search="+$('#project_list_text_box').val();
	});
</script>
</body>
</html>