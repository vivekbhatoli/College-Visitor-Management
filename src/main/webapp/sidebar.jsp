<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Gaming-Style Sidebar -->
<div class="gaming-sidebar">
    <div class="sidebar-logo">
        <a href="dashboard.jsp">⚡ VMS</a>
    </div>
    <ul class="sidebar-menu">
        <li><a href="dashboard.jsp">🏠 Dashboard</a></li>
        <li><a href="visitorList.jsp">📋 Visitor List</a></li>
        <li><a href="addVisitor.jsp">➕ Add Visitor</a></li>
        <li><a href="reports.jsp">📊 Reports</a></li>
        <li><a href="settings.jsp">⚙️ Settings</a></li>
        <li><a href="help.jsp">❓ Help</a></li>
        <li><a href="LogoutServlet" class="logout">🚪 Logout</a></li>
    </ul>
</div>

<!-- CSS for Advanced Gaming Sidebar -->
<style>
    /* Gaming Sidebar Styles */
    .gaming-sidebar {
        width: 250px;
        height: 100vh;
        background: rgba(20, 20, 20, 0.9);
        position: fixed;
        left: 0;
        top: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 20px;
        border-right: 3px solid #0ff;
        box-shadow: 5px 0px 15px rgba(0, 255, 255, 0.6);
        transition: width 0.3s ease;
        backdrop-filter: blur(10px);
    }

    /* Sidebar Logo */
    .sidebar-logo a {
        font-size: 22px;
        font-weight: bold;
        text-transform: uppercase;
        text-decoration: none;
        color: #0ff;
        transition: all 0.3s ease;
    }

    .sidebar-logo a:hover {
        color: #f0f;
        text-shadow: 0px 0px 10px #f0f;
    }

    /* Sidebar Menu */
    .sidebar-menu {
        list-style: none;
        padding: 0;
        margin: 30px 0;
        width: 100%;
    }

    .sidebar-menu li {
        width: 100%;
        text-align: center;
        margin: 10px 0;
    }

    .sidebar-menu a {
        display: block;
        text-decoration: none;
        color: #0ff;
        font-weight: bold;
        font-size: 16px;
        padding: 12px 20px;
        transition: all 0.3s ease;
        border-radius: 5px;
        text-transform: uppercase;
    }

    .sidebar-menu a:hover {
        color: #f0f;
        text-shadow: 0px 0px 8px #f0f;
        background: rgba(255, 0, 255, 0.2);
    }

    /* Logout Button */
    .logout {
        color: #ff4c4c;
    }

    .logout:hover {
        color: #ff0;
        text-shadow: 0px 0px 8px #ff0;
    }

    /* Sidebar Toggle (For Mobile) */
    @media (max-width: 768px) {
        .gaming-sidebar {
            width: 70px;
            align-items: flex-start;
            padding-left: 10px;
        }

        .sidebar-menu a {
            font-size: 14px;
            padding: 10px;
        }

        .sidebar-menu li {
            text-align: left;
        }

        .sidebar-logo {
            text-align: left;
            font-size: 18px;
        }
    }
</style>
