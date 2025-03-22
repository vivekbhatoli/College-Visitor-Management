<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Check if the user is logged in
    HttpSession sessionObj = request.getSession(false);
    String username = (sessionObj != null) ? (String) sessionObj.getAttribute("username") : null;
    
    if (username == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if session is not set
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visitor Dashboard</title>
    <script src="js/dashboard.js" defer></script>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />

    <!-- Top Navbar -->
    <jsp:include page="topNavbar.jsp" />

    <!-- Main Content -->
    <main class="dashboard-container">
        <div class="welcome-section">
            <h2>Welcome, <%= username %>! 👋</h2>
            <p>You have successfully logged in.</p>
        </div>

        <!-- Quick Actions Section -->
        <section class="quick-actions">
            <h3>🚀 Quick Actions</h3>
            <div class="actions-grid">
                <button>➕ Add Visitor</button>
                <button>📊 Generate Report</button>
                <button>📩 Send Notification</button>
                <button>🔍 Search Logs</button>
                <button>📈 View Trends</button>
                <button>⚡ Quick Access</button>
                <button>📝 Manage Appointments</button>
                <button>🔔 System Alerts</button>
                <button>📅 Schedule Meeting</button>
                <button>📷 Upload Documents</button>
                <button>🔑 Manage Access</button>
                <button>📌 Pin Important Notes</button>
                <button>🎨 Customize Theme</button>
                <button>📋 View Activity Logs</button>
                <button>🚀 Performance Monitor</button>
                <button>📎 Manage Attachments</button>
                <button>🛠 System Diagnostics</button>
                <button>🌐 Network Settings</button>
                <button>🔄 Refresh Data</button>
                <button>🔍 AI-Powered Search</button>
                <button>🤖 Chatbot Assistance</button>
                <button>🗃 Data Backup</button>
                <button>📚 Documentation</button>
                <button>🛡 Privacy Settings</button>
            </div>
        </section>
    </main>

<!-- CSS to Align Everything Properly -->
<style>
    /* Reset and Basic Styles */
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #121212;
        color: #fff;
    }

    /* Align Sidebar & Main Content */
    .dashboard-container {
        margin-left: 260px; /* Same width as sidebar */
        padding: 80px 20px 20px;
        transition: all 0.3s ease;
    }

    /* Welcome Section */
    .welcome-section {
        text-align: center;
        padding: 20px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        margin-bottom: 20px;
        box-shadow: 0px 0px 10px rgba(0, 255, 255, 0.4);
    }

    /* Quick Actions Section */
    .quick-actions h3 {
        text-align: center;
        margin-bottom: 15px;
    }

    .actions-grid {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 10px;
        padding: 20px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(255, 0, 255, 0.4);
    }

    .actions-grid button {
        background: linear-gradient(45deg, #0ff, #f0f);
        color: #fff;
        font-size: 14px;
        font-weight: bold;
        padding: 10px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        text-transform: uppercase;
        transition: 0.3s;
        flex: 1 1 calc(25% - 20px); /* Fill horizontally first */
        min-width: 180px;
        max-width: 220px;
    }

    .actions-grid button:hover {
        background: linear-gradient(45deg, #f0f, #0ff);
        box-shadow: 0px 0px 10px rgba(0, 255, 255, 0.6);
    }

    /* Responsive */
    @media (max-width: 1024px) {
        .actions-grid button {
            flex: 1 1 calc(33.33% - 20px); /* Adjusts to 3 per row on medium screens */
        }
    }

    @media (max-width: 768px) {
        .dashboard-container {
            margin-left: 80px; /* Adjust sidebar width */
            padding: 100px 10px 10px;
        }

        .actions-grid button {
            flex: 1 1 calc(50% - 20px); /* 2 buttons per row on small screens */
        }
    }

    @media (max-width: 480px) {
        .actions-grid button {
            flex: 1 1 100%; /* 1 button per row on extra small screens */
        }
    }
</style>

</body>
</html>
