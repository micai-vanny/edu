<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl/exam03.jsp</title>
</head>
<body>
	<h3>JSP Standard Tag Library</h3><br>
	<c:set var= "num" value= "${40 }"></c:set>
	<c:out value="${num }"></c:out><br>
	<c:if test="${num >= 60 }">당신은 우리와 함께할 수 있습니다. (손에 쥐어지는 합격 목걸이)</c:if>
	<c:if test="${num < 60 }">이 빡대가리야 너는 집에 가라</c:if>
	<br><br>
	
	<!-- if else처럼 쓰고 싶을 때 -->
	<c:choose>
		<c:when test="${num >= 90 }">AAAAA</c:when>
		<c:when test="${num >= 80 }">무난히 BBBBB</c:when>
		<c:when test="${num >= 70 }">공부 좀 해야겟는데 C</c:when>
		<c:when test="${num >= 60 }">어이구 D져라 걍</c:when>
		<c:otherwise>집에 가라 이 새끼야 지능 문드러진 새끼야 FFFFFFFFFFFFFFF</c:otherwise>
	</c:choose>
</body>
</html>