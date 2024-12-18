<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Tic Tac Toe</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
    	
    	body{
    		background: url('img/main1.jpg') no-repeat center center/cover;
    	}
    	
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav>
        <a href="index.jsp">Home</a>
        <a href="game.jsp">Game</a>
        <a href="about.jsp">About</a>
        <a href="contact.jsp">Contact</a>
    </nav>

    <!-- Main content -->
    <div class="container">
        <div class="content">
            <%
                HttpSession session1 = request.getSession(false);
                if (session1 != null && session1.getAttribute("username") != null) {
                    String username = (String) session1.getAttribute("username");
            %>
                    <h1>Welcome, <%= username %>!</h1>
                    <a href="GameServlet">Play Game</a>
                    <form action="SessionServlet" method="post">
                        <input type="hidden" name="action" value="logout">
                        <button class="logout-btn" type="submit">Logout</button>
                    </form>
            <%
                } else {
            %>
                    <h1>Welcome to Tic Tac Toe</h1>
                    <a href="login.jsp">Login</a> or <a href="register.jsp">Register</a>
            <%
                }
            %>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Tic Tac Toe. All rights reserved. | <a href="contact.jsp">Contact Us</a></p>
    </footer>

    <!-- Optional JS for interactivity (e.g., alert on logout) -->
    <script src="js/validation.js"></script>
</body>
</html>
