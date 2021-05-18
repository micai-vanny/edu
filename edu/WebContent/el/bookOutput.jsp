<%@page import="com.edu.beans.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BookBean book = (BookBean)request.getAttribute("book");	// 값을 받아올 때는 getAttribute로 받고 타입에 맞게 캐스팅까지 해줄 것 
	%>
	<h1>정상적으로 처리되었습니다.</h1>
	<p>책제목: ${book.title }</p><h3><%=book.getTitle() %></h3>
	<p>책저자: ${book.author }</p><h3><%=book.getAuthor() %></h3>
	<p>출판사: ${book.publisher }</p><h3><%=book.getPublisher() %></h3>
</body>
</html>