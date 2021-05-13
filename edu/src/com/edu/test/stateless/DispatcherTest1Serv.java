package com.edu.test.stateless;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dispatcher1")
public class DispatcherTest1Serv extends HttpServlet {
	// 정보 유지
	
	// 1> 어플리케이션 단위(ServletContext)
	// 2> 클라이언트 단위(Cookie, session)
	// 3> 요청단위 ->(HttpRequestServlet)
	// : service(request, response) client <---> server
	//   doGet, doPost
	//   request -> dispatcher1 => dispatcher2 
    //   (요청정보와 요청정보처리(resp) 공유한다) (1번을 요청했지만 실행되는 결과는 2번의 내용)
	
	// form: 회원 가입 -> DB에 한 건 입력 서블릿 -> logOut.jsp(memberReg.html) ->
	// member 한건 입력 서블릿(PutMemberServ) -> memberResult.jsp
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		String param = req.getParameter("p");
		if(param == null || param.isEmpty()) {
			param = "Null";
		}
		
		out.print("<h3>Dispatcher 수행 1</h3>");
		
		ServletContext sc = this.getServletContext();	//edu 전체에서 관리하는 객체.
		RequestDispatcher rd = sc.getRequestDispatcher("/dispatcher2");
		req.setAttribute("data1", "1따봉 드립니다");
		req.setAttribute("data2", param);
		rd.forward(req, resp);
		
		out.close();
	}
}
