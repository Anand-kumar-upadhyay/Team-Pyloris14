<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="css/register.css">
    <style>
    	
    	body{
    		background: url('img/main2.jpg') no-repeat center center/cover;
    	}
    	
    </style>
</head>
<body>

    <!-- Container for the registration form -->
    <div class="container">
        <h1>Register</h1>
        <form action="SessionServlet" method="post">
            <input type="hidden" name="action" value="register">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            <button type="submit">Register</button>
        </form>

        <%
            if (request.getParameter("error") != null) {
        %>
            <p class="error-message">Invalid registration details. Please try again.</p>
        <%
            }
        %>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Tic Tac Toe. All rights reserved. | <a href="contact.jsp">Contact Us</a></p>
    </footer>

    <!-- Optional JS for form validation or interactivity -->
    <script src="js/js/register.js"></script>

</body>
</html>
