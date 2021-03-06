<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/notification/list.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"
	crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 리스트</title>
<%@ include file="/WEB-INF/views/template/font.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/aside.jsp"%>
	<section id="noticeSection">
		<div id="noticePageTitle">알림 리스트</div>
				<div class="CheckDiv">
					<div class="CheckText">전체선택</div>
					<input class="AllCheck" type="checkbox">
					<div class="verLine"></div>
					<div class="DeleteText">
						<label for="deleteBtn">삭제</label> 
						<input type="button" id="deleteBtn" name="deleteNo">
					</div>
					<div class="verLine"></div>
					<div class="AllReadText">
						<label for="allReadBtn">모두읽음</label>
						<input type="button" id="allReadBtn">
					</div>
					<div class="unchkNotificationText">
						<label for="unchkNotification">미확인 알림</label>
						<input type="button" id="unchkNotification">
					</div>
					<div class="allNotificationText">
						<label for="allNotification">전체 알림</label>
					<div class="verLine2"></div>
						<input type="button" id="allNotification">
					</div>
					
				</div>
			<div class="notificationDiv">
				<div class="notificationTitleDiv">
					<span class="notificationNoDiv">
						구분
					</span> 
					<span class="notificationTitleDiv">
						알림내용
					</span>
					<span class="notificationDateDiv">
						알림일시
					</span>
				</div>
				<div class="notificationList">
					<c:choose>
						<c:when test="${empty notificationlist}">
							<div>알림이 없습니다.</div>
						</c:when>
					<c:otherwise>
						<table class="notificationTable">
						<c:forEach items="${notificationlist }" var="notification">
							<tr class="notificationTableContent" style="
							<c:if test="${notification.noti_status == 'Y' }">
								color: rgb(94, 94, 94);
							</c:if>
							">
								<td>
									<input type="checkbox" name="chk" value='${notification.noti_no }'>
								</td>
								<td class="notificationSort">
									${notification.noti_sort }
								</td>
								<td class="notificationTitle">
									${notification.noti_title }
								</td>
								<td class="notificationDate">
									${notification.noti_date }
								</td>
							</tr>
						</c:forEach>
					</table>
					</c:otherwise>
					
					
					</c:choose>
				</div>
			</div>

	</section>
	
	
	
	
	<script type="text/javascript">
		//전체선택 클릭시 전체선택됨 
	    $('.AllCheck').click(function(){
	         if($(".AllCheck").prop("checked")){
	            $("input[type=checkbox]").prop("checked",true); 
	        }else{
	            $("input[type=checkbox]").prop("checked",false); 
	        }
	    });
		// 갯수 비교하여 전체선택 체크표시
	    $("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
			
			if(total != checked)$(".AllCheck").prop("checked", false);
			else $(".AllCheck").prop("checked", true);
		});
		
	    <!-- 삭제 -->
 		// 체크박스 선택 후 삭제 버튼 클릭시 이벤트 
		$("#deleteBtn").click(function(){
		  var checkVal = $("input[name=chk]").serialize();
		  console.log(checkVal);
		  $.ajax({
		      url: "<%=request.getContextPath()%>/notification/delete",
		      type: "post",
		      data: checkVal,
		      success: function(result){
		    	alert('알림을 삭제 했습니다.');
		      	location.href = "<%=request.getContextPath()%>/notification/list";
		      },
		      error: function(error) {
		      	alert(error);
		      }  
		   });
		});
 		
 		$("#allReadBtn").click(function() {
 			var checkVal = $("input[name=chk]").serialize();
 			$.ajax({
 				url: "<%=request.getContextPath()%>/notification/check",
 				type: "post",
 				data: checkVal,
 				success: function(result) {
 					alert('모두읽음');
 					location.href = "<%=request.getContextPath()%>/notification/list";
				}
 			});
		});
	</script>

</body>
</html>










