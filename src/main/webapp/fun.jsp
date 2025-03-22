<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyberpunk Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <style>
        body {
            background: url('images/cyberpunk-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Press Start 2P', cursive;
            color: #0ff;
            text-align: center;
            margin: 0;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .login-form {
            background: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border: 2px solid #0ff;
            border-radius: 10px;
            width: 300px;
            box-shadow: 0 0 20px #0ff;
        }
        .input-field {
            width: 90%;
            margin: 10px 0;
            padding: 10px;
            background: black;
            border: 2px solid #0ff;
            color: #0ff;
            font-size: 14px;
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
            display: block;
            margin-top: 10px;
        }
        .neon-link:hover {
            color: #ff0;
        }
        .battery-status {
            position: absolute;
            bottom: 285px;
            left: 5px;
            background: black;
            color: #0ff;
            border: 2px solid #0ff;
            padding: 10px;
        }
        .hidden-terminal {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 250px;
            background: black;
            color: #0f0;
            padding: 10px;
            display: none;
            border-top: 2px solid #0ff;
            font-family: "Courier New", monospace;
            overflow-y: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <form class="login-form">
            <h2>Enter The Grid</h2>
            <input type="text" placeholder="Username" class="input-field" autofocus>
            <input type="password" placeholder="Password" class="input-field">
            <button class="login-btn">Login</button><br>
            <a href="#" class="neon-link">Forgot Password?</a>
            <a href="#" class="neon-link">Create Account</a>
        </form>
    </div>

    <!-- Battery Status -->
    <div class="battery-status">
        <p id="battery-level">🔋 Battery: Fetching...</p>
        <p id="battery-charging">⚡ Charging: Fetching...</p>
    </div>

    <!-- Hidden Hacker Terminal -->
    <div id="hacker-terminal" class="hidden-terminal">
        <p>[H4CK3R T3RM1N4L] - Press Ctrl + Q to Close</p>
        <input type="text" id="terminal-input" placeholder="Enter command...">
    </div>

    <script>
    function updateBatteryInfo(battery) {
        document.getElementById("battery-level").innerText = "🔋 Battery: " + Math.round(battery.level * 100) + "%";
        document.getElementById("battery-charging").innerText = battery.charging ? "⚡ Charging: Yes" : "⚡ Charging: No";
    }

    if ('getBattery' in navigator) {
        navigator.getBattery().then(function (battery) {
            updateBatteryInfo(battery);

            battery.addEventListener('levelchange', function() { updateBatteryInfo(battery); });
            battery.addEventListener('chargingchange', function() { updateBatteryInfo(battery); });
        });
    } else {
        document.getElementById("battery-level").innerText = "Battery API Not Supported";
    }


        // Toggle Hacker Terminal
        document.addEventListener("keydown", function(event) {
            if (event.ctrlKey && event.key.toLowerCase() === "q") {
                event.preventDefault();
                let terminal = document.getElementById("hacker-terminal");
                terminal.style.display = (terminal.style.display === "block") ? "none" : "block";
            }
        });
    </script>
    <%@ include file="footer.jsp" %>
    
</body>
</html>
