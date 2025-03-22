package com.login.Servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionTest {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/visitor_db";
        String user = "root";
        String password = "root";

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Connection
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("✅ Database Connection Successful!");

            // Close connection
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("❌ MySQL JDBC Driver Not Found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Database Connection Failed.");
            e.printStackTrace();
        }
    }
}
