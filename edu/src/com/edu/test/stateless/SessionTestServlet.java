package com.edu.test.stateless;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sessionTest")
public class SessionTestServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String param = req.getParameter("p");
		String msg = null;
		HttpSession session = null;
		
		if(param.equals("create")){
			session = req.getSession();
			System.out.println(session.getId());
			if (session.isNew()) {
				msg = "새로운 세션객체가 생성되었습니다.";
			}else {
				msg = "기존의 세션객체가 리턴되었습니다.";
			}
		}else if(param.equals("delete")) {
			session = req.getSession();
			if(session != null) {
				session.invalidate();
				msg = "세션객체 삭제작업이 완료되었습니다.";
			}else {
				msg = "삭제할 세션이 존재하지 않습니다.";
			}
		}
		
		
		
		
		out.print("<h2>" + msg + "</h2>");
		out.close();
	}
}
