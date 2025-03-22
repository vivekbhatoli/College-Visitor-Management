<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Check if the user is logged in
    HttpSession sessionObj = request.getSession(false);
    String username = (sessionObj != null) ? (String) sessionObj.getAttribute("username") : null;
    
    if (username == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if session is not set
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visitor Logs</title>
    <script src="js/dashboard.js" defer></script>
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    <jsp:include page="topNavbar.jsp" />

    <main>
        <h1>Visitor Logs</h1>
        <p>Here you can view all visitor logs.</p>
        
        <!-- Add a table or list to display visitor logs -->
    </main>
</body>
</html>
