<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 리스트 조회</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<style>
#section{
        margin-left: 60px;
        width: 1200px;
        color: rgb(94, 94, 94);
    }
    #title{
        display: inline-block;
        font-family: NotoSansB;
        font-size: 14px;
        margin-top: 105px;
        margin-left: 65px;
        color: rgb(75, 77, 178);
    }
    #select{
        width: 140px;
        height: 25px;
        font-family: NotoSansR;
        font-size: 12px;
        margin-left: 850px;
        
    }
    #content{
       margin-top: 70px;
       margin-left: 65px; 
    }
    #table{
        width: 1070px;
        text-align: center;
        font-size: 12px;
        font-family: NotoSansR;
        border-spacing: 0px;
        color: rgb(94, 94, 94);
    }
    td{
        height: 60px;
        vertical-align: middle;
    }
    tr > td:first-child, tr > td:last-child{
        width: 35px;
    }
    #first_line{
        font-family: NotoSansB;
        background-color: rgb(224, 224, 224);
    }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="section">
    <span id="title">직원 리스트</span>
    <select id="select">
        <option> 사번</option>
        <option selected> 입사일</option>
        <option> 직원명</option>
    </select>
    <div id="content">
        <table id="table">
            <tr id="first_line">
                <td></td>
                <td>사번</td>
                <td>직원명</td>
                <td style="width: 18%;">이메일</td>
                <td style="width: 18%;">입사일</td>
                <td>부서</td>
                <td>내선번호</td>
                <td style="width: 15%;">개인 연락처</td>
                <td></td>
            </tr>
        </table>
    </div>
</section>
<script>

</script>
</script>
</body>
</html>