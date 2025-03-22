<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gaming Real-Time Clock</title>
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: radial-gradient(circle, #1a1a2e, #16213e);
            color: cyan;
            font-family: 'Press Start 2P', cursive;
            text-align: center;
        }
        .clock-container {
            background: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px cyan;
            text-align: center;
        }
        .clock {
            font-size: 3rem;
            font-weight: bold;
            text-shadow: 0 0 10px cyan;
            animation: glow 1.5s infinite alternate;
        }
        @keyframes glow {
            from {
                text-shadow: 0 0 10px cyan, 0 0 20px blue;
            }
            to {
                text-shadow: 0 0 20px cyan, 0 0 30px blue;
            }
        }
    </style>
</head>
<body>
    <div class="clock-container">
        <h2>Gaming Real-Time Clock</h2>
        <div class="clock" id="clock"></div>
    </div>

    <script>
        function updateClock() {
            let now = new Date();
            let hours = now.getHours().toString().padStart(2, '0');
            let minutes = now.getMinutes().toString().padStart(2, '0');
            let seconds = now.getSeconds().toString().padStart(2, '0');
            document.getElementById("clock").innerText = `${hours}:${minutes}:${seconds}`;
        }
        setInterval(updateClock, 1000);
        updateClock();
    </script>
</body>
</html>
