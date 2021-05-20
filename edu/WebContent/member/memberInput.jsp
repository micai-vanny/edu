<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록 ::: Member Input</title>
</head>
<body>
	<form action="memberProc.do" method="post">
		ID: <input type = "text" name= "id"><br>
		pw: <input type= "password" name= "passwd"><br>
		name: <input type= "text" name= "name"><br>
		mail: <input type= "text" name= "mail"><br>
		<input type= "submit" value= "등록">
	</form>
</body>
</html>