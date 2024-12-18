package com.user.servlet;

import com.user.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();

        try {
            if (userDAO.isUserExists(username)) {
                // Redirect to registration page if username exists
                response.sendRedirect("register.jsp?error=username_exists");
            } else {
                // Register the user
                userDAO.addUser(username, password);
                response.sendRedirect("login.jsp?success=registered");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=server_error");
        }
    }
}
