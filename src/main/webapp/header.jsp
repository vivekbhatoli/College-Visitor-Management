<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<header class="gaming-header">

    <div class="header-left">
        <button id="theme-toggle" class="header-btn">🌙 Dark Mode</button>
    </div>

    <h1 class="neon-text">Online Visit Request</h1>
    
    <div class="header-right">
        <div id="google_translate_element"></div>
    </div>

    <div class="real-time-clock" id="clock"></div>
</header>

<style>
    .gaming-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 15px;
        background: rgba(0, 0, 0, 0.8);
        border-bottom: 2px solid #0ff;
        box-shadow: 0px 0px 10px #0ff;
        position: relative;
        z-index: 1000;
    }

    .header-left,
    .header-right {
        flex: 1;
        display: flex;
        align-items: center;
    }

    .header-left {
        justify-content: flex-start;
    }

    .header-right {
        justify-content: flex-end;
        position: relative;
        z-index: 2000;
    }

    .neon-text {
        font-size: 2rem;
        color: red;
        text-shadow: 0 0 10px #0ff, 0 0 20px #0ff;
        font-family: 'Press Start 2P', cursive;
        text-align: center;
        flex: 2;
    }

    .real-time-clock {
        position: absolute;
        bottom: 10px;
        left: 50%;
        transform: translateX(-50%);
        font-size: 1.2rem;
        color: white;
        font-family: 'Orbitron', sans-serif;
    }

    .header-btn {
        background: black;
        color: #0ff;
        border: 2px solid #0ff;
        padding: 8px 15px;
        cursor: pointer;
        font-family: 'Press Start 2P', cursive;
        transition: all 0.3s ease;
    }

    .header-btn:hover {
        background: #0ff;
        color: black;
        transform: scale(1.1);
    }

    /* Google Translate Dropdown Fix */
    .goog-te-gadget {
        font-size: 14px !important;
    }

    .goog-te-menu-frame {
        max-height: 400px !important; /* Allows scrolling */
        overflow-y: auto !important;
        z-index: 9999 !important;
    }

    .goog-te-menu2 {
        max-height: 400px !important; /* Prevents clipping */
        overflow-y: auto !important;
        z-index: 9999 !important;
    }

    /* Dark Mode Styles */
    body.dark-theme {
        background: #111;
        color: #0ff;
    }

    body.dark-theme .input-field {
        background: #222;
        border-color: #0ff;
        color: #0ff;
    }

    body.dark-theme .login-btn {
        background: #0ff;
        color: black;
    }
</style>

<script>
    // Real-time clock
    function updateClock() {
        document.getElementById('clock').innerText = new Date().toLocaleTimeString();
    }
    setInterval(updateClock, 1000);

    // Dark Mode Toggle
    document.getElementById('theme-toggle').addEventListener('click', function () {
        document.body.classList.toggle('dark-theme');
        this.innerText = document.body.classList.contains('dark-theme') ? "☀️ Light Mode" : "🌙 Dark Mode";
    });

    // Google Translate Initialization
    function googleTranslateInit() {
        new google.translate.TranslateElement({ 
            pageLanguage: 'en', 
            layout: google.translate.TranslateElement.InlineLayout.SIMPLE 
        }, 'google_translate_element');
    }
</script>

<!-- Load Google Translate API -->
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateInit"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

