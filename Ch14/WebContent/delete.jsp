<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("utf-8");
	
	String uid  = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp   = request.getParameter("hp");
	String pos  = request.getParameter("pos");
	String dep  = request.getParameter("dep");
	String rdate  = request.getParameter("rdate");
	
	//DB정보
	String host = "jdbc:mysql://192.168.44.46:3306/lsj";
	String user = "lsj";
	String pass = "1234";
	
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	//2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	//3단계
	PreparedStatement psmt = conn.prepareStatement("DELETE FROM `MEMBER` SET WHERE `uid`=?, `name`=?, `hp`=?, `pos`=?, `dep`=? `rdate`=?");
	psmt.setString(1, uid);
	psmt.setString(2, name);
	psmt.setString(3, hp);
	psmt.setString(4, pos);
	psmt.setString(5, dep);
	psmt.setString(6, rdate);
	

	
	//4단계
	psmt.executeUpdate();
	
	//5단계
	//6단계
	psmt.close();
	conn.close();
	
	//리다이렉트
	response.sendRedirect("./list.jsp");



%>
