<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid   = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp    = request.getParameter("hp");
	String zip   = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql  = "INSERT INTO `JBOARD_MEMBER` SET ";
		   sql += "`uid`='"+uid+"', ";
		   sql += "`pass`=PASSWORD('"+pass1+"'), ";
		   sql += "`name`='"+name+"', ";
		   sql += "`nick`='"+nick+"', ";
		   sql += "`email`='"+email+"', ";
		   sql += "`hp`='"+hp+"', ";		   
		   sql += "`zip`='"+zip+"', ";
		   sql += "`addr1`='"+addr1+"', ";
		   sql += "`addr2`='"+addr2+"', ";
		   sql += "`regip`='"+regip+"', ";
		   sql += "`rdate`=NOW()";
	
	stmt.executeUpdate(sql);
	
	// 5단계
	// 6단계
	stmt.close();
	conn.close();
	
	// 리다이렉트
	response.sendRedirect("/Jboard1/user/login.jsp");	
%>