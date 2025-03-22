package com.register.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/visitor_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email"); // Capture email from form

        // Validate input fields
        if (username == null || password == null || email == null ||
            username.trim().isEmpty() || password.trim().isEmpty() || email.trim().isEmpty()) {
            response.sendRedirect("register.jsp?error=empty_fields");
            return;
        }

        // Hash the password before storing it in the database
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

        // ✅ Correct order: (username, email, password)
        String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement ps = con.prepareStatement(query)) {

                // ✅ Correctly setting the parameters in the right order
                ps.setString(1, username);
                ps.setString(2, email);
                ps.setString(3, hashedPassword);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("login.jsp?success=registered");
                } else {
                    response.sendRedirect("register.jsp?error=insert_failed");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=exception&message=" + e.getMessage());
        }
    }
}
