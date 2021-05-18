<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Language</title>
</head>
<body>
	<%
		/* String name = "Hello";
		request.setAttribute("name", name); */
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
	%>
	<%-- <h3><%=name %></h3>
	<!--el 표현식 -->
	<h3>${name eq 'name'}</h3><!-- equals랑 같음. name 변수의 값이 'name'이라는 단어와 같으냐? -->
	<h3>${10 < 3 * 5 }</h3>
	<h3>${10 eq 15 }</h3><!-- eq는 그냥 ==처럼 쓸 수 있다. 꼭 String 타입이 아니어도 사용 가능. -->
	<h3>${empty name }</h3><!-- 변수 안에 값이 있는지 없는지 알 수 있음. --> --%>
	<%=name %> / <%=age %><br>
	${param.name } /  ${param["age"] }
</body>
</html>