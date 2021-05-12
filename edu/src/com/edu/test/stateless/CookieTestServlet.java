package com.edu.test.stateless;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cookie")
public class CookieTestServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		Cookie c1 = new Cookie("ID","guest");
		c1.setPath("/");	// server의 특정 위치 /edu application
		resp.addCookie(c1);	// client 쪽으로 c1 쿠키를 전송.
		
		Cookie c2 = new Cookie("code", "0001");
//		c2.setMaxAge(3 * 60 * 60);	// 60초가 60번씩 3 = 3시간
		c2.setMaxAge(2 * 60);	// 2분
		c2.setPath("/");
		resp.addCookie(c2);
		
		Cookie c3 = new Cookie("subject", "java");
		c3.setMaxAge(10 * 24 * 60 * 60);	// 60초가 60번씩 24시간, 10일
		c3.setPath("/");
		resp.addCookie(c3);
		
		out.print("쿠키 전송 완료");
		out.close();
	}
	
}
