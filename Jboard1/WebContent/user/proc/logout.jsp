<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션 정보 초기화
	session.invalidate(); // 아예 클라이언트 고객명단을 제거해버림
	//session.setAttribute("member", null); 이건 member값만 null
	
	//로그인으로 이동
	response.sendRedirect("/Jboard1/user/login.jsp");

%>