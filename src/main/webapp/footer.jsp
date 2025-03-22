<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer>
    <div class="footer-container">
        <div class="footer-left">
            <p class="footer-text">&copy; 2025 Cyber Login - All Rights Reserved</p>
        </div>

        <div class="footer-right">
            <button class="contact-btn">Contact Us</button>
            <button class="feedback-btn">Give Feedback</button>
        </div>
    </div>
</footer>

<style>
    footer {
        background: rgba(0, 0, 0, 0.8);
        color: #0ff;
        padding: 15px 20px;
        position: absolute;
        bottom: 0;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        backdrop-filter: blur(5px);
        border-top: 2px solid #0ff;
    }

    .footer-text {
        font-family: 'Press Start 2P', cursive;
    }

    .footer-container {
        display: flex;
        justify-content: space-between;
        width: 100%;
    }

    .footer-right button {
        background: transparent;
        border: 2px solid #0ff;
        color: #0ff;
        padding: 8px 12px;
        cursor: pointer;
        font-family: 'Press Start 2P', cursive;
        transition: all 0.3s ease-in-out;
    }

    .footer-right button:hover {
        background: #0ff;
        color: black;
    }
</style>

<script>
    document.querySelector(".contact-btn").addEventListener("click", function() {
        alert("Contact us at: support@cyberlogin.com");
    });

    document.querySelector(".feedback-btn").addEventListener("click", function() {
        alert("Thank you for your feedback!");
    });
</script>
