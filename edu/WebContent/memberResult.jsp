<%@page import="com.edu.test.stateless.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberRegister.jsp</title>
</head>
<body>
	<%
		Member mem = (Member)request.getAttribute("member");
		out.print("<h3>ID : "+mem.getMemberId()+"</h3>");
		out.print("<h3>Passwd : "+mem.getMemberPwd()+"</h3>");
		out.print("<h3>Name : "+mem.getMemberName()+"</h3>");
		out.print("<h3>age : "+mem.getMember_age()+"</h3>");
	%>
</body>
</html>