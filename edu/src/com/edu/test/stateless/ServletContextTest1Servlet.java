package com.edu.test.stateless;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/context1")
public class ServletContextTest1Servlet extends HttpServlet {
	// server <- client1
	//		  ->
	
	// client(/addInfo)-> server -> container(tomcat) -> servlet instance 생성 -> servletConfig -> init(sc) -> service() 
	
	// edu <- client(/addInfo)
	//     -> application 전체에서 공유. ServletContext(객체)
	
	//     <- client2(/login) -> list, bucket,
	//     -> :session에서 공유.          HttpSession(객체)
	//
	//     <- client3 (/bucket) -> payment
	//     -> :request에서 공유.      HttpServletRequest(객체)
	
	// webProj -> ServletContext(객체)
	// userProj ->ServletContext(객체)
	
	ServletContext sc;
	
//	@Override
//	public void init(ServletConfig config) throws ServletException {
//		sc = config.getServletContext();
//		
//	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		sc = this.getServletContext();
		String location = sc.getInitParameter("data1");
		System.out.println(location);
	}

}
