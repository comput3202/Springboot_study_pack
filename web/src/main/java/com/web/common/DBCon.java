package com.web.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {

	public static Connection getCon() {
		Connection con = null; // 아래에 con = DriverManager~~도 초기화 한 것이지만, 안하면 밑으로 빠진다. 완전한 초기화 아니므로 여기서 초기화 해야한다
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String url = "jdbc:mysql://localhost:3305/nothing";
		String id = "root";
		String pwd = "1234";

		try {
			con = DriverManager.getConnection(url, id, pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		} // 전화 거는 것(네트워크 이용). 예외처리 필요.
		return con;
	}

}
