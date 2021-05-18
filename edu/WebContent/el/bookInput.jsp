<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el/bookInput.jsp</title>
</head>
<body>
<!-- bookInput.jsp에서 사용자가 입력 -> bookProc.jsp에서 파라미터를 읽어온 뒤 DB에 입력 -> bookOutput.jsp에서 처리결과. -->
	<form action="bookProc.jsp" method = "post">
		책제목 : <input type = "text" name = "title"><br>
		책저자 : <input type = "text" name = "author"><br>
		출판사 : <input type = "text" name = "publisher"><br>
		<input type = "submit" value = "저장">
	</form>
	
	<a href = "bookProc.jsp?title=동동이의 하루">상세정보</a>
</body>
</html>