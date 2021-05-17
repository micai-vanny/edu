<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/example14.jsp</title>
</head>
<body>
	<h3>Example14 page</h3>
	<%
		String res = (String)application.getAttribute("welcomeMsg");
		out.print("example11.jsp에서 가지고 온 값");
		request.setAttribute("result", res);
	%>
	<%--↓얘는 jsp 태그. 밑에 쓴거랑 같음. --%>
	<h3>example05 forwarding</h3>
	<jsp:forward page="example05.jsp"></jsp:forward>
	<%-- <%
		RequestDispatcher rd = request.getRequestDispatcher("example12.jsp");
		rd.forward(request, response);
		
	%> --%>
	
</body>
</html>