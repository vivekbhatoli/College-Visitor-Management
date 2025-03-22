// dashboard.js - Ultra-Advanced Interactive Features for Visitor Dashboard

document.addEventListener("DOMContentLoaded", () => {
    // Smooth Sidebar Transition with Bounce Effect
    anime({
        targets: ".sidebar",
        translateX: [-300, 0],
        opacity: [0, 1],
        duration: 1000,
        easing: "easeOutBounce"
    });

    // Dashboard Cards Animation with Staggered Delay
    anime({
        targets: ".card",
        scale: [0.5, 1],
        opacity: [0, 1],
        rotate: '1turn',
        delay: anime.stagger(300),
        easing: "easeOutElastic(1, .6)"
    });

    // Dark Mode Toggle with Smooth Transition
    const darkModeBtn = document.querySelector(".dark-mode-btn");
    darkModeBtn.addEventListener("click", () => {
        document.body.classList.toggle("dark");
        localStorage.setItem("darkMode", document.body.classList.contains("dark"));
        anime({
            targets: "body",
            backgroundColor: document.body.classList.contains("dark") ? "#1a202c" : "#ffffff",
            duration: 600,
            easing: "easeInOutQuad"
        });
    });

    if (localStorage.getItem("darkMode") === "true") {
        document.body.classList.add("dark");
    }

    // Live Clock with Animated Digits
    function updateClock() {
        const clockElement = document.getElementById("current-time");
        const now = new Date();
        const timeString = now.toLocaleString("en-US", {
            weekday: "long", year: "numeric", month: "short", day: "numeric",
            hour: "2-digit", minute: "2-digit", second: "2-digit"
        });
        clockElement.innerHTML = timeString.split('').map(char => `<span class="digit">${char}</span>`).join('');
        anime({
            targets: ".digit",
            opacity: [0, 1],
            translateY: [-10, 0],
            duration: 800,
            delay: anime.stagger(50),
            easing: "easeOutExpo"
        });
    }
    setInterval(updateClock, 1000);
    updateClock();

    // Visitor Chart with Dynamic Updates
    const ctx = document.getElementById("visitorChart").getContext("2d");
    const visitorChart = new Chart(ctx, {
        type: "bar",
        data: {
            labels: ["January", "February", "March", "April", "May"],
            datasets: [{
                label: "Visitors",
                data: [120, 190, 300, 500, 200],
                backgroundColor: "rgba(75, 192, 192, 0.6)",
                borderColor: "rgba(75, 192, 192, 1)",
                borderWidth: 2,
                fill: true
            }]
        },
        options: {
            responsive: true,
            animation: {
                duration: 2000,
                easing: "easeInOutQuart"
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    setInterval(() => {
        visitorChart.data.datasets[0].data.push(Math.floor(Math.random() * 500));
        visitorChart.data.labels.push(new Date().toLocaleTimeString());
        if (visitorChart.data.labels.length > 10) {
            visitorChart.data.labels.shift();
            visitorChart.data.datasets[0].data.shift();
        }
        visitorChart.update();
    }, 5000);

    // Interactive Notification System with Sound
    function showNotification(message, type = "info") {
        const notification = document.createElement("div");
        notification.className = `notification ${type}`;
        notification.textContent = message;
        document.body.appendChild(notification);
        new Audio("notification.mp3").play();
        setTimeout(() => {
            notification.classList.add("fade-out");
            setTimeout(() => notification.remove(), 500);
        }, 3000);
    }
    showNotification("Welcome back to your dashboard!", "success");

    // Smooth Scroll Effect for Dashboard Sections with Highlighting
    document.querySelectorAll(".nav-link").forEach(link => {
        link.addEventListener("click", event => {
            event.preventDefault();
            const target = document.querySelector(link.getAttribute("href"));
            if (target) {
                window.scrollTo({
                    top: target.offsetTop - 50,
                    behavior: "smooth"
                });
                document.querySelectorAll(".nav-link").forEach(nav => nav.classList.remove("active"));
                link.classList.add("active");
            }
        });
    });
});
