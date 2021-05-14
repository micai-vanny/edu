<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>example01.jsp</title>
</head>
<body>
<%!
	String name;	// 필드(멤버변수)
	// 메소드 정의
	public int sum(int a, int b){
		return a + b;
	}
%>
<%
	// 자바 언어를 사용할 수 있는 구간이라서 이렇게 주석처리 가능
	String user = request.getParameter("name");
	if(user == null){
		user = "Guest";
	}
	int result = sum(10, 20);
%>
	<h1>Hello <%=user %></h1>
	<!-- 여기는 이렇게 주석을 씁시다 -->
	<h2>결과 : <%=result %></h2>
</body>
</html>