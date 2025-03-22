<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<div class="login-container">
    <form class="login-form" action="LoginServlet" method="post">
        <h2 class="login-title">Visitor Login</h2>

        <% if(request.getParameter("error") != null) { %>
            <p class="error-message">Invalid username or password!</p>
        <% } %>

        <input type="text" name="username" placeholder="Username" class="input-field" required autofocus>
        <input type="password" name="password" placeholder="Password" class="input-field" required>
        <button type="submit" class="login-btn">Login</button>
        <br>
        <a href="forgot-password.jsp" class="neon-link">Forgot Password?</a>
        <a href="register.jsp" class="neon-link">Create Account</a>
        <a href="fun.jsp" class="neon-link">Fun</a>
    </form>

    <!-- System Stats -->
    <div class="system-stats">
        <p><i class="fas fa-microchip"></i> CPU: <span id="cpu-usage">Fetching...</span></p>
        <p><i class="fas fa-microchip"></i> GPU: <span id="gpu-usage">Fetching...</span></p>
        <p><i class="fas fa-memory"></i> RAM: <span id="ram-usage">Fetching...</span></p>
    </div>

    <!-- Battery Status -->
    <div class="battery-container">
        <p id="battery-status">Battery: Fetching...</p>
        <div class="battery-bar">
            <div id="battery-level"></div>
        </div>
        <p id="charging-time">Charging Time: Calculating...</p>
    </div>
</div>

<%@ include file="footer.jsp" %>

<!-- Styles -->
<style>
    body {
        background: url('images/cyberpunk-bg.jpg') no-repeat center center fixed;
        background-size: cover;
        font-family: 'Press Start 2P', cursive;
        color: #0ff;
        text-align: center;
    }
    .login-container {
        backdrop-filter: blur(10px);
        padding: 20px;
        border-radius: 10px;
    }
    
    .input-field {
        display: block;
        margin: 10px auto;
        padding: 10px;
        background: black;
        border: 2px solid #0ff;
        color: #0ff;
    }
    .login-btn {
        background: #0ff;
        color: black;
        border: none;
        padding: 10px;
        cursor: pointer;
        transition: transform 0.3s;
    }
    .login-btn:hover {
        transform: scale(1.1);
    }
    .neon-link {
        color: #0ff;
        text-decoration: none;
    }
    .neon-link:hover {
        color: #ff0;
    }

    /* System Stats */
    .system-stats p {
        font-size: 16px;
        margin: 5px;
    }

    /* Battery Styles */
    .battery-container {
        margin-top: 20px;
        color: #0ff;
        font-size: 18px;
    }
    .battery-bar {
        width: 200px;
        height: 25px;
        border: 2px solid #0ff;
        background: rgba(0, 0, 0, 0.5);
        margin: 10px auto;
        position: relative;
        overflow: hidden;
    }
    #battery-level {
        height: 100%;
        width: 0%;
        background: linear-gradient(90deg, #0f0, #ff0);
        transition: width 0.5s ease-in-out;
    }
    @keyframes chargingGlow {
        0% { box-shadow: 0 0 5px #0f0; }
        50% { box-shadow: 0 0 20px #ff0; }
        100% { box-shadow: 0 0 5px #0f0; }
    }
    .charging {
        animation: chargingGlow 1s infinite alternate;
    }
</style>

<!-- Scripts -->
<script>
    // Live CPU, GPU, and RAM Stats (Mock Data)
    function fetchSystemStats() {
        document.getElementById('cpu-usage').innerText = Math.floor(Math.random() * 100) + "%";
        document.getElementById('gpu-usage').innerText = Math.floor(Math.random() * 100) + "%";
        document.getElementById('ram-usage').innerText = Math.floor(Math.random() * 100) + "%";
    }
    setInterval(fetchSystemStats, 2000);

    // Live Battery Status
    function updateBatteryStatus(battery) {
        let level = Math.round(battery.level * 100);
        let charging = battery.charging;
        let chargingTime = battery.chargingTime > 0 ? Math.round(battery.chargingTime / 60) + " min" : "N/A";

        document.getElementById("battery-status").innerHTML = `Battery: ${level}% ${charging ? "⚡" : ""}`;
        document.getElementById("battery-level").style.width = level + "%";

        if (charging) {
            document.getElementById("charging-time").innerHTML = `Charging Time: ${chargingTime}`;
            document.getElementById("battery-level").classList.add("charging");
        } else {
            document.getElementById("charging-time").innerHTML = "Charging Time: N/A";
            document.getElementById("battery-level").classList.remove("charging");
        }
    }

    navigator.getBattery().then(function(battery) {
        updateBatteryStatus(battery);
        battery.addEventListener("levelchange", () => updateBatteryStatus(battery));
        battery.addEventListener("chargingchange", () => updateBatteryStatus(battery));
    });
</script>
