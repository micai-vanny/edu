<%@page import="com.edu.test.stateless.Member"%>
<%@page import="com.edu.test.stateless.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세 페이지</title>
</head>
<body>
	<jsp:useBean id="dao" class = "com.edu.test.stateless.MemberDAO"></jsp:useBean>
	<!-- MemberDAO dao = new MemberDAO();랑 똑같음 -->
	<jsp:useBean id="mem" class = "com.edu.test.stateless.Member"></jsp:useBean>
	<%
		String id = request.getParameter("memberId");
		
//		MemberDAO dao = new MemberDAO();
		mem = dao.getMember(id);
	%>
	<h1>회원 상세 정보</h1>
	<table border = "1">
		<tr>
			<td>ID</td><td><%=mem.getMemberId() %></td>
		</tr>
		<tr>
			<td>Passwd</td><td><%=mem.getMemberPwd() %></td>
		</tr>
		<tr>
			<td>Name</td><td><%=mem.getMemberName() %></td>
		</tr>
		<tr>
			<td>Age</td><td><%=mem.getMember_age() %></td>
		</tr>
	</table>
	<a href = 'memberList.jsp'>리스트 보기☜</a>
</body>
</html>