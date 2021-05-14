<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jsp/example10.jsp</title>
</head>
<body>
	<%
		String rid = null;
		String name = null;
		String age = null;
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		if(id == null){
			id = (String)session.getAttribute("id");
		}
		
		if(pwd == null){
			pwd = (String)session.getAttribute("pwd");
		}
		if(id.isEmpty() || pwd.isEmpty()){
			request.setAttribute("error", "ID 또는 비밀번호를 입력하세요.");
			RequestDispatcher rd = request.getRequestDispatcher("logInOut.jsp");
			rd.forward(request, response);
			return;
		}
		
		// 로그인 처리
		if(session.isNew() || session.getAttribute("id") == null) {
			session.setAttribute("id", id);
			session.setAttribute("pwd", pwd);
			session.setAttribute("name", "최반야");
			session.setAttribute("age", "32");
			out.print("로그인이 완료되었습니다.");
		}else{
			out.print("이미 로그인 상태입니다.");
			rid = (String)session.getAttribute("id");
			name = (String)session.getAttribute("name");
			age = (String)session.getAttribute("age");
		}
		
	%> <!--   ┌>걍 동적인 값을 읽어오기 위한 것으로 코드를 작성할 수 없음. -->
	<h3>ID: <%=rid %></h3>
	<h3>Passwd: <%=pwd %></h3>
	<h1>Hello! <%=name %></h1>
</body>
</html>