package com.edu.test.stateless;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	Connection conn;
	PreparedStatement psmt = null;
	ResultSet rs;
	
	public MemberDAO(){
//		DataSource ds = DataSource.getInstance();
//		conn = ds.getConnection();
		//Connection Pool을 활용해서 Connection 객체 사용.
		try {
			InitialContext ic = new InitialContext();	//서버 리소스 관리 객체
			javax.sql.DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");	//아까 지정했던 이름 호출
			conn = ds.getConnection();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Member checkInfo(String id, String pwd) {
		String sql = "select * from member where member_id=? and member_pwd=?";
		Member mem = new Member();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				mem.setMemberId(rs.getString("member_id"));
				mem.setMemberPwd(rs.getNString("member_pwd"));
				mem.setMemberName(rs.getString("member_name"));
				mem.setMember_age(rs.getInt("member_age"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return mem;
	}
	
	public List<Member> getMemberList(){
		String sql = "select * from member order by 1";
		List<Member> list = new ArrayList<Member>();
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Member mem = new Member();
				mem.setMemberId(rs.getString("member_id"));
				mem.setMemberPwd(rs.getString("member_pwd"));
				mem.setMemberName(rs.getString("member_name"));
				mem.setMember_age(rs.getInt("member_age"));
				
				list.add(mem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	
	//회원 상세 정보 조회
	public Member getMember(String id) {
		// id로 1건 상세조회.
		String sql = "select * from member where member_id=?";
		Member mem = new Member();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				mem.setMemberId(rs.getString("member_id"));
				mem.setMemberPwd(rs.getNString("member_pwd"));
				mem.setMemberName(rs.getString("member_name"));
				mem.setMember_age(rs.getInt("member_age"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return mem;
	}
	
	public void insertMember(Member mem) {
		String sql = "insert into member(MEMBER_ID, MEMBER_PWD, member_name, member_age) values(?,?,?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem.getMemberId());
			psmt.setString(2, mem.getMemberPwd());
			psmt.setString(3, mem.getMemberName());
			psmt.setInt(4, mem.getMember_age());
			
			int in = psmt.executeUpdate();
			System.out.println(in + "건이 입력되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void close() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (psmt != null) {
			try {
				psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
