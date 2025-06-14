// File: com/ogrievance/dbutils/DBUtils.java
package com.ogrievance.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DBUtils {
    private static final String URL = "jdbc:mysql://localhost:3306/grievance_portal";
    private static final String USER = "root";
    private static final String PASSWORD = "cdac"; // 🔁 Change to your actual password

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

	public static void close(Object object, PreparedStatement psInsertDeleted) {
		// TODO Auto-generated method stub
		
	}
}
