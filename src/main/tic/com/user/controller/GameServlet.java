package com.user.controller;

import com.user.dao.GameDAO;
import com.user.model.Game;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/GameServlet")
public class GameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Define GameDAO object
    private GameDAO gameDAO = new GameDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the session and username to ensure the user is logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            String username = (String) session.getAttribute("username");

            // Create a new game or retrieve an existing one based on the session or logic
            Game game = new Game(0, username, "Opponent", "---------", "in_progress");

            // You can use GameDAO to save this game or retrieve an existing game if needed
            gameDAO.addGame(game); // Add a new game to the database

            // Forward to the game page (game.jsp)
            RequestDispatcher dispatcher = request.getRequestDispatcher("game.jsp");
            request.setAttribute("game", game);
            dispatcher.forward(request, response);
        } else {
            // Redirect to login if the user is not logged in
            response.sendRedirect("login.jsp");
        }
    }
}
