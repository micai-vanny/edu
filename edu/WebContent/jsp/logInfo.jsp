<%@page import="com.edu.test.stateless.MemberDAO"%>
<%@page import="com.edu.test.stateless.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logInfo.jsp</title>
</head>
<body>
<%
	// db조회 후 가져온 Member 확인 후 이름, 나이를 출력.
	// 없으면 "해당 사용자 없음"으로 출력되도록 코드 짜보기
	
	//input으로 입력받은 id/pwd 정보
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemberDAO dao = new MemberDAO();
	Member member = dao.checkInfo(id, pwd);			
	
	//db에서 가지고 온 정보
	String mid = member.getMemberId();
	String mpwd = member.getMemberPwd();
	String name = member.getMemberName();
	int age = member.getMember_age();
	
	if(id.equals(mid) && pwd.equals(mpwd)){
		out.print("name : " + name + ", age : " + age);
	}else {
		out.print("사용자 정보가 없습니다.");
	}
	
	 %>
</body>
</html>