<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="clock" class="text-white fw-bold"></div>

<script>
    function updateClock() {
        const now = new Date();
        let hours = now.getHours();
        let minutes = now.getMinutes();
        let seconds = now.getSeconds();
        let ampm = hours >= 12 ? 'PM' : 'AM';

        hours = hours % 12 || 12; // Convert to 12-hour format
        minutes = minutes < 10 ? '0' + minutes : minutes;
        seconds = seconds < 10 ? '0' + seconds : seconds;

        const timeString = hours + ':' + minutes + ':' + seconds + ' ' + ampm;
        document.getElementById('clock').innerText = timeString;
    }

    setInterval(updateClock, 1000);
    updateClock(); // Initialize clock immediately
</script>
