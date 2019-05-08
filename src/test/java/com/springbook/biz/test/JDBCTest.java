package com.springbook.biz.test;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCTest {
	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버를 로드 했다");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott", "tiger")) {
			System.out.println("connection 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
			}
		}
	
}
