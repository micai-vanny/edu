package com.edu.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
	// 전체 리스트조회, 신규 입력처리, 수정, 삭제 처리 => DBMS활용
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	public void close() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(psmt != null) {
			try {
				psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public BookBean getBook(String title) { // 한건 조회
		String sql = "select * from book where title = ?";
		
		conn = DAO.connect();
		BookBean book = new BookBean();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				book.setAuthor(rs.getString("author"));
				book.setPublisher(rs.getString("publisher"));
				book.setTitle(rs.getString("title"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return book;
	}
	
	public List<BookBean> getBookList(){ // 전체 리스트 조회
		String sql = "select * from book";
		conn = DAO.connect();
		BookBean book = new BookBean();
		List<BookBean> bookList = new ArrayList<BookBean>();
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				book.setAuthor(rs.getString("author"));
				book.setPublisher(rs.getString("publisher"));
				book.setTitle(rs.getString("title"));
				
				bookList.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return bookList;
	}
	
	public List<BookBean> getBooksbyAthor(String author) { // 저자별 책 조회 : author -> 책 리스트를 반환
		conn = DAO.connect();
		BookBean book = new BookBean();
		List<BookBean> authorList = new ArrayList<BookBean>();
		String sql = "select * from book where author = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, author);
			rs = psmt.executeQuery();
			if(rs.next()) {
				book.setAuthor(rs.getString("author"));
				book.setPublisher(rs.getString("publisher"));
				book.setTitle(rs.getString("title"));
				
				authorList.add(book);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		
		return authorList;
	}
	
	public BookBean insertBook(BookBean book) {
		conn = DAO.connect();
		String sql = "insert into book values(?,?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, book.getTitle());
			psmt.setString(2, book.getAuthor());
			psmt.setString(3, book.getPublisher());
			
			int in = psmt.executeUpdate();
			System.out.println(in + "건 입력완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}
	
	public BookBean EditBook(BookBean book) {
		conn = DAO.connect();
		String sql = "update book set title = ?, author = ? , publisher = ? where title = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, book.getTitle());
			psmt.setString(2, book.getAuthor());
			psmt.setString(3, book.getPublisher());
			psmt.setString(4, book.getTitle());
			
			int up = psmt.executeUpdate();
			System.out.println(up + "건 수정완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return book;
	}
}
