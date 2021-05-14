<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>example07.jsp :::스크립트릿(애플릿, 서블릿)</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

td {
	width: 30px;
	text-align: center;
}
</style>
</head>
<body>
<%!
	// 멤버변수선언 또는 메소드선언 할 때 사용 
%>
<h1>구구단</h1>
<h3>table 태그를 활용해보자</h3>
<table border = '1'>
<%
	for(int i = 2; i <10; i++){ %>
	<tr>
	<%
		for(int j = 1; j < 10; j++){%>
		<td><%=i%></td><td>*</td><td><%=j%></td><td>=</td><td><%=(i*j)%></td></tr>
		<%}%></table><br><table border = '1'>
	<%}%>

</body>
</html>