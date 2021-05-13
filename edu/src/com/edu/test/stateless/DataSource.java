package com.edu.test.stateless;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DataSource {
	
		private static DataSource datasource = new DataSource();
		private Connection conn;
		// ┌>이런 properties 정보들은 하드코딩(직접 써주는 코딩) XXXXXXXX
		private String driver;
		private String url;
		private String user;
		private String password;
		
		private DataSource() {}
		
		public static DataSource getInstance() {
			return datasource;
		}
		
		public Connection getConnection() {
			dbConfig();	// 환경 파일을 불러 DB 정보를 담는당.
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, user, password);
			}catch(ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			return conn;
	}
		
		// 이걸로 편하게 DB환경 관리가 편해진다 이거야
		private void dbConfig() {	// 환경을 불러오는 메소드	┌>파일 위치(상대적path)
			String resource = getClass().getResource("db.properties").getPath();
			System.out.println(resource);	// 실제 물리적 path를 출력해본다.
			Properties properties = new Properties();	// properties 객체 생성
			// 			└> key와 value를 가지고 있다.
			try {
				properties.load(new FileReader(resource));	// 환경파일을 Reader객체를 통해 읽음
				driver = properties.getProperty("driver");
				url = properties.getProperty("url");
				user = properties.getProperty("user");
				password = properties.getProperty("password");
			}catch(IOException e) {
				e.printStackTrace();
			}
		}

}
