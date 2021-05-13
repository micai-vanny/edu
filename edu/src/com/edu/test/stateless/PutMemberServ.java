package com.edu.test.stateless;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/memberRegister")
public class PutMemberServ extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// DB에서 리스트 가지고 와서 memberList.jsp 페이지에 forwarding
		MemberDAO dao = new MemberDAO();
		List<Member> list = dao.getMemberList();
		
		RequestDispatcher rd = req.getRequestDispatcher("memberList.jsp");
		req.setAttribute("memberList", list);
		rd.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		// Parameter를 읽어들여 DB에 한 건씩 insert해주고, 입력한 정보들은 memberResult.jsp로 전송
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		
		
		MemberDAO dao = new MemberDAO();
		
//		System.out.println("DB에 입력완료.");
		Member member = new Member();
		member.setMemberId(id);
		member.setMemberPwd(pwd);
		member.setMemberName(name);
		member.setMember_age(Integer.parseInt(age));
		
		dao.insertMember(member);

		
		this.getServletContext(); // servletContext가 가지고 있는 request를 호출하기 위함.
		RequestDispatcher rd = req.getRequestDispatcher("memberResult.jsp");
		req.setAttribute("member", member);
//		↓ 이거랑 똑같음	
//		req.setAttribute("id", id);
//		req.setAttribute("pwd", pwd);
//		req.setAttribute("name", name);
		
		rd.forward(req, resp);
		
		
	}
}
