<%@page import="kr.co.farmstory1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인여부 세션체크
	MemberBean mb = (MemberBean)session.getAttribute("member");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="/Farmstory1/css/style.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <header>
            <a href="/Farmstory1" class="logo"><img src="/Farmstory1/img/logo.png" alt="fhrh"/></a>
            <p>
                <a href="/Farmstory1">HOME |</a>
                <% if(mb == null) { %>
	                <a href="/Farmstory1/user/terms.jsp">회원가입 |</a>
	                <a href="/Farmstory1/user/login.jsp">로그인 |</a>
                <% }else{ %>
                <a href="/Farmstory1/user/proc/logout.jsp">로그아웃 |</a>
                <% } %>
                <a href="#">고객센터 </a>
			</p>
            <img src="/Farmstory1/img/head_txt_img.png" alt="3만원 이상 무료배송, 팜카드 10% 적립">
            
                <ul class="gnb">
                    <li><a href="/Farmstory1/introduction/greeting.jsp">팜스토리소개</a></li>
                    <li><a href="/Farmstory1/market/market.jsp"><img src="/Farmstory1/img/head_menu_badge.png" alt="30%"/>장보기</a></li>
                    <li><a href="/Farmstory1/croptalk/croptalk.jsp">농작물이야기</a></li>
                    <li><a href="/Farmstory1/event/event.jsp">이벤트</a></li>
                    <li><a href="/Farmstory1/community/notice.jsp">커뮤니티</a></li>
                </ul>
        </header>