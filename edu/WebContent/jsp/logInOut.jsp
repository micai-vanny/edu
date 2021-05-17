<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jsp/logInOut.jsp</title>
</head>
<body>
	<%
		String msg = (String)request.getAttribute("error");
		if(msg == null) {
			msg = "";
		}
	%>
	<%=msg %>
	<%
		if(session.getAttribute("info") == null){// 세션에 저장된 정보가 없으면 로그인 입력창 보여줌
			%>
			<form action="logInfo.jsp" method="post">
				ID : <input type="text" name="id"><br>
				Pass : <input type="password" name="pwd"><br><br>
				<input type="submit" value="로그인">
			</form>
		<%	
		}else{
		%>
			<a href ="logInfo.jsp">로그아웃.</a>
		<%
		}
	%>
</body>
</html>