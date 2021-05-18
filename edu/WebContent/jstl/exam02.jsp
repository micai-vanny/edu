<%@page import="com.edu.beans.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl/exam02.jsp</title>
<style>
	table {
	 border-collapse: collapse;
	 border-bottom: 3px solid blue;
	}
	
	th {
		border-top: 3px solid blue;
		border-bottom: 3px solid blue;
	}
	
	tr {
		border-top: 1px solid black; 
	}
</style>
</head>
<body>
	<c:set var="num" value="${98 }" />
	점수 <c:out value="${num }" /> 은(는)
	<c:if test="${num gt 60 }">합격입니다.</c:if>
	<c:if test="${num lt 60 }">불합격입니다.</c:if>
	<br><br>
	<c:choose>
		<c:when test="${num ge 90 }">!!A학점 ㅊㅋㅊㅋ!!</c:when>
		<c:when test="${num ge 80 }">B학점 ㅊㅋ</c:when>
		<c:when test="${num >= 70 }">C학점 ㅎㅎㅎ</c:when>
		<c:otherwise>학교에 기부를 해주셔서 감사합니다 ^^<br>여러분의 등록금이 큰 힘이 됩니다 ^^</c:otherwise>
	</c:choose>
	<br><br>
	<%
		ArrayList<BookBean> list = new ArrayList<>();
		list.add(new BookBean("짱귀여운 고양이의 삶", "최동동", "냥냥출판사"));
		list.add(new BookBean("인스타 스타의 길", "신참이", "냥멍출판사"));
		list.add(new BookBean("동동 불꽃가능캣", "최반야", "낄낄출판사"));
		
/* 		for(BookBean book : list){
			out.print("title" + book.getTitle());
			out.print("author" + book.getAuthor());
			out.print("publisher" + book.getPublisher());
		} */

		request.setAttribute("list", list);
	%>
	<table>
		<tr><th width="200px">책 제목</th><th width="60px">저자</th><th width="100px">출판사</th></tr>
	<c:forEach items="${list }" var="item">
		<tr><td align="center">${item.title }</td><td>${item.author }</td><td>${item. publisher }</td></tr>
	</c:forEach>
	</table>
</body>
</html>