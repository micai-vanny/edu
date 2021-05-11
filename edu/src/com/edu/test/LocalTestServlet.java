package com.edu.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/local")
public class LocalTestServlet extends HttpServlet{
	int number = 0; 	// 멤버 변수로 선언하면 여러 클라이언트가 쓰레드를 공유하여 사용하게 됨.
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//int number = 0;	// 지역변수로 선언하게 되면 클라이언트들이 각각의 쓰레드를 사용하게 된다.
		
		String str = req.getParameter("msg");
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>Thread Test</title></head>");
		out.print("<body><h2>처리결과(지역변수)</h2>");
		while(number++ <10) {
			out.print(str + " : " + number+"<br>");
			out.flush();
			System.out.println(str+ " : " + number);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		out.print("<h2>Done: " + str + "</h2>");
		out.print("</body></html>");
		out.close();
	}

}
