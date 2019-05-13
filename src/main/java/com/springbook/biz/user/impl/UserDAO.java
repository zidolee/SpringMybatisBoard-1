package com.springbook.biz.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.user.UserVO;

@Repository("userDAO")
public class UserDAO {
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String USER_INSERT = "insert into users values(?, ?, ?, ?, ?, ?, ?, sysdate)";
	private final String USER_GET = "select * from users where id=? and password=?";
	
	//회원등록
	public int insertUser(UserVO vo) {
		UserVO user = null;
		int joinCheck = 0;
		try {
			System.out.println("===> JDBC로 insertUser() 기능 처리");
			System.out.println(vo.getBirthday());
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_INSERT);
			
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getSex());
			stmt.setDate(5, vo.getBirthday());
			stmt.setString(6, vo.getHp());
			stmt.setString(7, vo.getAddress());
			
			joinCheck = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return joinCheck;
	}
	
	//회원 조회
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		
		try {
			System.out.println("===> JDBC로 getUser() 기능 처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			if(rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setSex(rs.getString("sex"));
				user.setBirthday(rs.getDate("birthday"));
				user.setHp(rs.getString("hp"));
				user.setAddress(rs.getString("address"));
				user.setReg_date(rs.getDate("reg_date"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}
	
}
