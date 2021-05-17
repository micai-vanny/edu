<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/example18.jsp</title>
</head>
<body>
	<h3>useBean 활용</h3>
	<form action="example17.jsp">	<!--   	┌>Member에 있는 필드 이름과 동일해야 한다. -->
		ID : <input type = 'text' name = 'memberId'><br>
		Password : <input type = 'password' name = 'memberPwd'><br>
		Name : <input type = 'text' name = 'memberName'><br>
		Age : <input type = 'number' name = 'member_age'><br>
		<input type='submit' value = '저장'>
	</form>
</body>
</html>