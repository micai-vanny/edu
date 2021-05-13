<%@page import="java.util.List"%>
<%@page import="com.edu.test.stateless.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
<style type="text/css">
	.title {
		background-color: pink;
	}
</style>
</head>
<body>
	<table border = "1">
	<%
		List<Member> list = (List<Member>)request.getAttribute("memberList");
		out.print("<tr class = 'title'><th>ID</th><th>Password</th><th>이름</th><th>나이</th></tr>");
		for(Member mem : list){
			out.print("<tr><td>" + mem.getMemberId() + "</td><td>" + mem.getMemberPwd() + "</td><td>" + mem.getMemberName() + "</td><td>" + mem.getMember_age()+"</td></tr>");
		}
	%>
	</table>
</body>
</html>