<%@page import="com.edu.beans.BookDAO"%>
<%@page import="com.edu.beans.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	BookDAO dao = new BookDAO();
	BookBean book = new BookBean();
	
	if(request.getMethod().equals("POST")){
		//입력
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		
		// DB에 입력처리
		// BookDAO dao = new BookDAO();
		// dao.insertBook();
		
		book.setAuthor(author);
		book.setTitle(title);
		book.setPublisher(publisher);
		
		dao.insertBook(book);
	}else{
		//조회
		String title = request.getParameter("title");
		
		book = dao.getBook(title);
	}
	
	request.setAttribute("book", book); // setAttribute로 값을 넘겨 주면 받는 쪽에서는 getAttribute로 받아야 한다.
	// bookOutput으로 처리결과 넘김.
	RequestDispatcher rd = request.getRequestDispatcher("bookOutput.jsp");
	rd.forward(request, response);

%>