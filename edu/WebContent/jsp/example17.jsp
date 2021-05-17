<%@page import="com.edu.test.stateless.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/example17.jsp</title>
</head>
<body>
	<%
		String id = request.getParameter("memberId");
		String pw = request.getParameter("memberPwd");
		String nm = request.getParameter("memberName");
		String ag = request.getParameter("member_age");
		
		Member member = new Member();
		
		member.setMemberId(id);
		member.setMemberName(nm);
		member.setMember_age(Integer.parseInt(ag));
		member.setMemberPwd(pw);
		
		out.print("기존에 했던 방식으로 id를 불러와봄<br>");
		out.print(member.getMemberId()+"<br>");
		out.print(member.getMemberPwd()+"<br>");
		out.print(member.getMemberName()+"<br>");
		out.print(member.getMember_age()+"<br><br>");
		out.print("태그로 내용을 불러와봄<br>");
	%>
	<%--위에 적은 걸 태그로 똑같이 구현해보겠슴! --%>
	<jsp:useBean id="mem" class="com.edu.test.stateless.Member"></jsp:useBean>
	<jsp:setProperty property="*" name="mem"/>
	<!--                       └>넘어온 값 전부(All) -->

	<%-- <jsp:setProperty property="memberId" name="mem" value="hello"/>
	<jsp:setProperty property="memberPwd" name="mem" value="1234"/>
	<jsp:setProperty property="memberName" name="mem" value="Shin"/>
	<jsp:setProperty property="member_age" name="mem" value="38"/> --%>
	<jsp:getProperty property="memberId" name="mem"/>
	<jsp:getProperty property="memberPwd" name="mem"/>
	<jsp:getProperty property="memberName" name="mem"/>
	<jsp:getProperty property="member_age" name="mem"/> 
</body>
</html>