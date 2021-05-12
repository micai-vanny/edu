package com.edu.test.stateless;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/context3")
public class ServletContextTest3Sevl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ServletContext -> 값을 읽어오도록 함. obj1, obj2
		ServletContext sc = this.getServletContext();
		ShareObject so1 = (ShareObject)sc.getAttribute("data1");
		ShareObject so2 = (ShareObject)sc.getAttribute("data2");
		System.out.println(so1.getCount() + ", " + so1.getStr());
		System.out.println(so2.getCount() + ", " + so2.getStr());
	}
}
