<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visitor Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="h-screen flex items-center justify-center bg-gray-100">

    <div class="w-full max-w-md bg-white shadow-lg rounded-lg p-6">
        <h2 class="text-2xl font-bold text-center text-gray-700">Register as a Visitor</h2>

        <%-- Display error message if registration fails --%>
        <c:if test="${not empty requestScope.error}">
            <p class="text-red-500 text-sm text-center mt-2">${error}</p>
        </c:if>

        <%-- Display success message --%>
        <c:if test="${not empty requestScope.success}">
            <p class="text-green-500 text-sm text-center mt-2">${success}</p>
        </c:if>

        <form action="RegisterServlet" method="post" class="mt-4" onsubmit="return validateForm()">
            <label class="block mb-2 text-sm text-gray-600">Username</label>
            <input type="text" name="username" id="username" required 
                   class="w-full p-3 border border-gray-300 rounded-lg focus:ring focus:ring-blue-400">
            <p class="text-red-500 text-xs" id="usernameError"></p>

            <label class="block mt-4 mb-2 text-sm text-gray-600">Email</label>
            <input type="email" name="email" id="email" required 
                   class="w-full p-3 border border-gray-300 rounded-lg focus:ring focus:ring-blue-400">
            <p class="text-red-500 text-xs" id="emailError"></p>

            <label class="block mt-4 mb-2 text-sm text-gray-600">Password</label>
            <input type="password" name="password" id="password" required 
                   class="w-full p-3 border border-gray-300 rounded-lg focus:ring focus:ring-blue-400">
            <p class="text-red-500 text-xs" id="passwordError"></p>

            <button type="submit" 
                    class="w-full mt-6 bg-blue-600 text-white p-3 rounded-lg hover:bg-blue-700">
                Register
            </button>
        </form>

        <div class="mt-4 text-center">
            <a href="login.jsp" class="text-blue-500 hover:underline">Already registered? Login here</a>
        </div>
    </div>

    <script>
        function validateForm() {
            let isValid = true;

            // Get input values
            let username = document.getElementById("username").value.trim();
            let email = document.getElementById("email").value.trim();
            let password = document.getElementById("password").value;

            // Error message elements
            let usernameError = document.getElementById("usernameError");
            let emailError = document.getElementById("emailError");
            let passwordError = document.getElementById("passwordError");

            // Reset errors
            usernameError.innerHTML = "";
            emailError.innerHTML = "";
            passwordError.innerHTML = "";

            // Username Validation (Min 3 characters, letters & numbers only)
            let usernamePattern = /^[a-zA-Z0-9]{3,}$/;
            if (!usernamePattern.test(username)) {
                usernameError.innerHTML = "Username must be at least 3 characters (letters & numbers only).";
                isValid = false;
            }

            // Email Validation (Basic format check)
            let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                emailError.innerHTML = "Enter a valid email address.";
                isValid = false;
            }

            // Password Validation (Min 8 characters, 1 uppercase, 1 lowercase, 1 number, 1 special char)
            let passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordPattern.test(password)) {
                passwordError.innerHTML = "Password must be at least 8 characters, include 1 uppercase, 1 lowercase, 1 number, and 1 special character.";
                isValid = false;
            }

            return isValid;
        }
    </script>

</body>
</html>
