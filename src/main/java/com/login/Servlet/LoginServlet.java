package com.login.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            response.sendRedirect("login.jsp?error=empty_fields");
            return;
        }

        if (authenticateUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?error=invalid");
        }
    }

    private boolean authenticateUser(String username, String password) {
        String url = "jdbc:mysql://localhost:3306/visitor_db";
        String dbUser = "root";
        String dbPassword = "root";

        String query = "SELECT password FROM users WHERE username=?";
        
        try (Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
             PreparedStatement ps = con.prepareStatement(query)) {
            
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure MySQL driver is loaded
            
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String storedHash = rs.getString("password");
                    return BCrypt.checkpw(password, storedHash); // Compare hashed passwords
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Authentication failed due to an exception
        }

        return false; // User not found or incorrect password
    }
}
