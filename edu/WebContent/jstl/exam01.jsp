<%@page import="com.edu.beans.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--        └>접두어. 여기에 정의한 이름으로 태그를 사용할 수 있음.-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		BookBean book = new BookBean();
		book.setAuthor("최동동");
		book.setTitle("동동이의 일기");
		book.setPublisher("반야출판사");
		
		request.setAttribute("Choi", book);
	%>
	<%-- <%String name = "Choi"; %> 랑 똑같음 ↓--%>
	<c:set var= "name" value= "123"></c:set>
<%--  └>위에서 정의했던 접두어 c--%>
	<%-- <%out.print(); %> 랑 똑같음--%>
	<c:out value="${name }"></c:out>
	<p>${name eq 123 }</p>
	<c:remove var="name"/>
	
	<c:set var= "title" value= "${Choi.title }"/>
	<c:set var= "author">${Choi.author }</c:set>
	<c:set var= "publisher"><%=book.getPublisher() %></c:set>
	<c:out value= "${title }" />
	<table border ="1">
		<tr>
			<th>책제목</th><th>작가명</th><th>출판사</th>
		</tr>
		<tr>
			<td>${title }</td><td>${author }</td><td>${publisher }</td>
		</tr>
	</table>
</body>
</html>