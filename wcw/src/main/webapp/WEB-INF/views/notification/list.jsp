<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
#noticeSection {
	margin-left: 65px;
	font-family: NotoSansB;
	width: 1070px;
}
.notificationDiv{
	height: 800px;
	width: 1070px;
	background-color: rgb(244, 244, 244);
	margin-bottom: 220px;
}

#noticePageTitle {
	margin-top: 105px;
	margin-bottom: 70px;
	font-size: 14px;
	color: rgb(75, 77, 178);
}

.CheckDiv {
	font-size: 13px;
	margin-bottom: 56px;
	color: rgb(94, 94, 94);
}

.AllCheck {
	margin-left: 11px;
}

.CheckText, .DeleteText, .AllReadText, .allNotificationText, .unchkNotificationText {
	height: 20px;
	line-height: 20px;
	display: inline-block;
	vertical-align: bottom;
}
.unchkNotificationText, .allNotificationText {
	float: right;
}


.AllCheck {
	vertical-align: bottom;
}

.verLine {
	border-left: thin solid rgb(94, 94, 94);
	height: 15px;
	width: 20px;
	display: inline-block;
	margin-left: 43px;
	margin-right: 43px;
}

input[type=button] {
	display: none;
}

.DeleteText {
	margin-right: 15px;
}
.notificationTitleDiv{
	font-size: 12px;
	color: rgb(94, 94, 94);
	background-color: rgb(224, 224, 224);
	height: 60px;
	box-sizing: border-box;
	line-height: 60px;
}
.notificationNoDiv{
	width: 59px;
	margin-left: 192px;
	margin-right: 282px;
}
.notificationDateDiv{
	margin-left: 328px;
}
.notificationTable{
	border-collapse: separate;
    border-spacing: 0 30px;
}
tr input[type=checkbox] {
	margin: 0px;
	vertical-align: bottom;
	margin-left: 59px;
}
.notificationSort{
	padding-left: 110px;
	width: 45px;
	text-align: center;
}
.notificationTitle{
	width: 400px;
	text-align: center;
	padding-left: 95px;
	padding-right: 131px;
}
.notificationDate{
	width: 87px;
	text-align: center;
}
.notificationList{
	font-size: 12px;
}
label{
	cursor: pointer;
}
.verLine2{
	border-left: thin solid rgb(94, 94, 94);
	height: 15px;
	width: 20px;
	display: inline-block;
	vertical-align: bottom;
	margin-left: 35px;
	margin-right: 25px;
}
</style>
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
						<input type="button" id="deleteBtn">
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
							<div>작성된 글이 없습니다.</div>
						</c:when>
					<c:otherwise>
						<table class="notificationTable">
						<c:forEach items="${notificationlist }" var="notification">
							<tr class="notificationTableContent">
								<td>
									<input type="checkbox" name="chk">
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
	    
	</script>

</body>
</html>



