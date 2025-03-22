<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Gaming-Style Top Navbar -->
<nav class="gaming-navbar">
    <div class="logo">
        <a href="dashboard.jsp">⚡ VMS</a>
    </div>
    <ul class="nav-links">
        <li><a href="dashboard.jsp">🏠 Dashboard</a></li>
        <li><a href="reports.jsp">📊 Reports</a></li>
        <li><a href="settings.jsp">⚙️ Settings</a></li>

        <!-- Dropdown Menu -->
        <li class="dropdown">
            <a href="#">🔻 More</a>
            <ul class="dropdown-menu">
                <li><a href="notifications.jsp">🔔 Notifications</a></li>
                <li><a href="feedback.jsp">📝 Feedback</a></li>
                <li><a href="help.jsp">❓ Help</a></li>
            </ul>
        </li>
    </ul>

    <!-- User Profile & Logout -->
    <div class="user-menu">
        <a href="profile.jsp">👤 Profile</a>
        <a href="LogoutServlet" class="logout">🚪 Logout</a>
    </div>
</nav>

<!-- CSS for Gaming Navbar -->
<style>
    /* Gaming Navbar Styles */
    .gaming-navbar {
        width: 100%;
        background: rgba(20, 20, 20, 0.9);
        padding: 15px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
        border-bottom: 3px solid #0ff;
        box-shadow: 0px 0px 15px rgba(0, 255, 255, 0.6);
        backdrop-filter: blur(8px);
    }

    /* Logo */
    .logo a {
        font-size: 22px;
        font-weight: bold;
        text-transform: uppercase;
        text-decoration: none;
        color: #0ff;
        transition: all 0.3s ease;
    }

    .logo a:hover {
        color: #f0f;
        text-shadow: 0px 0px 10px #f0f;
    }

    /* Navbar Links */
    .nav-links {
        display: flex;
        list-style: none;
        gap: 20px;
    }

    .nav-links li {
        position: relative;
    }

    .nav-links a {
        text-decoration: none;
        color: #0ff;
        font-weight: bold;
        font-size: 16px;
        padding: 10px 15px;
        transition: all 0.3s ease;
        border-radius: 5px;
        text-transform: uppercase;
    }

    .nav-links a:hover {
        color: #f0f;
        text-shadow: 0px 0px 8px #f0f;
        background: rgba(255, 0, 255, 0.2);
    }

    /* Dropdown Menu */
    .dropdown-menu {
        position: absolute;
        top: 100%;
        left: 0;
        background: rgba(20, 20, 20, 0.9);
        box-shadow: 0px 0px 10px rgba(0, 255, 255, 0.5);
        border-radius: 5px;
        display: none;
        flex-direction: column;
        min-width: 160px;
        padding: 10px;
        transition: all 0.3s ease-in-out;
        backdrop-filter: blur(8px);
    }

    .dropdown:hover .dropdown-menu {
        display: flex;
    }

    .dropdown-menu a {
        color: #0ff;
        padding: 8px 12px;
        display: block;
        transition: all 0.3s;
    }

    .dropdown-menu a:hover {
        background: rgba(255, 0, 255, 0.2);
        color: #f0f;
    }

    /* User Menu */
    .user-menu {
        display: flex;
        gap: 20px;
    }

    .user-menu a {
        color: #0ff;
        text-decoration: none;
        font-weight: bold;
        transition: all 0.3s;
    }

    .user-menu a:hover {
        color: #f0f;
        text-shadow: 0px 0px 10px #f0f;
    }

    /* Logout Button */
    .logout {
        color: #ff4c4c;
    }

    .logout:hover {
        color: #ff0;
        text-shadow: 0px 0px 8px #ff0;
    }
</style>
